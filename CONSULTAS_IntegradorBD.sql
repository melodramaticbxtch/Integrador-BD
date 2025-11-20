USE financiamiento_kg;
/*TRIGGERS*/
/* Trigger: actualiza fecha_de_modificacion y modificado_por en cualquier UPDATE de Cliente.
Esto evita que un empleado modifique datos sin dejar rastro. En este caso lo que pone es el nombre del user de MySQL no el id*/
DELIMITER $$
CREATE TRIGGER seguimiento_modificacion
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    SET NEW.nombre_cliente = UPPER(NEW.nombre_cliente);
END $$

DELIMITER ;

/*Trigger: automatizar cálculo de penalización por mora
Se aplica penalización cuando un pago llega más de X días tarde.*/
DELIMITER $$
CREATE TRIGGER calcular_penalizacion
BEFORE INSERT ON Pago
FOR EACH ROW
BEGIN
    IF NEW.demora > 0 THEN
        SET NEW.penalizacion_mora = NEW.demora * 1000; 
    ELSE
        SET NEW.penalizacion_mora = 0;
    END IF;
END;

DELIMITER $$

/*Trigger: cuando un pago cubre totalmente la cuota → marcar cuota como pagada
Automaticación típica administrativa.*/
CREATE TRIGGER cuota_pagada
AFTER INSERT ON Pago
FOR EACH ROW
BEGIN
    DECLARE total_pagado DECIMAL(10,2);

    SELECT SUM(monto_pagado)
    INTO total_pagado
    FROM Pago
    WHERE id_cuota = NEW.id_cuota;

    IF total_pagado >= (SELECT monto_total FROM Cuota WHERE id_cuota = NEW.id_cuota) THEN
        UPDATE Cuota
        SET estado = 1,
            fecha_de_modificacion = NOW()
        WHERE id_cuota = NEW.id_cuota;
    END IF;
END $$

DELIMITER ;

/*Trigger: evitar créditos duplicados con solicitudes rechazadas
Si la solicitud está rechazada (estado = 0), impide que se genere un crédito.*/
DELIMITER $$

CREATE TRIGGER solicitud_rechazada
BEFORE INSERT ON Credito
FOR EACH ROW
BEGIN
    DECLARE estado_sol BOOLEAN;

    SELECT estado INTO estado_sol
    FROM Solicitud
    WHERE id_solicitud = NEW.id_solicitud;

    IF estado_sol = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se puede crear un crédito con una solicitud rechazada.';
    END IF;
END;

DELIMITER ;

/*tRIGGER PARA generar cuotas automaticamente*/
DELIMITER $$

