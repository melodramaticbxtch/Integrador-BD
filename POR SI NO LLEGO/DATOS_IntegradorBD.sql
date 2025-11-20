USE financiamiento_kg;
/*TABLA SUCURSAL*/
INSERT INTO sucursal (nombre_sucursal, localidad, provincia, telefono_sucursal, direccion, fecha_de_alta, creado_por)
VALUES ('Sucursal Salta Capital', 'Salta', 'Salta', '0387-431-0032', 'Florida 100', '2023-01-20 10:00:00', 'Sistema'),
       ('Sucursal Paraná', 'Paraná', 'Entre Ríos', '0343-421-0035', 'San Martín 800', '2023-05-30 10:00:00', 'Sistema'),
       ('Sucursal Goya', 'Goya', 'Corrientes', '03777-42-0041', 'Colón 500', '2024-01-30 10:00:00', 'Sistema'),
       ('Sucursal Posadas', 'Posadas', 'Misiones', '0376-442-0042', 'Bolívar 1700', '2024-03-01 10:00:00', 'Sistema');

/* TABLA EMPLEADO*/
INSERT INTO empleado (id_sucursal, dni_empleado, nombre_empleado, apellido_empleado, cargo, email_empleado, telefono_empleado, fecha_de_alta,
                      creado_por)
VALUES
-- Roles Directivos y Administrativos 
(1, '30123456', 'Ana', 'García', 'Gerente de Sucursal', 'ana.garcia@financiera.com', '1123456789', '2023-08-15 09:00:00', 'Sistema'),
(2, '31234567', 'Luis', 'Pérez', 'Gerente de Sucursal', 'luis.perez@financiera.com', '1134567890', '2023-09-01 09:00:00', 'Sistema'),
(3, '32345678', 'María', 'López', 'Gerente de Sucursal', 'maria.lopez@financiera.com', '1145678901', '2023-10-10 09:00:00', 'Sistema'),
(4, '33456789', 'Pedro', 'Martínez', 'Gerente de Sucursal', 'pedro.martinez@financiera.com', '1156789012', '2023-11-20 09:00:00', 'Sistema'),
(1, '34567890', 'Sofía', 'Rodríguez', 'Contador/a', 'sofia.rodriguez@financiera.com', '1167890123', '2024-01-05 09:00:00', 'Sistema'),
(2, '35678901', 'Javier', 'Fernández', 'Contador/a', 'javier.fernandez@financiera.com', '1178901234', '2024-02-14 09:00:00', 'Sistema'),
(3, '36789012', 'Elena', 'Torres', 'Jefe de Producto Financiero', 'elena.torres@financiera.com', '1189012345', '2024-03-25 09:00:00', 'Sistema'),
(4, '37890123', 'Andrés', 'Ruiz', 'Jefe de Producto Financiero', 'andres.ruiz@financiera.com', '1190123456', '2024-04-30 09:00:00', 'Sistema'),
(1, '38901234', 'Laura', 'Sánchez', 'Personal de Administración/RR.HH.', 'laura.sanchez@financiera.com', '1112345670', '2024-05-18 09:00:00',
 'Sistema'),
(2, '39012345', 'Daniel', 'Gómez', 'Personal de Administración/RR.HH.', 'daniel.gomez@financiera.com', '1123456701', '2024-06-22 09:00:00',
 'Sistema'),

-- Roles de Atención al Cliente y Oficiales de Crédito
(1, '40112233', 'Carmen', 'Díaz', 'Oficial de Créditos (Asesor)', 'carmen.diaz@financiera.com', '1134567012', '2024-07-01 09:00:00', 'Sistema'),
(1, '41223344', 'Alejandro', 'Hernández', 'Oficial de Créditos (Asesor)', 'alejandro.hernandez@financiera.com', '1145670123', '2024-07-15 09:00:00',
 'Sistema'),
(1, '42334455', 'Isabel', 'Vargas', 'Asesor de Atención al Cliente', 'isabel.vargas@financiera.com', '1156701234', '2024-08-01 09:00:00', 'Sistema'),
(2, '43445566', 'Ricardo', 'Iglesias', 'Oficial de Créditos (Asesor)', 'ricardo.iglesias@financiera.com', '1167012345', '2024-08-15 09:00:00',
 'Sistema'),
(2, '44556677', 'Natalia', 'Cano', 'Oficial de Créditos (Asesor)', 'natalia.cano@financiera.com', '1170123456', '2024-09-01 09:00:00', 'Sistema'),
(2, '45667788', 'Héctor', 'Gil', 'Asesor de Atención al Cliente', 'hector.gil@financiera.com', '1101234567', '2024-09-15 09:00:00', 'Sistema'),
(3, '46778899', 'Sara', 'Marín', 'Oficial de Créditos (Asesor)', 'sara.marin@financiera.com', '1112345678', '2024-10-01 09:00:00', 'Sistema'),
(3, '37889900', 'Manuel', 'Ortega', 'Oficial de Créditos (Asesor)', 'manuel.ortega@financiera.com', '1123456780', '2024-10-15 09:00:00', 'Sistema'),
(3, '48990011', 'Paula', 'Castro', 'Cajero/a', 'paula.castro@financiera.com', '1134567801', '2024-11-01 09:00:00', 'Sistema'),
(4, '39001122', 'Jorge', 'Reyes', 'Oficial de Créditos (Asesor)', 'jorge.reyes@financiera.com', '1145678012', '2024-11-15 09:00:00', 'Sistema'),
(4, '40112233', 'Eva', 'Morales', 'Oficial de Créditos (Asesor)', 'eva.morales@financiera.com', '1156780123', '2024-12-01 09:00:00', 'Sistema'),
(4, '51223344', 'Sergio', 'Soto', 'Asesor de Atención al Cliente', 'sergio.soto@financiera.com', '1167801234', '2024-12-15 09:00:00', 'Sistema'),
(1, '42334455', 'Beatriz', 'Herrero', 'Cajero/a', 'beatriz.herrero@financiera.com', '1178012345', '2025-01-01 09:00:00', 'Sistema'),
(2, '43445566', 'Pablo', 'Molina', 'Cajero/a', 'pablo.molina@financiera.com', '1180123456', '2025-01-15 09:00:00', 'Sistema'),
(3, '44556677', 'Diana', 'Bravo', 'Asesor de Atención al Cliente', 'diana.bravo@financiera.com', '1101234560', '2025-02-01 09:00:00', 'Sistema'),
(4, '45667788', 'Rubén', 'Vela', 'Cajero/a', 'ruben.vela@financiera.com', '1112345601', '2025-02-15 09:00:00', 'Sistema'),
(1, '46778899', 'Clara', 'León', 'Oficial de Créditos (Asesor)', 'clara.leon@financiera.com', '1123456012', '2025-03-01 09:00:00', 'Sistema'),
(2, '47889900', 'Félix', 'Peña', 'Oficial de Créditos (Asesor)', 'felix.pena@financiera.com', '1134560123', '2025-03-15 09:00:00', 'Sistema'),
(3, '48990011', 'Gloria', 'Cruz', 'Oficial de Créditos (Asesor)', 'gloria.cruz@financiera.com', '1145601234', '2025-04-01 09:00:00', 'Sistema'),
(4, '39001122', 'Iván', 'Herrera', 'Oficial de Créditos (Asesor)', 'ivan.herrera@financiera.com', '1156012345', '2025-04-15 09:00:00', 'Sistema'),

-- Roles de Evaluación de Riesgo y Analistas (Centralizados o distribuidos)
(1, '40112233', 'Marta', 'Pascual', 'Analista Crediticio', 'marta.pascual@financiera.com', '1160123456', '2023-01-20 09:00:00', 'Sistema'),
(2, '41223344', 'Raúl', 'Blanco', 'Analista Crediticio', 'raul.blanco@financiera.com', '1170123450', '2023-02-10 09:00:00', 'Sistema'),
(3, '52334455', 'Alicia', 'Santos', 'Analista Crediticio', 'alicia.santos@financiera.com', '1180123401', '2023-03-05 09:00:00', 'Sistema'),
(4, '53445566', 'Óscar', 'Nuñez', 'Analista Crediticio', 'oscar.nunez@financiera.com', '1190123012', '2023-04-12 09:00:00', 'Sistema'),
(1, '54556677', 'Adriana', 'Vázquez', 'Analista Crediticio', 'adriana.vazquez@financiera.com', '1110120123', '2023-05-28 09:00:00', 'Sistema'),
(2, '35667788', 'Bruno', 'Marcos', 'Gerente de Riesgos', 'bruno.marcos@financiera.com', '1120123456', '2022-12-01 09:00:00', 'Sistema'),
(3, '36778899', 'Marina', 'Ramos', 'Especialista en Modelos de Riesgo', 'marina.ramos@financiera.com', '1130123457', '2023-06-19 09:00:00',
 'Sistema'),
(4, '47889900', 'Hugo', 'Pardo', 'Especialista en Modelos de Riesgo', 'hugo.pardo@financiera.com', '1140123458', '2023-07-07 09:00:00', 'Sistema'),

-- Roles de Cobranzas, Marketing y Soporte
(1, '38990011', 'Esther', 'Conde', 'Gestor de Cobranzas', 'esther.conde@financiera.com', '1150123459', '2023-08-01 09:00:00', 'Sistema'),
(2, '39001122', 'Vicente', 'Mendoza', 'Gestor de Cobranzas', 'vicente.mendoza@financiera.com', '1160123460', '2023-09-11 09:00:00', 'Sistema'),
(3, '40112233', 'Rocío', 'Peña', 'Gestor de Cobranzas', 'rocio.pena@financiera.com', '1170123461', '2023-10-25 09:00:00', 'Sistema'),
(4, '41223344', 'Felipe', 'Soler', 'Gestor de Cobranzas', 'felipe.soler@financiera.com', '1180123462', '2023-11-03 09:00:00', 'Sistema'),
(1, '42334455', 'Jimena', 'Sierra', 'Especialista en Refinanciaciones', 'jimena.sierra@financiera.com', '1190123463', '2024-01-01 09:00:00',
 'Sistema'),
(2, '43445566', 'Benito', 'Lozano', 'Especialista en Refinanciaciones', 'benito.lozano@financiera.com', '1112345664', '2024-02-08 09:00:00',
 'Sistema'),
(3, '44556677', 'Teresa', 'Aguilar', 'Especialista en Marketing y Campañas', 'teresa.aguilar@financiera.com', '1123456765', '2024-03-17 09:00:00',
 'Sistema'),
(4, '45667788', 'Guillermo', 'Rey', 'Especialista en Marketing y Campañas', 'guillermo.rey@financiera.com', '1134567866', '2024-04-05 09:00:00',
 'Sistema'),
(1, '46778899', 'Patricia', 'Cruz', 'Técnico de Sistemas/Soporte', 'patricia.cruz@financiera.com', '1145678967', '2024-05-13 09:00:00', 'Sistema'),
(2, '47889900', 'Miguel', 'Gallego', 'Técnico de Sistemas/Soporte', 'miguel.gallego@financiera.com', '1156789068', '2024-06-20 09:00:00', 'Sistema'),
(3, '38990011', 'Nuria', 'Prieto', 'Cajero/a', 'nuria.prieto@financiera.com', '1167890169', '2024-07-28 09:00:00', 'Sistema'),
(4, '49001122', 'Ángel', 'Vidal', 'Asesor de Atención al Cliente', 'angel.vidal@financiera.com', '1178901270', '2024-08-05 09:00:00', 'Sistema'),
(1, '30112233', 'Julia', 'Méndez', 'Asesor de Atención al Cliente', 'julia.mendez@financiera.com', '1189012371', '2024-09-12 09:00:00', 'Sistema'),
(2, '46223344', 'Lorenzo', 'Duran', 'Asesor de Atención al Cliente', 'lorenzo.duran@financiera.com', '1190123472', '2024-10-18 09:00:00', 'Sistema'),

-- Oficiales de Crédito y Analistas adicionales para completar los 60
(3, '44334455', 'Rosa', 'Castro', 'Oficial de Créditos (Asesor)', 'rosa.castro@financiera.com', '1112345673', '2024-11-01 09:00:00', 'Sistema'),
(4, '45445566', 'Vicenta', 'Sáez', 'Oficial de Créditos (Asesor)', 'vicenta.saez@financiera.com', '1123456774', '2024-12-09 09:00:00', 'Sistema'),
(1, '41556677', 'Marcos', 'Pons', 'Oficial de Créditos (Asesor)', 'marcos.pons@financiera.com', '1134567875', '2025-01-01 09:00:00', 'Sistema'),
(2, '30667788', 'Elvira', 'Roldán', 'Oficial de Créditos (Asesor)', 'elvira.roldan@financiera.com', '1145678976', '2025-01-28 09:00:00', 'Sistema'),
(3, '39778899', 'Julián', 'Garrido', 'Analista Crediticio', 'julian.garrido@financiera.com', '1156789077', '2025-02-14 09:00:00', 'Sistema'),
(4, '39889900', 'Reyes', 'Cuesta', 'Analista Crediticio', 'reyes.cuesta@financiera.com', '1167890178', '2025-03-03 09:00:00', 'Sistema'),
(1, '38990011', 'Jesús', 'Arroyo', 'Analista Crediticio', 'jesus.arroyo@financiera.com', '1178901279', '2025-03-20 09:00:00', 'Sistema'),
(2, '41001122', 'Lorena', 'Moreno', 'Analista Crediticio', 'lorena.moreno@financiera.com', '1189012380', '2025-04-07 09:00:00', 'Sistema'),
(3, '47112233', 'Silvia', 'Ríos', 'Analista Crediticio', 'silvia.rios@financiera.com', '1190123481', '2025-04-25 09:00:00', 'Sistema'),
(4, '45223344', 'Gonzalo', 'Guerra', 'Analista Crediticio', 'gonzalo.guerra@financiera.com', '1112345682', '2025-05-12 09:00:00', 'Sistema');

/*TABLA PRODUCTO CAMPANA*/
INSERT INTO producto_campana (tasa_promocional, vigencia, resultado, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por,
                              modificado_por)
VALUES (2.5, '2025-12-01 00:00:00', 100.0, '2025-11-01 08:00:00', '2025-11-01 08:00:00', NULL, NULL, 1, NULL),
       (3.1, '2025-12-05 00:00:00', 150.0, '2025-11-02 09:00:00', '2025-11-02 09:00:00', NULL, NULL, 2, NULL),
       (1.8, '2025-12-10 00:00:00', 90.0, '2025-11-03 10:00:00', '2025-11-03 10:00:00', NULL, NULL, 3, NULL),
       (2.5, '2025-12-15 00:00:00', 120.0, '2025-11-04 11:00:00', '2025-11-04 11:00:00', NULL, NULL, 4, NULL),
       (3.1, '2025-12-20 00:00:00', 130.0, '2025-11-05 12:00:00', '2025-11-05 12:00:00', NULL, NULL, 5, NULL),
       (2.0, '2025-12-25 00:00:00', 110.0, '2025-11-06 13:00:00', '2025-11-06 13:00:00', NULL, NULL, 6, NULL),
       (2.5, '2025-12-30 00:00:00', 140.0, '2025-11-07 14:00:00', '2025-11-07 14:00:00', NULL, NULL, 7, NULL),
       (1.8, '2026-01-01 00:00:00', 95.0, '2025-11-08 15:00:00', '2025-11-08 15:00:00', NULL, NULL, 8, NULL),
       (3.1, '2026-01-05 00:00:00', 160.0, '2025-11-09 16:00:00', '2025-11-09 16:00:00', NULL, NULL, 9, NULL),
       (2.0, '2026-01-10 00:00:00', 105.0, '2025-11-10 17:00:00', '2025-11-10 17:00:00', NULL, NULL, 10, NULL);

