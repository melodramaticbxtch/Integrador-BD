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
