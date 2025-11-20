USE financiamiento_ra;
/*INSERT INTO Sucursal (nombre_sucursal, localidad, provincia, telefono_sucursal, direccion, fecha_de_alta, creado_por) VALUES
('Sucursal Salta Capital', 'Salta', 'Salta', '0387-431-0032', 'Florida 100', '2023-01-20 10:00:00', 'Sistema'),
('Sucursal Paraná', 'Paraná', 'Entre Ríos', '0343-421-0035', 'San Martín 800', '2023-05-30 10:00:00', 'Sistema'),
('Sucursal Goya', 'Goya', 'Corrientes', '03777-42-0041', 'Colón 500', '2024-01-30 10:00:00', 'Sistema'),
('Sucursal Posadas', 'Posadas', 'Misiones', '0376-442-0042', 'Bolívar 1700', '2024-03-01 10:00:00', 'Sistema');*/

/*INSERT INTO Empleado (id_sucursal, DNI_empleado, nombre, apellido, cargo, email, telefono, fecha_de_alta, creado_por) VALUES
-- Roles Directivos y Administrativos 
(1, '30123456', 'Ana', 'García', 'Gerente de Sucursal', 'ana.garcia@financiera.com', '1123456789', '2023-08-15 09:00:00', 'Sistema'),
(2, '31234567', 'Luis', 'Pérez', 'Gerente de Sucursal', 'luis.perez@financiera.com', '1134567890', '2023-09-01 09:00:00', 'Sistema'),
(3, '32345678', 'María', 'López', 'Gerente de Sucursal', 'maria.lopez@financiera.com', '1145678901', '2023-10-10 09:00:00', 'Sistema'),
(4, '33456789', 'Pedro', 'Martínez', 'Gerente de Sucursal', 'pedro.martinez@financiera.com', '1156789012', '2023-11-20 09:00:00', 'Sistema'),
(1, '34567890', 'Sofía', 'Rodríguez', 'Contador/a', 'sofia.rodriguez@financiera.com', '1167890123', '2024-01-05 09:00:00', 'Sistema'),
(2, '35678901', 'Javier', 'Fernández', 'Contador/a', 'javier.fernandez@financiera.com', '1178901234', '2024-02-14 09:00:00', 'Sistema'),
(3, '36789012', 'Elena', 'Torres', 'Jefe de Producto Financiero', 'elena.torres@financiera.com', '1189012345', '2024-03-25 09:00:00', 'Sistema'),
(4, '37890123', 'Andrés', 'Ruiz', 'Jefe de Producto Financiero', 'andres.ruiz@financiera.com', '1190123456', '2024-04-30 09:00:00', 'Sistema'),
(1, '38901234', 'Laura', 'Sánchez', 'Personal de Administración/RR.HH.', 'laura.sanchez@financiera.com', '1112345670', '2024-05-18 09:00:00', 'Sistema'),
(2, '39012345', 'Daniel', 'Gómez', 'Personal de Administración/RR.HH.', 'daniel.gomez@financiera.com', '1123456701', '2024-06-22 09:00:00', 'Sistema'),

-- Roles de Atención al Cliente y Oficiales de Crédito
(1, '40112233', 'Carmen', 'Díaz', 'Oficial de Créditos (Asesor)', 'carmen.diaz@financiera.com', '1134567012', '2024-07-01 09:00:00', 'Sistema'),
(1, '41223344', 'Alejandro', 'Hernández', 'Oficial de Créditos (Asesor)', 'alejandro.hernandez@financiera.com', '1145670123', '2024-07-15 09:00:00', 'Sistema'),
(1, '42334455', 'Isabel', 'Vargas', 'Asesor de Atención al Cliente', 'isabel.vargas@financiera.com', '1156701234', '2024-08-01 09:00:00', 'Sistema'),
(2, '43445566', 'Ricardo', 'Iglesias', 'Oficial de Créditos (Asesor)', 'ricardo.iglesias@financiera.com', '1167012345', '2024-08-15 09:00:00', 'Sistema'),
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
(3, '36778899', 'Marina', 'Ramos', 'Especialista en Modelos de Riesgo', 'marina.ramos@financiera.com', '1130123457', '2023-06-19 09:00:00', 'Sistema'),
(4, '47889900', 'Hugo', 'Pardo', 'Especialista en Modelos de Riesgo', 'hugo.pardo@financiera.com', '1140123458', '2023-07-07 09:00:00', 'Sistema'),

-- Roles de Cobranzas, Marketing y Soporte
(1, '38990011', 'Esther', 'Conde', 'Gestor de Cobranzas', 'esther.conde@financiera.com', '1150123459', '2023-08-01 09:00:00', 'Sistema'),
(2, '39001122', 'Vicente', 'Mendoza', 'Gestor de Cobranzas', 'vicente.mendoza@financiera.com', '1160123460', '2023-09-11 09:00:00', 'Sistema'),
(3, '40112233', 'Rocío', 'Peña', 'Gestor de Cobranzas', 'rocio.pena@financiera.com', '1170123461', '2023-10-25 09:00:00', 'Sistema'),
(4, '41223344', 'Felipe', 'Soler', 'Gestor de Cobranzas', 'felipe.soler@financiera.com', '1180123462', '2023-11-03 09:00:00', 'Sistema'),
(1, '42334455', 'Jimena', 'Sierra', 'Especialista en Refinanciaciones', 'jimena.sierra@financiera.com', '1190123463', '2024-01-01 09:00:00', 'Sistema'),
(2, '43445566', 'Benito', 'Lozano', 'Especialista en Refinanciaciones', 'benito.lozano@financiera.com', '1112345664', '2024-02-08 09:00:00', 'Sistema'),
(3, '44556677', 'Teresa', 'Aguilar', 'Especialista en Marketing y Campañas', 'teresa.aguilar@financiera.com', '1123456765', '2024-03-17 09:00:00', 'Sistema'),
(4, '45667788', 'Guillermo', 'Rey', 'Especialista en Marketing y Campañas', 'guillermo.rey@financiera.com', '1134567866', '2024-04-05 09:00:00', 'Sistema'),
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
(4, '45223344', 'Gonzalo', 'Guerra', 'Analista Crediticio', 'gonzalo.guerra@financiera.com', '1112345682', '2025-05-12 09:00:00', 'Sistema');*/