INSERT INTO producto_campana (tasa_promocional, vigencia, resultado, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por,
                              modificado_por)
VALUES (2.0, '2026-03-01 00:00:00', 125.0, '2025-12-01 08:00:00', '2025-12-01 08:00:00', NULL, NULL, 61, NULL),
       (3.1, '2026-03-05 00:00:00', 135.0, '2025-12-02 09:00:00', '2025-12-02 09:00:00', NULL, NULL, 62, NULL),
       (1.8, '2026-03-10 00:00:00', 95.0, '2025-12-03 10:00:00', '2025-12-03 10:00:00', NULL, NULL, 5, NULL),
       (2.5, '2026-03-15 00:00:00', 145.0, '2025-12-04 11:00:00', '2025-12-04 11:00:00', NULL, NULL, 12, NULL),
       (2.0, '2026-03-20 00:00:00', 110.0, '2025-12-05 12:00:00', '2025-12-05 12:00:00', NULL, NULL, 18, NULL),
       (3.1, '2026-03-25 00:00:00', 155.0, '2025-12-06 13:00:00', '2025-12-06 13:00:00', NULL, NULL, 25, NULL),
       (1.8, '2026-03-30 00:00:00', 85.0, '2025-12-07 14:00:00', '2025-12-07 14:00:00', NULL, NULL, 33, NULL),
       (2.5, '2026-04-01 00:00:00', 130.0, '2025-12-08 15:00:00', '2025-12-08 15:00:00', NULL, NULL, 40, NULL),
       (2.0, '2026-04-05 00:00:00', 100.0, '2025-12-09 16:00:00', '2025-12-09 16:00:00', NULL, NULL, 47, NULL),
       (3.1, '2026-04-10 00:00:00', 140.0, '2025-12-10 17:00:00', '2025-12-10 17:00:00', NULL, NULL, 54, NULL);

INSERT INTO producto_campana (tasa_promocional, vigencia, resultado, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por,
                              modificado_por)
VALUES (1.8, '2026-04-15 00:00:00', 90.0, '2025-12-11 08:00:00', '2025-12-11 08:00:00', NULL, NULL, 3, NULL),
       (2.5, '2026-04-20 00:00:00', 115.0, '2025-12-12 09:00:00', '2025-12-12 09:00:00', NULL, NULL, 7, NULL),
       (3.1, '2026-04-25 00:00:00', 145.0, '2025-12-13 10:00:00', '2025-12-13 10:00:00', NULL, NULL, 15, NULL),
       (2.0, '2026-04-30 00:00:00', 105.0, '2025-12-14 11:00:00', '2025-12-14 11:00:00', NULL, NULL, 22, NULL),
       (2.5, '2026-05-05 00:00:00', 125.0, '2025-12-15 12:00:00', '2025-12-15 12:00:00', NULL, NULL, 29, NULL),
       (1.8, '2026-05-10 00:00:00', 85.0, '2025-12-16 13:00:00', '2025-12-16 13:00:00', NULL, NULL, 36, NULL),
       (3.1, '2026-05-15 00:00:00', 155.0, '2025-12-17 14:00:00', '2025-12-17 14:00:00', NULL, NULL, 43, NULL),
       (2.0, '2026-05-20 00:00:00', 100.0, '2025-12-18 15:00:00', '2025-12-18 15:00:00', NULL, NULL, 50, NULL),
       (2.5, '2026-05-25 00:00:00', 135.0, '2025-12-19 16:00:00', '2025-12-19 16:00:00', NULL, NULL, 57, NULL),
       (1.8, '2026-05-30 00:00:00', 95.0, '2025-12-20 17:00:00', '2025-12-20 17:00:00', NULL, NULL, 62, NULL);

INSERT INTO producto_campana (tasa_promocional, vigencia, resultado, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_de_modificacion,
                              creado_por, modificado_por)
VALUES (2.0, '2026-06-01 00:00:00', 110.0, '2025-12-21 08:00:00', '2025-12-21 08:00:00', NULL, NULL, 1, NULL),
       (3.1, '2026-06-05 00:00:00', 140.0, '2025-12-22 09:00:00', '2025-12-22 09:00:00', NULL, NULL, 8, NULL),
       (1.8, '2026-06-10 00:00:00', 95.0, '2025-12-23 10:00:00', '2025-12-23 10:00:00', NULL, NULL, 16, NULL),
       (2.5, '2026-06-15 00:00:00', 125.0, '2025-12-24 11:00:00', '2025-12-24 11:00:00', NULL, NULL, 23, NULL),
       (2.0, '2026-06-20 00:00:00', 105.0, '2025-12-25 12:00:00', '2025-12-25 12:00:00', NULL, NULL, 30, NULL),
       (3.1, '2026-06-25 00:00:00', 150.0, '2025-12-26 13:00:00', '2025-12-26 13:00:00', NULL, NULL, 37, NULL),
       (1.8, '2026-06-30 00:00:00', 85.0, '2025-12-27 14:00:00', '2025-12-27 14:00:00', NULL, NULL, 44, NULL),
       (2.5, '2026-07-05 00:00:00', 130.0, '2025-12-28 15:00:00', '2025-12-28 15:00:00', NULL, NULL, 51, NULL),
       (2.0, '2026-07-10 00:00:00', 100.0, '2025-12-29 16:00:00', '2025-12-29 16:00:00', NULL, NULL, 58, NULL),
       (3.1, '2026-07-15 00:00:00', 145.0, '2025-12-30 17:00:00', '2025-12-30 17:00:00', NULL, NULL, 62, NULL);

INSERT INTO producto_campana (tasa_promocional, vigencia, resultado, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por,
                              modificado_por)
VALUES (1.8, '2026-07-20 00:00:00', 90.0, '2025-12-31 08:00:00', '2025-12-31 08:00:00', NULL, NULL, 4, NULL),
       (2.5, '2026-07-25 00:00:00', 120.0, '2026-01-01 09:00:00', '2026-01-01 09:00:00', NULL, NULL, 11, NULL),
       (3.1, '2026-07-30 00:00:00', 150.0, '2026-01-02 10:00:00', '2026-01-02 10:00:00', NULL, NULL, 19, NULL),
       (2.0, '2026-08-05 00:00:00', 105.0, '2026-01-03 11:00:00', '2026-01-03 11:00:00', NULL, NULL, 26, NULL),
       (2.5, '2026-08-10 00:00:00', 130.0, '2026-01-04 12:00:00', '2026-01-04 12:00:00', NULL, NULL, 34, NULL),
       (1.8, '2026-08-15 00:00:00', 85.0, '2026-01-05 13:00:00', '2026-01-05 13:00:00', NULL, NULL, 41, NULL),
       (3.1, '2026-08-20 00:00:00', 155.0, '2026-01-06 14:00:00', '2026-01-06 14:00:00', NULL, NULL, 48, NULL),
       (2.0, '2026-08-25 00:00:00', 100.0, '2026-01-07 15:00:00', '2026-01-07 15:00:00', NULL, NULL, 55, NULL),
       (2.5, '2026-08-30 00:00:00', 135.0, '2026-01-08 16:00:00', '2026-01-08 16:00:00', NULL, NULL, 59, NULL),
       (1.8, '2026-09-05 00:00:00', 95.0, '2026-01-09 17:00:00', '2026-01-09 17:00:00', NULL, NULL, 62, NULL);

/*TABLA CLIENTE*/
INSERT INTO cliente (nombre_cliente, apellido_cliente, dni_cliente, tipo_de_persona, ingreso_declarado, domicilio, email_cliente, telefono_cliente,
                     fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por)
VALUES
-- Personas Físicas (id_cliente 1 - 40)
('Marcos', 'Fernandez', '25876543', 'fisica', 150000.00, 'Calle Falsa 123', 'marcos.f@mail.com', '1154321098', NOW(), NULL, NULL, 1, NULL),
('Carolina', 'Gomez', '30123456', 'fisica', 220000.00, 'Av. Libertador 4567', 'caro.g@mail.com', '1165432109', NOW(), NULL, NULL, 2, NULL),
('Ricardo', 'Perez', '27987654', 'fisica', 95000.00, 'Rivadavia 789', 'ricardo.p@mail.com', '1176543210', NOW(), NULL, NULL, 3, NULL),
('Valeria', 'Lopez', '35012345', 'fisica', 350000.00, 'Santa Fe 1010', 'valeria.l@mail.com', '1187654321', NOW(), NULL, NULL, 4, NULL),
('Javier', 'Duarte', '22567890', 'fisica', 80000.00, 'Corrientes 2020', 'javier.d@mail.com', '1198765432', NOW(), NULL, NULL, 5, NULL),
('Silvina', 'Ruiz', '31678901', 'fisica', 180000.00, 'Esmeralda 3030', 'silvina.r@mail.com', '1110987654', NOW(), NULL, NULL, 6, NULL),
('Alejandro', 'Castro', '29789012', 'fisica', 120000.00, 'Juncal 4040', 'ale.c@mail.com', '1121098765', NOW(), NULL, NULL, 7, NULL),
('Andrea', 'Sosa', '34890123', 'fisica', 280000.00, 'Marcelo T. 5050', 'andrea.s@mail.com', '1132109876', NOW(), NULL, NULL, 8, NULL),
('Diego', 'Torres', '26901234', 'fisica', 65000.00, 'Córdoba 6060', 'diego.t@mail.com', '1143210987', NOW(), NULL, NULL, 9, NULL),
('Florencia', 'Mendez', '33012345', 'fisica', 160000.00, 'Tucumán 7070', 'flor.m@mail.com', '1154321098', NOW(), NULL, NULL, 10, NULL),
('Hernán', 'Vazquez', '28123456', 'fisica', 400000.00, 'Lavalle 8080', 'hernan.v@mail.com', '1165432109', NOW(), NULL, NULL, 11, NULL),
('Lucia', 'Rios', '30234567', 'fisica', 110000.00, 'Viamonte 9090', 'lucia.r@mail.com', '1176543210', NOW(), NULL, NULL, 12, NULL),
('Pedro', 'Acosta', '25345678', 'fisica', 75000.00, 'Florida 1111', 'pedro.a@mail.com', '1187654321', NOW(), NULL, NULL, 13, NULL),
('Elena', 'Blanco', '32456789', 'fisica', 250000.00, 'Paraguay 2222', 'elena.b@mail.com', '1198765432', NOW(), NULL, NULL, 14, NULL),
('Gabriel', 'Cano', '24567890', 'fisica', 90000.00, 'Uruguay 3333', 'gabriel.c@mail.com', '1110987654', NOW(), NULL, NULL, 15, NULL),
('Daniela', 'Diaz', '31678901', 'fisica', 190000.00, 'Chile 4444', 'daniela.d@mail.com', '1121098765', NOW(), NULL, NULL, 16, NULL),
('Juan', 'Esposito', '23789012', 'fisica', 130000.00, 'Perú 5555', 'juan.e@mail.com', '1132109876', NOW(), NULL, NULL, 17, NULL),
('Romina', 'Flores', '34890123', 'fisica', 300000.00, 'Bolivia 6666', 'romina.f@mail.com', '1143210987', NOW(), NULL, NULL, 18, NULL),
('Mario', 'Gimenez', '26901234', 'fisica', 70000.00, 'Ecuador 7777', 'mario.g@mail.com', '1154321098', NOW(), NULL, NULL, 19, NULL),
('Natalia', 'Herrera', '33012345', 'fisica', 170000.00, 'Venezuela 8888', 'natalia.h@mail.com', '1165432109', NOW(), NULL, NULL, 20, NULL),
('Ezequiel', 'Ibañez', '28123456', 'fisica', 450000.00, 'Colombia 9999', 'eze.i@mail.com', '1176543210', NOW(), NULL, NULL, 21, NULL),
('Camila', 'Jara', '30234567', 'fisica', 100000.00, 'Brasil 1000', 'cami.j@mail.com', '1187654321', NOW(), NULL, NULL, 22, NULL),
('Ruben', 'Karp', '25345678', 'fisica', 60000.00, 'México 2000', 'ruben.k@mail.com', '1198765432', NOW(), NULL, NULL, 23, NULL),
('Sabrina', 'Ledesma', '32456789', 'fisica', 240000.00, 'Canadá 3000', 'sabri.l@mail.com', '1110987654', NOW(), NULL, NULL, 24, NULL),
('Hugo', 'Mendez', '24567890', 'fisica', 85000.00, 'Cuba 4000', 'hugo.m@mail.com', '1121098765', NOW(), NULL, NULL, 25, NULL),
('Veronica', 'Nuñez', '31678901', 'fisica', 200000.00, 'Japón 5000', 'vero.n@mail.com', '1132109876', NOW(), NULL, NULL, 26, NULL),
('Federico', 'Ortiz', '23789012', 'fisica', 140000.00, 'China 6000', 'fede.o@mail.com', '1143210987', NOW(), NULL, NULL, 27, NULL),
('Gisela', 'Paz', '34890123', 'fisica', 320000.00, 'India 7000', 'gise.p@mail.com', '1154321098', NOW(), NULL, NULL, 28, NULL),
('Tomas', 'Quinteros', '26901234', 'fisica', 55000.00, 'Rusia 8000', 'tomas.q@mail.com', '1165432109', NOW(), NULL, NULL, 29, NULL),
('Marina', 'Rios', '33012345', 'fisica', 155000.00, 'Alemania 9000', 'mari.r@mail.com', '1176543210', NOW(), NULL, NULL, 30, NULL),
('Franco', 'Sanchez', '28123456', 'fisica', 420000.00, 'Francia 1122', 'franco.s@mail.com', '1187654321', NOW(), NULL, NULL, 31, NULL),
('Cintia', 'Tapia', '30234567', 'fisica', 115000.00, 'Italia 3344', 'cintia.t@mail.com', '1198765432', NOW(), NULL, NULL, 32, NULL),
('Esteban', 'Uribe', '25345678', 'fisica', 68000.00, 'España 5566', 'esteban.u@mail.com', '1110987654', NOW(), NULL, NULL, 33, NULL),
('Analía', 'Vargas', '32456789', 'fisica', 230000.00, 'Portugal 7788', 'anali.v@mail.com', '1121098765', NOW(), NULL, NULL, 34, NULL),
('Leandro', 'Waisman', '24567890', 'fisica', 92000.00, 'Grecia 9900', 'leandro.w@mail.com', '1132109876', NOW(), NULL, NULL, 35, NULL),
('Paola', 'Xavier', '31678901', 'fisica', 210000.00, 'Egipto 1357', 'paola.x@mail.com', '1143210987', NOW(), NULL, NULL, 36, NULL),
('Dario', 'Yañez', '23789012', 'fisica', 125000.00, 'Sudáfrica 2468', 'dario.y@mail.com', '1154321098', NOW(), NULL, NULL, 37, NULL),
('Roxana', 'Zarate', '34890123', 'fisica', 330000.00, 'Australia 3691', 'roxana.z@mail.com', '1165432109', NOW(), NULL, NULL, 38, NULL),
('Sebastián', 'Arias', '26901234', 'fisica', 62000.00, 'Nueva Zelanda 4824', 'seba.a@mail.com', '1176543210', NOW(), NULL, NULL, 39, NULL),
('Jesica', 'Blanco', '33012345', 'fisica', 175000.00, 'Argentina 5957', 'jesi.b@mail.com', '1187654321', NOW(), NULL, NULL, 40, NULL),

