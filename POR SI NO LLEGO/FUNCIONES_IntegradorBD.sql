USE financiamiento_kg;
/*FUNCIONES Y PROCEDIMIENTOS*/
/*Función: Calcular mora total acumulada de un cliente*/
DELIMITER $$

CREATE FUNCTION mora_total_cliente (p_id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT IFNULL(SUM(pa.penalizacion_mora), 0)
    INTO v_total
    FROM Pago pa
    JOIN Cuota cu ON cu.id_cuota = pa.id_cuota
    JOIN Credito cr ON cr.id_credito = cu.id_credito
    JOIN Solicitud s ON s.id_solicitud = cr.id_solicitud
    WHERE s.id_cliente = p_id_cliente;

    RETURN v_total;
END $$

DELIMITER ;

/*Procedimiento registrar pago*/
DELIMITER $$

CREATE PROCEDURE registrar_pago (
    IN p_id_cuota INT,
    IN p_monto_pagado DECIMAL(10,2),
    IN p_fecha_pago TIMESTAMP
)
BEGIN
    DECLARE v_fecha_venc TIMESTAMP;
    DECLARE v_demora INT;
    DECLARE v_penalizacion DECIMAL(10,2);

    SELECT fecha_de_vencimiento
    INTO v_fecha_venc
    FROM Cuota
    WHERE id_cuota = p_id_cuota;

    SET v_demora = DATEDIFF(p_fecha_pago, v_fecha_venc);
    SET v_penalizacion = IF(v_demora > 0, v_demora * 100, 0);

    INSERT INTO Pago (
        id_cuota, fecha_de_pago, monto_pagado, demora, penalizacion_mora, fecha_de_alta
    ) VALUES (
        p_id_cuota, p_fecha_pago, p_monto_pagado, v_demora, v_penalizacion, NOW()
    );

    UPDATE Cuota
    SET estado = TRUE,
        fecha_de_modificacion = NOW()
    WHERE id_cuota = p_id_cuota;

END$$

DELIMITER ;

/*Procedimiento aprobacion de solicitudes*/
DELIMITER $$

CREATE PROCEDURE aprobar_solicitud (
    IN p_id_solicitud INT,
    IN p_tasa DECIMAL(10,2),
    IN p_plazo INT
)
BEGIN
    DECLARE v_monto DECIMAL(10,2);

    SELECT monto
    INTO v_monto
    FROM Solicitud
    WHERE id_solicitud = p_id_solicitud
      AND estado = TRUE;

    INSERT INTO Credito (
        id_producto_financiero,
        id_solicitud,
        monto_otorgado,
        fecha_inicio,
        fecha_fin,
        tasa_aplicada,
        plazo_devolucion,
        estado_crediticio,
        fecha_de_alta
    ) VALUES (
        1,
        p_id_solicitud,
        v_monto,
        NOW(),
        DATE_ADD(NOW(), INTERVAL p_plazo DAY),
        p_tasa,
        p_plazo,
        'Activo',
        NOW()
    );
END$$

DELIMITER ;

/*Procedimiento: para generar cuotas*/
DELIMITER $$

CREATE PROCEDURE generacion_de_cuotas(
    IN p_id_credito INT,
    IN p_cuotas INT
)
BEGIN
    DECLARE v_monto DECIMAL(10,2);
    DECLARE v_valor_cuota DECIMAL(10,2);
    DECLARE v_i INT DEFAULT 1;

    SELECT monto_otorgado
    INTO v_monto
    FROM Credito
    WHERE id_credito = p_id_credito;

    SET v_valor_cuota = v_monto / p_cuotas;

    WHILE v_i <= p_cuotas DO
        INSERT INTO Cuota (
            id_credito, numero_cuota, fecha_de_emision,
            fecha_de_vencimiento, monto_total, estado, fecha_de_alta
        ) VALUES (
            p_id_credito,
            v_i,
            NOW(),
            DATE_ADD(NOW(), INTERVAL (30 * v_i) DAY),
            v_valor_cuota,
            FALSE,
            NOW()
        );

        SET v_i = v_i + 1;
    END WHILE;
END$$

DELIMITER ;
/*Procedimiento:*/
DELIMITER $$

CREATE PROCEDURE reporte_cliente (
    IN p_id_cliente INT
)
BEGIN
    SELECT 
        c.id_cliente,
        c.nombre_cliente,
        c.apellido_cliente,
        cr.id_credito,
        cr.monto_otorgado,
        cr.estado_crediticio,
        SUM(cu.monto_total) AS deuda_total,
        SUM(CASE WHEN cu.estado = TRUE THEN cu.monto_total ELSE 0 END) AS cuotas_pagadas,
        SUM(CASE WHEN cu.estado = FALSE THEN cu.monto_total ELSE 0 END) AS cuotas_pendientes,
        mora_total_cliente(c.id_cliente) AS mora_acumulada
    FROM Cliente c
    JOIN Solicitud s ON s.id_cliente = c.id_cliente
    JOIN Credito cr ON cr.id_solicitud = s.id_solicitud
    JOIN Cuota cu ON cu.id_credito = cr.id_credito
    WHERE c.id_cliente = p_id_cliente
    GROUP BY 
        c.id_cliente, c.nombre_cliente, c.apellido_cliente,
        cr.id_credito, cr.monto_otorgado, cr.estado_crediticio;
END$$

DELIMITER ;

/*VISTAS*/
/*Vista: Clientes en mora y su último pago*/
CREATE VIEW vista_clientes_mora AS
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    c.apellido_cliente,
    cu.id_cuota,
    cu.fecha_de_vencimiento,
    cu.monto_total,
    cu.estado AS cuota_pagada,
    p.fecha_de_pago AS ultimo_pago_fecha,
    p.monto_pagado AS ultimo_pago_monto
FROM Cliente c
JOIN Solicitud s ON s.id_cliente = c.id_cliente
JOIN Credito cr ON cr.id_solicitud = s.id_solicitud
JOIN Cuota cu ON cu.id_credito = cr.id_credito
LEFT JOIN Pago p ON p.id_cuota = cu.id_cuota
WHERE cu.fecha_de_vencimiento < NOW()
  AND cu.estado = FALSE;   -- FALSE = no pagada

    
/*Vista: Créditos que vencen en los próximos 30 días*/
CREATE VIEW vista_creditos_vencimiento AS
SELECT 
    cr.id_credito,
    cr.monto_otorgado,
    cr.fecha_inicio,
    cr.fecha_fin,
    c.id_cliente,
    c.nombre_cliente,
    c.apellido_cliente
FROM Credito cr
JOIN Solicitud s ON s.id_solicitud = cr.id_solicitud
JOIN Cliente c ON c.id_cliente = s.id_cliente
WHERE cr.fecha_fin BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 30 DAY);


