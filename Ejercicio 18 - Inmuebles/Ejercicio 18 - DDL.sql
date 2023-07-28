/* DDL */

CREATE DATABASE inmuebles;
USE inmuebles;

CREATE TABLE personas(
	codigo_personal int auto_increment,
    dni varchar(9) not null,
    telefono_fijo varchar(15),
    telefono_movil varchar(15),
    nombre varchar(50),
    apellidos varchar(50),
    es_trabajador boolean,
    PRIMARY KEY(codigo_personal)
);

CREATE TABLE negociaciones(
	codigo_personal int,
    codigo_personal_dos int,
    PRIMARY KEY(codigo_personal, codigo_personal_dos),
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_personal_dos) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE inmuebles(
	id_inmueble int auto_increment,
    metros float,
    descripcion text,
    direccion varchar(50),
    PRIMARY KEY(id_inmueble)
);

CREATE TABLE locales(
	id_inmueble int,
    servicio varchar(50),
    uso varchar(50),
    PRIMARY KEY(id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pisos(
	codigo_piso int auto_increment,
	id_inmueble int,
    PRIMARY KEY(codigo_piso, id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE garajes(
	id_inmueble int,
    num_garaje int,
    planta varchar(30),
    codigo_piso int null,
    PRIMARY KEY(id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_piso) REFERENCES pisos (codigo_piso)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE compras(
	codigo_compra int auto_increment,
	fecha date,
    valor float,
    id_inmueble int,
    PRIMARY KEY(codigo_compra),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE personas_compras(
	codigo_personal int,
	codigo_compra int,
    PRIMARY KEY(codigo_personal, codigo_compra),
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_compra) REFERENCES compras (codigo_compra)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE alquileres(
	id_alquiler int auto_increment,
	num_alquiler int,
    id_inmueble int,
    codigo_personal int,
    PRIMARY KEY(id_alquiler),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE gestiones_alquileres(
	codigo_personal int,
	id_alquiler int,
    PRIMARY KEY(codigo_personal, id_alquiler),
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_alquiler) REFERENCES alquileres (id_alquiler)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pagos_alquileres(
	id_pago int auto_increment,
	mes enum('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'),
    ano year,
    valor float,
    PRIMARY KEY(id_pago)
);

CREATE TABLE alquileres_pagos_alquileres(
	id_alquiler int,
    id_pago int,
    PRIMARY KEY(id_alquiler, id_pago),
    FOREIGN KEY(id_alquiler) REFERENCES alquileres (id_alquiler)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_pago) REFERENCES pagos_alquileres (id_pago)
    ON DELETE cascade
    ON UPDATE cascade
);