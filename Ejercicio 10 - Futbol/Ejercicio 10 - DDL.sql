/* DDL */

CREATE DATABASE futbol;
USE futbol;

CREATE TABLE equipos(
	id_equipo int auto_increment,
    nombre varchar(50) not null,
    direccion varchar(50),
    PRIMARY KEY(id_equipo)
);

CREATE TABLE partidos(
	id_partido int auto_increment,
    fecha date,
    direccion varchar(50),
    goles_local int,
    goles_visitante int,
    PRIMARY KEY(id_partido)
);

CREATE TABLE equipos_partidos(
	id_equipo_local int,
    id_equipo_visitante int,
    id_partido int,
    PRIMARY KEY(id_equipo_local, id_equipo_visitante, id_partido),
    FOREIGN KEY(id_equipo_local) REFERENCES equipos (id_equipo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_equipo_visitante) REFERENCES equipos (id_equipo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_partido) REFERENCES partidos (id_partido)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE jugadores(
	dni varchar(9),
    nombre varchar(50),
    apellidos varchar(50),
    nacionalidad varchar(50),
    fecha_nacimiento date,
    dorsal int,
    id_equipo int,
    PRIMARY KEY(dni),
    FOREIGN KEY(id_equipo) REFERENCES equipos (id_equipo)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE entrenadores(
	dni varchar(9),
    nombre varchar(50),
    apellidos varchar(50),
    fecha_nacimiento date,
    id_equipo int,
    PRIMARY KEY(dni),
    FOREIGN KEY(id_equipo) REFERENCES equipos (id_equipo)
    ON DELETE cascade
    ON UPDATE cascade
);