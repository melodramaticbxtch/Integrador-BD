CREATE DATABASE financiamiento_ra;
USE financiamento_ra;

CREATE TABLE `Empleado` (
`id_empleado` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`id_sucursal` int,
`DNI_empleado` varchar(255),
`nombre` varchar(255),
`apellido` varchar(255),
`cargo` varchar(255),
`email` varchar(255),
`telefono` varchar(255),
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255),
FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE `Producto_financiero` (
`id_producto_financiero` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`nombre_producto_financiero` varchar(255),
`descripcion` varchar(255),
`limite_max` decimal(10,2),
`limite_min` decimal(10,2),
`requisitos` varchar(255),
`tasa_base` decimal,
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255)
);

CREATE TABLE Credito (
`id_credito integer` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`id_cliente` int not null,
`id_producto` int not null,
`id_solicitud` int not null,

-- Clave foránea autorreferenciada (crédito padre)
`id_credito_padre` int null,

`monto_otorgado` decimal,
`fecha_inicio` timestamp,
`fecha_fin` timestamp,
`tasa_aplicada` decimal,
`plazo_devolucion` int,
`estado_crediticio` varchar(255),
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
FOREIGN KEY (id_solicitud) REFERENCES Solicitud(id_solicitud),
FOREIGN KEY (id_credito_padre) REFERENCES credito(id_credito)
);

CREATE TABLE `Historial_de_tasas` (
`id_historial` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`tasa` decimal(10,2),
`fecha_inicio` timestamp,
`fecha_fin` timestamp,
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255)
);

CREATE TABLE `Cuota` (
`id_cuota` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`id_credito` int not null,
`numero_cuota` int,
`fecha_de_emision` timestamp,
`fecha_de_vencimiento` timestamp,
`monto_total` decimal(10,2),
`estado` boolean,
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255),
FOREIGN KEY (id_credito) REFERENCES Credito(id_credito)
);

CREATE TABLE `Pago` (
`id_pago` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`id_cuota` int not null,
`fecha_de_pago` timestamp,
`monto_pagado` decimal,
`demora` int,
`penalizacion_mora` decimal(10,2),
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255),
FOREIGN KEY (id_cuota) REFERENCES Cuota(id_cuota)
);

CREATE TABLE `Metodo_de_pago` (
`id_metodo` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
`metodo` enum("Efectivo", "Trajeta", "Transferencia") not null,
`fecha_de_alta` timestamp,
`fecha_de_baja` timestamp,
`fecha_de_modificacion` timestamp,
`creado_por` varchar(255),
`modificado_por` varchar(255)
);


INSERT INTO Empleado (id_sucursal, DNI_empleado, nombre, apellido, cargo, email, telefono, fecha_de_alta, creado_por) VALUES
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
(4, '45223344', 'Gonzalo', 'Guerra', 'Analista Crediticio', 'gonzalo.guerra@financiera.com', '1112345682', '2025-05-12 09:00:00', 'Sistema');

INSERT INTO Sucursal (nombre_sucursal, localidad, provincia, telefono_sucursal, direccion, fecha_de_alta, creado_por) VALUES
('Sucursal Salta Capital', 'Salta', 'Salta', '0387-431-0032', 'Florida 100', '2023-01-20 10:00:00', 'Sistema'),
('Sucursal Paraná', 'Paraná', 'Entre Ríos', '0343-421-0035', 'San Martín 800', '2023-05-30 10:00:00', 'Sistema'),
('Sucursal Goya', 'Goya', 'Corrientes', '03777-42-0041', 'Colón 500', '2024-01-30 10:00:00', 'Sistema'),
('Sucursal Posadas', 'Posadas', 'Misiones', '0376-442-0042', 'Bolívar 1700', '2024-03-01 10:00:00', 'Sistema'),
);

INSERT INTO Solicitud (monto, destino, fecha_solicitud, estado, motivo_estado, fecha_de_alta, creado_por) VALUES
-- Registros Aprobados (estado = 1) - Sin motivo
(100000.00, 'Consolidación de Deudas', '2025-01-01 10:00:00', 1, NULL, NOW(), 'Sistema'),
(500000.00, 'Compra de Vehículo', '2025-01-05 11:30:00', 1, NULL, NOW(), 'Sistema'),
(150000.00, 'Inversión en Negocio', '2025-01-08 14:45:00', 1, NULL, NOW(), 'Sistema'),
(80000.00, 'Viaje Familiar', '2025-01-12 09:15:00', 1, NULL, NOW(), 'Sistema'),
(1200000.00, 'Ampliación de Vivienda', '2025-01-15 16:20:00', 1, NULL, NOW(), 'Sistema'),
(65000.00, 'Estudios/Capacitación', '2025-01-18 10:40:00', 1, NULL, NOW(), 'Sistema'),
(750000.00, 'Capital de Trabajo', '2025-01-22 13:10:00', 1, NULL, NOW(), 'Sistema'),
(200000.00, 'Renovación de Equipamiento', '2025-01-25 11:55:00', 1, NULL, NOW(), 'Sistema'),
(90000.00, 'Gastos Médicos', '2025-01-28 09:30:00', 1, NULL, NOW(), 'Sistema'),
(1300000.00, 'Compra de Inmueble', '2025-02-01 15:00:00', 1, NULL, NOW(), 'Sistema'),
(110000.00, 'Consolidación de Deudas', '2025-02-04 10:15:00', 1, NULL, NOW(), 'Sistema'),
(480000.00, 'Compra de Vehículo', '2025-02-07 12:40:00', 1, NULL, NOW(), 'Sistema'),
(180000.00, 'Inversión en Negocio', '2025-02-10 14:50:00', 1, NULL, NOW(), 'Sistema'),
(55000.00, 'Viaje Familiar', '2025-02-13 09:25:00', 1, NULL, NOW(), 'Sistema'),
(1050000.00, 'Ampliación de Vivienda', '2025-02-16 16:30:00', 1, NULL, NOW(), 'Sistema'),
(70000.00, 'Estudios/Capacitación', '2025-02-19 10:50:00', 1, NULL, NOW(), 'Sistema'),
(800000.00, 'Capital de Trabajo', '2025-02-22 13:20:00', 1, NULL, NOW(), 'Sistema'),
(250000.00, 'Renovación de Equipamiento', '2025-02-25 11:45:00', 1, NULL, NOW(), 'Sistema'),
(95000.00, 'Gastos Médicos', '2025-02-28 09:40:00', 1, NULL, NOW(), 'Sistema'),
(1400000.00, 'Compra de Inmueble', '2025-03-03 15:10:00', 1, NULL, NOW(), 'Sistema'),
(105000.00, 'Consolidación de Deudas', '2025-03-06 10:25:00', 1, NULL, NOW(), 'Sistema'),
(510000.00, 'Compra de Vehículo', '2025-03-09 12:50:00', 1, NULL, NOW(), 'Sistema'),
(190000.00, 'Inversión en Negocio', '2025-03-12 14:00:00', 1, NULL, NOW(), 'Sistema'),
(60000.00, 'Viaje Familiar', '2025-03-15 09:35:00', 1, NULL, NOW(), 'Sistema'),
(1150000.00, 'Ampliación de Vivienda', '2025-03-18 16:40:00', 1, NULL, NOW(), 'Sistema'),

