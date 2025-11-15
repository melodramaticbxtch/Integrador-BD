USE financiamiento_ra;
CREATE TABLE sucursal
(
    id_sucursal           INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
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

CREATE TABLE garante
(
    id_garante            INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre                VARCHAR(255),
    apellido              VARCHAR(255),
    dni_garante           VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255),
    id_solicitud          INT,
    FOREIGN KEY (id_solicitud) REFERENCES solicitud (id_solicitud)
);

CREATE TABLE solicitud
(
    id_solicitud          INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    monto                 DECIMAL,
    destino               VARCHAR(255),
    fecha_solicitud       TIMESTAMP,
    estado                BOOLEAN,
    motivo_estado         VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255)
);

CREATE TABLE cliente
(
    id_cliente            INT UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_cliente        VARCHAR(255),
    apellido_cliente      VARCHAR(255),
    documento             VARCHAR(255),
    tipo_de_persona       ENUM ('juridica', 'fisica'),
    ingreso_declarado     DECIMAL,
    domicilio             VARCHAR(255),
    email_cliente         VARCHAR(255),
    telefono_cliente      VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255)
);

CREATE TABLE producto_financiero
(
    id_producto_financiero     INTEGER UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_producto_financiero VARCHAR(255),
    descripcion                VARCHAR(255),
    limite_max                 DECIMAL(10, 2),
    limite_min                 DECIMAL(10, 2),
    requisitos                 VARCHAR(255),
    tasa_base                  DECIMAL,
    fecha_de_alta              TIMESTAMP,
    fecha_de_baja              TIMESTAMP,
    fecha_de_modificacion      TIMESTAMP,
    creado_por                 VARCHAR(255),
    modificado_por             VARCHAR(255)
);

CREATE TABLE credito
(
    id_credito            INTEGER UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente            INT                        NOT NULL,
    id_producto           INT                        NOT NULL,
    id_solicitud          INT                        NOT NULL,

    -- Clave foránea autorreferenciada (crédito padre)
    id_credito_padre      INT                        NOT NULL,
    monto_otorgado        DECIMAL,
    fecha_inicio          TIMESTAMP,
    fecha_fin             TIMESTAMP,
    tasa_aplicada         DECIMAL,
    plazo_devolucion      INT,
    estado_crediticio     VARCHAR(255),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_producto) REFERENCES producto (id_producto),
    FOREIGN KEY (id_solicitud) REFERENCES solicitud (id_solicitud),
    FOREIGN KEY (id_credito_padre) REFERENCES credito (id_credito)
);

CREATE TABLE historial_de_tasas
(
    id_historial          INTEGER UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tasa                  DECIMAL(10, 2),
    fecha_inicio          TIMESTAMP,
    fecha_fin             TIMESTAMP,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255)
);

CREATE TABLE cuota
(
    id_cuota              INTEGER UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_credito            INT                        NOT NULL,
    numero_cuota          INT,
    fecha_de_emision      TIMESTAMP,
    fecha_de_vencimiento  TIMESTAMP,
    monto_total           DECIMAL(10, 2),
    estado                BOOLEAN,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255),
    FOREIGN KEY (id_credito) REFERENCES credito (id_credito)
);

CREATE TABLE pago
(
    id_pago               INTEGER UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cuota              INT                        NOT NULL,
    fecha_de_pago         TIMESTAMP,
    monto_pagado          DECIMAL,
    demora                INT,
    penalizacion_mora     DECIMAL(10, 2),
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255),
    FOREIGN KEY (id_cuota) REFERENCES cuota (id_cuota)
);

CREATE TABLE metodo_de_pago
(
    id_metodo             INTEGER UNIQUE PRIMARY KEY                    NOT NULL AUTO_INCREMENT,
    metodo                ENUM ('Efectivo', 'Trajeta', 'Transferencia') NOT NULL,
    fecha_de_alta         TIMESTAMP,
    fecha_de_baja         TIMESTAMP,
    fecha_de_modificacion TIMESTAMP,
    creado_por            VARCHAR(255),
    modificado_por        VARCHAR(255)
);