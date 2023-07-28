/* DDL */

CREATE DATABASE geografia;
USE geografia;

CREATE TABLE comunidades_autonomas(
	id_comunidad_autonoma int auto_increment,
    nombre varchar(50),
    poblacion int,
    superficie float,
    PRIMARY KEY(id_comunidad_autonoma)
);

CREATE TABLE provincias(
	codigo_postal int,
    nombre varchar(50),
    poblacion int,
    superficie float,
    id_comunidad_autonoma int,
    PRIMARY KEY(codigo_postal),
    FOREIGN KEY(id_comunidad_autonoma) REFERENCES comunidades_autonomas (id_comunidad_autonoma)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE localidades(
	id_localidad int auto_increment,
    nombre varchar(50),
    poblacion int,
    codigo_postal int,
    PRIMARY KEY(id_localidad),
    FOREIGN KEY(codigo_postal) REFERENCES provincias (codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE capitales_provincias(
	codigo_postal int,
    id_localidad int,
    PRIMARY KEY(codigo_postal, id_localidad),
    FOREIGN KEY(codigo_postal) REFERENCES provincias (codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_localidad) REFERENCES localidades (id_localidad)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE capitales_comunidades_autonomas(
	id_comunidad_autonoma int,
    codigo_postal int,
    PRIMARY KEY(id_comunidad_autonoma, codigo_postal),
    FOREIGN KEY(id_comunidad_autonoma) REFERENCES comunidades_autonomas (id_comunidad_autonoma)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_postal) REFERENCES provincias (codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);