/*INSERT INTO Producto_campana (tasa_promocional, vigencia, resultados, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_modificacion, creado_por, modificado_por)
VALUES
(2.5, '2025-12-01 00:00:00', 100.0, '2025-11-01 08:00:00', '2025-11-01 08:00:00', NULL, NULL, 1, NULL),
(3.1, '2025-12-05 00:00:00', 150.0, '2025-11-02 09:00:00', '2025-11-02 09:00:00', NULL, NULL, 2, NULL),
(1.8, '2025-12-10 00:00:00', 90.0, '2025-11-03 10:00:00', '2025-11-03 10:00:00', NULL, NULL, 3, NULL),
(2.5, '2025-12-15 00:00:00', 120.0, '2025-11-04 11:00:00', '2025-11-04 11:00:00', NULL, NULL, 4, NULL),
(3.1, '2025-12-20 00:00:00', 130.0, '2025-11-05 12:00:00', '2025-11-05 12:00:00', NULL, NULL, 5, NULL),
(2.0, '2025-12-25 00:00:00', 110.0, '2025-11-06 13:00:00', '2025-11-06 13:00:00', NULL, NULL, 6, NULL),
(2.5, '2025-12-30 00:00:00', 140.0, '2025-11-07 14:00:00', '2025-11-07 14:00:00', NULL, NULL, 7, NULL),
(1.8, '2026-01-01 00:00:00', 95.0, '2025-11-08 15:00:00', '2025-11-08 15:00:00', NULL, NULL, 8, NULL),
(3.1, '2026-01-05 00:00:00', 160.0, '2025-11-09 16:00:00', '2025-11-09 16:00:00', NULL, NULL, 9, NULL),
(2.0, '2026-01-10 00:00:00', 105.0, '2025-11-10 17:00:00', '2025-11-10 17:00:00', NULL, NULL, 10, NULL);
INSERT INTO Producto_campana (tasa_promocional, vigencia, resultados, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_modificacion, creado_por, modificado_por)
VALUES
(2.0, '2026-03-01 00:00:00', 125.0, '2025-12-01 08:00:00', '2025-12-01 08:00:00', NULL, NULL, 61, NULL),
(3.1, '2026-03-05 00:00:00', 135.0, '2025-12-02 09:00:00', '2025-12-02 09:00:00', NULL, NULL, 62, NULL),
(1.8, '2026-03-10 00:00:00', 95.0, '2025-12-03 10:00:00', '2025-12-03 10:00:00', NULL, NULL, 5, NULL),
(2.5, '2026-03-15 00:00:00', 145.0, '2025-12-04 11:00:00', '2025-12-04 11:00:00', NULL, NULL, 12, NULL),
(2.0, '2026-03-20 00:00:00', 110.0, '2025-12-05 12:00:00', '2025-12-05 12:00:00', NULL, NULL, 18, NULL),
(3.1, '2026-03-25 00:00:00', 155.0, '2025-12-06 13:00:00', '2025-12-06 13:00:00', NULL, NULL, 25, NULL),
(1.8, '2026-03-30 00:00:00', 85.0, '2025-12-07 14:00:00', '2025-12-07 14:00:00', NULL, NULL, 33, NULL),
(2.5, '2026-04-01 00:00:00', 130.0, '2025-12-08 15:00:00', '2025-12-08 15:00:00', NULL, NULL, 40, NULL),
(2.0, '2026-04-05 00:00:00', 100.0, '2025-12-09 16:00:00', '2025-12-09 16:00:00', NULL, NULL, 47, NULL),
(3.1, '2026-04-10 00:00:00', 140.0, '2025-12-10 17:00:00', '2025-12-10 17:00:00', NULL, NULL, 54, NULL);
INSERT INTO Producto_campana (tasa_promocional, vigencia, resultados, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_modificacion, creado_por, modificado_por)
VALUES
(1.8, '2026-04-15 00:00:00', 90.0, '2025-12-11 08:00:00', '2025-12-11 08:00:00', NULL, NULL, 3, NULL),
(2.5, '2026-04-20 00:00:00', 115.0, '2025-12-12 09:00:00', '2025-12-12 09:00:00', NULL, NULL, 7, NULL),
(3.1, '2026-04-25 00:00:00', 145.0, '2025-12-13 10:00:00', '2025-12-13 10:00:00', NULL, NULL, 15, NULL),
(2.0, '2026-04-30 00:00:00', 105.0, '2025-12-14 11:00:00', '2025-12-14 11:00:00', NULL, NULL, 22, NULL),
(2.5, '2026-05-05 00:00:00', 125.0, '2025-12-15 12:00:00', '2025-12-15 12:00:00', NULL, NULL, 29, NULL),
(1.8, '2026-05-10 00:00:00', 85.0, '2025-12-16 13:00:00', '2025-12-16 13:00:00', NULL, NULL, 36, NULL),
(3.1, '2026-05-15 00:00:00', 155.0, '2025-12-17 14:00:00', '2025-12-17 14:00:00', NULL, NULL, 43, NULL),
(2.0, '2026-05-20 00:00:00', 100.0, '2025-12-18 15:00:00', '2025-12-18 15:00:00', NULL, NULL, 50, NULL),
(2.5, '2026-05-25 00:00:00', 135.0, '2025-12-19 16:00:00', '2025-12-19 16:00:00', NULL, NULL, 57, NULL),
(1.8, '2026-05-30 00:00:00', 95.0, '2025-12-20 17:00:00', '2025-12-20 17:00:00', NULL, NULL, 62, NULL);
INSERT INTO Producto_campana (tasa_promocional, vigencia, resultados, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_modificacion, creado_por, modificado_por)
VALUES
(2.0, '2026-06-01 00:00:00', 110.0, '2025-12-21 08:00:00', '2025-12-21 08:00:00', NULL, NULL, 1, NULL),
(3.1, '2026-06-05 00:00:00', 140.0, '2025-12-22 09:00:00', '2025-12-22 09:00:00', NULL, NULL, 8, NULL),
(1.8, '2026-06-10 00:00:00', 95.0, '2025-12-23 10:00:00', '2025-12-23 10:00:00', NULL, NULL, 16, NULL),
(2.5, '2026-06-15 00:00:00', 125.0, '2025-12-24 11:00:00', '2025-12-24 11:00:00', NULL, NULL, 23, NULL),
(2.0, '2026-06-20 00:00:00', 105.0, '2025-12-25 12:00:00', '2025-12-25 12:00:00', NULL, NULL, 30, NULL),
(3.1, '2026-06-25 00:00:00', 150.0, '2025-12-26 13:00:00', '2025-12-26 13:00:00', NULL, NULL, 37, NULL),
(1.8, '2026-06-30 00:00:00', 85.0, '2025-12-27 14:00:00', '2025-12-27 14:00:00', NULL, NULL, 44, NULL),
(2.5, '2026-07-05 00:00:00', 130.0, '2025-12-28 15:00:00', '2025-12-28 15:00:00', NULL, NULL, 51, NULL),
(2.0, '2026-07-10 00:00:00', 100.0, '2025-12-29 16:00:00', '2025-12-29 16:00:00', NULL, NULL, 58, NULL),
(3.1, '2026-07-15 00:00:00', 145.0, '2025-12-30 17:00:00', '2025-12-30 17:00:00', NULL, NULL, 62, NULL);
INSERT INTO Producto_campana (tasa_promocional, vigencia, resultados, fecha_inicio, fecha_de_alta, fecha_de_baja, fecha_modificacion, creado_por, modificado_por)
VALUES
(1.8, '2026-07-20 00:00:00', 90.0, '2025-12-31 08:00:00', '2025-12-31 08:00:00', NULL, NULL, 4, NULL),
(2.5, '2026-07-25 00:00:00', 120.0, '2026-01-01 09:00:00', '2026-01-01 09:00:00', NULL, NULL, 11, NULL),
(3.1, '2026-07-30 00:00:00', 150.0, '2026-01-02 10:00:00', '2026-01-02 10:00:00', NULL, NULL, 19, NULL),
(2.0, '2026-08-05 00:00:00', 105.0, '2026-01-03 11:00:00', '2026-01-03 11:00:00', NULL, NULL, 26, NULL),
(2.5, '2026-08-10 00:00:00', 130.0, '2026-01-04 12:00:00', '2026-01-04 12:00:00', NULL, NULL, 34, NULL),
(1.8, '2026-08-15 00:00:00', 85.0, '2026-01-05 13:00:00', '2026-01-05 13:00:00', NULL, NULL, 41, NULL),
(3.1, '2026-08-20 00:00:00', 155.0, '2026-01-06 14:00:00', '2026-01-06 14:00:00', NULL, NULL, 48, NULL),
(2.0, '2026-08-25 00:00:00', 100.0, '2026-01-07 15:00:00', '2026-01-07 15:00:00', NULL, NULL, 55, NULL),
(2.5, '2026-08-30 00:00:00', 135.0, '2026-01-08 16:00:00', '2026-01-08 16:00:00', NULL, NULL, 59, NULL),
(1.8, '2026-09-05 00:00:00', 95.0, '2026-01-09 17:00:00', '2026-01-09 17:00:00', NULL, NULL, 62, NULL);*/

