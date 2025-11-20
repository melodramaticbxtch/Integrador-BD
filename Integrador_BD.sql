USE financiamiento_ra;
CREATE TABLE `Sucursal` (
    `id_sucursal` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    `nombre_sucursal` VARCHAR(255),
    `localidad` VARCHAR(255),
    `provincia` VARCHAR(255),
    `telefono_sucursal` VARCHAR(255), 
    `direccion` VARCHAR(255), 
    `fecha_de_alta` TIMESTAMP, 
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255), 
    `modificado_por` VARCHAR(255)
);
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

CREATE TABLE `Producto_campana` (
    `id_productocampana` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `tasa_promocional` DECIMAL,
    `vigencia` DATETIME,
    `resultados` DECIMAL,
    `fecha_inicio` TIMESTAMP,
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_modificacion` TIMESTAMP,
    `modificado_por` VARCHAR(255),
    `creado_por` VARCHAR(255)
);

CREATE TABLE `Cliente` (
    `id_cliente` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `nombre_cliente` VARCHAR(255),
    `apellido_cliente` VARCHAR(255),
    `documento` VARCHAR(255),  
    `tipo_de_persona` ENUM('juridica', 'fisica'),
    `ingreso_declarado` DECIMAL,
    `domicilio` VARCHAR(255),
    `email_cliente` VARCHAR(255),
    `telefono_cliente` VARCHAR(255),
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255)
);

CREATE TABLE `Producto_financiero` (
    `id_producto_financiero` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `nombre_producto_financiero` VARCHAR(255),
    `descripcion` VARCHAR(255),
    `limite_max` DECIMAL(10,2),
    `limite_min` DECIMAL(10,2),
    `requisitos` VARCHAR(255),
    `tasa_base` DECIMAL,
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255)
);

CREATE TABLE `Solicitud` (
    `id_solicitud` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `monto` DECIMAL,
    `destino` VARCHAR(255), 
    `fecha_solicitud` TIMESTAMP,
    `estado` BOOLEAN,
    `motivo_estado` VARCHAR(255),
    `fecha_de_alta` TIMESTAMP, 
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255)
);

CREATE TABLE `Garante` (
    `id_garante` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255),
    `apellido` VARCHAR(255),
    `DNI_garante` VARCHAR(255),
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255),
    `id_solicitud` INT,
    FOREIGN KEY (`id_solicitud`) REFERENCES `Solicitud`(`id_solicitud`)
);

CREATE TABLE `Cliente_campana` (
    `id_clientecampana` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `fecha_ingreso` TIMESTAMP,
    `cliente_nuevo` BOOLEAN,
    `fecha_inicio` TIMESTAMP,
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_modificacion` TIMESTAMP,
    `modificado_por` VARCHAR(255),
    `creado_por` VARCHAR(255),
    `id_productocampana` INT,
    FOREIGN KEY (`id_productocampana`) REFERENCES `Producto_campana`(`id_productocampana`)
);

CREATE TABLE `Credito` (
    `id_credito` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `id_cliente` INT NOT NULL,
    `id_producto_financiero` INT NOT NULL,
    `id_solicitud` INT NOT NULL,
    `id_credito_padre` INT,
    `monto_otorgado` DECIMAL,
    `fecha_inicio` TIMESTAMP,
    `fecha_fin` TIMESTAMP,
    `tasa_aplicada` DECIMAL,
    `plazo_devolucion` INT,
    `estado_crediticio` VARCHAR(255),
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255),

    FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_cliente`),
    FOREIGN KEY (`id_producto_financiero`) REFERENCES `Producto_financiero`(`id_producto_financiero`),
    FOREIGN KEY (`id_solicitud`) REFERENCES `Solicitud`(`id_solicitud`),
    FOREIGN KEY (`id_credito_padre`) REFERENCES `Credito`(`id_credito`)
);

CREATE TABLE `Historial_de_tasas` (
    `id_historial` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `tasa` DECIMAL(10,2),
    `fecha_inicio` TIMESTAMP,
    `fecha_fin` TIMESTAMP,
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255)
);

CREATE TABLE `Cuota` (
    `id_cuota` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `id_credito` INT NOT NULL,
    `numero_cuota` INT,
    `fecha_de_emision` TIMESTAMP,
    `fecha_de_vencimiento` TIMESTAMP,
    `monto_total` DECIMAL(10,2),
    `estado` BOOLEAN,
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255),
    FOREIGN KEY (`id_credito`) REFERENCES `Credito`(`id_credito`)
);

CREATE TABLE `Pago` (
    `id_pago` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `id_cuota` INT NOT NULL,
    `fecha_de_pago` TIMESTAMP,
    `monto_pagado` DECIMAL,
    `demora` INT,
    `penalizacion_mora` DECIMAL(10,2),
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255),
    FOREIGN KEY (`id_cuota`) REFERENCES `Cuota`(`id_cuota`)
);

CREATE TABLE `Metodo_de_pago` (
    `id_metodo` INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `metodo` ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    `fecha_de_alta` TIMESTAMP,
    `fecha_de_baja` TIMESTAMP,
    `fecha_de_modificacion` TIMESTAMP,
    `creado_por` VARCHAR(255),
    `modificado_por` VARCHAR(255)
);