-- Registros Rechazados (estado = 0) - Con motivo
(1500000.00, 'Compra de Inmueble', '2025-03-21 11:00:00', 0, 'Puntaje de riesgo insuficiente (Score < 500)', NOW(), 'Sistema'),
(50000.00, 'Estudios/Capacitación', '2025-03-24 13:30:00', 0, 'Relación cuota-ingreso excede el 35%', NOW(), 'Sistema'),
(600000.00, 'Capital de Trabajo', '2025-03-27 11:15:00', 0, 'Historial crediticio con mora mayor a 60 días', NOW(), 'Sistema'),
(100000.00, 'Consolidación de Deudas', '2025-03-30 09:50:00', 0, 'Documentación de ingresos incompleta', NOW(), 'Sistema'),
(250000.00, 'Compra de Vehículo', '2025-04-02 15:20:00', 0, 'Monto solicitado excede el límite máximo del producto', NOW(), 'Sistema'),
(80000.00, 'Inversión en Negocio', '2025-04-05 10:00:00', 0, 'Puntaje de riesgo insuficiente (Score < 500)', NOW(), 'Sistema'),
(1000000.00, 'Ampliación de Vivienda', '2025-04-08 12:30:00', 0, 'Relación cuota-ingreso excede el 35%', NOW(), 'Sistema'),
(120000.00, 'Viaje Familiar', '2025-04-11 14:40:00', 0, 'Historial crediticio con mora mayor a 60 días', NOW(), 'Sistema'),
(50000.00, 'Gastos Médicos', '2025-04-14 09:10:00', 0, 'Documentación de ingresos incompleta', NOW(), 'Sistema'),
(300000.00, 'Renovación de Equipamiento', '2025-04-17 16:50:00', 0, 'Monto solicitado excede el límite máximo del producto', NOW(), 'Sistema'),

-- Registros en Revisión (estado = 0) - Con motivo
(700000.00, 'Capital de Trabajo', '2025-04-20 10:35:00', 0, 'En revisión por falta de co-deudor', NOW(), 'Sistema'),
(180000.00, 'Compra de Vehículo', '2025-04-23 13:05:00', 0, 'En revisión por variación de ingresos no justificada', NOW(), 'Sistema'),
(1100000.00, 'Compra de Inmueble', '2025-04-26 15:35:00', 0, 'En revisión por necesidad de informe de tasación', NOW(), 'Sistema'),
(60000.00, 'Estudios/Capacitación', '2025-04-29 09:00:00', 0, 'En revisión por falta de garante', NOW(), 'Sistema'),
(450000.00, 'Ampliación de Vivienda', '2025-05-02 11:20:00', 0, 'En revisión por validación de garantía hipotecaria', NOW(), 'Sistema'),

-- Registros Aprobados adicionales (estado = 1)
(550000.00, 'Compra de Vehículo', '2025-05-05 14:15:00', 1, NULL, NOW(), 'Sistema'),
(85000.00, 'Viaje Familiar', '2025-05-08 10:40:00', 1, NULL, NOW(), 'Sistema'),
(140000.00, 'Inversión en Negocio', '2025-05-11 16:05:00', 1, NULL, NOW(), 'Sistema'),
(950000.00, 'Ampliación de Vivienda', '2025-05-14 09:55:00', 1, NULL, NOW(), 'Sistema'),
(130000.00, 'Consolidación de Deudas', '2025-05-17 12:25:00', 1, NULL, NOW(), 'Sistema'),
(1450000.00, 'Compra de Inmueble', '2025-05-20 14:55:00', 1, NULL, NOW(), 'Sistema'),
(75000.00, 'Estudios/Capacitación', '2025-05-23 09:45:00', 1, NULL, NOW(), 'Sistema'); 

INSERT INTO Garante (nombre, apellido, DNI_garante, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por, id_solicitud) VALUES
-- Registros 1 al 10 (id_solicitud 1 al 10)
('Juan', 'Perez', '28123456', NOW(), NULL, NULL, 'Sistema', NULL, 1),
('Maria', 'Gomez', '30234567', NOW(), NULL, NULL, 'Sistema', NULL, 2),
('Carlos', 'Lopez', '25345678', NOW(), NULL, NULL, 'Sistema', NULL, 3),
('Laura', 'Diaz', '32456789', NOW(), NULL, NULL, 'Sistema', NULL, 4),
('Pedro', 'Rodriguez', '26567890', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 5),
('Ana', 'Martinez', '31678901', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 6),
('Miguel', 'Sanchez', '24789012', NOW(), NULL, NULL, 'Sistema', NULL, 7),
('Sofia', 'Fernandez', '33890123', NOW(), NULL, NULL, 'Sistema', NULL, 8),
('Diego', 'Ruiz', '27901234', NOW(), NULL, NULL, 'Sistema', NULL, 9),
('Elena', 'Torres', '35012345', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 10),

-- Registros 11 al 20 (id_solicitud 11 al 20)
('Javier', 'Acosta', '29112233', NOW(), NULL, NULL, 'Sistema', NULL, 11),
('Lucia', 'Benitez', '34223344', NOW(), NULL, NULL, 'Sistema', NULL, 12),
('Andres', 'Cabrera', '23334455', NOW(), NULL, NULL, 'Sistema', NULL, 13),
('Valeria', 'Duarte', '36445566', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 14),
('Ricardo', 'Esposito', '21556677', NOW(), NULL, NULL, 'Sistema', NULL, 15),
('Paula', 'Flores', '37667788', NOW(), NULL, NULL, 'Sistema', NULL, 16),
('Marcelo', 'Gimenez', '22778899', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 17),
('Natalia', 'Herrera', '38889900', NOW(), NULL, NULL, 'Sistema', NULL, 18),
('Guillermo', 'Ibañez', '20990011', NOW(), NULL, NULL, 'Sistema', NULL, 19),
('Silvina', 'Jara', '39001122', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 20),

-- Registros 21 al 30 (id_solicitud 21 al 30)
('Ernesto', 'Karp', '28001123', NOW(), NULL, NULL, 'Sistema', NULL, 21),
('Marina', 'Ledesma', '30112234', NOW(), NULL, NULL, 'Sistema', NULL, 22),
('Hector', 'Mendez', '25223345', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 23),
('Viviana', 'Nuñez', '32334456', NOW(), NULL, NULL, 'Sistema', NULL, 24),
('Fabian', 'Ortiz', '26445567', NOW(), NULL, NULL, 'Sistema', NULL, 25),
('Gisela', 'Paz', '31556678', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 26),
('Ramon', 'Quinteros', '24667789', NOW(), NULL, NULL, 'Sistema', NULL, 27),
('Adriana', 'Rios', '33778890', NOW(), NULL, NULL, 'Sistema', NULL, 28),
('Sergio', 'Salinas', '27889901', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 29),
('Daniela', 'Tapia', '35990012', NOW(), NULL, NULL, 'Sistema', NULL, 30),

-- Registros 31 al 40 (id_solicitud 31 al 40)
('Gustavo', 'Uribe', '29001133', NOW(), NULL, NULL, 'Sistema', NULL, 31),
('Julieta', 'Vargas', '34112244', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 32),
('Omar', 'Waisman', '23223355', NOW(), NULL, NULL, 'Sistema', NULL, 33),
('Romina', 'Xavier', '36334466', NOW(), NULL, NULL, 'Sistema', NULL, 34),
('Alejandro', 'Yañez', '21445577', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 35),
('Lorena', 'Zarate', '37556688', NOW(), NULL, NULL, 'Sistema', NULL, 36),
('Federico', 'Arias', '22667799', NOW(), NULL, NULL, 'Sistema', NULL, 37),
('Camila', 'Blanco', '38778800', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 38),
('Sebastian', 'Castro', '20889911', NOW(), NULL, NULL, 'Sistema', NULL, 39),
('Veronica', 'Delgado', '39990022', NOW(), NULL, NULL, 'Sistema', NULL, 40),

-- Registros 41 al 50 (id_solicitud 41 al 47 y 1 al 3)
('Martin', 'Escobar', '28990033', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 41),
('Florencia', 'Ferreyra', '30001144', NOW(), NULL, NULL, 'Sistema', NULL, 42),
('Benjamin', 'Gaitán', '25112255', NOW(), NULL, NULL, 'Sistema', NULL, 43),
('Soledad', 'Herrera', '32223366', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 44),
('Tobias', 'Ibarra', '26334477', NOW(), NULL, NULL, 'Sistema', NULL, 45),
('Melisa', 'Juárez', '31445588', NOW(), NULL, NULL, 'Sistema', NULL, 46),
('Dario', 'Krause', '24556699', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 47),
('Rocio', 'López', '33667700', NOW(), NULL, NULL, 'Sistema', NULL, 1), -- Repite 1
('Ezequiel', 'Molina', '27778811', NOW(), NULL, NULL, 'Sistema', NULL, 2), -- Repite 2
('Tamara', 'Navarro', '35889922', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 3), -- Repite 3