/*INSERT INTO Cliente (nombre_cliente, apellido_cliente, documento, tipo_de_persona, ingreso_declarado, domicilio, email_cliente, telefono_cliente, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por) VALUES
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
('Construcciones del Norte S.A.', NULL, '30701234567', 'juridica', 850000.00, 'Av. Olascoaga 100', 'norte.sa@mail.com', '3874987654', NOW(), NULL, NULL, 41, NULL),
('Logística Patagónica SRL', NULL, '30702345678', 'juridica', 550000.00, 'Ruta 3 Km 10', 'logistica.pata@mail.com', '2901765432', NOW(), NULL, NULL, 42, NULL),
('Tecnología Global S.R.L.', NULL, '33703456789', 'juridica', 1200000.00, 'Bv. Oroño 2000', 'tech.global@mail.com', '3414567890', NOW(), NULL, NULL, 43, NULL),
('Distribuidora El Sol S.A.', NULL, '30704567890', 'juridica', 700000.00, 'San Juan 333', 'elsol@mail.com', '2615678901', NOW(), NULL, NULL, 44, NULL),
('Imprenta Rápida SRL', NULL, '33705678901', 'juridica', 400000.00, 'Lavalleja 500', 'imprenta.r@mail.com', '3516789012', NOW(), NULL, NULL, 45, NULL),
('Servicios de Limpieza ABC', NULL, '30706789012', 'juridica', 300000.00, 'Salta 1200', 'limpieza.abc@mail.com', '3874123456', NOW(), NULL, NULL, 46, NULL),
('Desarrollos Inmobiliarios LTDA', NULL, '33707890123', 'juridica', 1500000.00, 'Entre Ríos 800', 'inmo.des@mail.com', '3434789012', NOW(), NULL, NULL, 47, NULL),
('Metalúrgica Sur S.A.', NULL, '30708901234', 'juridica', 950000.00, 'Pte. Perón 1500', 'metalurgica.sur@mail.com', '3777456789', NOW(), NULL, NULL, 48, NULL),
('Comercializadora del Centro', NULL, '33709012345', 'juridica', 600000.00, '25 de Mayo 100', 'centro.com@mail.com', '3764012345', NOW(), NULL, NULL, 49, NULL),
('Estudio Contable Global', NULL, '20710123456', 'juridica', 280000.00, 'San Lorenzo 450', 'contable.g@mail.com', '3874678901', NOW(), NULL, NULL, 50, NULL),
('Agencia de Viajes Sol y Mar', NULL, '30711234567', 'juridica', 450000.00, 'Belgrano 700', 'solymar@mail.com', '3434234567', NOW(), NULL, NULL, 51, NULL),
('Consultora Estratégica S.A.', NULL, '33712345678', 'juridica', 750000.00, 'Alvear 900', 'consultora.e@mail.com', '3777890123', NOW(), NULL, NULL, 52, NULL),
('Alimentos Frescos SRL', NULL, '30713456789', 'juridica', 1100000.00, 'Libertad 1234', 'alimentos.f@mail.com', '3764345678', NOW(), NULL, NULL, 53, NULL),
('Taller Mecánico El Rayo', NULL, '33714567890', 'juridica', 350000.00, 'Mitre 567', 'taller.rayo@mail.com', '3874456789', NOW(), NULL, NULL, 54, NULL),
('Farmacia Central S.A.', NULL, '30715678901', 'juridica', 900000.00, 'Independencia 890', 'farmacia.c@mail.com', '3434567890', NOW(), NULL, NULL, 55, NULL),
('Moda Juvenil SRL', NULL, '33716789012', 'juridica', 500000.00, 'Roca 101', 'moda.j@mail.com', '3777678901', NOW(), NULL, NULL, 56, NULL),
('Servicios Informáticos 24/7', NULL, '30717890123', 'juridica', 650000.00, 'España 202', 'info247@mail.com', '3764890123', NOW(), NULL, NULL, 57, NULL),
('Panadería Artesanal El Trigo', NULL, '33718901234', 'juridica', 420000.00, 'Jujuy 303', 'panaderia.t@mail.com', '3874012345', NOW(), NULL, NULL, 58, NULL),
('Bodega Los Aromas S.A.', NULL, '30719012345', 'juridica', 1300000.00, 'Mendoza 404', 'bodega.a@mail.com', '3434123456', NOW(), NULL, NULL, 59, NULL),
('Frigorífico del Litoral', NULL, '33720123456', 'juridica', 1000000.00, 'San Martín 505', 'frigo.lito@mail.com', '3777789012', NOW(), NULL, NULL, 60, NULL);*/