CREATE TRIGGER trg_generar_cuotas_credito
AFTER INSERT ON Credito
FOR EACH ROW
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE monto_cuota DECIMAL(10,2);
    DECLARE fecha_venc DATE;

    SET monto_cuota = NEW.monto_otorgado / NEW.plazo_devolucion;

    WHILE i <= NEW.plazo_devolucion DO

        SET fecha_venc = DATE_ADD(NEW.fecha_inicio, INTERVAL i MONTH);

        INSERT INTO Cuota (
            id_credito,
            numero_cuota,
            fecha_de_emision,
            fecha_de_vencimiento,
            monto_total,
            estado,
            fecha_de_alta,
            creado_por
        )
        VALUES (
            NEW.id_credito,
            i,
            NEW.fecha_inicio,
            fecha_venc,
            monto_cuota,
            0,
            NOW(),
            NEW.creado_por
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

/*INDICES*/
CREATE UNIQUE INDEX idx_dni_cliente
ON Cliente(DNI_cliente);

CREATE INDEX idx_solicitud_ciente
ON Solicitud(id_cliente);

CREATE INDEX idx_pago_cuota
ON Pago(id_cuota);

CREATE INDEX idx_cuota_credito_estado
ON Cuota(id_credito, estado);

CREATE INDEX idx_producto_financiero
ON Producto_financiero(nombre_producto_financiero);



/*CONSULTAS*/
/*Ranking mayores montos*/
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    c.apellido_cliente,
    SUM(cr.monto_otorgado) AS total_otorgado,
    RANK() OVER (ORDER BY SUM(cr.monto_otorgado) DESC) AS ranking
FROM Cliente c
JOIN Solicitud s ON c.id_cliente = s.id_cliente
JOIN Credito cr ON s.id_solicitud = cr.id_solicitud
GROUP BY c.id_cliente;

/*Monto promedio*/
SELECT 
    c.tipo_de_persona,
    COUNT(s.id_solicitud) AS total_solicitudes,
    AVG(s.monto) AS promedio_solicitado
FROM Cliente c
JOIN Solicitud s ON c.id_cliente = s.id_cliente
GROUP BY c.tipo_de_persona
HAVING AVG(s.monto) > 50000;

/*Creditos con cuotas atrasadas*/
SELECT 
    cr.id_credito,
    cr.monto_otorgado,
    cu.id_cuota,
    cu.fecha_de_vencimiento
FROM Credito cr
JOIN Cuota cu ON cr.id_credito = cu.id_credito
WHERE cu.estado = FALSE
  AND DATEDIFF(NOW(), cu.fecha_de_vencimiento) > 30
  AND NOT EXISTS (
      SELECT 1 FROM Pago p
      WHERE p.id_cuota = cu.id_cuota
  );

/*total recaudado por surcusal*/
SELECT 
    s.nombre_sucursal,
    SUM(p.monto_pagado) AS total_recaudado
FROM Sucursal s
JOIN Empleado e ON s.id_sucursal = e.id_sucursal
JOIN Pago p ON e.id_empleado = p.creado_por
GROUP BY s.id_sucursal;

/*promedio de tasas historicas*/
SELECT 
    pf.nombre_producto_financiero,
    (SELECT AVG(h.tasa)
     FROM Historial_de_tasas h
     WHERE h.id_producto_financiero = pf.id_producto_financiero) AS promedio_tasa
FROM Producto_financiero pf;

/*Solicitudes rechazadas*/
WITH rechazadas AS (
    SELECT *
    FROM Solicitud
    WHERE estado = FALSE
)
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    COUNT(r.id_solicitud) AS rechazos,
    GROUP_CONCAT(r.motivo_estado SEPARATOR ', ') AS motivos
FROM Cliente c
JOIN rechazadas r ON c.id_cliente = r.id_cliente
GROUP BY c.id_cliente;

/*Ingreso*/
WITH ingresos AS (
    SELECT 
        c.*,
        NTILE(5) OVER (ORDER BY ingreso_declarado) AS quintil
    FROM Cliente c
)
SELECT *
FROM ingresos
WHERE quintil = 5;

/*productos financieros mas utiliados*/
SELECT 
    pf.nombre_producto_financiero,
    c.tipo_de_persona,
    COUNT(cr.id_credito) AS usos
FROM Producto_financiero pf
JOIN Credito cr ON pf.id_producto_financiero = cr.id_producto_financiero
JOIN Solicitud s ON cr.id_solicitud = s.id_solicitud
JOIN Cliente c ON s.id_cliente = c.id_cliente
GROUP BY pf.id_producto_financiero, c.tipo_de_persona;

/*Solicitudes que superan el ingreso mensual del cliente*/
SELECT 
    s.id_solicitud,
    s.monto,
    c.ingreso_declarado
FROM Solicitud s
JOIN Cliente c ON s.id_cliente = c.id_cliente
WHERE s.estado = TRUE
  AND s.monto > c.ingreso_declarado;

/*creditos refinanciados*/
SELECT 
    c1.id_credito AS credito_original,
    c2.id_credito AS credito_refinanciado,
    c2.monto_otorgado
FROM Credito c1
JOIN Credito c2 ON c2.id_credito_padre = c1.id_credito;

/*Productos con tasas historicas mayor a la actual*/
SELECT 
    pf.nombre_producto_financiero,
    h.tasa AS tasa_actual,
    pf.tasa_base
FROM Producto_financiero pf
JOIN Historial_de_tasas h 
    ON pf.id_producto_financiero = h.id_producto_financiero
WHERE h.fecha_inicio = (
    SELECT MAX(h2.fecha_inicio)
    FROM Historial_de_tasas h2
    WHERE h2.id_producto_financiero = pf.id_producto_financiero
)
AND h.tasa > pf.tasa_base;

/*roles mas frecuentes en empleados*/
SELECT 
    DNI_empleado,
    COUNT(*) AS roles_distintos
FROM Empleado
GROUP BY DNI_empleado
HAVING COUNT(*) > 1;

/*Promedio de penalizacion por tipo de pago*/
SELECT 
    mp.metodo,
    AVG(p.penalizacion_mora) AS prom_penalizacion
FROM Metodo_de_pago mp
JOIN Pago p ON mp.id_pago = p.id_pago
GROUP BY mp.metodo;

/*campañas mas efectivas*/
SELECT 
    id_producto_campana,
    resultados,
    RANK() OVER (ORDER BY resultados DESC) AS ranking
FROM Producto_campana;

/*creditos con cuota mas impagas que pagas*/
SELECT 
    cr.id_credito,
    SUM(CASE WHEN cu.estado = TRUE THEN 1 ELSE 0 END) AS pagadas,
    SUM(CASE WHEN cu.estado = FALSE THEN 1 ELSE 0 END) AS impagas
FROM Credito cr
JOIN Cuota cu ON cr.id_credito = cu.id_credito
GROUP BY cr.id_credito
HAVING SUM(CASE WHEN cu.estado = TRUE THEN 1 ELSE 0 END) >
       SUM(CASE WHEN cu.estado = FALSE THEN 1 ELSE 0 END);
       
/*Primer y ultimo pago*/
SELECT 
    c.id_cliente,
    p.id_pago,
    p.fecha_de_pago,
    LAG(p.fecha_de_pago) OVER (PARTITION BY c.id_cliente ORDER BY p.fecha_de_pago) AS pago_anterior,
    LEAD(p.fecha_de_pago) OVER (PARTITION BY c.id_cliente ORDER BY p.fecha_de_pago) AS pago_siguiente
FROM Cliente c
JOIN Solicitud s ON c.id_cliente = s.id_cliente
JOIN Credito cr ON s.id_solicitud = cr.id_solicitud
JOIN Cuota cu ON cr.id_credito = cu.id_credito
JOIN Pago p ON cu.id_cuota = p.id_cuota;

/*cuando el pago supera el 80% del credito*/
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    (SELECT AVG(p.monto_pagado)
     FROM Solicitud s2
     JOIN Credito cr2 ON s2.id_solicitud = cr2.id_solicitud
     JOIN Cuota cu2 ON cr2.id_credito = cu2.id_credito
     JOIN Pago p ON cu2.id_cuota = p.id_cuota
     WHERE s2.id_cliente = c.id_cliente) AS promedio_pago,
    (SELECT SUM(cr3.monto_otorgado)
     FROM Solicitud s3
     JOIN Credito cr3 ON s3.id_solicitud = cr3.id_solicitud
     WHERE s3.id_cliente = c.id_cliente) AS total_creditos
FROM Cliente c
HAVING promedio_pago > total_creditos * 0.8;