/*Vista: Clientes con crédito activo y su monto total otorgado*/
CREATE VIEW vista_credito_activo AS
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    c.apellido_cliente,
    SUM(cr.monto_otorgado) AS monto_total_otorgado,
    COUNT(cr.id_credito) AS cantidad_creditos_activos
FROM Cliente c
JOIN Solicitud s ON s.id_cliente = c.id_cliente
JOIN Credito cr ON cr.id_solicitud = s.id_solicitud
WHERE cr.estado_crediticio = 'Activo'
GROUP BY 
    c.id_cliente, c.nombre_cliente, c.apellido_cliente;
    
/*VISTAS PERMISOS*/
GRANT SELECT, INSERT, UPDATE, DELETE ON financiamiento_kg.* TO 'admin_finanzas'@'%';
GRANT ALL PRIVILEGES ON financiamiento_kg.* TO 'admin_finanzas'@'%';
GRANT SELECT ON financiamiento_kg.vista_clientes_mora TO 'editor_finanzas'@'%';
GRANT SELECT ON financiamiento_kg.vista_creditos_vencimiento TO 'editor_finanzas'@'%';
GRANT SELECT ON financiamiento_kg.vista_credito_activo TO 'editor_finanzas'@'%';

GRANT SELECT ON financiamiento_kg.vista_clientes_mora TO 'lector_finanzas'@'%';
GRANT SELECT ON financiamiento_kg.vista_creditos_vencimiento TO 'lector_finanzas'@'%';
GRANT SELECT ON financiamiento_kg.vista_credito_activo TO 'lector_finanzas'@'%';
REVOKE INSERT ON financiamiento_kg.* FROM 'lector_finanzas'@'%';
REVOKE UPDATE ON financiamiento_kg.* FROM 'lector_finanzas'@'%';
REVOKE DELETE ON financiamiento_kg.* FROM 'lector_finanzas'@'%';
REVOKE CREATE ON financiamiento_kg.* FROM 'lector_finanzas'@'%';
REVOKE DROP ON financiamiento_kg.* FROM 'lector_finanzas'@'%';
    