-- Personas Jurídicas (id_cliente 41 - 60)
('Construcciones del Norte S.A.', NULL, '30701234567', 'juridica', 850000.00, 'Av. Olascoaga 100', 'norte.sa@mail.com', '3874987654', NOW(), NULL,
 NULL, 41, NULL),
('Logística Patagónica SRL', NULL, '30702345678', 'juridica', 550000.00, 'Ruta 3 Km 10', 'logistica.pata@mail.com', '2901765432', NOW(), NULL, NULL,
 42, NULL),
('Tecnología Global S.R.L.', NULL, '33703456789', 'juridica', 1200000.00, 'Bv. Oroño 2000', 'tech.global@mail.com', '3414567890', NOW(), NULL, NULL,
 43, NULL),
('Distribuidora El Sol S.A.', NULL, '30704567890', 'juridica', 700000.00, 'San Juan 333', 'elsol@mail.com', '2615678901', NOW(), NULL, NULL, 44,
 NULL),
('Imprenta Rápida SRL', NULL, '33705678901', 'juridica', 400000.00, 'Lavalleja 500', 'imprenta.r@mail.com', '3516789012', NOW(), NULL, NULL, 45,
 NULL),
('Servicios de Limpieza ABC', NULL, '30706789012', 'juridica', 300000.00, 'Salta 1200', 'limpieza.abc@mail.com', '3874123456', NOW(), NULL, NULL, 46,
 NULL),
('Desarrollos Inmobiliarios LTDA', NULL, '33707890123', 'juridica', 1500000.00, 'Entre Ríos 800', 'inmo.des@mail.com', '3434789012', NOW(), NULL,
 NULL, 47, NULL),
('Metalúrgica Sur S.A.', NULL, '30708901234', 'juridica', 950000.00, 'Pte. Perón 1500', 'metalurgica.sur@mail.com', '3777456789', NOW(), NULL, NULL,
 48, NULL),
('Comercializadora del Centro', NULL, '33709012345', 'juridica', 600000.00, '25 de Mayo 100', 'centro.com@mail.com', '3764012345', NOW(), NULL, NULL,
 49, NULL),
('Estudio Contable Global', NULL, '20710123456', 'juridica', 280000.00, 'San Lorenzo 450', 'contable.g@mail.com', '3874678901', NOW(), NULL, NULL, 50,
 NULL),
('Agencia de Viajes Sol y Mar', NULL, '30711234567', 'juridica', 450000.00, 'Belgrano 700', 'solymar@mail.com', '3434234567', NOW(), NULL, NULL, 51,
 NULL),
('Consultora Estratégica S.A.', NULL, '33712345678', 'juridica', 750000.00, 'Alvear 900', 'consultora.e@mail.com', '3777890123', NOW(), NULL, NULL,
 52, NULL),
('Alimentos Frescos SRL', NULL, '30713456789', 'juridica', 1100000.00, 'Libertad 1234', 'alimentos.f@mail.com', '3764345678', NOW(), NULL, NULL, 53,
 NULL),
('Taller Mecánico El Rayo', NULL, '33714567890', 'juridica', 350000.00, 'Mitre 567', 'taller.rayo@mail.com', '3874456789', NOW(), NULL, NULL, 54,
 NULL),
('Farmacia Central S.A.', NULL, '30715678901', 'juridica', 900000.00, 'Independencia 890', 'farmacia.c@mail.com', '3434567890', NOW(), NULL, NULL, 55,
 NULL),
('Moda Juvenil SRL', NULL, '33716789012', 'juridica', 500000.00, 'Roca 101', 'moda.j@mail.com', '3777678901', NOW(), NULL, NULL, 56, NULL),
('Servicios Informáticos 24/7', NULL, '30717890123', 'juridica', 650000.00, 'España 202', 'info247@mail.com', '3764890123', NOW(), NULL, NULL, 57,
 NULL),
('Panadería Artesanal El Trigo', NULL, '33718901234', 'juridica', 420000.00, 'Jujuy 303', 'panaderia.t@mail.com', '3874012345', NOW(), NULL, NULL, 58,
 NULL),
('Bodega Los Aromas S.A.', NULL, '30719012345', 'juridica', 1300000.00, 'Mendoza 404', 'bodega.a@mail.com', '3434123456', NOW(), NULL, NULL, 59,
 NULL),
('Frigorífico del Litoral', NULL, '33720123456', 'juridica', 1000000.00, 'San Martín 505', 'frigo.lito@mail.com', '3777789012', NOW(), NULL, NULL, 60,
 NULL);

/*PRODUCTO FINANCIERO*/
INSERT INTO producto_financiero (nombre_producto_financiero, descripcion, limite_max, limite_min, requisito, tasa_base, fecha_de_alta, fecha_de_baja,
                                 fecha_de_modificacion, creado_por, modificado_por)
VALUES
-- Bloque 1: Préstamos Personales (id 1-10)
('Préstamo Express', 'Crédito rápido de libre destino', 300000.00, 10000.00, 'Ingreso fijo 6 meses, Score > 550', 0.55, NOW(), NULL, NULL, '54',
 NULL),
('Préstamo Coche Usado', 'Financiación para compra de vehículos usados', 1500000.00, 50000.00, 'Antigüedad laboral 1 año, titularidad vehículo', 0.40,
 NOW(), NULL, NULL, '50', NULL),
('Préstamo Estudios', 'Crédito para educación y capacitación', 500000.00, 20000.00, 'Certificado de inscripción, ingresos comprobables', 0.65, NOW(),
 NULL, NULL, '46', NULL),
('Préstamo Consolidación', 'Para unificar deudas existentes', 800000.00, 100000.00, 'Análisis de deuda actual, Score > 600', 0.48, NOW(), NULL, NULL,
 '42', NULL),
('Préstamo Viajes', 'Crédito para paquetes turísticos y pasajes', 150000.00, 15000.00, 'Reserva de viaje, sin morosidad', 0.70, NOW(), NULL, NULL,
 '38', NULL),
('Préstamo Salud', 'Crédito para tratamientos médicos y cirugías', 400000.00, 25000.00, 'Presupuesto médico, ingresos estables', 0.58, NOW(), NULL,
 NULL, '34', NULL),
('Préstamo Joven', 'Crédito inicial para nuevos clientes', 100000.00, 5000.00, 'Edad 18-25, recibo de sueldo', 0.75, NOW(), NULL, NULL, '30', NULL),
('Préstamo Digital', 'Solicitud y desembolso 100% online', 200000.00, 5000.00, 'Cuenta bancaria activa, validación biométrica', 0.60, NOW(), NULL,
 NULL, '26', NULL),
('Préstamo Verde', 'Para reformas y equipos de eficiencia energética', 1000000.00, 100000.00, 'Presupuesto de obra/equipos, Score > 650', 0.45, NOW(),
 NULL, NULL, '22', NULL),
('Préstamo Pyme', 'Crédito para pequeños negocios unipersonales', 2500000.00, 50000.00, 'Monotributo/Autónomo 2 años, proyección de negocio', 0.35,
 NOW(), NULL, NULL, '21', NULL),

-- Bloque 2: Hipotecarios y Garantizados (id 11-20)
('Hipotecario Vivienda Única', 'Crédito para adquisición de primera vivienda', 30000000.00, 500000.00, 'Garantía hipotecaria, 20% ahorro propio',
 0.25, NOW(), NULL, NULL, '20', NULL),
('Hipotecario Refacción', 'Préstamo para ampliar o refaccionar vivienda', 5000000.00, 100000.00, 'Garantía hipotecaria, planos aprobados', 0.28,
 NOW(), NULL, NULL, '8', NULL),
('Hipotecario Lote', 'Financiación para compra de terrenos', 8000000.00, 200000.00, 'Tasación de lote, ingresos altos', 0.30, NOW(), NULL, NULL, '4',
 NULL),
('Crédito Prendario Nuevo', 'Financiación para vehículos 0km (Prenda)', 5000000.00, 100000.00, 'Prenda sobre el vehículo, seguro total', 0.38, NOW(),
 NULL, NULL, '61', NULL),
('Préstamo con Garantía Real', 'Crédito respaldado por inmueble (no hipotecario)', 10000000.00, 500000.00, 'Garantía real, sin gravámenes', 0.32,
 NOW(), NULL, NULL, '57', NULL),
('Préstamo con Garantía Fiduciaria', 'Crédito respaldado por fondo de garantía', 2000000.00, 200000.00, 'Adhesión a fideicomiso, aporte inicial',
 0.42, NOW(), NULL, NULL, '53', NULL),
('Hipotecario Uva', 'Crédito hipotecario con ajuste por inflación', 25000000.00, 300000.00, 'Relación cuota-ingreso estricta', 0.15, NOW(), NULL,
 NULL, '49', NULL),
('Préstamo Automático', 'Crédito preaprobado por sistema', 100000.00, 5000.00, 'Límite basado en historial de cliente', 0.68, NOW(), NULL, NULL, '45',
 NULL),
('Crédito para Adquisición de Maquinaria', 'Financiación de equipos productivos (Garantía Maquinaria)', 4000000.00, 500000.00,
 'Prenda sobre la maquinaria, plan de negocios', 0.36, NOW(), NULL, NULL, '41', NULL),
('Préstamo para Inquilinos', 'Garantía para alquiler (sustituye fianza)', 200000.00, 10000.00, 'Contrato de alquiler, 3 meses de ingresos', 0.50,
 NOW(), NULL, NULL, '37', NULL),

-- Bloque 3: Productos Empresariales y Líneas de Crédito (id 21-30)
('Línea de Crédito Rotativa', 'Fondo revolvente para capital de trabajo', 5000000.00, 50000.00, 'Balance 2 años, sujeto a revisión trimestral', 0.30,
 NOW(), NULL, NULL, '37', NULL),
('Descuento de Cheques', 'Anticipo de fondos por cheques de terceros', 10000000.00, 100000.00, 'Carpeta crediticia comercial, historial con el banco',
 0.20, NOW(), NULL, NULL, '33', NULL),
('Préstamo Agropecuario', 'Para siembra, cosecha o inversión rural', 15000000.00, 500000.00, 'Título de propiedad rural, plan de explotación', 0.22,
 NOW(), NULL, NULL, '29', NULL),
('Leasing de Equipamiento', 'Alquiler con opción a compra de activos fijos', 8000000.00, 100000.00,
 'Evaluación de flujo de caja, contrato con proveedor', 0.24, NOW(), NULL, NULL, '25', NULL),
('Comercio Exterior Pre-financiación', 'Crédito para insumos de exportación', 20000000.00, 1000000.00,
 'Contrato de exportación, historial de operaciones', 0.18, NOW(), NULL, NULL, '19', NULL),
('Cuenta Corriente con Acuerdo', 'Límite de descubierto en cuenta corriente', 2000000.00, 50000.00, 'Promedio de saldos, Score bancario alto', 0.40,
 NOW(), NULL, NULL, '18', NULL),
('Factoring sin Recurso', 'Venta de facturas a la entidad', 10000000.00, 500000.00, 'Clientes A+ en cartera, límite por deudor', 0.26, NOW(), NULL,
 NULL, '17', NULL),
('Garantía Bancaria', 'Emisión de avales para licitaciones o contratos', 5000000.00, 50000.00, 'Contragarantía (hipoteca/prenda), solidez financiera',
 0.15, NOW(), NULL, NULL, '7', NULL),
('Préstamo Turismo', 'Inversión en hotelería y servicios turísticos', 12000000.00, 500000.00, 'Habilitación municipal, proyección de ocupación', 0.33,
 NOW(), NULL, NULL, '3', NULL),
('Crédito Puente Constructor', 'Financiación de etapas de construcción', 50000000.00, 5000000.00, 'Permisos de obra, venta mínima de unidades', 0.19,
 NOW(), NULL, NULL, '60', NULL),

-- Bloque 4: Variaciones y Refuerzos (id 31-60)
-- Variaciones de Préstamos Personales (id 31-40)
('Préstamo Express Plus', 'Versión con límite ampliado y plazo mayor', 500000.00, 50000.00, 'Ingreso fijo 1 año, Score > 600', 0.50, NOW(), NULL,
 NULL, '52', NULL),
('Préstamo Consolidación Gold', 'Para unificar deudas grandes con mejor tasa', 1200000.00, 200000.00, 'Excelente historial, sin morosidad en 2 años',
 0.45, NOW(), NULL, NULL, '48', NULL),
('Préstamo Auto Clásico', 'Financiación de vehículos de colección', 800000.00, 100000.00, 'Tasación oficial, seguro específico', 0.42, NOW(), NULL,
 NULL, '44', NULL),
('Préstamo Estudios Postgrado', 'Crédito a largo plazo para posgrados', 800000.00, 100000.00, 'Aceptación en universidad, codeudor', 0.52, NOW(),
 NULL, NULL, '40', NULL),
('Préstamo Viajes Premium', 'Para viajes de lujo o larga estadía', 300000.00, 50000.00, 'Ingresos comprobables > 500k', 0.65, NOW(), NULL, NULL, '36',
 NULL),
('Préstamo Renovación Hogar', 'Para refacciones menores y decoración', 250000.00, 10000.00, 'Ingresos fijos, antigüedad 6 meses', 0.68, NOW(), NULL,
 NULL, '32', NULL),
('Préstamo Emprendedor', 'Lanzamiento de proyecto inicial', 300000.00, 20000.00, 'Plan de negocio básico, tutoría', 0.78, NOW(), NULL, NULL, '28',
 NULL),
('Préstamo Cajas de Ahorro', 'Garantizado por plazos fijos o ahorros', 1000000.00, 100000.00, 'Constitución de garantía líquida del 120%', 0.10,
 NOW(), NULL, NULL, '24', NULL),
('Préstamo de Anticipo de Haberes', 'Adelanto de sueldo automático', 50000.00, 1000.00, 'Convenio de nómina, antigüedad 3 meses', 0.85, NOW(), NULL,
 NULL, '16', NULL),
('Préstamo RSE', 'Para proyectos de impacto social/ambiental', 700000.00, 50000.00, 'Certificación de proyecto, bajo riesgo', 0.40, NOW(), NULL, NULL,
 '15', NULL),

-- Variaciones de Hipotecarios/Empresariales (id 41-50)
('Hipotecario Cliente Preferencial', 'Tasa reducida para clientes con historial', 35000000.00, 1000000.00, 'Cliente Platino/VIP, historial 5 años',
 0.23, NOW(), NULL, NULL, '14', NULL),
('Línea de Crédito Pyme Flexible', 'Límite dinámico ajustado al flujo de caja', 7000000.00, 100000.00, 'Flujo de caja positivo, garantía prendaria',
 0.28, NOW(), NULL, NULL, '10', NULL),
('Crédito Prendario Motos', 'Financiación de motos nuevas y usadas', 800000.00, 30000.00, 'Prenda sobre moto, seguro obligatorio', 0.55, NOW(), NULL,
 NULL, '6', NULL),
('Fianza de Alquiler Comercial', 'Aval para locales y oficinas', 500000.00, 20000.00, 'Balance 1 año, contrato de alquiler comercial', 0.45, NOW(),
 NULL, NULL, '2', NULL),
