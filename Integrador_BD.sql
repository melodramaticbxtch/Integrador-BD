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
`modificado_por` varchar(255)
);