/*TRANSACCINES*/
/*Otorgamiento de un crédito + generación automática de cuotas*/
START TRANSACTION;

SELECT id_solicitud 
INTO @sol
FROM Solicitud
WHERE id_solicitud BETWEEN 11 AND 70
ORDER BY id_solicitud
LIMIT 1;

INSERT INTO Credito(
    id_producto_financiero,
    id_solicitud,
    monto_otorgado,
    fecha_inicio,
    fecha_fin,
    tasa_aplicada,
    plazo_devolucion,
    estado_crediticio,
    fecha_de_alta,
    creado_por
)
SELECT 1, s.id_solicitud, s.monto, NOW(),
       DATE_ADD(NOW(), INTERVAL 12 MONTH), pf.tasa_base,
       12, 'Activo', NOW(), 1
FROM Solicitud s
JOIN Producto_financiero pf ON pf.id_producto_financiero = 1
WHERE s.id_solicitud = @sol AND s.estado = 1;

SET @id_credito := LAST_INSERT_ID();

INSERT INTO Cuota(id_credito, numero_cuota, fecha_de_emision, fecha_de_vencimiento, monto_total, estado, fecha_de_alta, creado_por)
SELECT @id_credito, n, NOW(), DATE_ADD(NOW(), INTERVAL n MONTH), 10000, 0, NOW(), 1
FROM (
    SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
) AS meses;

COMMIT;
/*kk*/
START TRANSACTION;

SELECT id_credito
INTO @credito_original
FROM Credito
WHERE estado_crediticio = 'Activo'
ORDER BY id_credito
LIMIT 1;

UPDATE Credito
SET estado_crediticio = 'Reestructurado',
    fecha_de_modificacion = NOW(),
    modificado_por = 1
WHERE id_credito = @credito_original;

SELECT id_producto_financiero, id_solicitud, monto_otorgado
INTO @prod, @sol, @monto
FROM Credito
WHERE id_credito = @credito_original;

INSERT INTO Credito(
    id_producto_financiero,
    id_solicitud,
    id_credito_padre,
    monto_otorgado,
    fecha_inicio,
    fecha_fin,
    tasa_aplicada,
    plazo_devolucion,
    estado_crediticio,
    fecha_de_alta,
    creado_por
)
SELECT @prod, @sol, @credito_original, @monto,
       NOW(), DATE_ADD(NOW(), INTERVAL 18 MONTH),
       pf.tasa_base, 18, 'Activo', NOW(), 1
FROM Producto_financiero pf
WHERE pf.id_producto_financiero = @prod;

SET @credito_nuevo := LAST_INSERT_ID();

INSERT INTO Cuota(id_credito, numero_cuota, fecha_de_emision, fecha_de_vencimiento, monto_total, estado, fecha_de_alta, creado_por)
SELECT @credito_nuevo, n, NOW(), DATE_ADD(NOW(), INTERVAL n MONTH), @monto / 18, 0, NOW(), 1
FROM (
    SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
    UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18
) AS meses;

COMMIT;