('Crédito para Exportación Directa', 'Financiación específica para grandes exportadores', 30000000.00, 2000000.00,
 'Facturación anual > 50MM, carta de crédito', 0.16, NOW(), NULL, NULL, '59', NULL),
('Préstamo Capitalización Rural', 'Inversión a largo plazo en tecnología rural', 20000000.00, 1000000.00,
 'Proyecto de inversión a 5 años, garantía real', 0.20, NOW(), NULL, NULL, '55', NULL),
('Hipotecario Segunda Vivienda', 'Para inversión inmobiliaria o casa de veraneo', 15000000.00, 500000.00, 'Propiedad libre de deuda, ingresos dobles',
 0.35, NOW(), NULL, NULL, '51', NULL),
('Préstamo Refuerzo', 'Segundo crédito para clientes con historial excelente', 100000.00, 5000.00, 'Sin atrasos en el crédito vigente', 0.62, NOW(),
 NULL, NULL, '47', NULL),
('Descuento de E-Cheqs', 'Digitalización del descuento de valores', 5000000.00, 50000.00, 'Cuenta comitente activa, firma digital', 0.23, NOW(), NULL,
 NULL, '43', NULL),
('Garantía de Cumplimiento', 'Aval para asegurar finalización de obras', 10000000.00, 1000000.00, 'Capacidad de endeudamiento probada', 0.17, NOW(),
 NULL, NULL, '39', NULL),

-- Nuevos Productos (id 51-60)
('Microcrédito', 'Préstamo social para emprendedores de bajos ingresos', 50000.00, 1000.00, 'Validación comunitaria/ONG, plan simple', 0.95, NOW(),
 NULL, NULL, '35', NULL),
('Préstamo para Franquicias', 'Financiación de costos iniciales de franquicias', 1000000.00, 100000.00,
 'Contrato de franquicia, viabilidad de negocio', 0.40, NOW(), NULL, NULL, '31', NULL),
('Línea de Comercio Electrónico', 'Capital de trabajo para plataformas online', 2000000.00, 50000.00, 'Historial de ventas online, integración API',
 0.38, NOW(), NULL, NULL, '27', NULL),
('Préstamo para Honorarios', 'Para profesionales que cobran por honorarios', 400000.00, 20000.00, 'Matrícula profesional, 1 año de ejercicio', 0.55,
 NOW(), NULL, NULL, '23', NULL),
('Hipotecario Dólar Link', 'Préstamo en pesos ajustado al tipo de cambio oficial', 20000000.00, 500000.00, 'Ingresos indexados al dólar o altos',
 0.20, NOW(), NULL, NULL, '13', NULL),
('Préstamo para Tecnología', 'Compra de hardware y software profesional', 600000.00, 30000.00, 'Factura proforma, ingresos estables', 0.50, NOW(),
 NULL, NULL, '12', NULL),
('Crédito para Inclusión Financiera', 'Productos con menores requisitos para no bancarizados', 80000.00, 5000.00,
 'Verificación de identidad simple, límite inicial bajo', 1.10, NOW(), NULL, NULL, '11', NULL),
('Préstamo para Bodas y Eventos', 'Financiación de fiestas y grandes eventos', 500000.00, 50000.00, 'Presupuesto de proveedores, 1 año de antigüedad',
 0.60, NOW(), NULL, NULL, '9', NULL),
('Línea de Inversión Fija', 'Para compra de activos fijos de empresas', 15000000.00, 500000.00, 'Proyecto de inversión detallado, garantía mixta',
 0.25, NOW(), NULL, NULL, '5', NULL),
('Préstamo para Jubilados', 'Crédito con descuento de cuota en el haber', 300000.00, 10000.00, 'Último recibo de haber, sin morosidad previsional',
 0.50, NOW(), NULL, NULL, '1', NULL);

/*TABLA SOLICITUD*/
INSERT INTO solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, puntaje_riesgo,
                       fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES (150000.00, 'Compra de vehículo', '2025-11-01 10:00:00', TRUE, NULL, 2, '2025-11-01 10:00:00', NULL, NULL, 1, NULL, 1),
       (220000.00, 'Refacción de vivienda', '2025-11-03 11:30:00', FALSE, 'Falta de documentación', 5, '2025-11-03 11:30:00', NULL, NULL, 2, NULL, 2),
       (95000.00, 'Pago de deudas', '2025-11-05 09:15:00', TRUE, NULL, 1, '2025-11-05 09:15:00', NULL, NULL, 3, NULL, 3),
       (350000.00, 'Capital de trabajo', '2025-11-07 14:45:00', TRUE, NULL, 3, '2025-11-07 14:45:00', NULL, NULL, 4, NULL, 4),
       (80000.00, 'Compra de herramientas', '2025-11-09 08:20:00', FALSE, 'Historial crediticio negativo', 4, '2025-11-09 08:20:00', NULL, NULL, 5,
        NULL, 5),
       (180000.00, 'Inversión en negocio', '2025-11-11 13:00:00', TRUE, NULL, 1, '2025-11-11 13:00:00', NULL, NULL, 6, NULL, 6),
       (120000.00, 'Gastos médicos', '2025-11-13 16:10:00', TRUE, NULL, 2, '2025-11-13 16:10:00', NULL, NULL, 7, NULL, 7),
       (280000.00, 'Compra de maquinaria', '2025-11-15 10:30:00', FALSE, 'Excede capacidad de pago', 4, '2025-11-15 10:30:00', NULL, NULL, 8, NULL,
        8),
       (65000.00, 'Estudios universitarios', '2025-11-17 12:00:00', TRUE, NULL, 3, '2025-11-17 12:00:00', NULL, NULL, 9, NULL, 9),
       (160000.00, 'Mudanza y alquiler', '2025-11-19 15:45:00', TRUE, NULL, 2, '2025-11-19 15:45:00', NULL, NULL, 10, NULL, 10);

INSERT INTO solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, puntaje_riesgo,
                       fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES (200000.00, 'Compra de insumos', '2025-11-21 09:00:00', TRUE, NULL, 1, '2025-11-21 09:00:00', NULL, NULL, 11, NULL, 11),
       (175000.00, 'Reparación de maquinaria', '2025-11-22 10:30:00', FALSE, 'Cliente en mora', 4, '2025-11-22 10:30:00', NULL, NULL, 12, NULL, 12),
       (95000.00, 'Gastos personales', '2025-11-23 11:45:00', TRUE, NULL, 3, '2025-11-23 11:45:00', NULL, NULL, 13, NULL, 13),
       (300000.00, 'Ampliación de local', '2025-11-24 14:15:00', TRUE, NULL, 2, '2025-11-24 14:15:00', NULL, NULL, 14, NULL, 14),
       (85000.00, 'Compra de mobiliario', '2025-11-25 08:50:00', FALSE, 'Documentación vencida', 5, '2025-11-25 08:50:00', NULL, NULL, 15, NULL, 15),
       (190000.00, 'Viaje de negocios', '2025-11-26 13:20:00', TRUE, NULL, 1, '2025-11-26 13:20:00', NULL, NULL, 16, NULL, 16),
       (140000.00, 'Renovación de flota', '2025-11-27 15:10:00', TRUE, NULL, 3, '2025-11-27 15:10:00', NULL, NULL, 17, NULL, 17),
       (310000.00, 'Compra de stock', '2025-11-28 09:40:00', FALSE, 'Inconsistencias en ingresos', 4, '2025-11-28 09:40:00', NULL, NULL, 18, NULL,
        18),
       (70000.00, 'Mudanza', '2025-11-29 12:30:00', TRUE, NULL, 2, '2025-11-29 12:30:00', NULL, NULL, 19, NULL, 19),
       (165000.00, 'Estudios de posgrado', '2025-11-30 16:00:00', TRUE, NULL, 1, '2025-11-30 16:00:00', NULL, NULL, 20, NULL, 20);

INSERT INTO solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, puntaje_riesgo,
                       fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES (185000.00, 'Compra de equipamiento', '2025-12-01 09:00:00', TRUE, NULL, 2, '2025-12-01 09:00:00', NULL, NULL, 21, NULL, 21),
       (210000.00, 'Reforma de oficina', '2025-12-02 10:30:00', FALSE, 'Ingresos insuficientes', 5, '2025-12-02 10:30:00', NULL, NULL, 22, NULL, 22),
       (98000.00, 'Gastos médicos', '2025-12-03 11:45:00', TRUE, NULL, 1, '2025-12-03 11:45:00', NULL, NULL, 23, NULL, 23),
       (320000.00, 'Expansión comercial', '2025-12-04 14:15:00', TRUE, NULL, 3, '2025-12-04 14:15:00', NULL, NULL, 24, NULL, 24),
       (87000.00, 'Compra de mobiliario', '2025-12-05 08:50:00', FALSE, 'Cliente con antecedentes negativos', 4, '2025-12-05 08:50:00', NULL, NULL,
        25, NULL, 25),
       (195000.00, 'Viaje corporativo', '2025-12-06 13:20:00', TRUE, NULL, 1, '2025-12-06 13:20:00', NULL, NULL, 26, NULL, 26),
       (145000.00, 'Renovación de flota', '2025-12-07 15:10:00', TRUE, NULL, 2, '2025-12-07 15:10:00', NULL, NULL, 27, NULL, 27),
       (315000.00, 'Compra de stock', '2025-12-08 09:40:00', FALSE, 'Falta de garantías', 5, '2025-12-08 09:40:00', NULL, NULL, 28, NULL, 28),
       (72000.00, 'Mudanza', '2025-12-09 12:30:00', TRUE, NULL, 3, '2025-12-09 12:30:00', NULL, NULL, 29, NULL, 29),
       (170000.00, 'Estudios en el exterior', '2025-12-10 16:00:00', TRUE, NULL, 2, '2025-12-10 16:00:00', NULL, NULL, 30, NULL, 30);

INSERT INTO solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, puntaje_riesgo,
                       fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES (190000.00, 'Compra de insumos médicos', '2025-12-11 09:00:00', TRUE, NULL, 1, '2025-12-11 09:00:00', NULL, NULL, 31, NULL, 31),
       (215000.00, 'Reparación de instalaciones', '2025-12-12 10:30:00', FALSE, 'Cliente en revisión judicial', 4, '2025-12-12 10:30:00', NULL, NULL,
        32, NULL, 32),
       (99000.00, 'Gastos familiares', '2025-12-13 11:45:00', TRUE, NULL, 3, '2025-12-13 11:45:00', NULL, NULL, 33, NULL, 33),
       (325000.00, 'Apertura de sucursal', '2025-12-14 14:15:00', TRUE, NULL, 2, '2025-12-14 14:15:00', NULL, NULL, 34, NULL, 34),
       (88000.00, 'Compra de mobiliario escolar', '2025-12-15 08:50:00', FALSE, 'Falta de aval institucional', 5, '2025-12-15 08:50:00', NULL, NULL,
        35, NULL, 35),
       (198000.00, 'Viaje académico', '2025-12-16 13:20:00', TRUE, NULL, 1, '2025-12-16 13:20:00', NULL, NULL, 36, NULL, 36),
       (148000.00, 'Renovación de equipos', '2025-12-17 15:10:00', TRUE, NULL, 3, '2025-12-17 15:10:00', NULL, NULL, 37, NULL, 37),
       (318000.00, 'Compra de mercadería', '2025-12-18 09:40:00', FALSE, 'Inconsistencias en documentación', 4, '2025-12-18 09:40:00', NULL, NULL, 38,
        NULL, 38),
       (73000.00, 'Mudanza internacional', '2025-12-19 12:30:00', TRUE, NULL, 2, '2025-12-19 12:30:00', NULL, NULL, 39, NULL, 39),
       (175000.00, 'Estudios técnicos', '2025-12-20 16:00:00', TRUE, NULL, 1, '2025-12-20 16:00:00', NULL, NULL, 40, NULL, 40);

INSERT INTO solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, puntaje_riesgo,
                       fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES (195000.00, 'Compra de equipamiento médico', '2025-12-21 09:00:00', TRUE, NULL, 3, '2025-12-21 09:00:00', NULL, NULL, 41, NULL, 41),
       (225000.00, 'Reforma de local comercial', '2025-12-22 10:30:00', FALSE, 'Cliente con deuda activa', 5, '2025-12-22 10:30:00', NULL, NULL, 42,
        NULL, 42),
       (101000.00, 'Gastos personales urgentes', '2025-12-23 11:45:00', TRUE, NULL, 1, '2025-12-23 11:45:00', NULL, NULL, 43, NULL, 43),
       (330000.00, 'Apertura de nueva sede', '2025-12-24 14:15:00', TRUE, NULL, 2, '2025-12-24 14:15:00', NULL, NULL, 44, NULL, 44),
       (89000.00, 'Compra de mobiliario urbano', '2025-12-25 08:50:00', FALSE, 'Falta de documentación respaldatoria', 4, '2025-12-25 08:50:00', NULL,
        NULL, 45, NULL, 45),
       (205000.00, 'Viaje institucional', '2025-12-26 13:20:00', TRUE, NULL, 3, '2025-12-26 13:20:00', NULL, NULL, 46, NULL, 46),
       (150000.00, 'Renovación de sistemas', '2025-12-27 15:10:00', TRUE, NULL, 1, '2025-12-27 15:10:00', NULL, NULL, 47, NULL, 47),
       (320000.00, 'Compra de insumos agrícolas', '2025-12-28 09:40:00', FALSE, 'Cliente con historial irregular', 5, '2025-12-28 09:40:00', NULL,
        NULL, 48, NULL, 48),
       (74000.00, 'Mudanza nacional', '2025-12-29 12:30:00', TRUE, NULL, 2, '2025-12-29 12:30:00', NULL, NULL, 49, NULL, 49),
       (180000.00, 'Estudios de especialización', '2025-12-30 16:00:00', TRUE, NULL, 3, '2025-12-30 16:00:00', NULL, NULL, 50, NULL, 50);

