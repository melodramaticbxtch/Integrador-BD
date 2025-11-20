/*CREACiÓN DE LAS TABLAS*/
CREATE DATABASE financiamiento_kg;
USE financiamiento_kg;

/*USERS*/
/* 1) USUARIO ADMINISTRADOR – acceso total */
CREATE USER IF NOT EXISTS 'admin_finanzas'@'%' IDENTIFIED BY 'Admin123!';
GRANT ALL PRIVILEGES ON financiamiento_kg.* TO 'admin_finanzas'@'%';

/* 2) USUARIO EDITOR – solo INSERT, UPDATE y SELECT (sin DROP, DELETE ni CREATE) */
CREATE USER IF NOT EXISTS 'editor_finanzas'@'%' IDENTIFIED BY 'Editor123!';
GRANT SELECT, INSERT, UPDATE ON financiamiento_kg.* TO 'editor_finanzas'@'%';

/* 3) USUARIO LECTOR – solo lectura */
CREATE USER IF NOT EXISTS 'lector_finanzas'@'%' IDENTIFIED BY 'Lector123!';
GRANT SELECT ON financiamiento_kg.* TO 'lector_finanzas'@'%';

/* Aplicar cambios */
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS sucursal
(
    id_sucursal           INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_sucursal       VARCHAR(255),
    localidad             VARCHAR(255),
    provincia             VARCHAR(255),
    telefono_sucursal     VARCHAR(255),
    direccion             VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS empleado
(
    id_empleado           INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_sucursal           INT,
    dni_empleado          VARCHAR(255),
    nombre_empleado       VARCHAR(255),
    apellido_empleado     VARCHAR(255),
    cargo                 VARCHAR(255),
    email_empleado        VARCHAR(255),
    telefono_empleado     VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal)
);

CREATE TABLE IF NOT EXISTS producto_campana
(
    id_producto_campana   INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tasa_promocional      DECIMAL,
    vigencia              DATETIME,
    resultado             DECIMAL,
    fecha_inicio          TIMESTAMP,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT
);

CREATE TABLE IF NOT EXISTS cliente
(
    id_cliente            INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_cliente        VARCHAR(255),
    apellido_cliente      VARCHAR(255),
    dni_cliente           VARCHAR(255),
    tipo_de_persona       ENUM ('juridica', 'fisica'),
    ingreso_declarado     DECIMAL,
    domicilio             VARCHAR(255),
    email_cliente         VARCHAR(255),
    telefono_cliente      VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT
);

CREATE TABLE IF NOT EXISTS producto_financiero
(
    id_producto_financiero     INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_producto_financiero VARCHAR(255),
    descripcion                VARCHAR(255),
    limite_max                 DECIMAL(10, 2),
    limite_min                 DECIMAL(10, 2),
    requisito                  VARCHAR(255),
    tasa_base                  DECIMAL,
    fecha_de_alta              TIMESTAMP,
    fecha_de_baja              TIMESTAMP,
    fecha_de_modificacion      TIMESTAMP,
    creado_por                 INT,
    modificado_por             INT
);

CREATE TABLE IF NOT EXISTS solicitud
(
    id_solicitud          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    monto                 DECIMAL,
    destino               VARCHAR(255),
    fecha_solicitud       TIMESTAMP,
    estado                BOOLEAN,
    motivo_estado         VARCHAR(255),
    puntaje_riesgo        INT,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT,
    id_cliente            INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE IF NOT EXISTS garante
(
    id_garante            INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_garante        VARCHAR(255),
    apellido_garante      VARCHAR(255),
    dni_garante           VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT,
    id_solicitud          INT,
    FOREIGN KEY (id_solicitud) REFERENCES solicitud (id_solicitud)
);

CREATE TABLE IF NOT EXISTS cliente_campana
(
    id_cliente_campana    INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha_ingreso         TIMESTAMP,
    cliente_nuevo         BOOLEAN,
    fecha_inicio          TIMESTAMP,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT,
    id_producto_campana   INT,
    FOREIGN KEY (id_producto_campana) REFERENCES producto_campana (id_producto_campana)
);

CREATE TABLE IF NOT EXISTS credito
(
    id_credito             INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_producto_financiero INT             NOT NULL,
    id_solicitud           INT             NOT NULL,
    id_credito_padre       INT,
    monto_otorgado         DECIMAL,
    fecha_inicio           TIMESTAMP,
    fecha_fin              TIMESTAMP,
    tasa_aplicada          DECIMAL,
    plazo_devolucion       INT,
    estado_crediticio      VARCHAR(255),
    fecha_de_alta          TIMESTAMP,
    fecha_de_baja          TIMESTAMP,
    fecha_de_modificacion  TIMESTAMP,
    creado_por             INT,
    modificado_por         INT,
    FOREIGN KEY (id_producto_financiero) REFERENCES producto_financiero (id_producto_financiero),
    FOREIGN KEY (id_solicitud) REFERENCES solicitud (id_solicitud),
    FOREIGN KEY (id_credito_padre) REFERENCES credito (id_credito)
);

CREATE TABLE IF NOT EXISTS historial_de_tasas
(
    id_historial           INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_producto_financiero INT,
    tasa                   DECIMAL(10, 2),
    fecha_inicio           TIMESTAMP,
    fecha_fin              TIMESTAMP,
    fecha_de_alta          TIMESTAMP,
    fecha_de_baja          TIMESTAMP,
    fecha_de_modificacion  TIMESTAMP,
    creado_por             INT,
    modificado_por         INT,
    FOREIGN KEY (id_producto_financiero) REFERENCES producto_financiero (id_producto_financiero)
);

CREATE TABLE IF NOT EXISTS cuota
(
    id_cuota              INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_credito            INT             NOT NULL,
    numero_cuota          INT,
    fecha_de_emision      TIMESTAMP,
    fecha_de_vencimiento  TIMESTAMP,
    monto_total           DECIMAL(10, 2),
    estado                BOOLEAN,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT,
    FOREIGN KEY (id_credito) REFERENCES credito (id_credito)
);

CREATE TABLE IF NOT EXISTS pago
(
    id_pago               INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cuota              INT             NOT NULL,
    fecha_de_pago         TIMESTAMP,
    monto_pagado          DECIMAL,
    demora                INT,
    penalizacion_mora     DECIMAL(10, 2),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT,
    FOREIGN KEY (id_cuota) REFERENCES cuota (id_cuota)
);

CREATE TABLE IF NOT EXISTS metodo_de_pago
(
    id_metodo             INT PRIMARY KEY                               NOT NULL AUTO_INCREMENT,
    id_pago               INT,
    metodo                ENUM ('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            INT,
    modificado_por        INT,
    FOREIGN KEY (id_pago) REFERENCES pago (id_pago)
);