-- Registros 51 al 60 (id_solicitud 4 al 13)
('Facundo', 'Ochoa', '29990044', NOW(), NULL, NULL, 'Sistema', NULL, 4), -- Repite 4
('Antonela', 'Pacheco', '34001155', NOW(), NULL, NULL, 'Sistema', NULL, 5), -- Repite 5
('Renzo', 'Quirós', '23112266', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 6), -- Repite 6
('Catalina', 'Reyes', '36223377', NOW(), NULL, NULL, 'Sistema', NULL, 7), -- Repite 7
('Ignacio', 'Sosa', '21334488', NOW(), NULL, NULL, 'Sistema', NULL, 8), -- Repite 8
('Flavia', 'Toledo', '37445599', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 9), -- Repite 9
('Alan', 'Vázquez', '22556600', NOW(), NULL, NULL, 'Sistema', NULL, 10), -- Repite 10
('Emilia', 'Zubizarreta', '38667711', NOW(), NULL, NULL, 'Sistema', NULL, 11), -- Repite 11
('Bruno', 'Alvarez', '20778822', NOW(), NULL, NULL, 'Usuario_Admin', NULL, 12), -- Repite 12
('Candela', 'Bustos', '39889933', NOW(), NULL, NULL, 'Sistema', NULL, 13); -- Repite 13

INSERT INTO Empleado (id_sucursal, DNI_empleado, nombre, apellido, cargo, email, telefono, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por) VALUES
-- Sucursal 1: Salta Capital (Registros 1-15)
(1, '30112233', 'Roberto', 'Arias', 'Gerente', 'roberto.arias@empresa.com.ar', '3874112233', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '32445566', 'Elena', 'Bustos', 'Asesor Comercial', 'elena.bustos@empresa.com.ar', '3874223344', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '34778899', 'Pablo', 'Cáceres', 'Analista de Crédito', 'pablo.caceres@empresa.com.ar', '3874334455', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '28001122', 'Sofía', 'Delgado', 'Cajero', 'sofia.delgado@empresa.com.ar', '3874445566', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '31334455', 'Martín', 'Escobar', 'Asesor Comercial', 'martin.escobar@empresa.com.ar', '3874556677', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '33667788', 'Valeria', 'Ferreyra', 'Supervisor', 'valeria.ferreyra@empresa.com.ar', '3874667788', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '29990011', 'Jorge', 'Giménez', 'Asesor Comercial', 'jorge.gimenez@empresa.com.ar', '3874778899', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '35223344', 'Luciana', 'Herrera', 'Atención al Cliente', 'luciana.herrera@empresa.com.ar', '3874889900', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '27889900', 'Claudio', 'Ibañez', 'Cajero', 'claudio.ibanez@empresa.com.ar', '3874990011', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '36556677', 'Daniela', 'Juárez', 'Analista de Riesgo', 'daniela.juarez@empresa.com.ar', '3874001122', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '38889900', 'Federico', 'Ledesma', 'Asesor Comercial', 'federico.ledesma@empresa.com.ar', '3874112244', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '30001123', 'Natalia', 'Molina', 'Cajero', 'natalia.molina@empresa.com.ar', '3874223355', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '32112234', 'Ricardo', 'Navarro', 'Asesor Comercial', 'ricardo.navarro@empresa.com.ar', '3874334466', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '34334456', 'Laura', 'Ortiz', 'Atención al Cliente', 'laura.ortiz@empresa.com.ar', '3874445577', NOW(), NULL, NULL, 'Sistema', NULL),
(1, '28556678', 'Esteban', 'Peralta', 'Cajero', 'esteban.peralta@empresa.com.ar', '3874556688', NOW(), NULL, NULL, 'Sistema', NULL),

-- Sucursal 2: Paraná (Registros 16-30)
(2, '31889901', 'Silvia', 'Quirós', 'Gerente', 'silvia.quiros@empresa.com.ar', '3434112233', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '33990012', 'Maximiliano', 'Ramos', 'Asesor Comercial', 'maxi.ramos@empresa.com.ar', '3434223344', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '29001134', 'Andrea', 'Sosa', 'Analista de Crédito', 'andrea.sosa@empresa.com.ar', '3434334455', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '35112245', 'Hugo', 'Tapia', 'Cajero', 'hugo.tapia@empresa.com.ar', '3434445566', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '27001156', 'Carolina', 'Uribe', 'Asesor Comercial', 'carolina.uribe@empresa.com.ar', '3434556677', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '36001167', 'Gustavo', 'Vargas', 'Supervisor', 'gustavo.vargas@empresa.com.ar', '3434667788', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '38112278', 'Romina', 'Weiss', 'Asesor Comercial', 'romina.weiss@empresa.com.ar', '3434778899', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '30223389', 'Javier', 'Xavier', 'Atención al Cliente', 'javier.xavier@empresa.com.ar', '3434889900', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '32334490', 'Florencia', 'Yañez', 'Cajero', 'florencia.yañez@empresa.com.ar', '3434990011', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '34445501', 'Gabriel', 'Zárate', 'Analista de Riesgo', 'gabriel.zarate@empresa.com.ar', '3434001122', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '28667712', 'Marisa', 'Almeida', 'Asesor Comercial', 'marisa.almeida@empresa.com.ar', '3434112244', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '31778823', 'Luciano', 'Brítez', 'Cajero', 'luciano.britez@empresa.com.ar', '3434223355', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '33889934', 'Viviana', 'Cano', 'Asesor Comercial', 'viviana.cano@empresa.com.ar', '3434334466', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '29112245', 'Hernán', 'Díaz', 'Atención al Cliente', 'hernan.diaz@empresa.com.ar', '3434445577', NOW(), NULL, NULL, 'Sistema', NULL),
(2, '35223356', 'Marina', 'Echeverría', 'Cajero', 'marina.echeverria@empresa.com.ar', '3434556688', NOW(), NULL, NULL, 'Sistema', NULL),

-- Sucursal 3: Goya (Registros 31-45)
(3, '27334467', 'Alejandro', 'Fuentes', 'Gerente', 'alejandro.fuentes@empresa.com.ar', '3777411223', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '36445578', 'Noelia', 'Galarza', 'Asesor Comercial', 'noelia.galarza@empresa.com.ar', '3777422334', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '38556689', 'Darío', 'Iturbe', 'Analista de Crédito', 'dario.iturbe@empresa.com.ar', '3777433445', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '30667790', 'Camila', 'Lugo', 'Cajero', 'camila.lugo@empresa.com.ar', '3777444556', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '32778801', 'Adrián', 'Méndez', 'Asesor Comercial', 'adrian.mendez@empresa.com.ar', '3777455667', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '34889912', 'Estela', 'Nieto', 'Supervisor', 'estela.nieto@empresa.com.ar', '3777466778', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '28990023', 'Gonzalo', 'Oviedo', 'Asesor Comercial', 'gonzalo.oviedo@empresa.com.ar', '3777477889', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '31001134', 'Agustina', 'Paz', 'Atención al Cliente', 'agustina.paz@empresa.com.ar', '3777488990', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '33112245', 'Osvaldo', 'Quinteros', 'Cajero', 'osvaldo.quinteros@empresa.com.ar', '3777499001', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '29223356', 'Rocío', 'Rodríguez', 'Analista de Riesgo', 'rocio.rodriguez@empresa.com.ar', '3777400112', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '35334467', 'Tomás', 'Salinas', 'Asesor Comercial', 'tomas.salinas@empresa.com.ar', '3777411234', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '27445578', 'Victoria', 'Toledo', 'Cajero', 'victoria.toledo@empresa.com.ar', '3777422345', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '36556689', 'Ezequiel', 'Ullúa', 'Asesor Comercial', 'ezequiel.ullua@empresa.com.ar', '3777433456', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '38667700', 'Jesica', 'Vazquez', 'Atención al Cliente', 'jesica.vazquez@empresa.com.ar', '3777444567', NOW(), NULL, NULL, 'Sistema', NULL),
(3, '30778811', 'Mariano', 'Winkler', 'Cajero', 'mariano.winkler@empresa.com.ar', '3777455678', NOW(), NULL, NULL, 'Sistema', NULL),

