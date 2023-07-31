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

/* DML */

INSERT INTO equipos (nombre, direccion) values 
('Barcelona', 'C/ Arístides Maillol, 12, 08028 Barcelona'),
('Madrid', 'Av. de Concha Espina, 1, 28036 Madrid'),
('Villareal', 'Carrer Blasco Ibáñez, 2, 12540 Vila-real, Castelló'),
('Zaragoza', 'P.º de Isabel la Católica, 4, 50009 Zaragoza'),
('Valencia', 'Av. de Suècia, s/n, 46010 València, Valencia');

INSERT INTO partidos (fecha, direccion, goles_local, goles_visitante) values 
('2023-06-25', 'C/ Arístides Maillol, 12, 08028 Barcelona', 3, 2),
('2023-06-12', 'P.º de Isabel la Católica, 4, 50009 Zaragoza', 1, 4),
('2023-07-07', 'Av. de Suècia, s/n, 46010 València, Valencia', 3, 0),
('2023-06-09', 'Av. de Concha Espina, 1, 28036 Madrid', 2, 2),
('2023-04-23', 'Carrer Blasco Ibáñez, 2, 12540 Vila-real, Castelló', 2, 1);

INSERT INTO equipos_partidos (id_equipo_local, id_equipo_visitante, id_partido) values 
(1, 2, 1),
(4, 5, 2),
(5, 1, 3),
(2, 3, 4),
(3, 4, 5);

INSERT INTO jugadores (dni, nombre, apellidos, nacionalidad, fecha_nacimiento, dorsal, id_equipo) values 
('31128312E', 'Cristiano', 'Ronaldo', 'Portugués', '2000-02-17', 2, 1),
('48821212X', 'Carlos', 'Pérez', 'Español', '1996-12-20', 10, 2),
('82912311B', 'Andrea', 'Casari', 'Italiano', '1993-08-12', 11, 3),
('32219212H', 'Aimil', 'Fyers', 'Canadiense', '1999-01-02', 4, 4),
('72812312E', 'Fernando', 'Pujals', 'Español', '2001-10-21', 9, 5);

INSERT INTO entrenadores (dni, nombre, apellidos, fecha_nacimiento, id_equipo) values 
('39928412X', 'Ivie', 'Amphlett', '1982-03-10', 1),
('81123192B', 'Hollis', 'Kencott', '1968-01-21', 2),
('27182321V', 'Gerhardine', 'Kunneke', '1970-05-30', 3),
('38812312H', 'Aldus', 'McGinlay', '1972-11-04', 4),
('28819212X', 'Galvin', 'Aslet', '1966-12-07', 5);

UPDATE entrenadores SET nombre='Pep'
WHERE dni='39928412X';

DELETE FROM jugadores
WHERE nombre='Aimil';

SELECT equipos.nombre, partidos.fecha, partidos.goles_local, partidos.goles_visitante
FROM equipos
INNER JOIN equipos_partidos
ON equipos.id_equipo = equipos_partidos.id_equipo_local
INNER JOIN partidos
ON equipos_partidos.id_partido = partidos.id_partido;