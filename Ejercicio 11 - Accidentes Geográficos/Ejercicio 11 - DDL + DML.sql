/* DDL */

CREATE DATABASE accidentes_geograficos;
USE accidentes_geograficos;

CREATE TABLE paises(
	id_pais int auto_increment,
    nombre varchar(50) not null,
    extension float,
    poblacion int,
    PRIMARY KEY(id_pais)
);

CREATE TABLE lagos(
	id_lago int auto_increment,
    nombre varchar(50) not null,
    posicion point, 
    extension float,
    PRIMARY KEY(id_lago)
);

CREATE TABLE montanas(
	id_montana int auto_increment,
    nombre varchar(50) not null,
    posicion point,
    altura float,
    PRIMARY KEY(id_montana)
);

CREATE TABLE rios(
	id_rio int auto_increment,
    nombre varchar(50) not null,
    posicion point,
    longitud float,
    PRIMARY KEY(id_rio)
);

CREATE TABLE paises_lagos(
	id_pais int,
    id_lago int,
    PRIMARY KEY(id_pais, id_lago),
    FOREIGN KEY(id_pais) REFERENCES paises (id_pais)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_lago) REFERENCES lagos (id_lago)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE paises_montanas(
	id_pais int,
    id_montana int,
    PRIMARY KEY(id_pais, id_montana),
    FOREIGN KEY(id_pais) REFERENCES paises (id_pais)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_montana) REFERENCES montanas (id_montana)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE paises_rios(
	id_pais int,
    id_rio int,
    PRIMARY KEY(id_pais, id_rio),
    FOREIGN KEY(id_pais) REFERENCES paises (id_pais)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_rio) REFERENCES rios (id_rio)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE localidades(
	id_localidad int auto_increment,
    nombre varchar(50),
    id_pais int,
    PRIMARY KEY(id_localidad),
    FOREIGN KEY(id_pais) REFERENCES paises (id_pais)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE localidades_rios(
	id_localidad int,
    id_rio int,
    PRIMARY KEY(id_localidad, id_rio),
    FOREIGN KEY(id_localidad) REFERENCES localidades (id_localidad)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_rio) REFERENCES rios (id_rio)
    ON DELETE cascade
    ON UPDATE cascade
);

/* DML */

DELETE FROM paises;

INSERT INTO paises (nombre, extension, poblacion) VALUES
('Espana', 1232412, 2300123),
('Italia', 5235423, 3045651),
('Portugal', 233432, 1235234);

INSERT INTO lagos (nombre, posicion, extension) VALUES
('Azul', POINT(12323,-313123123), 123234);

INSERT INTO paises_lagos (id_pais, id_lago) VALUES
(4, 2);

UPDATE paises SET nombre='Francia'
WHERE nombre='Senegal';

DELETE FROM paises
WHERE nombre='Francia';