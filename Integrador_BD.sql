USE financiamiento_ra;
CREATE TABLE ´Sucursal´ (
	id_sucursal int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	nombre_sucursal VARCHAR(255),
	localidad VARCHAR(255),
	provincia VARCHAR(255),
	telefono_sucursal VARCHAR(20),
	direccion VARCHAR(255),
	fecha_de_alta TIMESTAMP,
	fecha_de_baja TIMESTAMP,
	fecha_de_modificacion TIMESTAMP,
	creado_por VARCHAR(255),
	modificado_por VARCHAR (255)
)