/*INSERT INTO Producto_financiero (nombre_producto_financiero, descripcion, limite_max, limite_min, requisitos, tasa_base, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por) VALUES
-- Bloque 1: Préstamos Personales (id 1-10)
('Préstamo Express', 'Crédito rápido de libre destino', 300000.00, 10000.00, 'Ingreso fijo 6 meses, Score > 550', 0.55, NOW(), NULL, NULL, '54', NULL),
('Préstamo Coche Usado', 'Financiación para compra de vehículos usados', 1500000.00, 50000.00, 'Antigüedad laboral 1 año, titularidad vehículo', 0.40, NOW(), NULL, NULL, '50', NULL),
('Préstamo Estudios', 'Crédito para educación y capacitación', 500000.00, 20000.00, 'Certificado de inscripción, ingresos comprobables', 0.65, NOW(), NULL, NULL, '46', NULL),
('Préstamo Consolidación', 'Para unificar deudas existentes', 800000.00, 100000.00, 'Análisis de deuda actual, Score > 600', 0.48, NOW(), NULL, NULL, '42', NULL),
('Préstamo Viajes', 'Crédito para paquetes turísticos y pasajes', 150000.00, 15000.00, 'Reserva de viaje, sin morosidad', 0.70, NOW(), NULL, NULL, '38', NULL),
('Préstamo Salud', 'Crédito para tratamientos médicos y cirugías', 400000.00, 25000.00, 'Presupuesto médico, ingresos estables', 0.58, NOW(), NULL, NULL, '34', NULL),
('Préstamo Joven', 'Crédito inicial para nuevos clientes', 100000.00, 5000.00, 'Edad 18-25, recibo de sueldo', 0.75, NOW(), NULL, NULL, '30', NULL),
('Préstamo Digital', 'Solicitud y desembolso 100% online', 200000.00, 5000.00, 'Cuenta bancaria activa, validación biométrica', 0.60, NOW(), NULL, NULL, '26', NULL),
('Préstamo Verde', 'Para reformas y equipos de eficiencia energética', 1000000.00, 100000.00, 'Presupuesto de obra/equipos, Score > 650', 0.45, NOW(), NULL, NULL, '22', NULL),
('Préstamo Pyme', 'Crédito para pequeños negocios unipersonales', 2500000.00, 50000.00, 'Monotributo/Autónomo 2 años, proyección de negocio', 0.35, NOW(), NULL, NULL, '21', NULL),

-- Bloque 2: Hipotecarios y Garantizados (id 11-20)
('Hipotecario Vivienda Única', 'Crédito para adquisición de primera vivienda', 30000000.00, 500000.00, 'Garantía hipotecaria, 20% ahorro propio', 0.25, NOW(), NULL, NULL, '20', NULL),
('Hipotecario Refacción', 'Préstamo para ampliar o refaccionar vivienda', 5000000.00, 100000.00, 'Garantía hipotecaria, planos aprobados', 0.28, NOW(), NULL, NULL, '8', NULL),
('Hipotecario Lote', 'Financiación para compra de terrenos', 8000000.00, 200000.00, 'Tasación de lote, ingresos altos', 0.30, NOW(), NULL, NULL, '4', NULL),
('Crédito Prendario Nuevo', 'Financiación para vehículos 0km (Prenda)', 5000000.00, 100000.00, 'Prenda sobre el vehículo, seguro total', 0.38, NOW(), NULL, NULL, '61', NULL),
('Préstamo con Garantía Real', 'Crédito respaldado por inmueble (no hipotecario)', 10000000.00, 500000.00, 'Garantía real, sin gravámenes', 0.32, NOW(), NULL, NULL, '57', NULL),
('Préstamo con Garantía Fiduciaria', 'Crédito respaldado por fondo de garantía', 2000000.00, 200000.00, 'Adhesión a fideicomiso, aporte inicial', 0.42, NOW(), NULL, NULL, '53', NULL),
('Hipotecario Uva', 'Crédito hipotecario con ajuste por inflación', 25000000.00, 300000.00, 'Relación cuota-ingreso estricta', 0.15, NOW(), NULL, NULL, '49', NULL),
('Préstamo Automático', 'Crédito preaprobado por sistema', 100000.00, 5000.00, 'Límite basado en historial de cliente', 0.68, NOW(), NULL, NULL, '45', NULL),
('Crédito para Adquisición de Maquinaria', 'Financiación de equipos productivos (Garantía Maquinaria)', 4000000.00, 500000.00, 'Prenda sobre la maquinaria, plan de negocios', 0.36, NOW(), NULL, NULL, '41', NULL),
('Préstamo para Inquilinos', 'Garantía para alquiler (sustituye fianza)', 200000.00, 10000.00, 'Contrato de alquiler, 3 meses de ingresos', 0.50, NOW(), NULL, NULL, '37', NULL),

-- Bloque 3: Productos Empresariales y Líneas de Crédito (id 21-30)
('Línea de Crédito Rotativa', 'Fondo revolvente para capital de trabajo', 5000000.00, 50000.00, 'Balance 2 años, sujeto a revisión trimestral', 0.30, NOW(), NULL, NULL, '37', NULL),
('Descuento de Cheques', 'Anticipo de fondos por cheques de terceros', 10000000.00, 100000.00, 'Carpeta crediticia comercial, historial con el banco', 0.20, NOW(), NULL, NULL, '33', NULL),
('Préstamo Agropecuario', 'Para siembra, cosecha o inversión rural', 15000000.00, 500000.00, 'Título de propiedad rural, plan de explotación', 0.22, NOW(), NULL, NULL, '29', NULL),
('Leasing de Equipamiento', 'Alquiler con opción a compra de activos fijos', 8000000.00, 100000.00, 'Evaluación de flujo de caja, contrato con proveedor', 0.24, NOW(), NULL, NULL, '25', NULL),
('Comercio Exterior Pre-financiación', 'Crédito para insumos de exportación', 20000000.00, 1000000.00, 'Contrato de exportación, historial de operaciones', 0.18, NOW(), NULL, NULL, '19', NULL),
('Cuenta Corriente con Acuerdo', 'Límite de descubierto en cuenta corriente', 2000000.00, 50000.00, 'Promedio de saldos, Score bancario alto', 0.40, NOW(), NULL, NULL, '18', NULL),
('Factoring sin Recurso', 'Venta de facturas a la entidad', 10000000.00, 500000.00, 'Clientes A+ en cartera, límite por deudor', 0.26, NOW(), NULL, NULL, '17', NULL),
('Garantía Bancaria', 'Emisión de avales para licitaciones o contratos', 5000000.00, 50000.00, 'Contragarantía (hipoteca/prenda), solidez financiera', 0.15, NOW(), NULL, NULL, '7', NULL),
('Préstamo Turismo', 'Inversión en hotelería y servicios turísticos', 12000000.00, 500000.00, 'Habilitación municipal, proyección de ocupación', 0.33, NOW(), NULL, NULL, '3', NULL),
('Crédito Puente Constructor', 'Financiación de etapas de construcción', 50000000.00, 5000000.00, 'Permisos de obra, venta mínima de unidades', 0.19, NOW(), NULL, NULL, '60', NULL),

-- Bloque 4: Variaciones y Refuerzos (id 31-60)
-- Variaciones de Préstamos Personales (id 31-40)
('Préstamo Express Plus', 'Versión con límite ampliado y plazo mayor', 500000.00, 50000.00, 'Ingreso fijo 1 año, Score > 600', 0.50, NOW(), NULL, NULL, '52', NULL),
('Préstamo Consolidación Gold', 'Para unificar deudas grandes con mejor tasa', 1200000.00, 200000.00, 'Excelente historial, sin morosidad en 2 años', 0.45, NOW(), NULL, NULL, '48', NULL),
('Préstamo Auto Clásico', 'Financiación de vehículos de colección', 800000.00, 100000.00, 'Tasación oficial, seguro específico', 0.42, NOW(), NULL, NULL, '44', NULL),
('Préstamo Estudios Postgrado', 'Crédito a largo plazo para posgrados', 800000.00, 100000.00, 'Aceptación en universidad, codeudor', 0.52, NOW(), NULL, NULL, '40', NULL),
('Préstamo Viajes Premium', 'Para viajes de lujo o larga estadía', 300000.00, 50000.00, 'Ingresos comprobables > 500k', 0.65, NOW(), NULL, NULL, '36', NULL),
('Préstamo Renovación Hogar', 'Para refacciones menores y decoración', 250000.00, 10000.00, 'Ingresos fijos, antigüedad 6 meses', 0.68, NOW(), NULL, NULL, '32', NULL),
('Préstamo Emprendedor', 'Lanzamiento de proyecto inicial', 300000.00, 20000.00, 'Plan de negocio básico, tutoría', 0.78, NOW(), NULL, NULL, '28', NULL),
('Préstamo Cajas de Ahorro', 'Garantizado por plazos fijos o ahorros', 1000000.00, 100000.00, 'Constitución de garantía líquida del 120%', 0.10, NOW(), NULL, NULL, '24', NULL),
('Préstamo de Anticipo de Haberes', 'Adelanto de sueldo automático', 50000.00, 1000.00, 'Convenio de nómina, antigüedad 3 meses', 0.85, NOW(), NULL, NULL, '16', NULL),
('Préstamo RSE', 'Para proyectos de impacto social/ambiental', 700000.00, 50000.00, 'Certificación de proyecto, bajo riesgo', 0.40, NOW(), NULL, NULL, '15', NULL),

-- Variaciones de Hipotecarios/Empresariales (id 41-50)
('Hipotecario Cliente Preferencial', 'Tasa reducida para clientes con historial', 35000000.00, 1000000.00, 'Cliente Platino/VIP, historial 5 años', 0.23, NOW(), NULL, NULL, '14', NULL),
('Línea de Crédito Pyme Flexible', 'Límite dinámico ajustado al flujo de caja', 7000000.00, 100000.00, 'Flujo de caja positivo, garantía prendaria', 0.28, NOW(), NULL, NULL, '10', NULL),
('Crédito Prendario Motos', 'Financiación de motos nuevas y usadas', 800000.00, 30000.00, 'Prenda sobre moto, seguro obligatorio', 0.55, NOW(), NULL, NULL, '6', NULL),
('Fianza de Alquiler Comercial', 'Aval para locales y oficinas', 500000.00, 20000.00, 'Balance 1 año, contrato de alquiler comercial', 0.45, NOW(), NULL, NULL, '2', NULL),
('Crédito para Exportación Directa', 'Financiación específica para grandes exportadores', 30000000.00, 2000000.00, 'Facturación anual > 50MM, carta de crédito', 0.16, NOW(), NULL, NULL, '59', NULL),
('Préstamo Capitalización Rural', 'Inversión a largo plazo en tecnología rural', 20000000.00, 1000000.00, 'Proyecto de inversión a 5 años, garantía real', 0.20, NOW(), NULL, NULL, '55', NULL),
('Hipotecario Segunda Vivienda', 'Para inversión inmobiliaria o casa de veraneo', 15000000.00, 500000.00, 'Propiedad libre de deuda, ingresos dobles', 0.35, NOW(), NULL, NULL, '51', NULL),
('Préstamo Refuerzo', 'Segundo crédito para clientes con historial excelente', 100000.00, 5000.00, 'Sin atrasos en el crédito vigente', 0.62, NOW(), NULL, NULL, '47', NULL),
('Descuento de E-Cheqs', 'Digitalización del descuento de valores', 5000000.00, 50000.00, 'Cuenta comitente activa, firma digital', 0.23, NOW(), NULL, NULL, '43', NULL),
('Garantía de Cumplimiento', 'Aval para asegurar finalización de obras', 10000000.00, 1000000.00, 'Capacidad de endeudamiento probada', 0.17, NOW(), NULL, NULL, '39', NULL),

-- Nuevos Productos (id 51-60)
('Microcrédito', 'Préstamo social para emprendedores de bajos ingresos', 50000.00, 1000.00, 'Validación comunitaria/ONG, plan simple', 0.95, NOW(), NULL, NULL, '35', NULL),
('Préstamo para Franquicias', 'Financiación de costos iniciales de franquicias', 1000000.00, 100000.00, 'Contrato de franquicia, viabilidad de negocio', 0.40, NOW(), NULL, NULL, '31', NULL),
('Línea de Comercio Electrónico', 'Capital de trabajo para plataformas online', 2000000.00, 50000.00, 'Historial de ventas online, integración API', 0.38, NOW(), NULL, NULL, '27', NULL),
('Préstamo para Honorarios', 'Para profesionales que cobran por honorarios', 400000.00, 20000.00, 'Matrícula profesional, 1 año de ejercicio', 0.55, NOW(), NULL, NULL, '23', NULL),
('Hipotecario Dólar Link', 'Préstamo en pesos ajustado al tipo de cambio oficial', 20000000.00, 500000.00, 'Ingresos indexados al dólar o altos', 0.20, NOW(), NULL, NULL, '13', NULL),
('Préstamo para Tecnología', 'Compra de hardware y software profesional', 600000.00, 30000.00, 'Factura proforma, ingresos estables', 0.50, NOW(), NULL, NULL, '12', NULL),
('Crédito para Inclusión Financiera', 'Productos con menores requisitos para no bancarizados', 80000.00, 5000.00, 'Verificación de identidad simple, límite inicial bajo', 1.10, NOW(), NULL, NULL, '11', NULL),
('Préstamo para Bodas y Eventos', 'Financiación de fiestas y grandes eventos', 500000.00, 50000.00, 'Presupuesto de proveedores, 1 año de antigüedad', 0.60, NOW(), NULL, NULL, '9', NULL),
('Línea de Inversión Fija', 'Para compra de activos fijos de empresas', 15000000.00, 500000.00, 'Proyecto de inversión detallado, garantía mixta', 0.25, NOW(), NULL, NULL, '5', NULL),
('Préstamo para Jubilados', 'Crédito con descuento de cuota en el haber', 300000.00, 10000.00, 'Último recibo de haber, sin morosidad previsional', 0.50, NOW(), NULL, NULL, '1', NULL);*/


INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES
(150000.00, 'Compra de vehículo', '2025-11-01 10:00:00', TRUE, NULL, '2025-11-01 10:00:00', NULL, NULL, 1, NULL, 5),
(220000.00, 'Refacción de vivienda', '2025-11-03 11:30:00', FALSE, 'Falta de documentación', '2025-11-03 11:30:00', NULL, NULL, 2, NULL, 12),
(95000.00, 'Pago de deudas', '2025-11-05 09:15:00', TRUE, NULL, '2025-11-05 09:15:00', NULL, NULL, 3, NULL, 18),
(350000.00, 'Capital de trabajo', '2025-11-07 14:45:00', TRUE, NULL, '2025-11-07 14:45:00', NULL, NULL, 4, NULL, 25),
(80000.00, 'Compra de herramientas', '2025-11-09 08:20:00', FALSE, 'Historial crediticio negativo', '2025-11-09 08:20:00', NULL, NULL, 5, NULL, 31),
(180000.00, 'Inversión en negocio', '2025-11-11 13:00:00', TRUE, NULL, '2025-11-11 13:00:00', NULL, NULL, 6, NULL, 39),
(120000.00, 'Gastos médicos', '2025-11-13 16:10:00', TRUE, NULL, '2025-11-13 16:10:00', NULL, NULL, 7, NULL, 43),
(280000.00, 'Compra de maquinaria', '2025-11-15 10:30:00', FALSE, 'Excede capacidad de pago', '2025-11-15 10:30:00', NULL, NULL, 8, NULL, 47),
(65000.00, 'Estudios universitarios', '2025-11-17 12:00:00', TRUE, NULL, '2025-11-17 12:00:00', NULL, NULL, 9, NULL, 51),
(160000.00, 'Mudanza y alquiler', '2025-11-19 15:45:00', TRUE, NULL, '2025-11-19 15:45:00', NULL, NULL, 10, NULL, 59);
INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES
(200000.00, 'Compra de insumos', '2025-11-21 09:00:00', TRUE, NULL, '2025-11-21 09:00:00', NULL, NULL, 11, NULL, 6),
(175000.00, 'Reparación de maquinaria', '2025-11-22 10:30:00', FALSE, 'Cliente en mora', '2025-11-22 10:30:00', NULL, NULL, 12, NULL, 13),
(95000.00, 'Gastos personales', '2025-11-23 11:45:00', TRUE, NULL, '2025-11-23 11:45:00', NULL, NULL, 13, NULL, 20),
(300000.00, 'Ampliación de local', '2025-11-24 14:15:00', TRUE, NULL, '2025-11-24 14:15:00', NULL, NULL, 14, NULL, 27),
(85000.00, 'Compra de mobiliario', '2025-11-25 08:50:00', FALSE, 'Documentación vencida', '2025-11-25 08:50:00', NULL, NULL, 15, NULL, 33),
(190000.00, 'Viaje de negocios', '2025-11-26 13:20:00', TRUE, NULL, '2025-11-26 13:20:00', NULL, NULL, 16, NULL, 38),
(140000.00, 'Renovación de flota', '2025-11-27 15:10:00', TRUE, NULL, '2025-11-27 15:10:00', NULL, NULL, 17, NULL, 42),
(310000.00, 'Compra de stock', '2025-11-28 09:40:00', FALSE, 'Inconsistencias en ingresos', '2025-11-28 09:40:00', NULL, NULL, 18, NULL, 49),
(70000.00, 'Mudanza', '2025-11-29 12:30:00', TRUE, NULL, '2025-11-29 12:30:00', NULL, NULL, 19, NULL, 53),
(165000.00, 'Estudios de posgrado', '2025-11-30 16:00:00', TRUE, NULL, '2025-11-30 16:00:00', NULL, NULL, 20, NULL, 60);
INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES
(185000.00, 'Compra de equipamiento', '2025-12-01 09:00:00', TRUE, NULL, '2025-12-01 09:00:00', NULL, NULL, 21, NULL, 7),
(210000.00, 'Reforma de oficina', '2025-12-02 10:30:00', FALSE, 'Ingresos insuficientes', '2025-12-02 10:30:00', NULL, NULL, 22, NULL, 14),
(98000.00, 'Gastos médicos', '2025-12-03 11:45:00', TRUE, NULL, '2025-12-03 11:45:00', NULL, NULL, 23, NULL, 21),
(320000.00, 'Expansión comercial', '2025-12-04 14:15:00', TRUE, NULL, '2025-12-04 14:15:00', NULL, NULL, 24, NULL, 28),
(87000.00, 'Compra de mobiliario', '2025-12-05 08:50:00', FALSE, 'Cliente con antecedentes negativos', '2025-12-05 08:50:00', NULL, NULL, 25, NULL, 35),
(195000.00, 'Viaje corporativo', '2025-12-06 13:20:00', TRUE, NULL, '2025-12-06 13:20:00', NULL, NULL, 26, NULL, 41),
(145000.00, 'Renovación de flota', '2025-12-07 15:10:00', TRUE, NULL, '2025-12-07 15:10:00', NULL, NULL, 27, NULL, 45),
(315000.00, 'Compra de stock', '2025-12-08 09:40:00', FALSE, 'Falta de garantías', '2025-12-08 09:40:00', NULL, NULL, 28, NULL, 50),
(72000.00, 'Mudanza', '2025-12-09 12:30:00', TRUE, NULL, '2025-12-09 12:30:00', NULL, NULL, 29, NULL, 54),
(170000.00, 'Estudios en el exterior', '2025-12-10 16:00:00', TRUE, NULL, '2025-12-10 16:00:00', NULL, NULL, 31, NULL, 58);
INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES
(190000.00, 'Compra de insumos médicos', '2025-12-11 09:00:00', TRUE, NULL, '2025-12-11 09:00:00', NULL, NULL, 32, NULL, 8),
(215000.00, 'Reparación de instalaciones', '2025-12-12 10:30:00', FALSE, 'Cliente en revisión judicial', '2025-12-12 10:30:00', NULL, NULL, 33, NULL, 15),
(99000.00, 'Gastos familiares', '2025-12-13 11:45:00', TRUE, NULL, '2025-12-13 11:45:00', NULL, NULL, 35, NULL, 22),
(325000.00, 'Apertura de sucursal', '2025-12-14 14:15:00', TRUE, NULL, '2025-12-14 14:15:00', NULL, NULL, 36, NULL, 29),
(88000.00, 'Compra de mobiliario escolar', '2025-12-15 08:50:00', FALSE, 'Falta de aval institucional', '2025-12-15 08:50:00', NULL, NULL, 37, NULL, 36),
(198000.00, 'Viaje académico', '2025-12-16 13:20:00', TRUE, NULL, '2025-12-16 13:20:00', NULL, NULL, 38, NULL, 44),
(148000.00, 'Renovación de equipos', '2025-12-17 15:10:00', TRUE, NULL, '2025-12-17 15:10:00', NULL, NULL, 39, NULL, 48),
(318000.00, 'Compra de mercadería', '2025-12-18 09:40:00', FALSE, 'Inconsistencias en documentación', '2025-12-18 09:40:00', NULL, NULL, 40, NULL, 52),
(73000.00, 'Mudanza internacional', '2025-12-19 12:30:00', TRUE, NULL, '2025-12-19 12:30:00', NULL, NULL, 41, NULL, 56),
(175000.00, 'Estudios técnicos', '2025-12-20 16:00:00', TRUE, NULL, '2025-12-20 16:00:00', NULL, NULL, 42, NULL, 61);
INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES
(195000.00, 'Compra de equipamiento médico', '2025-12-21 09:00:00', TRUE, NULL, '2025-12-21 09:00:00', NULL, NULL, 43, NULL, 9),
(225000.00, 'Reforma de local comercial', '2025-12-22 10:30:00', FALSE, 'Cliente con deuda activa', '2025-12-22 10:30:00', NULL, NULL, 44, NULL, 16),
(101000.00, 'Gastos personales urgentes', '2025-12-23 11:45:00', TRUE, NULL, '2025-12-23 11:45:00', NULL, NULL, 45, NULL, 23),
(330000.00, 'Apertura de nueva sede', '2025-12-24 14:15:00', TRUE, NULL, '2025-12-24 14:15:00', NULL, NULL, 46, NULL, 30),
(89000.00, 'Compra de mobiliario urbano', '2025-12-25 08:50:00', FALSE, 'Falta de documentación respaldatoria', '2025-12-25 08:50:00', NULL, NULL, 47, NULL, 37),
(205000.00, 'Viaje institucional', '2025-12-26 13:20:00', TRUE, NULL, '2025-12-26 13:20:00', NULL, NULL, 48, NULL, 46),
(150000.00, 'Renovación de sistemas', '2025-12-27 15:10:00', TRUE, NULL, '2025-12-27 15:10:00', NULL, NULL, 49, NULL, 55),
(320000.00, 'Compra de insumos agrícolas', '2025-12-28 09:40:00', FALSE, 'Cliente con historial irregular', '2025-12-28 09:40:00', NULL, NULL, 50, NULL, 62),
(74000.00, 'Mudanza nacional', '2025-12-29 12:30:00', TRUE, NULL, '2025-12-29 12:30:00', NULL, NULL, 51, NULL, 11),
(180000.00, 'Estudios de especialización', '2025-12-30 16:00:00', TRUE, NULL, '2025-12-30 16:00:00', NULL, NULL, 52, NULL, 19);
INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_cliente)
VALUES
(200000.00, 'Compra de herramientas industriales', '2025-12-31 09:00:00', TRUE, NULL, '2025-12-31 09:00:00', NULL, NULL, 53, NULL, 10),
(230000.00, 'Reforma de planta', '2026-01-01 10:30:00', FALSE, 'Falta de documentación técnica', '2026-01-01 10:30:00', NULL, NULL, 55, NULL, 17),
(102000.00, 'Gastos de mudanza', '2026-01-02 11:45:00', TRUE, NULL, '2026-01-02 11:45:00', NULL, NULL, 56, NULL, 24),
(335000.00, 'Apertura de nueva oficina', '2026-01-03 14:15:00', TRUE, NULL, '2026-01-03 14:15:00', NULL, NULL, 57, NULL, 32),
(90000.00, 'Compra de mobiliario de oficina', '2026-01-04 08:50:00', FALSE, 'Cliente con historial irregular', '2026-01-04 08:50:00', NULL, NULL, 58, NULL, 40),
(210000.00, 'Viaje de capacitación', '2026-01-05 13:20:00', TRUE, NULL, '2026-01-05 13:20:00', NULL, NULL, 59, NULL, 51),
(152000.00, 'Renovación de flota vehicular', '2026-01-06 15:10:00', TRUE, NULL, '2026-01-06 15:10:00', NULL, NULL, 60, NULL, 57),
(325000.00, 'Compra de insumos tecnológicos', '2026-01-07 09:40:00', FALSE, 'Falta de garantías comerciales', '2026-01-07 09:40:00', NULL, NULL, 61, NULL, 4),
(75000.00, 'Mudanza y alquiler', '2026-01-08 12:30:00', TRUE, NULL, '2026-01-08 12:30:00', NULL, NULL, 62, NULL, 26),
(185000.00, 'Estudios universitarios', '2026-01-09 16:00:00', TRUE, NULL, '2026-01-09 16:00:00', NULL, NULL, 1, NULL, 38);