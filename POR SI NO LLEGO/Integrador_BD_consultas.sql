USE financiamiento_ra;
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
        SET NEW.penalizacion_mora = NEW.demora * 200; 
    ELSE
        SET NEW.penalizacion_mora = 0;
    END IF;
END;

/*Trigger: cuando un pago cubre totalmente la cuota → marcar cuota como pagada
Automaticación típica administrativa.*/
DELIMITER $$

CREATE TRIGGER cuota_pagada
AFTER INSERT ON Pago
FOR EACH ROW
BEGIN
    DECLARE total_pagado DECIMAL(10,2);

    SELECT SUM(monto_pagado)
    INTO total_pagado
    FROM Pago
    WHERE id_cuota = NEW.id_cuota;

    UPDATE Cuota
    SET estado = 1,
        fecha_de_modificacion = NOW()
    WHERE id_cuota = NEW.id_cuota
      AND total_pagado >= monto_total;
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


/*Funciones y procedimientos almacenados*/
/*Función: calcular monto total financiado (interés simple)
Útil para simulaciones rápidas.*/
DELIMITER $$

CREATE FUNCTION fn_monto_financiado (
    p_monto DECIMAL(10,2),
    p_tasa DECIMAL(10,2),
    p_meses INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_monto + (p_monto * (p_tasa/100) * p_meses);
END$$

DELIMITER ;

/*Procedimiento: generar crédito completo (con validaciones)*/
DELIMITER $$

CREATE PROCEDURE sp_crear_credito (
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_id_solicitud INT,
    IN p_monto DECIMAL(10,2),
    IN p_plazo INT,
    OUT p_id_credito INT
)
BEGIN
    DECLARE estado_sol BOOLEAN;

    -- validar solicitud
    SELECT estado INTO estado_sol
    FROM Solicitud
    WHERE id_solicitud = p_id_solicitud;

    IF estado_sol IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La solicitud no existe.';
    END IF;

    IF estado_sol = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La solicitud está rechazada y no puede crear un crédito.';
    END IF;

    INSERT INTO Credito (
        id_cliente,
        id_producto_financiero,
        id_solicitud,
        monto_otorgado,
        plazo_devolucion,
        fecha_inicio,
        creado_por
    ) VALUES (
        p_id_cliente,
        p_id_producto,
        p_id_solicitud,
        p_monto,
        p_plazo,
        NOW(),
        USER()
    );

    SET p_id_credito = LAST_INSERT_ID();
END$$

DELIMITER ;

/*Procedimiento: Crear una solicitud validando ingreso mínimo*/
DELIMITER $$

CREATE PROCEDURE sp_crear_solicitud (
    IN p_id_cliente INT,
    IN p_monto DECIMAL(10,2),
    IN p_destino VARCHAR(255)
)
BEGIN
    DECLARE ingreso_cliente DECIMAL(10,2);

    -- obtener ingreso
    SELECT ingreso_declarado INTO ingreso_cliente
    FROM Cliente
    WHERE id_cliente = p_id_cliente;

    IF ingreso_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no existe.';
    END IF;

    -- validación de ingreso mínimo
    IF ingreso_cliente < 50000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ingreso del cliente es insuficiente para solicitar crédito.';
    END IF;

    INSERT INTO Solicitud (monto, destino, estado, fecha_solicitud, creado_por)
    VALUES (p_monto, p_destino, 1, NOW(), USER());
END$$

DELIMITER ;

/*Función: calcular la tasa final según campaña + producto*/
DELIMITER $$

CREATE FUNCTION fn_tasa_final (
    p_id_producto INT,
    p_id_campana INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE tasa_base DECIMAL(10,2);
    DECLARE tasa_promo DECIMAL(10,2);

    SELECT tasa_base INTO tasa_base
    FROM Producto_financiero
    WHERE id_producto_financiero = p_id_producto;

    IF tasa_base IS NULL THEN
        RETURN NULL;
    END IF;

    SELECT tasa_promocional INTO tasa_promo
    FROM Producto_campana
    WHERE id_productocampana = p_id_campana;

    IF tasa_promo IS NULL THEN
        SET tasa_promo = 0;
    END IF;

    RETURN tasa_base - tasa_promo;
END$$

DELIMITER ;

/*Procedimiento: Registrar un pago con validación de monto*/
DELIMITER $$

CREATE PROCEDURE sp_registrar_pago (
    IN p_id_cuota INT,
    IN p_monto DECIMAL(10,2)
)
BEGIN
    DECLARE monto_total DECIMAL(10,2);
    DECLARE monto_pagado DECIMAL(10,2);

    SELECT monto_total INTO monto_total
    FROM Cuota
    WHERE id_cuota = p_id_cuota;

    IF monto_total IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cuota no existe.';
    END IF;

    SELECT IFNULL(SUM(monto_pagado), 0) INTO monto_pagado
    FROM Pago
    WHERE id_cuota = p_id_cuota;

    IF monto_pagado + p_monto > monto_total THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pago excede el monto pendiente.';
    END IF;

    INSERT INTO Pago (id_cuota, fecha_de_pago, monto_pagado, fecha_de_alta, creado_por)
    VALUES (p_id_cuota, NOW(), p_monto, NOW(), USER());
END$$

DELIMITER ;

/*Función: calcular monto total financiado (interés simple)*/
DELIMITER $$

CREATE FUNCTION fn_monto_financiado (
    p_monto DECIMAL(10,2),
    p_tasa DECIMAL(10,2),
    p_meses INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_monto + (p_monto * (p_tasa/100) * p_meses);
END$$

DELIMITER ;

/*Procedimiento para detectar clientes en riesgo (score interno simple) ESTE SI O SI*/
DELIMITER $$
CREATE PROCEDURE sp_evaluar_riesgo_cliente (
    IN p_id_cliente INT,
    OUT p_nivel_riesgo VARCHAR(20)
)
BEGIN
    DECLARE cuotas_vencidas INT;
    DECLARE atraso_promedio DECIMAL(10,2);

    SELECT COUNT(*)
    INTO cuotas_vencidas
    FROM Cuota c
    JOIN Credito cr ON c.id_credito = cr.id_credito
    WHERE cr.id_cliente = p_id_cliente
    AND c.estado = 0
    AND c.fecha_de_vencimiento < NOW();

    SELECT AVG(demora)
    INTO atraso_promedio
    FROM Pago p
    JOIN Cuota c ON p.id_cuota = c.id_cuota
    JOIN Credito cr ON c.id_credito = cr.id_credito
    WHERE cr.id_cliente = p_id_cliente;

    IF cuotas_vencidas >= 3 OR atraso_promedio >= 15 THEN
        SET p_nivel_riesgo = 'ALTO';
    ELSEIF cuotas_vencidas = 0 AND atraso_promedio <= 3 THEN
        SET p_nivel_riesgo = 'BAJO';
    ELSE
        SET p_nivel_riesgo = 'MEDIO';
    END IF;
END;

/*Procedimiento: refinanciar automáticamente un crédito*/
CREATE PROCEDURE sp_refinanciar_credito (
    IN p_id_credito_original INT,
    IN p_nuevo_plazo INT,
    OUT p_id_credito_nuevo INT
)
BEGIN
    DECLARE saldo DECIMAL(10,2);
    DECLARE id_cliente INT;
    DECLARE id_producto INT;
    DECLARE tasa DECIMAL(10,2);

    -- calcular saldo pendiente
    SELECT SUM(c.monto_total - IFNULL(SUM(p.monto_pagado), 0))
    INTO saldo
    FROM Cuota c
    LEFT JOIN Pago p ON c.id_cuota = p.id_cuota
    WHERE c.id_credito = p_id_credito_original;

    IF saldo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El crédito no existe o no tiene saldo.';
    END IF;

    -- obtener datos originales
    SELECT id_cliente, id_producto_financiero
    INTO id_cliente, id_producto
    FROM Credito
    WHERE id_credito = p_id_credito_original;

    SELECT tasa_base INTO tasa
    FROM Producto_financiero
    WHERE id_producto_financiero = id_producto;

    -- crear crédito nuevo
    INSERT INTO Credito (id_cliente, id_producto_financiero, id_credito_padre,
                         monto_otorgado, fecha_inicio, tasa_aplicada,
                         plazo_devolucion, fecha_de_alta, creado_por)
    VALUES (id_cliente, id_producto, p_id_credito_original,
            saldo, NOW(), tasa,
            p_nuevo_plazo, NOW(), USER());

    SET p_id_credito_nuevo = LAST_INSERT_ID();
END;

/* Procedimiento: auditoría completa de cambios por tabla ESTE SI O SI*/
CREATE PROCEDURE sp_registrar_log (
    IN p_tabla VARCHAR(100),
    IN p_id_registro INT,
    IN p_accion VARCHAR(50),
    IN p_usuario VARCHAR(100)
)
BEGIN
    INSERT INTO Auditoria (tabla, id_registro, accion, usuario, fecha)
    VALUES (p_tabla, p_id_registro, p_accion, p_usuario, NOW());
END;

/*Vistas*/
/*ista: Clientes en mora y su último pago*/
CREATE OR REPLACE VIEW vw_clientes_en_mora AS
SELECT 
    cl.id_cliente,
    cl.nombre_cliente,
    cl.apellido_cliente,
    MAX(p.fecha_de_pago) AS ultima_fecha_pago,
    COALESCE(SUM(p.penalizacion_mora), 0) AS total_penalizaciones,
    DATEDIFF(NOW(), MAX(p.fecha_de_pago)) AS dias_desde_ultimo_pago
FROM Cliente cl
JOIN Credito cr ON cr.id_cliente = cl.id_cliente
JOIN Cuota cu ON cu.id_credito = cr.id_credito
LEFT JOIN Pago p ON p.id_cuota = cu.id_cuota
GROUP BY 
    cl.id_cliente, cl.nombre_cliente, cl.apellido_cliente
HAVING 
    total_penalizaciones > 0
    OR dias_desde_ultimo_pago > 30;
/*Vista: Créditos que vencen en los próximos 30 días*/
CREATE OR REPLACE VIEW vw_creditos_por_vencer AS
SELECT 
    id_credito,
    id_cliente,
    monto_otorgado,
    fecha_fin
FROM Credito
WHERE fecha_fin BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 30 DAY);

/*Vista: Créditos ya vencidos (complementaria)*/
CREATE OR REPLACE VIEW vw_creditos_vencidos AS
SELECT
    id_credito,
    id_cliente,
    monto_otorgado,
    fecha_fin,
    DATEDIFF(NOW(), fecha_fin) AS dias_vencido
FROM Credito
WHERE fecha_fin < NOW();

/*Vista: Clientes con crédito activo y su monto total otorgado*/
CREATE OR REPLACE VIEW vw_clientes_con_credito_activo AS
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    c.apellido_cliente,
    SUM(cr.monto_otorgado) AS total_otorgado,
    COUNT(cr.id_credito) AS cantidad_creditos
FROM Cliente c
JOIN Credito cr ON cr.id_cliente = c.id_cliente
WHERE 
    cr.fecha_de_baja IS NULL
    AND (cr.fecha_fin IS NULL OR cr.fecha_fin > NOW())
GROUP BY 
    c.id_cliente, c.nombre_cliente, c.apellido_cliente;
    
    /*TRANSACCINES*/

/*Otorgamiento de crédito + generación automática de sus primeras cuotas*/
START TRANSACTION;

-- Crear crédito basado en solicitud aprobada
INSERT INTO Credito(id_cliente, id_producto_financiero, id_solicitud, monto_otorgado,
                    fecha_inicio, fecha_fin, tasa_aplicada, plazo_devolucion, estado_crediticio,
                    creado_por)
SELECT s.id_cliente, 1, s.id_solicitud, s.monto, NOW(),
       DATE_ADD(NOW(), INTERVAL 12 MONTH), pf.tasa_base, 12, 'Activo', 'sistema'
FROM Solicitud s
JOIN Producto_financiero pf ON pf.id_producto_financiero = 1
WHERE s.id_solicitud = 10 AND s.estado = 1;

-- Obtener ID del crédito generado
SET @id_credito := LAST_INSERT_ID();

-- Generar 12 cuotas
INSERT INTO Cuota(id_credito, numero_cuota, fecha_de_emision, fecha_de_vencimiento, monto_total, estado, creado_por)
SELECT @id_credito, n, NOW(),
       DATE_ADD(NOW(), INTERVAL n MONTH),
       10000, 0, 'sistema'
FROM (
    SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
) AS meses;

COMMIT;
/*Registrar pago + actualizar saldo de la cuota + marcar penalización si corresponde*/
START TRANSACTION;

-- Insertar pago
INSERT INTO Pago(id_cuota, fecha_de_pago, monto_pagado, demora, penalizacion_mora, creado_por)
SELECT c.id_cuota, NOW(), 10000,
       DATEDIFF(NOW(), c.fecha_de_vencimiento),
       CASE WHEN NOW() > c.fecha_de_vencimiento THEN 500 ELSE 0 END,
       'empleado'
FROM Cuota c
WHERE c.id_cuota = 200;

-- Actualizar cuota a pagada
UPDATE Cuota
SET estado = 1,
    modificado_por = 'empleado'
WHERE id_cuota = 200;

COMMIT;
