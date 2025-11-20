/* TRABAJO PRACTICO INTEGRADOR
INTEGRANTES:
Bojanovich Hannah
Brycki Selene
Gamarra Kiara
Szevaga Emanuel 
Viana Matias*/
/*CREATE DATABASE financiamiento_ra;*/
USE financiamiento_ra;
/* Creacion de usuarios por nivel administrativo*/
/*Los ejecutivos y jefes pueden hacer todo*/
/*CREATE USER 'admin_ejecutivos'@'%' IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES ON financiamiento_ra.* TO 'admin_ejecutivos'@'%' WITH GRANT OPTION;*/

/*Gerentes o empleados con cargos especiales pueden insertar datos*/
/*CREATE USER 'gerentes_analistas'@'%' IDENTIFIED BY 'Analista123!';
GRANT SELECT, INSERT, UPDATE 
ON financiamiento_ra.* 
TO 'gerentes_analistas'@'%';*/

/*Empleados nuevos o con cargos bajos solo pueden leer*/
/*CREATE USER 'empleados'@'%' IDENTIFIED BY 'Consulta123!';
GRANT SELECT 
ON financiamiento_ra.*/

CREATE TABLE IF NOT EXISTS Sucursal (
    id_sucursal INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_sucursal VARCHAR(255),
    localidad VARCHAR(255),
    provincia VARCHAR(255),
    telefono_sucursal VARCHAR(255),
    direccion VARCHAR(255),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por VARCHAR(255),
    modificado_por VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Empleado (
    id_empleado INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_sucursal INT,
    DNI_empleado VARCHAR(255),
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    cargo VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(255),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por VARCHAR(255),
    modificado_por VARCHAR(255),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE IF NOT EXISTS Producto_campana (
    id_productocampana INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tasa_promocional DECIMAL,
    vigencia DATETIME,
    resultados DECIMAL,
    fecha_inicio TIMESTAMP,
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT
);

CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(255),
    apellido_cliente VARCHAR(255),
    documento VARCHAR(255),
    tipo_de_persona ENUM('juridica', 'fisica'),
    ingreso_declarado DECIMAL,
    domicilio VARCHAR(255),
    email_cliente VARCHAR(255),
    telefono_cliente VARCHAR(255),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT
);

CREATE TABLE IF NOT EXISTS Producto_financiero (
    id_producto_financiero INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_producto_financiero VARCHAR(255),
    descripcion VARCHAR(255),
    limite_max DECIMAL(10,2),
    limite_min DECIMAL(10,2),
    requisitos VARCHAR(255),
    tasa_base DECIMAL,
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT
);

CREATE TABLE IF NOT EXISTS Solicitud (
    id_solicitud INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    monto DECIMAL,
    destino VARCHAR(255),
    fecha_solicitud TIMESTAMP,
    estado BOOLEAN,
    motivo_estado VARCHAR(255),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE IF NOT EXISTS Garante (
    id_garante INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    DNI_garante VARCHAR(255),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    id_solicitud INT,
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud(id_solicitud)
);

CREATE TABLE IF NOT EXISTS Cliente_campana (
    id_clientecampana INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha_ingreso TIMESTAMP,
    cliente_nuevo BOOLEAN,
    fecha_inicio TIMESTAMP,
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    id_productocampana INT,
    FOREIGN KEY (id_productocampana) REFERENCES Producto_campana(id_productocampana)
);

CREATE TABLE IF NOT EXISTS Credito (
    id_credito INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_producto_financiero INT NOT NULL,
    id_solicitud INT NOT NULL,
    id_credito_padre INT,
    monto_otorgado DECIMAL,
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    tasa_aplicada DECIMAL,
    plazo_devolucion INT,
    estado_crediticio VARCHAR(255),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    FOREIGN KEY (id_producto_financiero) REFERENCES Producto_financiero(id_producto_financiero),
    FOREIGN KEY (id_solicitud) REFERENCES Solicitud(id_solicitud),
    FOREIGN KEY (id_credito_padre) REFERENCES Credito(id_credito)
);

CREATE TABLE IF NOT EXISTS Historial_de_tasas (
    id_historial INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tasa DECIMAL(10,2),
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    FOREIGN KEY (id_producto_financiero) REFERENCES Producto_financiero(id_producto_financiero)
);

CREATE TABLE IF NOT EXISTS Cuota (
    id_cuota INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_credito INT NOT NULL,
    numero_cuota INT,
    fecha_de_emision TIMESTAMP,
    fecha_de_vencimiento TIMESTAMP,
    monto_total DECIMAL(10,2),
    estado BOOLEAN,
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    FOREIGN KEY (id_credito) REFERENCES Credito(id_credito)
);

CREATE TABLE IF NOT EXISTS Pago (
    id_pago INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cuota INT NOT NULL,
    fecha_de_pago TIMESTAMP,
    monto_pagado DECIMAL,
    demora INT,
    penalizacion_mora DECIMAL(10,2),
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    FOREIGN KEY (id_cuota) REFERENCES Cuota(id_cuota)
);

CREATE TABLE IF NOT EXISTS Metodo_de_pago (
    id_metodo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    metodo ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    fecha_de_alta TIMESTAMP,
    fecha_de_baja TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por INT,
    modificado_por INT,
    FOREIGN KEY (id_metodo) REFERENCES Metodo_de_pago(id_metodo)
);


