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