INSERT INTO solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, puntaje_riesgo,
                       fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES (200000.00, 'Compra de
herramientas industriales', '2025-12-31 09:00:00', TRUE, NULL, 1, '2025-12-31 09:00:00', NULL, NULL, 51, NULL, 51),
       (230000.00, 'Reforma de
planta', '2026-01-01 10:30:00', FALSE, 'Falta de documentación técnica', 4, '2026-01-01 10:30:00', NULL, NULL, 52,
        NULL, 52),
       (102000.00, 'Gastos de mudanza', '2026-01-02 11:45:00', TRUE, NULL, 3, '2026-01-02 11:45:00', NULL, NULL, 53, NULL, 53),
       (335000.00, 'Apertura de nueva oficina', '2026-01-03 14:15:00', TRUE, NULL, 2, '2026-01-03 14:15:00', NULL, NULL, 54, NULL, 54),
       (90000.00, 'Compra de mobiliario de oficina', '2026-01-04 08:50:00', FALSE, 'Cliente con historial irregular', 5, '2026-01-04 08:50:00', NULL,
        NULL, 55, NULL, 55),
       (210000.00, 'Viaje de capacitación', '2026-01-05 13:20:00', TRUE, NULL, 1, '2026-01-05 13:20:00', NULL, NULL, 56, NULL, 56),
       (152000.00, 'Renovación de flota vehicular', '2026-01-06 15:10:00', TRUE, NULL, 3, '2026-01-06 15:10:00', NULL, NULL, 57, NULL, 57),
       (325000.00, 'Compra de insumos tecnológicos', '2026-01-07 09:40:00', FALSE, 'Falta de garantías comerciales', 4, '2026-01-07 09:40:00', NULL,
        NULL, 58, NULL, 58),
       (75000.00, 'Mudanza y alquiler', '2026-01-08 12:30:00', TRUE, NULL, 2, '2026-01-08 12:30:00', NULL, NULL, 59, NULL, 59),
       (185000.00, 'Estudios universitarios', '2026-01-09 16:00:00', TRUE, NULL, 1, '2026-01-09 16:00:00', NULL, NULL, 60, NULL, 60);

/*TABLA GARANTE*/
INSERT INTO garante (nombre_garante, apellido_garante, dni_garante, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por,
                     id_solicitud)
VALUES ('Lucas', 'Gómez', '32789456', NOW(), NULL, NULL, 12, 12, 1),
       ('Mariana', 'Soria', '28900444', NOW(), NULL, NULL, 5, NULL, 2),
       ('Sofía', 'Benítez', '33822190', NOW(), NULL, NULL, 18, 9, 3),
       ('Nicolás', 'Pereyra', '36111987', NOW(), NULL, NULL, 21, NULL, 4),
       ('Carla', 'Domínguez', '29544882', NOW(), NULL, NULL, 16, 8, 5),
       ('Julián', 'Mercado', '40111922', NOW(), NULL, NULL, 7, NULL, 6),
       ('Victoria', 'Ríos', '37222811', NOW(), NULL, NULL, 19, 19, 7),
       ('Leonardo', 'Dávila', '33149777', NOW(), NULL, NULL, 6, NULL, 8),
       ('Ana', 'Páez', '27400988', NOW(), NULL, NULL, 25, 25, 9),
       ('Gabriel', 'Torres', '38743821', NOW(), NULL, NULL, 11, 11, 10),
       ('María', 'Acuña', '29888110', NOW(), NULL, NULL, 4, NULL, 11),
       ('Pablo', 'Coria', '34922881', NOW(), NULL, NULL, 55, 55, 12),
       ('Esteban', 'Vera', '41299300', NOW(), NULL, NULL, 22, 10, 13),
       ('Cintia', 'Lagos', '31822990', NOW(), NULL, NULL, 3, 3, 14),
       ('Fernando', 'Marquez', '36411220', NOW(), NULL, NULL, 48, NULL, 15),
       ('Ramiro', 'Silva', '38119902', NOW(), NULL, NULL, 2, NULL, 16),
       ('Daniela', 'Noriega', '29911822', NOW(), NULL, NULL, 1, 1, 17),
       ('Brenda', 'Sena', '27999210', NOW(), NULL, NULL, 47, 47, 18),
       ('Joaquín', 'Peña', '35222091', NOW(), NULL, NULL, 9, NULL, 19),
       ('Martina', 'Funes', '40311444', NOW(), NULL, NULL, 52, 52, 20),
       ('Adrián', 'Palacios', '33118800', NOW(), NULL, NULL, 26, NULL, 21),
       ('Camila', 'Arce', '38299112', NOW(), NULL, NULL, 14, 14, 22),
       ('Emanuel', 'López', '37011299', NOW(), NULL, NULL, 8, NULL, 23),
       ('Lautaro', 'Sierra', '33001991', NOW(), NULL, NULL, 13, 13, 24),
       ('Paula', 'Rivas', '34119020', NOW(), NULL, NULL, 17, NULL, 25),
       ('Sergio', 'Coronel', '38601011', NOW(), NULL, NULL, 44, 44, 26),
       ('Milagros', 'Suárez', '39772011', NOW(), NULL, NULL, 41, NULL, 27),
       ('Tomás', 'Godoy', '31118872', NOW(), NULL, NULL, 24, 24, 28),
       ('Agustina', 'Peralta', '34566211', NOW(), NULL, NULL, 20, NULL, 29),
       ('Juan', 'Ferrero', '41900987', NOW(), NULL, NULL, 58, 58, 30),
       ('Rocío', 'Molina', '30999112', NOW(), NULL, NULL, 15, NULL, 31),
       ('Matías', 'Delgado', '36222009', NOW(), NULL, NULL, 10, 10, 32),
       ('Carolina', 'Pizarro', '27888112', NOW(), NULL, NULL, 40, NULL, 33),
       ('Alberto', 'Escobar', '33999811', NOW(), NULL, NULL, 36, 36, 34),
       ('Gisel', 'Moreno', '31144901', NOW(), NULL, NULL, 59, NULL, 35),
       ('Hernán', 'Puebla', '40118188', NOW(), NULL, NULL, 23, 23, 36),
       ('Julieta', 'Vega', '27700219', NOW(), NULL, NULL, 42, NULL, 37),
       ('Lucía', 'Garrido', '34400122', NOW(), NULL, NULL, 32, 32, 38),
       ('Sebastián', 'Bustos', '38211300', NOW(), NULL, NULL, 29, NULL, 39),
       ('Carla', 'Zárate', '29671290', NOW(), NULL, NULL, 57, 57, 40),
       ('Ignacio', 'Campos', '41902210', NOW(), NULL, NULL, 53, NULL, 41),
       ('Santiago', 'Herrera', '30888971', NOW(), NULL, NULL, 18, 18, 42),
       ('Elena', 'Villar', '27660011', NOW(), NULL, NULL, 56, NULL, 43),
       ('Jorge', 'Avellaneda', '32990014', NOW(), NULL, NULL, 22, 22, 44),
       ('Celeste', 'Nuñez', '31400982', NOW(), NULL, NULL, 43, NULL, 45),
       ('Mauricio', 'Pardo', '39118002', NOW(), NULL, NULL, 31, 31, 46),
       ('Abril', 'Montenegro', '30011877', NOW(), NULL, NULL, 12, NULL, 47),
       ('Kevin', 'Roldán', '37844111', NOW(), NULL, NULL, 49, 49, 48),
       ('Rafael', 'Quiroga', '35228102', NOW(), NULL, NULL, 54, NULL, 49),
       ('Camila', 'Álava', '31899154', NOW(), NULL, NULL, 6, 6, 50),
       ('Damián', 'Bravo', '40119908', NOW(), NULL, NULL, 46, NULL, 51),
       ('Bianca', 'Silvestre', '29711092', NOW(), NULL, NULL, 28, 28, 52),
       ('Renzo', 'Videla', '36900211', NOW(), NULL, NULL, 39, NULL, 53),
       ('Ayelén', 'Maidana', '27831011', NOW(), NULL, NULL, 33, 33, 54),
       ('Franco', 'Gaitán', '41100092', NOW(), NULL, NULL, 45, NULL, 55),
       ('Ángeles', 'Soto', '30188200', NOW(), NULL, NULL, 37, 37, 56),
       ('Mauro', 'Caballero', '32220119', NOW(), NULL, NULL, 50, NULL, 57),
       ('Daniel', 'Monti', '36888221', NOW(), NULL, NULL, 27, 27, 58),
       ('Yesica', 'Pereyra', '33600982', NOW(), NULL, NULL, 13, NULL, 59),
       ('Ezequiel', 'Campos', '39777118', NOW(), NULL, NULL, 35, 35, 60);

/*TABLA CREDITO*/
INSERT INTO credito (id_producto_financiero, id_solicitud, id_credito_padre, monto_otorgado, fecha_inicio, fecha_fin, tasa_aplicada, plazo_devolucion,
                     estado_crediticio, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por)
VALUES (1, 1, NULL, 142500.00, '2025-11-02 10:00:00', DATE_ADD('2025-11-02 10:00:00', INTERVAL 36 MONTH), 0.40, 36, 'Activo', '2025-11-02 10:00:00',
        NULL, NULL, 1, NULL),
       (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (3, 3, NULL, 90250.00, '2025-11-06 09:15:00', DATE_ADD('2025-11-06 09:15:00', INTERVAL 24 MONTH), 0.48, 24, 'Activo', '2025-11-06 09:15:00',
        NULL, NULL, 3, NULL),
       (4, 4, NULL, 332500.00, '2025-11-08 14:45:00', DATE_ADD('2025-11-08 14:45:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo', '2025-11-08 14:45:00',
        NULL, NULL, 4, NULL),
       (5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (6, 6, NULL, 171000.00, '2025-11-12 13:00:00', DATE_ADD('2025-11-12 13:00:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo', '2025-11-12 13:00:00',
        NULL, NULL, 6, NULL),
       (7, 7, NULL, 114000.00, '2025-11-14 16:10:00', DATE_ADD('2025-11-14 16:10:00', INTERVAL 24 MONTH), 0.58, 24, 'Activo', '2025-11-14 16:10:00',
        NULL, NULL, 7, NULL),
       (8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (9, 9, NULL, 61850.00, '2025-11-18 12:00:00', DATE_ADD('2025-11-18 12:00:00', INTERVAL 24 MONTH), 0.65, 24, 'Activo', '2025-11-18 12:00:00',
        NULL, NULL, 9, NULL),
       (10, 10, NULL, 152000.00, '2025-11-20 15:45:00', DATE_ADD('2025-11-20 15:45:00', INTERVAL 24 MONTH), 0.55, 24, 'En mora',
        '2025-11-20 15:45:00', NULL, NULL, 10, NULL),
       (11, 11, NULL, 190000.00, '2025-11-22 09:00:00', DATE_ADD('2025-11-22 09:00:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo',
        '2025-11-22 09:00:00', NULL, NULL, 11, NULL),
       (12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (13, 13, NULL, 90250.00, '2025-11-24 11:45:00', DATE_ADD('2025-11-24 11:45:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2025-11-24 11:45:00',
        NULL, NULL, 13, NULL),
       (14, 14, NULL, 278500.00, '2025-12-02 09:00:00', DATE_ADD('2025-12-02 09:00:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-02 09:00:00', NULL, NULL, 21, NULL),
       (15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (16, 16, NULL, 185500.00, '2025-11-27 13:20:00', DATE_ADD('2025-11-27 13:20:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-11-27 13:20:00', NULL, NULL, 16, NULL),
       (17, 17, NULL, 133000.00, '2025-11-28 15:10:00', DATE_ADD('2025-11-28 15:10:00', INTERVAL 36 MONTH), 0.24, 36, 'Activo',
        '2025-11-28 15:10:00', NULL, NULL, 17, NULL),
       (18, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (19, 19, NULL, 66300.00, '2025-11-30 12:30:00', DATE_ADD('2025-11-30 12:30:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2025-11-30 12:30:00',
        NULL, NULL, 19, NULL),
       (20, 20, NULL, 156750.00, '2025-12-01 16:00:00', DATE_ADD('2025-12-01 16:00:00', INTERVAL 24 MONTH), 0.65, 24, 'Refinanciado',
        '2025-12-01 16:00:00', NULL, NULL, 20, NULL),
       (21, 21, NULL, 175750.00, '2025-12-02 09:00:00', DATE_ADD('2025-12-02 09:00:00', INTERVAL 36 MONTH), 0.22, 36, 'Activo',
        '2025-12-02 09:00:00', NULL, NULL, 21, NULL),
       (22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (23, 23, NULL, 93150.00, '2025-12-03 11:45:00', DATE_ADD('2025-12-03 11:45:00', INTERVAL 24 MONTH), 0.10, 24, 'Activo', '2025-12-03 11:45:00',
        NULL, NULL, 23, NULL),
       (24, 24, NULL, 304000.00, '2025-12-04 14:15:00', DATE_ADD('2025-12-04 14:15:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo',
        '2025-12-04 14:15:00', NULL, NULL, 24, NULL),
       (25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (26, 26, NULL, 195000.00, '2025-12-09 13:20:00', DATE_ADD('2025-12-09 13:20:00', INTERVAL 36 MONTH), 0.22, 36, 'Activo',
        '2025-12-09 13:20:00', NULL, NULL, 26, NULL),
       (27, 27, NULL, 137750.00, '2025-12-08 15:10:00', DATE_ADD('2025-12-08 15:10:00', INTERVAL 36 MONTH), 0.24, 36, 'Activo',
        '2025-12-08 15:10:00', NULL, NULL, 27, NULL),
       (28, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (29, 29, NULL, 64800.00, '2025-12-10 12:30:00', DATE_ADD('2025-12-10 12:30:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2025-12-10 12:30:00',
        NULL, NULL, 31, NULL),
       (30, 30, NULL, 161500.00, '2025-12-11 09:00:00', DATE_ADD('2025-12-11 09:00:00', INTERVAL 36 MONTH), 0.30, 36, 'Refinanciado',
        '2025-12-11 09:00:00', NULL, NULL, 32, NULL),
       (31, 31, NULL, 188100.00, '2025-12-12 10:30:00', DATE_ADD('2025-12-12 10:30:00', INTERVAL 36 MONTH), 0.24, 36, 'Activo',
        '2025-12-12 10:30:00', NULL, NULL, 33, NULL),
       (32, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (33, 33, NULL, 94050.00, '2025-12-13 11:45:00', DATE_ADD('2025-12-13 11:45:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2025-12-13 11:45:00',
        NULL, NULL, 35, NULL),
       (34, 34, NULL, 308500.00, '2025-12-14 14:15:00', DATE_ADD('2025-12-14 14:15:00', INTERVAL 36 MONTH), 0.24, 36, 'Activo',
        '2025-12-14 14:15:00', NULL, NULL, 36, NULL),
       (35, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (36, 36, NULL, 141750.00, '2025-12-16 13:20:00', DATE_ADD('2025-12-16 13:20:00', INTERVAL 36 MONTH), 0.36, 36, 'Activo',
        '2025-12-16 13:20:00', NULL, NULL, 26, NULL),
       (37, 37, NULL, 137500.00, '2025-12-17 15:10:00', DATE_ADD('2025-12-17 15:10:00', INTERVAL 36 MONTH), 0.24, 36, 'Activo',
        '2025-12-17 15:10:00', NULL, NULL, 27, NULL),
       (38, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (39, 39, NULL, 183150.00, '2025-12-19 12:30:00', DATE_ADD('2025-12-19 12:30:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-19 12:30:00', NULL, NULL, 41, NULL),
       (40, 40, NULL, 297000.00, '2025-12-20 16:00:00', DATE_ADD('2025-12-20 16:00:00', INTERVAL 36 MONTH), 0.22, 36, 'Refinanciado',
        '2025-12-20 16:00:00', NULL, NULL, 42, NULL),
       (41, 41, NULL, 185250.00, '2025-12-21 09:00:00', DATE_ADD('2025-12-21 09:00:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-21 09:00:00', NULL, NULL, 43, NULL),
       (42, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (43, 43, NULL, 95925.00, '2025-12-23 11:45:00', DATE_ADD('2025-12-23 11:45:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2025-12-23 11:45:00',
        NULL, NULL, 45, NULL),
       (44, 44, NULL, 308000.00, '2025-12-24 14:15:00', DATE_ADD('2025-12-24 14:15:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-24 14:15:00', NULL, NULL, 46, NULL),
       (45, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (46, 46, NULL, 142500.00, '2025-12-27 15:10:00', DATE_ADD('2025-12-27 15:10:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-27 15:10:00', NULL, NULL, 49, NULL),
       (47, 47, NULL, 296000.00, '2025-12-28 09:40:00', DATE_ADD('2025-12-28 09:40:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-28 09:40:00', NULL, NULL, 50, NULL),
       (48, 48, NULL, 70300.00, '2025-12-29 12:30:00', DATE_ADD('2025-12-29 12:30:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2025-12-29 12:30:00',
        NULL, NULL, 51, NULL),
       (49, 49, NULL, 171000.00, '2025-12-30 16:00:00', DATE_ADD('2025-12-30 16:00:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2025-12-30 16:00:00', NULL, NULL, 52, NULL),
       (50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (51, 51, NULL, 190000.00, '2026-01-01 09:00:00', DATE_ADD('2026-01-01 09:00:00', INTERVAL 36 MONTH), 0.40, 36, 'Activo',
        '2026-01-01 09:00:00', NULL, NULL, 53, NULL),
       (52, 52, NULL, 97000.00, '2026-01-02 11:45:00', DATE_ADD('2026-01-02 11:45:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo', '2026-01-02 11:45:00',
        NULL, NULL, 56, NULL),
       (53, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (54, 54, NULL, 71250.00, '2026-01-03 14:15:00', DATE_ADD('2026-01-03 14:15:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo', '2026-01-03 14:15:00',
        NULL, NULL, 57, NULL),
       (55, 55, NULL, 85500.00, '2026-01-04 08:50:00', DATE_ADD('2026-01-04 08:50:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo', '2026-01-04 08:50:00',
        NULL, NULL, 58, NULL),
       (56, 56, NULL, 199500.00, '2026-01-06 15:10:00', DATE_ADD('2026-01-06 15:10:00', INTERVAL 36 MONTH), 0.30, 36, 'Activo',
        '2026-01-06 15:10:00', NULL, NULL, 60, NULL),
       (57, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
       (58, 58, NULL, 308750.00, '2026-01-09 16:00:00', DATE_ADD('2026-01-09 16:00:00', INTERVAL 36 MONTH), 0.22, 36, 'Activo',
        '2026-01-09 16:00:00', NULL, NULL, 1, NULL),
       (59, 59, NULL, 175750.00, '2026-01-10 12:30:00', DATE_ADD('2026-01-10 12:30:00', INTERVAL 24 MONTH), 0.55, 24, 'Activo',
        '2026-01-10 12:30:00', NULL, NULL, 62, NULL),
       (60, 60, NULL, 175750.00, '2026-01-12 16:00:00', DATE_ADD('2026-01-12 16:00:00', INTERVAL 24 MONTH), 0.65, 24, 'Refinanciado',
        '2026-01-12 16:00:00', NULL, NULL, 1, NULL);


/*TABLA HISTORIAL DE TASAS*/
INSERT INTO historial_de_tasas (id_producto_financiero, tasa, fecha_inicio, fecha_fin, fecha_de_alta, fecha_de_baja, fecha_de_modificacion,
                                creado_por, modificado_por)
VALUES

-- Bloque 1: Productos 1-40 (Tasa actual)
-- Productos 1-10
(1, 0.55, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 54, NULL),
(2, 0.39, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 50, NULL),
(3, 0.66, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 46, NULL),
(4, 0.48, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 42, NULL),
(5, 0.71, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 38, NULL),
(6, 0.57, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 34, NULL),
(7, 0.75, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 30, NULL),
(8, 0.60, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 26, NULL),
(9, 0.46, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 22, NULL),
(10, 0.34, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 21, NULL),

-- Productos 11-20
(11, 0.26, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 20, NULL),
(12, 0.28, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 8, NULL),
(13, 0.31, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 4, NULL),
(14, 0.37, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 61, NULL),
(15, 0.32, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 57, NULL),
(16, 0.43, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 53, NULL),
(17, 0.15, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 49, NULL),
(18, 0.67, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 45, NULL),
(19, 0.36, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 41, NULL),
(20, 0.50, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 37, NULL),

-- Productos 21-30
(21, 0.30, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 37, NULL),
(22, 0.21, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 33, NULL),
(23, 0.23, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 29, NULL),
(24, 0.24, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 25, NULL),
(25, 0.17, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 19, NULL),
(26, 0.39, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 18, NULL),
(27, 0.26, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 17, NULL),
(28, 0.16, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 7, NULL),
(29, 0.33, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 3, NULL),
(30, 0.18, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 60, NULL),

-- Productos 31-40
(31, 0.50, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 52, NULL),
(32, 0.44, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 48, NULL),
(33, 0.42, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 44, NULL),
(34, 0.53, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 40, NULL),
(35, 0.65, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 36, NULL),
(36, 0.69, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 32, NULL),
(37, 0.77, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 28, NULL),
(38, 0.10, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 24, NULL),
(39, 0.84, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 16, NULL),
(40, 0.40, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 15, NULL),

-- Bloque 2: Productos 41-50 (Historial de 2 tasas)
-- Producto 41: Hipotecario Cliente Preferencial (Base 0.23)
(41, 0.25, '2023-05-01 09:00:00', '2024-04-30 23:59:59', '2023-04-29 08:00:00', NULL, '2024-04-30 08:00:00', 14, 14), -- Antigua
(41, 0.23, '2024-05-01 09:00:00', NULL, '2024-04-30 08:00:00', NULL, NULL, 14, NULL),                                 -- Actual

-- Producto 42: Línea de Crédito Pyme Flexible (Base 0.28)
(42, 0.30, '2023-05-01 09:00:00', '2024-04-30 23:59:59', '2023-04-29 08:00:00', NULL, '2024-04-30 08:00:00', 10, 10), -- Antigua
(42, 0.27, '2024-05-01 09:00:00', NULL, '2024-04-30 08:00:00', NULL, NULL, 10, NULL),                                 -- Actual

-- Producto 43: Crédito Prendario Motos (Base 0.55)
(43, 0.58, '2023-07-01 09:00:00', '2024-06-30 23:59:59', '2023-06-29 08:00:00', NULL, '2024-06-30 08:00:00', 6, 5),   -- Antigua
(43, 0.54, '2024-07-01 09:00:00', NULL, '2024-06-30 08:00:00', NULL, NULL, 5, NULL),                                  -- Actual

-- Producto 44: Fianza de Alquiler Comercial (Base 0.45)
(44, 0.47, '2023-08-01 09:00:00', '2024-03-31 23:59:59', '2023-07-30 08:00:00', NULL, '2024-03-31 08:00:00', 2, 59),  -- Antigua
(44, 0.45, '2024-04-01 09:00:00', NULL, '2024-03-31 08:00:00', NULL, NULL, 59, NULL),                                 -- Actual

-- Producto 45: Crédito para Exportación Directa (Base 0.16)
(45, 0.18, '2023-01-01 09:00:00', '2024-01-31 23:59:59', '2022-12-30 08:00:00', NULL, '2024-01-31 08:00:00', 59, 59), -- Antigua
(45, 0.15, '2024-02-01 09:00:00', NULL, '2024-01-31 08:00:00', NULL, NULL, 59, NULL),                                 -- Actual

-- Producto 46: Préstamo Capitalización Rural (Base 0.20)
(46, 0.21, '2023-03-01 09:00:00', '2024-03-31 23:59:59', '2023-02-28 08:00:00', NULL, '2024-03-31 08:00:00', 55, 55), -- Antigua
(46, 0.20, '2024-04-01 09:00:00', NULL, '2024-03-31 08:00:00', NULL, NULL, 55, NULL),                                 -- Actual

-- Producto 47: Hipotecario Segunda Vivienda (Base 0.35)
(47, 0.37, '2023-06-01 09:00:00', '2024-05-31 23:59:59', '2023-05-30 08:00:00', NULL, '2024-05-31 08:00:00', 51, 51), -- Antigua
(47, 0.34, '2024-06-01 09:00:00', NULL, '2024-05-31 08:00:00', NULL, NULL, 51, NULL),                                 -- Actual

-- Producto 48: Préstamo Refuerzo (Base 0.62)
(48, 0.65, '2023-11-01 09:00:00', '2024-07-31 23:59:59', '2023-10-30 08:00:00', NULL, '2024-07-31 08:00:00', 47, 47), -- Antigua
(48, 0.60, '2024-08-01 09:00:00', NULL, '2024-07-31 08:00:00', NULL, NULL, 47, NULL),                                 -- Actual

-- Producto 49: Descuento de E-Cheqs (Base 0.23)
(49, 0.25, '2023-10-01 09:00:00', '2024-02-29 23:59:59', '2023-09-30 08:00:00', NULL, '2024-02-29 08:00:00', 43, 43), -- Antigua
(49, 0.24, '2024-03-01 09:00:00', NULL, '2024-02-29 08:00:00', NULL, NULL, 43, NULL),                                 -- Actual

-- Producto 50: Garantía de Cumplimiento (Base 0.17)
(50, 0.19, '2023-02-01 09:00:00', '2024-02-29 23:59:59', '2023-01-30 08:00:00', NULL, '2024-02-29 08:00:00', 39, 39), -- Antigua
(50, 0.17, '2024-03-01 09:00:00', NULL, '2024-02-29 08:00:00', NULL, NULL, 39, NULL),                                 -- Actual

-- Bloque 3: Productos 51-60 (Tasa actual)
-- Productos 51-60
(51, 0.81, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 35, NULL),
(52, 0.38, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 31, NULL),
(53, 0.42, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 27, NULL),
(54, 0.59, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 23, NULL),
(55, 0.35, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 13, NULL),
(56, 0.70, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 12, NULL),
(57, 0.88, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 11, NULL),
(58, 0.63, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 9, NULL),
(59, 0.30, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 5, NULL),
(60, 0.74, '2024-01-01 09:00:00', NULL, '2023-12-30 08:00:00', NULL, NULL, 1, NULL);

SELECT *
FROM credito;
/*TABLA CUOTAS*/
INSERT INTO cuota (id_credito, numero_cuota, fecha_de_emision, fecha_de_vencimiento, monto_total, estado, fecha_de_alta, creado_por, modificado_por)
VALUES (1, 1, '2025-11-02 10:00:00', '2025-12-02 10:00:00', 3958.33, 0, '2025-11-02 10:00:00', 1, NULL),
       (2, 1, '2025-11-04 11:30:00', '2025-12-04 11:30:00', 0.00, 0, '2025-11-04 11:30:00', 2, NULL),
       (3, 1, '2025-11-06 09:15:00', '2025-12-06 09:15:00', 3760.42, 0, '2025-11-06 09:15:00', 3, NULL),
       (4, 1, '2025-11-08 14:45:00', '2025-12-08 14:45:00', 9236.11, 0, '2025-11-08 14:45:00', 4, NULL),
       (5, 1, '2025-11-10 10:20:00', '2025-12-10 10:20:00', 0.00, 0, '2025-11-10 10:20:00', 5, NULL),
       (6, 1, '2025-11-12 13:00:00', '2025-12-12 13:00:00', 4750.00, 0, '2025-11-12 13:00:00', 6, NULL),
       (7, 1, '2025-11-14 16:10:00', '2025-12-14 16:10:00', 4750.00, 0, '2025-11-14 16:10:00', 7, NULL),
       (8, 1, '2025-11-16 09:45:00', '2025-12-16 09:45:00', 0.00, 0, '2025-11-16 09:45:00', 8, NULL),
       (9, 1, '2025-11-18 12:00:00', '2025-12-18 12:00:00', 2577.08, 0, '2025-11-18 12:00:00', 9, NULL),
       (10, 1, '2025-11-20 15:45:00', '2025-12-20 15:45:00', 6333.33, 0, '2025-11-20 15:45:00', 10, NULL),
       (11, 1, '2025-11-22 09:00:00', '2025-12-22 09:00:00', 5277.77, 0, '2025-11-22 09:00:00', 11, NULL),
       (12, 1, '2025-11-23 14:30:00', '2025-12-23 14:30:00', 0.00, 0, '2025-11-23 14:30:00', 12, NULL),
       (13, 1, '2025-11-24 11:45:00', '2025-12-24 11:45:00', 3760.42, 0, '2025-11-24 11:45:00', 13, NULL),
       (14, 1, '2025-12-02 09:00:00', '2026-01-02 09:00:00', 11604.16, 0, '2025-12-02 09:00:00', 21, NULL),
       (15, 1, '2025-11-26 10:15:00', '2025-12-26 10:15:00', 0.00, 0, '2025-11-26 10:15:00', 15, NULL),
       (16, 1, '2025-11-27 13:20:00', '2025-12-27 13:20:00', 7739.58, 0, '2025-11-27 13:20:00', 16, NULL),
       (17, 1, '2025-11-28 15:10:00', '2025-12-28 15:10:00', 3694.44, 0, '2025-11-28 15:10:00', 17, NULL),
       (18, 1, '2025-11-29 11:00:00', '2025-12-29 11:00:00', 0.00, 0, '2025-11-29 11:00:00', 18, NULL),
       (19, 1, '2025-11-30 12:30:00', '2025-12-30 12:30:00', 2762.50, 0, '2025-11-30 12:30:00', 19, NULL),
       (20, 1, '2025-12-01 16:00:00', '2026-01-01 16:00:00', 6531.25, 0, '2025-12-01 16:00:00', 20, NULL),
       (21, 1, '2025-12-02 09:00:00', '2026-01-02 09:00:00', 4881.94, 0, '2025-12-02 09:00:00', 21, NULL),
       (22, 1, '2025-12-02 16:45:00', '2026-01-02 16:45:00', 0.00, 0, '2025-12-02 16:45:00', 22, NULL),
       (23, 1, '2025-12-03 11:45:00', '2026-01-03 11:45:00', 3881.25, 0, '2025-12-03 11:45:00', 23, NULL),
       (24, 1, '2025-12-04 14:15:00', '2026-01-04 14:15:00', 8513.88, 0, '2025-12-04 14:15:00', 24, NULL),
       (25, 1, '2025-12-05 09:30:00', '2026-01-05 09:30:00', 0.00, 0, '2025-12-05 09:30:00', 25, NULL),
       (26, 1, '2025-12-09 13:20:00', '2026-01-09 13:20:00', 5416.66, 0, '2025-12-09 13:20:00', 26, NULL),
       (27, 1, '2025-12-08 15:10:00', '2026-01-08 15:10:00', 3826.38, 0, '2025-12-08 15:10:00', 27, NULL),
       (28, 1, '2025-12-09 10:00:00', '2026-01-09 10:00:00', 0.00, 0, '2025-12-09 10:00:00', 28, NULL),
       (29, 1, '2025-12-10 12:30:00', '2026-01-10 12:30:00', 2700.00, 0, '2025-12-10 12:30:00', 31, NULL),
       (30, 1, '2025-12-11 09:00:00', '2026-01-11 09:00:00', 4486.11, 0, '2025-12-11 09:00:00', 32, NULL),
       (31, 1, '2025-12-12 10:30:00', '2026-01-12 10:30:00', 5225.00, 0, '2025-12-12 10:30:00', 33, NULL),
       (32, 1, '2025-12-12 17:00:00', '2026-01-12 17:00:00', 0.00, 0, '2025-12-12 17:00:00', 34, NULL),
       (33, 1, '2025-12-13 11:45:00', '2026-01-13 11:45:00', 3927.08, 0, '2025-12-13 11:45:00', 35, NULL),
       (34, 1, '2025-12-14 14:15:00', '2026-01-14 14:15:00', 8572.22, 0, '2025-12-14 14:15:00', 36, NULL),
       (35, 1, '2025-12-15 08:45:00', '2026-01-15 08:45:00', 0.00, 0, '2025-12-15 08:45:00', 37, NULL),
       (36, 1, '2025-12-16 13:20:00', '2026-01-16 13:20:00', 3937.50, 0, '2025-12-16 13:20:00', 26, NULL),
       (37, 1, '2025-12-17 15:10:00', '2026-01-17 15:10:00', 3819.44, 0, '2025-12-17 15:10:00', 27, NULL),
       (38, 1, '2025-12-18 09:00:00', '2026-01-18 09:00:00', 0.00, 0, '2025-12-18 09:00:00', 38, NULL),
       (39, 1, '2025-12-19 12:30:00', '2026-01-19 12:30:00', 7631.25, 0, '2025-12-19 12:30:00', 41, NULL),
       (40, 1, '2025-12-20 10:00:00', '2026-01-20 10:00:00', 8250.00, 0, '2025-12-20 10:00:00', 40, NULL),
       (41, 1, '2025-12-21 09:00:00', '2026-01-21 09:00:00', 7718.75, 0, '2025-12-21 09:00:00', 43, NULL),
       (42, 1, '2025-12-22 14:00:00', '2026-01-22 14:00:00', 0.00, 0, '2025-12-22 14:00:00', 44, NULL),
       (43, 1, '2025-12-23 10:30:00', '2026-01-23 10:30:00', 3995.83, 0, '2025-12-23 10:30:00', 45, NULL),
       (44, 1, '2025-12-24 14:15:00', '2026-01-24 14:15:00', 12833.33, 0, '2025-12-24 14:15:00', 46, NULL),
       (45, 1, '2025-12-26 11:00:00', '2026-01-26 11:00:00', 0.00, 0, '2025-12-26 11:00:00', 47, NULL),
       (46, 1, '2025-12-27 15:10:00', '2026-01-27 15:10:00', 5937.50, 0, '2025-12-27 15:10:00', 49, NULL),
       (47, 1, '2025-12-28 08:30:00', '2026-01-28 08:30:00', 12333.33, 0, '2025-12-28 08:30:00', 48, NULL),
       (48, 1, '2025-12-29 12:30:00', '2026-01-29 12:30:00', 2929.16, 0, '2025-12-29 12:30:00', 51, NULL),
       (49, 1, '2025-12-30 16:00:00', '2026-01-30 16:00:00', 7125.00, 0, '2025-12-30 16:00:00', 52, NULL),
       (50, 1, '2025-12-31 10:00:00', '2026-01-31 10:00:00', 0.00, 0, '2025-12-31 10:00:00', 54, NULL),
       (51, 1, '2026-01-01 09:00:00', '2026-02-01 09:00:00', 5277.77, 0, '2026-01-01 09:00:00', 53, NULL),
       (52, 1, '2026-01-02 11:45:00', '2026-02-02 11:45:00', 2694.44, 0, '2026-01-02 11:45:00', 56, NULL),
       (53, 1, '2026-01-02 16:30:00', '2026-02-02 16:30:00', 0.00, 0, '2026-01-02 16:30:00', 55, NULL),
       (54, 1, '2026-01-03 14:15:00', '2026-02-03 14:15:00', 2971.87, 0, '2026-01-03 14:15:00', 57, NULL),
       (55, 1, '2026-01-04 08:50:00', '2026-02-04 08:50:00', 2375.00, 0, '2026-01-04 08:50:00', 58, NULL),
       (56, 1, '2026-01-06 15:10:00', '2026-02-06 15:10:00', 5541.66, 0, '2026-01-06 15:10:00', 60, NULL),
       (57, 1, '2026-01-07 09:00:00', '2026-02-07 09:00:00', 0.00, 0, '2026-01-07 09:00:00', 59, NULL),
       (58, 1, '2026-01-09 16:00:00', '2026-02-09 16:00:00', 8576.94, 0, '2026-01-09 16:00:00', 1, NULL),
       (59, 1, '2026-01-10 12:30:00', '2026-02-10 12:30:00', 7322.91, 0, '2026-01-10 12:30:00', 62, NULL),
       (60, 1, '2026-01-12 16:00:00', '2026-02-12 16:00:00', 7322.91, 0, '2026-01-12 16:00:00', 1, NULL);

INSERT INTO cuota (id_credito, numero_cuota, fecha_de_emision, fecha_de_vencimiento, monto_total, estado, fecha_de_alta, creado_por, modificado_por)
VALUES (1, 2, '2025-12-02 10:00:00', '2026-01-02 10:00:00', 3958.33, 0, '2025-12-02 10:00:00', 1, NULL),
       (1, 3, '2026-01-02 10:00:00', '2026-02-02 10:00:00', 3958.33, 0, '2026-01-02 10:00:00', 1, NULL),
       (3, 2, '2025-12-06 09:15:00', '2026-01-06 09:15:00', 3760.42, 0, '2025-12-06 09:15:00', 3, NULL),
       (3, 3, '2026-01-06 09:15:00', '2026-02-06 09:15:00', 3760.42, 0, '2026-01-06 09:15:00', 3, NULL),
       (4, 2, '2025-12-08 14:45:00', '2026-01-08 14:45:00', 9236.11, 0, '2025-12-08 14:45:00', 4, NULL),
       (4, 3, '2026-01-08 14:45:00', '2026-02-08 14:45:00', 9236.11, 0, '2026-01-08 14:45:00', 4, NULL),
       (6, 2, '2025-12-12 13:00:00', '2026-01-12 13:00:00', 4750.00, 0, '2025-12-12 13:00:00', 6, NULL),
       (6, 3, '2026-01-12 13:00:00', '2026-02-12 13:00:00', 4750.00, 0, '2026-01-12 13:00:00', 6, NULL),
       (7, 2, '2025-12-14 16:10:00', '2026-01-14 16:10:00', 4750.00, 0, '2025-12-14 16:10:00', 7, NULL),
       (7, 3, '2026-01-14 16:10:00', '2026-02-14 16:10:00', 4750.00, 0, '2026-01-14 16:10:00', 7, NULL),
       (9, 2, '2025-12-18 12:00:00', '2026-01-18 12:00:00', 2577.08, 0, '2025-12-18 12:00:00', 9, NULL),
       (9, 3, '2026-01-18 12:00:00', '2026-02-18 12:00:00', 2577.08, 0, '2026-01-18 12:00:00', 9, NULL),
       (10, 2, '2025-12-20 15:45:00', '2026-01-20 15:45:00', 6333.33, 0, '2025-12-20 15:45:00', 10, NULL),
       (10, 3, '2026-01-20 15:45:00', '2026-02-20 15:45:00', 6333.33, 0, '2026-01-20 15:45:00', 10, NULL),
       (11, 2, '2025-12-22 09:00:00', '2026-01-22 09:00:00', 5277.77, 0, '2025-12-22 09:00:00', 11, NULL),
       (11, 3, '2026-01-22 09:00:00', '2026-02-22 09:00:00', 5277.77, 0, '2026-01-22 09:00:00', 11, NULL),
       (13, 2, '2025-12-24 11:45:00', '2026-01-24 11:45:00', 3760.42, 0, '2025-12-24 11:45:00', 13, NULL),
       (13, 3, '2026-01-24 11:45:00', '2026-02-24 11:45:00', 3760.42, 0, '2026-01-24 11:45:00', 13, NULL),
       (14, 2, '2026-01-02 09:00:00', '2026-02-02 09:00:00', 11604.16, 0, '2026-01-02 09:00:00', 21, NULL),
       (14, 3, '2026-02-02 09:00:00', '2026-03-02 09:00:00', 11604.16, 0, '2026-02-02 09:00:00', 21, NULL);

INSERT INTO cuota (id_credito, numero_cuota, fecha_de_emision, fecha_de_vencimiento, monto_total, estado, fecha_de_alta, creado_por, modificado_por)
VALUES (1, 2, '2025-12-02 10:00:00', '2026-01-02 10:00:00', 3958.33, 0, '2025-12-02 10:00:00', 1, NULL),
       (1, 3, '2026-01-02 10:00:00', '2026-02-02 10:00:00', 3958.33, 0, '2026-01-02 10:00:00', 1, NULL),
       (3, 2, '2025-12-06 09:15:00', '2026-01-06 09:15:00', 3760.42, 0, '2025-12-06 09:15:00', 3, NULL),
       (3, 3, '2026-01-06 09:15:00', '2026-02-06 09:15:00', 3760.42, 0, '2026-01-06 09:15:00', 3, NULL),
       (4, 2, '2025-12-08 14:45:00', '2026-01-08 14:45:00', 9236.11, 0, '2025-12-08 14:45:00', 4, NULL),
       (4, 3, '2026-01-08 14:45:00', '2026-02-08 14:45:00', 9236.11, 0, '2026-01-08 14:45:00', 4, NULL),
       (6, 2, '2025-12-12 13:00:00', '2026-01-12 13:00:00', 4750.00, 0, '2025-12-12 13:00:00', 6, NULL),
       (6, 3, '2026-01-12 13:00:00', '2026-02-12 13:00:00', 4750.00, 0, '2026-01-12 13:00:00', 6, NULL),
       (7, 2, '2025-12-14 16:10:00', '2026-01-14 16:10:00', 4750.00, 0, '2025-12-14 16:10:00', 7, NULL),
       (7, 3, '2026-01-14 16:10:00', '2026-02-14 16:10:00', 4750.00, 0, '2026-01-14 16:10:00', 7, NULL),
       (9, 2, '2025-12-18 12:00:00', '2026-01-18 12:00:00', 2577.08, 0, '2025-12-18 12:00:00', 9, NULL),
       (9, 3, '2026-01-18 12:00:00', '2026-02-18 12:00:00', 2577.08, 0, '2026-01-18 12:00:00', 9, NULL),
       (10, 2, '2025-12-20 15:45:00', '2026-01-20 15:45:00', 6333.33, 0, '2025-12-20 15:45:00', 10, NULL),
       (10, 3, '2026-01-20 15:45:00', '2026-02-20 15:45:00', 6333.33, 0, '2026-01-20 15:45:00', 10, NULL),
       (11, 2, '2025-12-22 09:00:00', '2026-01-22 09:00:00', 5277.77, 0, '2025-12-22 09:00:00', 11, NULL),
       (11, 3, '2026-01-22 09:00:00', '2026-02-22 09:00:00', 5277.77, 0, '2026-01-22 09:00:00', 11, NULL),
       (13, 2, '2025-12-24 11:45:00', '2026-01-24 11:45:00', 3760.42, 0, '2025-12-24 11:45:00', 13, NULL),
       (13, 3, '2026-01-24 11:45:00', '2026-02-24 11:45:00', 3760.42, 0, '2026-01-24 11:45:00', 13, NULL),
       (14, 2, '2026-01-02 09:00:00', '2026-02-02 09:00:00', 11604.16, 0, '2026-01-02 09:00:00', 21, NULL),
       (14, 3, '2026-02-02 09:00:00', '2026-03-02 09:00:00', 11604.16, 0, '2026-02-02 09:00:00', 21, NULL);

/*TABLA PAGO*/
SET @penalidad_por_dia = 1000;
-- Penalidad por día de demora
INSERT INTO pago (id_cuota, fecha_de_pago, monto_pagado, demora, penalizacion_mora, fecha_de_alta, creado_por, modificado_por)
VALUES (21, DATE_ADD('2025-12-21 09:00:00', INTERVAL 0 DAY), 7718.75 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 43, NULL),
       (22, DATE_ADD('2025-12-24 14:15:00', INTERVAL 0 DAY), 12833.33 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 46, NULL),
       (23, DATE_ADD('2025-12-27 15:10:00', INTERVAL 1 DAY), 5937.50 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 49, NULL),
       (24, DATE_ADD('2025-12-29 12:30:00', INTERVAL 0 DAY), 2929.16 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 51, NULL),
       (25, DATE_ADD('2025-12-30 16:00:00', INTERVAL 2 DAY), 7125.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 52, NULL),
       (26, DATE_ADD('2025-12-27 15:10:00', INTERVAL 0 DAY), 5937.50 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 49, NULL),
       (27, DATE_ADD('2025-12-17 15:10:00', INTERVAL 0 DAY), 3819.44 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 27, NULL),
       (28, DATE_ADD('2025-12-29 12:30:00', INTERVAL 1 DAY), 2929.16 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 51, NULL),
       (29, DATE_ADD('2025-12-30 16:00:00', INTERVAL 0 DAY), 7125.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 52, NULL),
       (30, DATE_ADD('2025-12-20 16:00:00', INTERVAL 3 DAY), 2970.00 + 3 * @penalidad_por_dia, 3, 3 * @penalidad_por_dia, NOW(), 42, NULL),
       (31, DATE_ADD('2026-01-01 09:00:00', INTERVAL 0 DAY), 5277.77 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 53, NULL),
       (32, DATE_ADD('2026-01-02 11:45:00', INTERVAL 0 DAY), 2694.44 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 56, NULL),
       (33, DATE_ADD('2025-12-23 11:45:00', INTERVAL 1 DAY), 9592.50 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 45, NULL),
       (34, DATE_ADD('2026-01-03 14:15:00', INTERVAL 0 DAY), 7125.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 57, NULL),
       (35, DATE_ADD('2026-01-04 08:50:00', INTERVAL 2 DAY), 8550.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 58, NULL),
       (36, DATE_ADD('2026-01-06 15:10:00', INTERVAL 0 DAY), 199500.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 60, NULL),
       (37, DATE_ADD('2025-12-28 09:40:00', INTERVAL 1 DAY), 296000.00 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 50, NULL),
       (38, DATE_ADD('2026-01-09 16:00:00', INTERVAL 0 DAY), 308750.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
       (39, DATE_ADD('2026-01-10 12:30:00', INTERVAL 2 DAY), 175750.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 20, NULL),
       (40, DATE_ADD('2026-01-12 16:00:00', INTERVAL 0 DAY), 175750.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
       (41, DATE_ADD('2026-01-01 09:00:00', INTERVAL 1 DAY), 5277.77 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 53, NULL),
       (42, DATE_ADD('2026-01-02 11:45:00', INTERVAL 0 DAY), 2694.44 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 56, NULL),
       (43, DATE_ADD('2025-12-23 11:45:00', INTERVAL 0 DAY), 9592.50 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 45, NULL),
       (44, DATE_ADD('2026-01-03 14:15:00', INTERVAL 2 DAY), 7125.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 57, NULL),
       (45, DATE_ADD('2026-01-04 08:50:00', INTERVAL 0 DAY), 8550.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 58, NULL),
       (46, DATE_ADD('2026-01-06 15:10:00', INTERVAL 0 DAY), 199500.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 60, NULL),
       (47, DATE_ADD('2025-12-28 09:40:00', INTERVAL 1 DAY), 296000.00 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 50, NULL),
       (48, DATE_ADD('2026-01-09 16:00:00', INTERVAL 0 DAY), 308750.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
       (49, DATE_ADD('2026-01-10 12:30:00', INTERVAL 2 DAY), 175750.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 20, NULL),
       (50, DATE_ADD('2026-01-12 16:00:00', INTERVAL 0 DAY), 7322.91 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
       (51, DATE_ADD('2026-01-01 09:00:00', INTERVAL 0 DAY), 5277.77 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 53, NULL),
       (52, DATE_ADD('2026-01-02 11:45:00', INTERVAL 1 DAY), 2694.44 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 56, NULL),
       (53, DATE_ADD('2025-12-23 11:45:00', INTERVAL 0 DAY), 9592.50 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 45, NULL),
       (54, DATE_ADD('2026-01-03 14:15:00', INTERVAL 0 DAY), 7125.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 57, NULL),
       (55, DATE_ADD('2026-01-04 08:50:00', INTERVAL 3 DAY), 8550.00 + 3 * @penalidad_por_dia, 3, 3 * @penalidad_por_dia, NOW(), 58, NULL),
       (56, DATE_ADD('2026-01-06 15:10:00', INTERVAL 0 DAY), 199500.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 60, NULL),
       (57, DATE_ADD('2025-12-28 09:40:00', INTERVAL 1 DAY), 296000.00 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 50, NULL),
       (58, DATE_ADD('2026-01-09 16:00:00', INTERVAL 0 DAY), 308750.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
       (59, DATE_ADD('2026-01-10 12:30:00', INTERVAL 2 DAY), 175750.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 20, NULL),
       (60, DATE_ADD('2026-01-12 16:00:00', INTERVAL 1 DAY), 7322.91 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 1, NULL);

SET @penalidad_por_dia = 1000;

INSERT INTO pago (id_cuota, fecha_de_pago, monto_pagado, demora, penalizacion_mora, fecha_de_alta, creado_por, modificado_por)
VALUES
-- Cuotas número 2
(41, DATE_ADD('2026-01-02 10:00:00', INTERVAL 0 DAY), 3958.33 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
(42, DATE_ADD('2026-01-06 09:15:00', INTERVAL 1 DAY), 3760.42 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 3, NULL),
(43, DATE_ADD('2026-01-08 14:45:00', INTERVAL 0 DAY), 9236.11 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 4, NULL),
(44, DATE_ADD('2026-01-12 13:00:00', INTERVAL 2 DAY), 4750.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 6, NULL),
(45, DATE_ADD('2026-01-14 16:10:00', INTERVAL 0 DAY), 4750.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 7, NULL),
(46, DATE_ADD('2026-01-18 12:00:00', INTERVAL 1 DAY), 2577.08 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 9, NULL),
(47, DATE_ADD('2026-01-20 15:45:00', INTERVAL 0 DAY), 6333.33 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 10, NULL),
(48, DATE_ADD('2026-01-22 09:00:00', INTERVAL 2 DAY), 5277.77 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 11, NULL),
(49, DATE_ADD('2026-01-24 11:45:00', INTERVAL 0 DAY), 3760.42 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 13, NULL),
(50, DATE_ADD('2026-02-02 09:00:00', INTERVAL 1 DAY), 11604.16 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 21, NULL),

-- Cuotas número 3
(51, DATE_ADD('2026-02-02 10:00:00', INTERVAL 0 DAY), 3958.33 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 1, NULL),
(52, DATE_ADD('2026-02-06 09:15:00', INTERVAL 1 DAY), 3760.42 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 3, NULL),
(53, DATE_ADD('2026-02-08 14:45:00', INTERVAL 0 DAY), 9236.11 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 4, NULL),
(54, DATE_ADD('2026-02-12 13:00:00', INTERVAL 2 DAY), 4750.00 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 6, NULL),
(55, DATE_ADD('2026-02-14 16:10:00', INTERVAL 0 DAY), 4750.00 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 7, NULL),
(56, DATE_ADD('2026-02-18 12:00:00', INTERVAL 1 DAY), 2577.08 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 9, NULL),
(57, DATE_ADD('2026-02-20 15:45:00', INTERVAL 0 DAY), 6333.33 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 10, NULL),
(58, DATE_ADD('2026-02-22 09:00:00', INTERVAL 2 DAY), 5277.77 + 2 * @penalidad_por_dia, 2, 2 * @penalidad_por_dia, NOW(), 11, NULL),
(59, DATE_ADD('2026-02-24 11:45:00', INTERVAL 0 DAY), 3760.42 + 0 * @penalidad_por_dia, 0, 0 * @penalidad_por_dia, NOW(), 13, NULL),
(60, DATE_ADD('2026-03-02 09:00:00', INTERVAL 1 DAY), 11604.16 + 1 * @penalidad_por_dia, 1, 1 * @penalidad_por_dia, NOW(), 21, NULL);


/*TABLA METODO DE PAGO*/
INSERT INTO metodo_de_pago (id_pago, metodo, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por)
VALUES (1, 'Efectivo', NOW(), NULL, NULL, 1, NULL),
       (2, 'Tarjeta', NOW(), NULL, NULL, 2, NULL),
       (3, 'Transferencia', NOW(), NULL, NULL, 3, NULL),
       (4, 'Efectivo', NOW(), NULL, NULL, 4, NULL),
       (5, 'Tarjeta', NOW(), NULL, NULL, 5, NULL),
       (6, 'Transferencia', NOW(), NULL, NULL, 6, NULL),
       (7, 'Efectivo', NOW(), NULL, NULL, 7, NULL),
       (8, 'Tarjeta', NOW(), NULL, NULL, 8, NULL),
       (9, 'Transferencia', NOW(), NULL, NULL, 9, NULL),
       (10, 'Efectivo', NOW(), NULL, NULL, 10, NULL),
       (11, 'Tarjeta', NOW(), NULL, NULL, 11, NULL),
       (12, 'Transferencia', NOW(), NULL, NULL, 12, NULL),
       (13, 'Efectivo', NOW(), NULL, NULL, 13, NULL),
       (14, 'Tarjeta', NOW(), NULL, NULL, 14, NULL),
       (15, 'Transferencia', NOW(), NULL, NULL, 15, NULL),
       (16, 'Efectivo', NOW(), NULL, NULL, 16, NULL),
       (17, 'Tarjeta', NOW(), NULL, NULL, 17, NULL),
       (18, 'Transferencia', NOW(), NULL, NULL, 18, NULL),
       (19, 'Efectivo', NOW(), NULL, NULL, 19, NULL),
       (20, 'Tarjeta', NOW(), NULL, NULL, 20, NULL),
       (21, 'Transferencia', NOW(), NULL, NULL, 21, NULL),
       (22, 'Efectivo', NOW(), NULL, NULL, 22, NULL),
       (23, 'Tarjeta', NOW(), NULL, NULL, 23, NULL),
       (24, 'Transferencia', NOW(), NULL, NULL, 24, NULL),
       (25, 'Efectivo', NOW(), NULL, NULL, 25, NULL),
       (26, 'Tarjeta', NOW(), NULL, NULL, 26, NULL),
       (27, 'Transferencia', NOW(), NULL, NULL, 27, NULL),
       (28, 'Efectivo', NOW(), NULL, NULL, 28, NULL),
       (29, 'Tarjeta', NOW(), NULL, NULL, 29, NULL),
       (30, 'Transferencia', NOW(), NULL, NULL, 30, NULL),
       (31, 'Efectivo', NOW(), NULL, NULL, 31, NULL),
       (32, 'Tarjeta', NOW(), NULL, NULL, 32, NULL),
       (33, 'Transferencia', NOW(), NULL, NULL, 33, NULL),
       (34, 'Efectivo', NOW(), NULL, NULL, 34, NULL),
       (35, 'Tarjeta', NOW(), NULL, NULL, 35, NULL),
       (36, 'Transferencia', NOW(), NULL, NULL, 36, NULL),
       (37, 'Efectivo', NOW(), NULL, NULL, 37, NULL),
       (38, 'Tarjeta', NOW(), NULL, NULL, 38, NULL),
       (39, 'Transferencia', NOW(), NULL, NULL, 39, NULL),
       (40, 'Efectivo', NOW(), NULL, NULL, 40, NULL);

INSERT INTO metodo_de_pago (id_pago, metodo, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por)
VALUES (41, 'Efectivo', NOW(), NULL, NULL, 1, NULL),
       (42, 'Tarjeta', NOW(), NULL, NULL, 2, NULL),
       (43, 'Transferencia', NOW(), NULL, NULL, 3, NULL),
       (44, 'Efectivo', NOW(), NULL, NULL, 4, NULL),
       (45, 'Tarjeta', NOW(), NULL, NULL, 5, NULL),
       (46, 'Transferencia', NOW(), NULL, NULL, 6, NULL),
       (47, 'Efectivo', NOW(), NULL, NULL, 7, NULL),
       (48, 'Tarjeta', NOW(), NULL, NULL, 8, NULL),
       (49, 'Transferencia', NOW(), NULL, NULL, 9, NULL),
       (50, 'Efectivo', NOW(), NULL, NULL, 10, NULL),
       (51, 'Tarjeta', NOW(), NULL, NULL, 11, NULL),
       (52, 'Transferencia', NOW(), NULL, NULL, 12, NULL),
       (53, 'Efectivo', NOW(), NULL, NULL, 13, NULL),
       (54, 'Tarjeta', NOW(), NULL, NULL, 14, NULL),
       (55, 'Transferencia', NOW(), NULL, NULL, 15, NULL),
       (56, 'Efectivo', NOW(), NULL, NULL, 16, NULL),
       (57, 'Tarjeta', NOW(), NULL, NULL, 17, NULL),
       (58, 'Transferencia', NOW(), NULL, NULL, 18, NULL),
       (59, 'Efectivo', NOW(), NULL, NULL, 19, NULL),
       (60, 'Tarjeta', NOW(), NULL, NULL, 20, NULL);
-- DNI 40112233 (4 empleados)
UPDATE Empleado SET DNI_empleado = '40112233' WHERE id_empleado = 11;
UPDATE Empleado SET DNI_empleado = '40112234' WHERE id_empleado = 21;
UPDATE Empleado SET DNI_empleado = '40112235' WHERE id_empleado = 37;
UPDATE Empleado SET DNI_empleado = '40112236' WHERE id_empleado = 45;

-- DNI 45667788 (3 empleados)
UPDATE Empleado SET DNI_empleado = '45667788' WHERE id_empleado = 16;
UPDATE Empleado SET DNI_empleado = '45667789' WHERE id_empleado = 26;
UPDATE Empleado SET DNI_empleado = '45667790' WHERE id_empleado = 46;

-- DNI 39001122 (3 empleados)
UPDATE Empleado SET DNI_empleado = '39001122' WHERE id_empleado = 20;
UPDATE Empleado SET DNI_empleado = '39001123' WHERE id_empleado = 30;
UPDATE Empleado SET DNI_empleado = '39001124' WHERE id_empleado = 42;

-- DNI 42334455 (3 empleados)
UPDATE Empleado SET DNI_empleado = '42334455' WHERE id_empleado = 13;
UPDATE Empleado SET DNI_empleado = '42334456' WHERE id_empleado = 23;
UPDATE Empleado SET DNI_empleado = '42334457' WHERE id_empleado = 49;

-- DNI 43445566 (3 empleados)
UPDATE Empleado SET DNI_empleado = '43445566' WHERE id_empleado = 14;
UPDATE Empleado SET DNI_empleado = '43445567' WHERE id_empleado = 24;
UPDATE Empleado SET DNI_empleado = '43445568' WHERE id_empleado = 50;

-- DNI 44556677 (3 empleados)
UPDATE Empleado SET DNI_empleado = '44556677' WHERE id_empleado = 15;
UPDATE Empleado SET DNI_empleado = '44556678' WHERE id_empleado = 25;
UPDATE Empleado SET DNI_empleado = '44556679' WHERE id_empleado = 51;

-- DNI 38990011 (2 empleados dentro del 1–60)
UPDATE Empleado SET DNI_empleado = '38990011' WHERE id_empleado = 41;
UPDATE Empleado SET DNI_empleado = '38990012' WHERE id_empleado = 57;

-- 31678901 (IDs 6, 16, 26, 36)
UPDATE Cliente SET DNI_cliente = '31678901' WHERE id_cliente = 6;
UPDATE Cliente SET DNI_cliente = '31678902' WHERE id_cliente = 16;
UPDATE Cliente SET DNI_cliente = '31678903' WHERE id_cliente = 26;
UPDATE Cliente SET DNI_cliente = '31678904' WHERE id_cliente = 36;

-- 34890123 (IDs 8, 18, 28, 38)
UPDATE Cliente SET DNI_cliente = '34890123' WHERE id_cliente = 8;
UPDATE Cliente SET DNI_cliente = '34890124' WHERE id_cliente = 18;
UPDATE Cliente SET DNI_cliente = '34890125' WHERE id_cliente = 28;
UPDATE Cliente SET DNI_cliente = '34890126' WHERE id_cliente = 38;

-- 26901234 (IDs 9, 19, 29, 39)
UPDATE Cliente SET DNI_cliente = '26901234' WHERE id_cliente = 9;
UPDATE Cliente SET DNI_cliente = '26901235' WHERE id_cliente = 19;
UPDATE Cliente SET DNI_cliente = '26901236' WHERE id_cliente = 29;
UPDATE Cliente SET DNI_cliente = '26901237' WHERE id_cliente = 39;

-- 33012345 (IDs 10, 20, 30, 40)
UPDATE Cliente SET DNI_cliente = '33012345' WHERE id_cliente = 10;
UPDATE Cliente SET DNI_cliente = '33012346' WHERE id_cliente = 20;
UPDATE Cliente SET DNI_cliente = '33012347' WHERE id_cliente = 30;
UPDATE Cliente SET DNI_cliente = '33012348' WHERE id_cliente = 40;

-- 28123456 (IDs 11, 21, 31, 41)
UPDATE Cliente SET DNI_cliente = '28123456' WHERE id_cliente = 11;
UPDATE Cliente SET DNI_cliente = '28123457' WHERE id_cliente = 21;
UPDATE Cliente SET DNI_cliente = '28123458' WHERE id_cliente = 31;
UPDATE Cliente SET DNI_cliente = '28123459' WHERE id_cliente = 41;

-- 30234567 (IDs 12, 22, 32, 42)
UPDATE Cliente SET DNI_cliente = '30234567' WHERE id_cliente = 12;
UPDATE Cliente SET DNI_cliente = '30234568' WHERE id_cliente = 22;
UPDATE Cliente SET DNI_cliente = '30234569' WHERE id_cliente = 32;
UPDATE Cliente SET DNI_cliente = '30234570' WHERE id_cliente = 42;

-- 25345678 (IDs 13, 23, 33, 43)
UPDATE Cliente SET DNI_cliente = '25345678' WHERE id_cliente = 13;
UPDATE Cliente SET DNI_cliente = '25345679' WHERE id_cliente = 23;
UPDATE Cliente SET DNI_cliente = '25345680' WHERE id_cliente = 33;
UPDATE Cliente SET DNI_cliente = '25345681' WHERE id_cliente = 43;

-- 32456789 (IDs 14, 24, 34, 44)
UPDATE Cliente SET DNI_cliente = '32456789' WHERE id_cliente = 14;
UPDATE Cliente SET DNI_cliente = '32456790' WHERE id_cliente = 24;
UPDATE Cliente SET DNI_cliente = '32456791' WHERE id_cliente = 34;
UPDATE Cliente SET DNI_cliente = '32456792' WHERE id_cliente = 44;

-- 24567890 (IDs 15, 25, 35, 45)
UPDATE Cliente SET DNI_cliente = '24567890' WHERE id_cliente = 15;
UPDATE Cliente SET DNI_cliente = '24567891' WHERE id_cliente = 25;
UPDATE Cliente SET DNI_cliente = '24567892' WHERE id_cliente = 35;
UPDATE Cliente SET DNI_cliente = '24567893' WHERE id_cliente = 45;

-- 23789012 (IDs 17, 27, 37)
UPDATE Cliente SET DNI_cliente = '23789012' WHERE id_cliente = 17;
UPDATE Cliente SET DNI_cliente = '23789013' WHERE id_cliente = 27;
UPDATE Cliente SET DNI_cliente = '23789014' WHERE id_cliente = 37;