-- Sucursal 4: Posadas (Registros 46-60)
(4, '32889922', 'Cecilia', 'Ybarra', 'Gerente', 'cecilia.ybarra@empresa.com.ar', '3764112233', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '34990033', 'Damián', 'Zárate', 'Asesor Comercial', 'damian.zarate@empresa.com.ar', '3764223344', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '28101144', 'Yanina', 'Alonso', 'Analista de Crédito', 'yanina.alonso@empresa.com.ar', '3764334455', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '31212255', 'Alejandro', 'Benítez', 'Cajero', 'ale.benitez@empresa.com.ar', '3764445566', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '33323366', 'Micaela', 'Castro', 'Asesor Comercial', 'micaela.castro@empresa.com.ar', '3764556677', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '29434477', 'Cristian', 'Díaz', 'Supervisor', 'cristian.diaz@empresa.com.ar', '3764667788', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '35545588', 'Paula', 'Gómez', 'Asesor Comercial', 'paula.gomez@empresa.com.ar', '3764778899', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '27656699', 'Mauro', 'Juárez', 'Atención al Cliente', 'mauro.juarez@empresa.com.ar', '3764889900', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '36767700', 'Verónica', 'López', 'Cajero', 'veronica.lopez@empresa.com.ar', '3764990011', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '38878811', 'Sergio', 'Marín', 'Analista de Riesgo', 'sergio.marin@empresa.com.ar', '3764001122', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '30989922', 'Cintia', 'Nieva', 'Asesor Comercial', 'cintia.nieva@empresa.com.ar', '3764112244', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '32090033', 'Facundo', 'Ocampo', 'Cajero', 'facundo.ocampo@empresa.com.ar', '3764223355', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '34101144', 'Agustín', 'Pérez', 'Asesor Comercial', 'agustin.perez@empresa.com.ar', '3764334466', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '28212255', 'Aldana', 'Rojas', 'Atención al Cliente', 'aldana.rojas@empresa.com.ar', '3764445577', NOW(), NULL, NULL, 'Sistema', NULL),
(4, '31323366', 'Santiago', 'Torres', 'Cajero', 'santiago.torres@empresa.com.ar', '3764556688', NOW(), NULL, NULL, 'Sistema', NULL);

INSERT INTO Cliente (nombre_cliente, apellido_cliente, documento, tipo_de_persona, ingreso_declarado, domicilio, email_cliente, telefono_cliente, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por) VALUES
-- Personas Físicas (id_cliente 1 - 40)
('Marcos', 'Fernandez', '25876543', 'fisica', 150000.00, 'Calle Falsa 123', 'marcos.f@mail.com', '1154321098', NOW(), NULL, NULL, 'Sistema', NULL),
('Carolina', 'Gomez', '30123456', 'fisica', 220000.00, 'Av. Libertador 4567', 'caro.g@mail.com', '1165432109', NOW(), NULL, NULL, 'Sistema', NULL),
('Ricardo', 'Perez', '27987654', 'fisica', 95000.00, 'Rivadavia 789', 'ricardo.p@mail.com', '1176543210', NOW(), NULL, NULL, 'Sistema', NULL),
('Valeria', 'Lopez', '35012345', 'fisica', 350000.00, 'Santa Fe 1010', 'valeria.l@mail.com', '1187654321', NOW(), NULL, NULL, 'Sistema', NULL),
('Javier', 'Duarte', '22567890', 'fisica', 80000.00, 'Corrientes 2020', 'javier.d@mail.com', '1198765432', NOW(), NULL, NULL, 'Sistema', NULL),
('Silvina', 'Ruiz', '31678901', 'fisica', 180000.00, 'Esmeralda 3030', 'silvina.r@mail.com', '1110987654', NOW(), NULL, NULL, 'Sistema', NULL),
('Alejandro', 'Castro', '29789012', 'fisica', 120000.00, 'Juncal 4040', 'ale.c@mail.com', '1121098765', NOW(), NULL, NULL, 'Sistema', NULL),
('Andrea', 'Sosa', '34890123', 'fisica', 280000.00, 'Marcelo T. 5050', 'andrea.s@mail.com', '1132109876', NOW(), NULL, NULL, 'Sistema', NULL),
('Diego', 'Torres', '26901234', 'fisica', 65000.00, 'Córdoba 6060', 'diego.t@mail.com', '1143210987', NOW(), NULL, NULL, 'Sistema', NULL),
('Florencia', 'Mendez', '33012345', 'fisica', 160000.00, 'Tucumán 7070', 'flor.m@mail.com', '1154321098', NOW(), NULL, NULL, 'Sistema', NULL),
('Hernán', 'Vazquez', '28123456', 'fisica', 400000.00, 'Lavalle 8080', 'hernan.v@mail.com', '1165432109', NOW(), NULL, NULL, 'Sistema', NULL),
('Lucia', 'Rios', '30234567', 'fisica', 110000.00, 'Viamonte 9090', 'lucia.r@mail.com', '1176543210', NOW(), NULL, NULL, 'Sistema', NULL),
('Pedro', 'Acosta', '25345678', 'fisica', 75000.00, 'Florida 1111', 'pedro.a@mail.com', '1187654321', NOW(), NULL, NULL, 'Sistema', NULL),
('Elena', 'Blanco', '32456789', 'fisica', 250000.00, 'Paraguay 2222', 'elena.b@mail.com', '1198765432', NOW(), NULL, NULL, 'Sistema', NULL),
('Gabriel', 'Cano', '24567890', 'fisica', 90000.00, 'Uruguay 3333', 'gabriel.c@mail.com', '1110987654', NOW(), NULL, NULL, 'Sistema', NULL),
('Daniela', 'Diaz', '31678901', 'fisica', 190000.00, 'Chile 4444', 'daniela.d@mail.com', '1121098765', NOW(), NULL, NULL, 'Sistema', NULL),
('Juan', 'Esposito', '23789012', 'fisica', 130000.00, 'Perú 5555', 'juan.e@mail.com', '1132109876', NOW(), NULL, NULL, 'Sistema', NULL),
('Romina', 'Flores', '34890123', 'fisica', 300000.00, 'Bolivia 6666', 'romina.f@mail.com', '1143210987', NOW(), NULL, NULL, 'Sistema', NULL),
('Mario', 'Gimenez', '26901234', 'fisica', 70000.00, 'Ecuador 7777', 'mario.g@mail.com', '1154321098', NOW(), NULL, NULL, 'Sistema', NULL),
('Natalia', 'Herrera', '33012345', 'fisica', 170000.00, 'Venezuela 8888', 'natalia.h@mail.com', '1165432109', NOW(), NULL, NULL, 'Sistema', NULL),
('Ezequiel', 'Ibañez', '28123456', 'fisica', 450000.00, 'Colombia 9999', 'eze.i@mail.com', '1176543210', NOW(), NULL, NULL, 'Sistema', NULL),
('Camila', 'Jara', '30234567', 'fisica', 100000.00, 'Brasil 1000', 'cami.j@mail.com', '1187654321', NOW(), NULL, NULL, 'Sistema', NULL),
('Ruben', 'Karp', '25345678', 'fisica', 60000.00, 'México 2000', 'ruben.k@mail.com', '1198765432', NOW(), NULL, NULL, 'Sistema', NULL),
('Sabrina', 'Ledesma', '32456789', 'fisica', 240000.00, 'Canadá 3000', 'sabri.l@mail.com', '1110987654', NOW(), NULL, NULL, 'Sistema', NULL),
('Hugo', 'Mendez', '24567890', 'fisica', 85000.00, 'Cuba 4000', 'hugo.m@mail.com', '1121098765', NOW(), NULL, NULL, 'Sistema', NULL),
('Veronica', 'Nuñez', '31678901', 'fisica', 200000.00, 'Japón 5000', 'vero.n@mail.com', '1132109876', NOW(), NULL, NULL, 'Sistema', NULL),
('Federico', 'Ortiz', '23789012', 'fisica', 140000.00, 'China 6000', 'fede.o@mail.com', '1143210987', NOW(), NULL, NULL, 'Sistema', NULL),
('Gisela', 'Paz', '34890123', 'fisica', 320000.00, 'India 7000', 'gise.p@mail.com', '1154321098', NOW(), NULL, NULL, 'Sistema', NULL),
('Tomas', 'Quinteros', '26901234', 'fisica', 55000.00, 'Rusia 8000', 'tomas.q@mail.com', '1165432109', NOW(), NULL, NULL, 'Sistema', NULL),
('Marina', 'Rios', '33012345', 'fisica', 155000.00, 'Alemania 9000', 'mari.r@mail.com', '1176543210', NOW(), NULL, NULL, 'Sistema', NULL),
('Franco', 'Sanchez', '28123456', 'fisica', 420000.00, 'Francia 1122', 'franco.s@mail.com', '1187654321', NOW(), NULL, NULL, 'Sistema', NULL),
('Cintia', 'Tapia', '30234567', 'fisica', 115000.00, 'Italia 3344', 'cintia.t@mail.com', '1198765432', NOW(), NULL, NULL, 'Sistema', NULL),
('Esteban', 'Uribe', '25345678', 'fisica', 68000.00, 'España 5566', 'esteban.u@mail.com', '1110987654', NOW(), NULL, NULL, 'Sistema', NULL),
('Analía', 'Vargas', '32456789', 'fisica', 230000.00, 'Portugal 7788', 'anali.v@mail.com', '1121098765', NOW(), NULL, NULL, 'Sistema', NULL),
('Leandro', 'Waisman', '24567890', 'fisica', 92000.00, 'Grecia 9900', 'leandro.w@mail.com', '1132109876', NOW(), NULL, NULL, 'Sistema', NULL),
('Paola', 'Xavier', '31678901', 'fisica', 210000.00, 'Egipto 1357', 'paola.x@mail.com', '1143210987', NOW(), NULL, NULL, 'Sistema', NULL),
('Dario', 'Yañez', '23789012', 'fisica', 125000.00, 'Sudáfrica 2468', 'dario.y@mail.com', '1154321098', NOW(), NULL, NULL, 'Sistema', NULL),
('Roxana', 'Zarate', '34890123', 'fisica', 330000.00, 'Australia 3691', 'roxana.z@mail.com', '1165432109', NOW(), NULL, NULL, 'Sistema', NULL),
('Sebastián', 'Arias', '26901234', 'fisica', 62000.00, 'Nueva Zelanda 4824', 'seba.a@mail.com', '1176543210', NOW(), NULL, NULL, 'Sistema', NULL),
('Jesica', 'Blanco', '33012345', 'fisica', 175000.00, 'Argentina 5957', 'jesi.b@mail.com', '1187654321', NOW(), NULL, NULL, 'Sistema', NULL),

