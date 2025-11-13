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
)