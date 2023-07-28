/* DDL */

CREATE DATABASE organigrama;
USE organigrama;

CREATE TABLE departamentos(
	id_departamento int auto_increment,
    nombre varchar(50) not null,
    PRIMARY KEY(id_departamento)
);

CREATE TABLE empleados(
	codigo_empleado int auto_increment,
    dni varchar(9) not null,
    seguridad_social int,
    nombre varchar(50) not null,
    apellido varchar(50),
    direccion varchar(50),
    telefono int,
    id_departamento int,
    codigo_coordinador int,
    PRIMARY KEY(codigo_empleado),
    FOREIGN KEY(id_departamento) REFERENCES departamentos (id_departamento)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_coordinador) REFERENCES empleados (codigo_empleado)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE coordinadores(
	codigo_empleado int,
    id_departamento int,
    PRIMARY KEY(codigo_empleado, id_departamento),
    FOREIGN KEY(codigo_empleado) REFERENCES empleados (codigo_empleado)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_departamento) REFERENCES departamentos (id_departamento)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE categorias(
	id_categoria int auto_increment,
    nombre varchar(50) not null,
    fecha_inicio date,
    fecha_final date,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE contratos(
	id_contrato int auto_increment,
    fecha_inicio date,
    fecha_final date,
    id_categoria int,
    codigo_empleado int,
    PRIMARY KEY(id_contrato),
    FOREIGN KEY(id_categoria) REFERENCES categorias (id_categoria)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_empleado) REFERENCES empleados (codigo_empleado)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE nominas(
	id_nomina int auto_increment,
    fecha date,
    salario float,
    id_contrato int,
    PRIMARY KEY(id_nomina),
    FOREIGN KEY(id_contrato) REFERENCES contratos (id_contrato)
    ON DELETE cascade
    ON UPDATE cascade
);