-- Personas Jurídicas (id_cliente 41 - 60)
('Construcciones del Norte S.A.', NULL, '30701234567', 'juridica', 850000.00, 'Av. Olascoaga 100', 'norte.sa@mail.com', '3874987654', NOW(), NULL, NULL, 'Sistema', NULL),
('Logística Patagónica SRL', NULL, '30702345678', 'juridica', 550000.00, 'Ruta 3 Km 10', 'logistica.pata@mail.com', '2901765432', NOW(), NULL, NULL, 'Sistema', NULL),
('Tecnología Global S.R.L.', NULL, '33703456789', 'juridica', 1200000.00, 'Bv. Oroño 2000', 'tech.global@mail.com', '3414567890', NOW(), NULL, NULL, 'Sistema', NULL),
('Distribuidora El Sol S.A.', NULL, '30704567890', 'juridica', 700000.00, 'San Juan 333', 'elsol@mail.com', '2615678901', NOW(), NULL, NULL, 'Sistema', NULL),
('Imprenta Rápida SRL', NULL, '33705678901', 'juridica', 400000.00, 'Lavalleja 500', 'imprenta.r@mail.com', '3516789012', NOW(), NULL, NULL, 'Sistema', NULL),
('Servicios de Limpieza ABC', NULL, '30706789012', 'juridica', 300000.00, 'Salta 1200', 'limpieza.abc@mail.com', '3874123456', NOW(), NULL, NULL, 'Sistema', NULL),
('Desarrollos Inmobiliarios LTDA', NULL, '33707890123', 'juridica', 1500000.00, 'Entre Ríos 800', 'inmo.des@mail.com', '3434789012', NOW(), NULL, NULL, 'Sistema', NULL),
('Metalúrgica Sur S.A.', NULL, '30708901234', 'juridica', 950000.00, 'Pte. Perón 1500', 'metalurgica.sur@mail.com', '3777456789', NOW(), NULL, NULL, 'Sistema', NULL),
('Comercializadora del Centro', NULL, '33709012345', 'juridica', 600000.00, '25 de Mayo 100', 'centro.com@mail.com', '3764012345', NOW(), NULL, NULL, 'Sistema', NULL),
('Estudio Contable Global', NULL, '20710123456', 'juridica', 280000.00, 'San Lorenzo 450', 'contable.g@mail.com', '3874678901', NOW(), NULL, NULL, 'Sistema', NULL),
('Agencia de Viajes Sol y Mar', NULL, '30711234567', 'juridica', 450000.00, 'Belgrano 700', 'solymar@mail.com', '3434234567', NOW(), NULL, NULL, 'Sistema', NULL),
('Consultora Estratégica S.A.', NULL, '33712345678', 'juridica', 750000.00, 'Alvear 900', 'consultora.e@mail.com', '3777890123', NOW(), NULL, NULL, 'Sistema', NULL),
('Alimentos Frescos SRL', NULL, '30713456789', 'juridica', 1100000.00, 'Libertad 1234', 'alimentos.f@mail.com', '3764345678', NOW(), NULL, NULL, 'Sistema', NULL),
('Taller Mecánico El Rayo', NULL, '33714567890', 'juridica', 350000.00, 'Mitre 567', 'taller.rayo@mail.com', '3874456789', NOW(), NULL, NULL, 'Sistema', NULL),
('Farmacia Central S.A.', NULL, '30715678901', 'juridica', 900000.00, 'Independencia 890', 'farmacia.c@mail.com', '3434567890', NOW(), NULL, NULL, 'Sistema', NULL),
('Moda Juvenil SRL', NULL, '33716789012', 'juridica', 500000.00, 'Roca 101', 'moda.j@mail.com', '3777678901', NOW(), NULL, NULL, 'Sistema', NULL),
('Servicios Informáticos 24/7', NULL, '30717890123', 'juridica', 650000.00, 'España 202', 'info247@mail.com', '3764890123', NOW(), NULL, NULL, 'Sistema', NULL),
('Panadería Artesanal El Trigo', NULL, '33718901234', 'juridica', 420000.00, 'Jujuy 303', 'panaderia.t@mail.com', '3874012345', NOW(), NULL, NULL, 'Sistema', NULL),
('Bodega Los Aromas S.A.', NULL, '30719012345', 'juridica', 1300000.00, 'Mendoza 404', 'bodega.a@mail.com', '3434123456', NOW(), NULL, NULL, 'Sistema', NULL),
('Frigorífico del Litoral', NULL, '33720123456', 'juridica', 1000000.00, 'San Martín 505', 'frigo.lito@mail.com', '3777789012', NOW(), NULL, NULL, 'Sistema', NULL);


