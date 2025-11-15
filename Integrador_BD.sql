USE financiamiento_ra;
CREATE TABLE ´Sucursal´ (
	id_sucursal int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	nombre_sucursal varchar(255),
	localidad varchar(255),
	provincia varchar(255),
	telefono_sucursal varchar(255), 
	direccion varchar(255), 
	fecha_de_alta timestamp, 
	fecha_de_baja timestamp,
	fecha_de_modificacion timestamp,
	creado_por varchar(255), 
	modificado_por varchar (255)
);
CREATE TABLE ´Garante (
	id_garante int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre varchar(255),
	apellido varchar(255),
	DNI_garante varchar(255),
	fecha_de_alta timestamp,
	fecha_de_baja timestamp,
	fecha_de_mdificacion timestamp,
	creado_po varchar(255),
	modificado_por varchar(255),
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud(id_solicitud)
    );
CREATE TABLE ´Solicitud´ (
	id_solicitud int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
	monto decimal,
	destino varchar(255), 
	fecha_solictud timestamp,
	estado boolean,
	motivo_estado varchar(255),
	fecha_de_alta timestamp, 
	fecha_de_baja timestamp,
	fecha_de_modificacion timestamp,
	crado_por varchar(255),
	modificado_por varchar(255)
);
CREATE TABLE ´Cliente´(
	id_cliente int,
	nombre_cliente varchar(255),
	apellido_cliente varchar(255,
	documento varchar(255),  
	tipo_de_persona enum ('juridica7', ''),
	ingreso_declarado decimal,
	domicilio varchar(255),
	email_cliente varchar
	telefono_cliente varchar [ not null ]
	fecha_de_alta timestamp [ not null ]
	fecha_de_baja timestamp [ not null ]
	fecha_de_modificacion timestamp [ not null ]
	creado_por varchar [ not null ]
	modificado_por varchar [ not null ]
}

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
`id_credito_padre` int not null,

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