INSERT INTO Credito (id_cliente, id_producto, id_solicitud, id_credito_padre, monto_otorgado, fecha_inicio, fecha_fin, tasa_aplicada, plazo_devolucion, estado_crediticio, fecha_de_alta, creado_por) VALUES
-- Bloque 1: Solicitudes Aprobadas (id_solicitud 1 al 25) - Clientes 1 al 25
(1, 1, 1, NULL, 100000.00, '2025-01-02 12:00:00', '2026-01-02 12:00:00', 0.55, 12, 'Vigente', NOW(), 'Sistema'), -- id_credito 1
(2, 2, 2, NULL, 500000.00, '2025-01-06 12:00:00', '2029-01-06 12:00:00', 0.40, 48, 'Vigente', NOW(), 'Sistema'),
(3, 1, 3, NULL, 150000.00, '2025-01-09 12:00:00', '2026-07-09 12:00:00', 0.60, 18, 'Vigente', NOW(), 'Sistema'),
(4, 3, 4, NULL, 80000.00, '2025-01-13 12:00:00', '2025-10-13 12:00:00', 0.65, 9, 'Vigente', NOW(), 'Sistema'),
(5, 4, 5, NULL, 1200000.00, '2025-01-16 12:00:00', '2045-01-16 12:00:00', 0.25, 240, 'Vigente', NOW(), 'Sistema'),
(6, 3, 6, NULL, 65000.00, '2025-01-20 12:00:00', '2025-11-20 12:00:00', 0.70, 10, 'Vigente', NOW(), 'Sistema'),
(7, 5, 7, NULL, 750000.00, '2025-01-23 12:00:00', '2028-01-23 12:00:00', 0.45, 36, 'Vigente', NOW(), 'Sistema'),
(8, 2, 8, NULL, 200000.00, '2025-01-26 12:00:00', '2027-07-26 12:00:00', 0.50, 30, 'Vigente', NOW(), 'Sistema'),
(9, 3, 9, NULL, 90000.00, '2025-01-29 12:00:00', '2026-04-29 12:00:00', 0.60, 15, 'Vigente', NOW(), 'Sistema'),
(10, 4, 10, NULL, 1300000.00, '2025-02-03 12:00:00', '2045-02-03 12:00:00', 0.28, 240, 'Vigente', NOW(), 'Sistema'),
(11, 1, 11, NULL, 110000.00, '2025-02-05 12:00:00', '2026-02-05 12:00:00', 0.58, 12, 'Vigente', NOW(), 'Sistema'),
(12, 2, 12, NULL, 480000.00, '2025-02-08 12:00:00', '2029-02-08 12:00:00', 0.42, 48, 'Vigente', NOW(), 'Sistema'),
(13, 1, 13, NULL, 180000.00, '2025-02-11 12:00:00', '2026-08-11 12:00:00', 0.62, 18, 'Vigente', NOW(), 'Sistema'),
(14, 3, 14, NULL, 55000.00, '2025-02-14 12:00:00', '2025-11-14 12:00:00', 0.68, 9, 'Vigente', NOW(), 'Sistema'),
(15, 4, 15, NULL, 1050000.00, '2025-02-17 12:00:00', '2045-02-17 12:00:00', 0.26, 240, 'Vigente', NOW(), 'Sistema'),
(16, 3, 16, NULL, 70000.00, '2025-02-20 12:00:00', '2025-12-20 12:00:00', 0.72, 10, 'Vigente', NOW(), 'Sistema'),
(17, 5, 17, NULL, 800000.00, '2025-02-24 12:00:00', '2028-02-24 12:00:00', 0.47, 36, 'Vigente', NOW(), 'Sistema'),
(18, 2, 18, NULL, 250000.00, '2025-02-26 12:00:00', '2027-09-26 12:00:00', 0.52, 30, 'Vigente', NOW(), 'Sistema'),
(19, 3, 19, NULL, 95000.00, '2025-03-01 12:00:00', '2026-05-01 12:00:00', 0.62, 15, 'Vigente', NOW(), 'Sistema'),
(20, 4, 20, NULL, 1400000.00, '2025-03-04 12:00:00', '2045-03-04 12:00:00', 0.29, 240, 'Vigente', NOW(), 'Sistema'),
(21, 1, 21, NULL, 105000.00, '2025-03-07 12:00:00', '2026-03-07 12:00:00', 0.57, 12, 'Vigente', NOW(), 'Sistema'),
(22, 2, 22, NULL, 510000.00, '2025-03-10 12:00:00', '2029-03-10 12:00:00', 0.41, 48, 'Vigente', NOW(), 'Sistema'),
(23, 1, 23, NULL, 190000.00, '2025-03-13 12:00:00', '2026-09-13 12:00:00', 0.61, 18, 'Vigente', NOW(), 'Sistema'),
(24, 3, 24, NULL, 60000.00, '2025-03-16 12:00:00', '2025-12-16 12:00:00', 0.66, 9, 'Vigente', NOW(), 'Sistema'),
(25, 4, 25, NULL, 1150000.00, '2025-03-19 12:00:00', '2045-03-19 12:00:00', 0.27, 240, 'Vigente', NOW(), 'Sistema'),

-- Bloque 2: Préstamos Adicionales (Créditos 26 al 40) - Clientes 26 al 40, reutilizando id_solicitud 1-15
(26, 3, 1, NULL, 50000.00, '2025-04-01 12:00:00', '2026-04-01 12:00:00', 0.75, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 26, Solicitud 1
(27, 2, 2, NULL, 300000.00, '2025-04-05 12:00:00', '2028-04-05 12:00:00', 0.45, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 27, Solicitud 2
(28, 1, 3, NULL, 70000.00, '2025-04-10 12:00:00', '2026-01-10 12:00:00', 0.80, 9, 'Vigente', NOW(), 'Sistema'), -- Cliente 28, Solicitud 3
(29, 3, 4, NULL, 120000.00, '2025-04-15 12:00:00', '2027-04-15 12:00:00', 0.68, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 29, Solicitud 4
(30, 5, 5, NULL, 900000.00, '2025-04-20 12:00:00', '2028-04-20 12:00:00', 0.35, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 30, Solicitud 5
(31, 1, 6, NULL, 40000.00, '2025-04-25 12:00:00', '2025-10-25 12:00:00', 0.90, 6, 'Vigente', NOW(), 'Sistema'), -- Cliente 31, Solicitud 6
(32, 2, 7, NULL, 150000.00, '2025-05-01 12:00:00', '2027-05-01 12:00:00', 0.50, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 32, Solicitud 7
(33, 3, 8, NULL, 85000.00, '2025-05-05 12:00:00', '2026-05-05 12:00:00', 0.70, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 33, Solicitud 8
(34, 4, 9, NULL, 200000.00, '2025-05-10 12:00:00', '2028-05-10 12:00:00', 0.30, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 34, Solicitud 9
(35, 5, 10, NULL, 600000.00, '2025-05-15 12:00:00', '2029-05-15 12:00:00', 0.40, 48, 'Vigente', NOW(), 'Sistema'), -- Cliente 35, Solicitud 10
(36, 1, 11, NULL, 90000.00, '2025-05-20 12:00:00', '2026-05-20 12:00:00', 0.65, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 36, Solicitud 11
(37, 2, 12, NULL, 350000.00, '2025-05-25 12:00:00', '2028-05-25 12:00:00', 0.43, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 37, Solicitud 12
(38, 3, 13, NULL, 110000.00, '2025-06-01 12:00:00', '2027-06-01 12:00:00', 0.72, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 38, Solicitud 13
(39, 4, 14, NULL, 50000.00, '2025-06-05 12:00:00', '2025-12-05 12:00:00', 0.85, 6, 'Vigente', NOW(), 'Sistema'), -- Cliente 39, Solicitud 14
(40, 5, 15, NULL, 1100000.00, '2025-06-10 12:00:00', '2030-06-10 12:00:00', 0.32, 60, 'Vigente', NOW(), 'Sistema'), -- Cliente 40, Solicitud 15

-- Bloque 3: Personas Jurídicas y Refinanciaciones (Créditos 41 al 60)
-- Jurídicas (id_cliente 41 al 60, reutilizando id_solicitud 16-25 y 1-10)
(41, 5, 16, NULL, 500000.00, '2025-06-15 12:00:00', '2027-06-15 12:00:00', 0.20, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 41, Solicitud 16
(42, 5, 17, NULL, 350000.00, '2025-06-20 12:00:00', '2026-06-20 12:00:00', 0.22, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 42, Solicitud 17
(43, 5, 18, NULL, 800000.00, '2025-06-25 12:00:00', '2028-06-25 12:00:00', 0.18, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 43, Solicitud 18
(44, 5, 19, NULL, 400000.00, '2025-07-01 12:00:00', '2027-07-01 12:00:00', 0.25, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 44, Solicitud 19
(45, 4, 20, NULL, 1500000.00, '2025-07-05 12:00:00', '2045-07-05 12:00:00', 0.15, 240, 'Vigente', NOW(), 'Sistema'), -- Cliente 45, Solicitud 20
(46, 5, 21, NULL, 600000.00, '2025-07-10 12:00:00', '2028-07-10 12:00:00', 0.21, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 46, Solicitud 21
(47, 5, 22, NULL, 480000.00, '2025-07-15 12:00:00', '2026-07-15 12:00:00', 0.23, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 47, Solicitud 22
(48, 5, 23, NULL, 950000.00, '2025-07-20 12:00:00', '2029-07-20 12:00:00', 0.19, 48, 'Vigente', NOW(), 'Sistema'), -- Cliente 48, Solicitud 23
(49, 5, 24, NULL, 320000.00, '2025-07-25 12:00:00', '2027-07-25 12:00:00', 0.26, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 49, Solicitud 24
(50, 4, 25, NULL, 1800000.00, '2025-08-01 12:00:00', '2045-08-01 12:00:00', 0.16, 240, 'Vigente', NOW(), 'Sistema'), -- Cliente 50, Solicitud 25

-- Créditos con Refinanciación (id_credito_padre)
(1, 1, 1, 1, 10000.00, '2026-01-03 12:00:00', '2026-04-03 12:00:00', 0.50, 3, 'Cancelado', NOW(), 'Sistema'), -- id_credito 51 (Consolidación / Adicional sobre el 1)
(1, 1, 1, 51, 15000.00, '2026-04-04 12:00:00', '2026-10-04 12:00:00', 0.52, 6, 'Vigente', NOW(), 'Sistema'), -- id_credito 52 (Refinanciación del 51)
(2, 2, 2, 2, 50000.00, '2025-05-01 12:00:00', '2026-05-01 12:00:00', 0.45, 12, 'Vigente', NOW(), 'Sistema'), -- id_credito 53 (Adicional sobre el 2)
(3, 1, 3, 3, 20000.00, '2025-08-01 12:00:00', '2026-08-01 12:00:00', 0.65, 12, 'Vigente', NOW(), 'Sistema'), -- id_credito 54 (Adicional sobre el 3)
(4, 3, 4, 4, 10000.00, '2025-03-01 12:00:00', '2025-06-01 12:00:00', 0.70, 3, 'Cancelado', NOW(), 'Sistema'), -- id_credito 55 (Adicional sobre el 4)

-- Más registros (reutilizando id_solicitud 1-5, clientes 5-9)
(5, 4, 5, NULL, 150000.00, '2025-08-10 12:00:00', '2030-08-10 12:00:00', 0.30, 60, 'Vigente', NOW(), 'Sistema'), -- Cliente 5, Solicitud 5
(6, 3, 6, NULL, 75000.00, '2025-08-15 12:00:00', '2026-08-15 12:00:00', 0.70, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 6, Solicitud 6
(7, 5, 7, NULL, 900000.00, '2025-08-20 12:00:00', '2028-08-20 12:00:00', 0.40, 36, 'Vigente', NOW(), 'Sistema'), -- Cliente 7, Solicitud 7
(8, 2, 8, NULL, 180000.00, '2025-08-25 12:00:00', '2027-08-25 12:00:00', 0.55, 24, 'Vigente', NOW(), 'Sistema'), -- Cliente 8, Solicitud 8
(9, 3, 9, NULL, 100000.00, '2025-09-01 12:00:00', '2026-09-01 12:00:00', 0.60, 12, 'Vigente', NOW(), 'Sistema'), -- Cliente 9, Solicitud 9
(10, 4, 10, NULL, 1500000.00, '2025-09-05 12:00:00', '2045-09-05 12:00:00', 0.28, 240, 'Vigente', NOW(), 'Sistema'); -- Cliente 10, Solicitud 10


INSERT INTO Producto_financiero (nombre_producto_financiero, descripcion, limite_max, limite_min, requisitos, tasa_base, fecha_de_alta, fecha_de_baja, fecha_de_modificacion, creado_por, modificado_por) VALUES
-- Bloque 1: Préstamos Personales (id 1-10)
('Préstamo Express', 'Crédito rápido de libre destino', 300000.00, 10000.00, 'Ingreso fijo 6 meses, Score > 550', 0.55, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Coche Usado', 'Financiación para compra de vehículos usados', 1500000.00, 50000.00, 'Antigüedad laboral 1 año, titularidad vehículo', 0.40, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Estudios', 'Crédito para educación y capacitación', 500000.00, 20000.00, 'Certificado de inscripción, ingresos comprobables', 0.65, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Consolidación', 'Para unificar deudas existentes', 800000.00, 100000.00, 'Análisis de deuda actual, Score > 600', 0.48, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Viajes', 'Crédito para paquetes turísticos y pasajes', 150000.00, 15000.00, 'Reserva de viaje, sin morosidad', 0.70, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Salud', 'Crédito para tratamientos médicos y cirugías', 400000.00, 25000.00, 'Presupuesto médico, ingresos estables', 0.58, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Joven', 'Crédito inicial para nuevos clientes', 100000.00, 5000.00, 'Edad 18-25, recibo de sueldo', 0.75, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Digital', 'Solicitud y desembolso 100% online', 200000.00, 5000.00, 'Cuenta bancaria activa, validación biométrica', 0.60, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Verde', 'Para reformas y equipos de eficiencia energética', 1000000.00, 100000.00, 'Presupuesto de obra/equipos, Score > 650', 0.45, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Pyme', 'Crédito para pequeños negocios unipersonales', 2500000.00, 50000.00, 'Monotributo/Autónomo 2 años, proyección de negocio', 0.35, NOW(), NULL, NULL, 'Sistema', NULL),

-- Bloque 2: Hipotecarios y Garantizados (id 11-20)
('Hipotecario Vivienda Única', 'Crédito para adquisición de primera vivienda', 30000000.00, 500000.00, 'Garantía hipotecaria, 20% ahorro propio', 0.25, NOW(), NULL, NULL, 'Sistema', NULL),
('Hipotecario Refacción', 'Préstamo para ampliar o refaccionar vivienda', 5000000.00, 100000.00, 'Garantía hipotecaria, planos aprobados', 0.28, NOW(), NULL, NULL, 'Sistema', NULL),
('Hipotecario Lote', 'Financiación para compra de terrenos', 8000000.00, 200000.00, 'Tasación de lote, ingresos altos', 0.30, NOW(), NULL, NULL, 'Sistema', NULL),
('Crédito Prendario Nuevo', 'Financiación para vehículos 0km (Prenda)', 5000000.00, 100000.00, 'Prenda sobre el vehículo, seguro total', 0.38, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo con Garantía Real', 'Crédito respaldado por inmueble (no hipotecario)', 10000000.00, 500000.00, 'Garantía real, sin gravámenes', 0.32, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo con Garantía Fiduciaria', 'Crédito respaldado por fondo de garantía', 2000000.00, 200000.00, 'Adhesión a fideicomiso, aporte inicial', 0.42, NOW(), NULL, NULL, 'Sistema', NULL),
('Hipotecario Uva', 'Crédito hipotecario con ajuste por inflación', 25000000.00, 300000.00, 'Relación cuota-ingreso estricta', 0.15, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Automático', 'Crédito preaprobado por sistema', 100000.00, 5000.00, 'Límite basado en historial de cliente', 0.68, NOW(), NULL, NULL, 'Sistema', NULL),
('Crédito para Adquisición de Maquinaria', 'Financiación de equipos productivos (Garantía Maquinaria)', 4000000.00, 500000.00, 'Prenda sobre la maquinaria, plan de negocios', 0.36, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo para Inquilinos', 'Garantía para alquiler (sustituye fianza)', 200000.00, 10000.00, 'Contrato de alquiler, 3 meses de ingresos', 0.50, NOW(), NULL, NULL, 'Sistema', NULL),

-- Bloque 3: Productos Empresariales y Líneas de Crédito (id 21-30)
('Línea de Crédito Rotativa', 'Fondo revolvente para capital de trabajo', 5000000.00, 50000.00, 'Balance 2 años, sujeto a revisión trimestral', 0.30, NOW(), NULL, NULL, 'Sistema', NULL),
('Descuento de Cheques', 'Anticipo de fondos por cheques de terceros', 10000000.00, 100000.00, 'Carpeta crediticia comercial, historial con el banco', 0.20, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Agropecuario', 'Para siembra, cosecha o inversión rural', 15000000.00, 500000.00, 'Título de propiedad rural, plan de explotación', 0.22, NOW(), NULL, NULL, 'Sistema', NULL),
('Leasing de Equipamiento', 'Alquiler con opción a compra de activos fijos', 8000000.00, 100000.00, 'Evaluación de flujo de caja, contrato con proveedor', 0.24, NOW(), NULL, NULL, 'Sistema', NULL),
('Comercio Exterior Pre-financiación', 'Crédito para insumos de exportación', 20000000.00, 1000000.00, 'Contrato de exportación, historial de operaciones', 0.18, NOW(), NULL, NULL, 'Sistema', NULL),
('Cuenta Corriente con Acuerdo', 'Límite de descubierto en cuenta corriente', 2000000.00, 50000.00, 'Promedio de saldos, Score bancario alto', 0.40, NOW(), NULL, NULL, 'Sistema', NULL),
('Factoring sin Recurso', 'Venta de facturas a la entidad', 10000000.00, 500000.00, 'Clientes A+ en cartera, límite por deudor', 0.26, NOW(), NULL, NULL, 'Sistema', NULL),
('Garantía Bancaria', 'Emisión de avales para licitaciones o contratos', 5000000.00, 50000.00, 'Contragarantía (hipoteca/prenda), solidez financiera', 0.15, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Turismo', 'Inversión en hotelería y servicios turísticos', 12000000.00, 500000.00, 'Habilitación municipal, proyección de ocupación', 0.33, NOW(), NULL, NULL, 'Sistema', NULL),
('Crédito Puente Constructor', 'Financiación de etapas de construcción', 50000000.00, 5000000.00, 'Permisos de obra, venta mínima de unidades', 0.19, NOW(), NULL, NULL, 'Sistema', NULL),

-- Bloque 4: Variaciones y Refuerzos (id 31-60)
-- Variaciones de Préstamos Personales (id 31-40)
('Préstamo Express Plus', 'Versión con límite ampliado y plazo mayor', 500000.00, 50000.00, 'Ingreso fijo 1 año, Score > 600', 0.50, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Consolidación Gold', 'Para unificar deudas grandes con mejor tasa', 1200000.00, 200000.00, 'Excelente historial, sin morosidad en 2 años', 0.45, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Auto Clásico', 'Financiación de vehículos de colección', 800000.00, 100000.00, 'Tasación oficial, seguro específico', 0.42, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Estudios Postgrado', 'Crédito a largo plazo para posgrados', 800000.00, 100000.00, 'Aceptación en universidad, codeudor', 0.52, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Viajes Premium', 'Para viajes de lujo o larga estadía', 300000.00, 50000.00, 'Ingresos comprobables > 500k', 0.65, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Renovación Hogar', 'Para refacciones menores y decoración', 250000.00, 10000.00, 'Ingresos fijos, antigüedad 6 meses', 0.68, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Emprendedor', 'Lanzamiento de proyecto inicial', 300000.00, 20000.00, 'Plan de negocio básico, tutoría', 0.78, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Cajas de Ahorro', 'Garantizado por plazos fijos o ahorros', 1000000.00, 100000.00, 'Constitución de garantía líquida del 120%', 0.10, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo de Anticipo de Haberes', 'Adelanto de sueldo automático', 50000.00, 1000.00, 'Convenio de nómina, antigüedad 3 meses', 0.85, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo RSE', 'Para proyectos de impacto social/ambiental', 700000.00, 50000.00, 'Certificación de proyecto, bajo riesgo', 0.40, NOW(), NULL, NULL, 'Sistema', NULL),

-- Variaciones de Hipotecarios/Empresariales (id 41-50)
('Hipotecario Cliente Preferencial', 'Tasa reducida para clientes con historial', 35000000.00, 1000000.00, 'Cliente Platino/VIP, historial 5 años', 0.23, NOW(), NULL, NULL, 'Sistema', NULL),
('Línea de Crédito Pyme Flexible', 'Límite dinámico ajustado al flujo de caja', 7000000.00, 100000.00, 'Flujo de caja positivo, garantía prendaria', 0.28, NOW(), NULL, NULL, 'Sistema', NULL),
('Crédito Prendario Motos', 'Financiación de motos nuevas y usadas', 800000.00, 30000.00, 'Prenda sobre moto, seguro obligatorio', 0.55, NOW(), NULL, NULL, 'Sistema', NULL),
('Fianza de Alquiler Comercial', 'Aval para locales y oficinas', 500000.00, 20000.00, 'Balance 1 año, contrato de alquiler comercial', 0.45, NOW(), NULL, NULL, 'Sistema', NULL),
('Crédito para Exportación Directa', 'Financiación específica para grandes exportadores', 30000000.00, 2000000.00, 'Facturación anual > 50MM, carta de crédito', 0.16, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Capitalización Rural', 'Inversión a largo plazo en tecnología rural', 20000000.00, 1000000.00, 'Proyecto de inversión a 5 años, garantía real', 0.20, NOW(), NULL, NULL, 'Sistema', NULL),
('Hipotecario Segunda Vivienda', 'Para inversión inmobiliaria o casa de veraneo', 15000000.00, 500000.00, 'Propiedad libre de deuda, ingresos dobles', 0.35, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo Refuerzo', 'Segundo crédito para clientes con historial excelente', 100000.00, 5000.00, 'Sin atrasos en el crédito vigente', 0.62, NOW(), NULL, NULL, 'Sistema', NULL),
('Descuento de E-Cheqs', 'Digitalización del descuento de valores', 5000000.00, 50000.00, 'Cuenta comitente activa, firma digital', 0.23, NOW(), NULL, NULL, 'Sistema', NULL),
('Garantía de Cumplimiento', 'Aval para asegurar finalización de obras', 10000000.00, 1000000.00, 'Capacidad de endeudamiento probada', 0.17, NOW(), NULL, NULL, 'Sistema', NULL),

-- Nuevos Productos (id 51-60)
('Microcrédito', 'Préstamo social para emprendedores de bajos ingresos', 50000.00, 1000.00, 'Validación comunitaria/ONG, plan simple', 0.95, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo para Franquicias', 'Financiación de costos iniciales de franquicias', 1000000.00, 100000.00, 'Contrato de franquicia, viabilidad de negocio', 0.40, NOW(), NULL, NULL, 'Sistema', NULL),
('Línea de Comercio Electrónico', 'Capital de trabajo para plataformas online', 2000000.00, 50000.00, 'Historial de ventas online, integración API', 0.38, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo para Honorarios', 'Para profesionales que cobran por honorarios', 400000.00, 20000.00, 'Matrícula profesional, 1 año de ejercicio', 0.55, NOW(), NULL, NULL, 'Sistema', NULL),
('Hipotecario Dólar Link', 'Préstamo en pesos ajustado al tipo de cambio oficial', 20000000.00, 500000.00, 'Ingresos indexados al dólar o altos', 0.20, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo para Tecnología', 'Compra de hardware y software profesional', 600000.00, 30000.00, 'Factura proforma, ingresos estables', 0.50, NOW(), NULL, NULL, 'Sistema', NULL),
('Crédito para Inclusión Financiera', 'Productos con menores requisitos para no bancarizados', 80000.00, 5000.00, 'Verificación de identidad simple, límite inicial bajo', 1.10, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo para Bodas y Eventos', 'Financiación de fiestas y grandes eventos', 500000.00, 50000.00, 'Presupuesto de proveedores, 1 año de antigüedad', 0.60, NOW(), NULL, NULL, 'Sistema', NULL),
('Línea de Inversión Fija', 'Para compra de activos fijos de empresas', 15000000.00, 500000.00, 'Proyecto de inversión detallado, garantía mixta', 0.25, NOW(), NULL, NULL, 'Sistema', NULL),
('Préstamo para Jubilados', 'Crédito con descuento de cuota en el haber', 300000.00, 10000.00, 'Último recibo de haber, sin morosidad previsional', 0.50, NOW(), NULL, NULL, 'Sistema', NULL);