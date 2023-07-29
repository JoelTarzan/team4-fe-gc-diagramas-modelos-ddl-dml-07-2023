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
	codigo_postal varchar(5),
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
    codigo_postal varchar(5),
    PRIMARY KEY(id_localidad),
    FOREIGN KEY(codigo_postal) REFERENCES provincias (codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE capitales_provincias(
	codigo_postal varchar(5),
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
    codigo_postal varchar(5),
    PRIMARY KEY(id_comunidad_autonoma, codigo_postal),
    FOREIGN KEY(id_comunidad_autonoma) REFERENCES comunidades_autonomas (id_comunidad_autonoma)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_postal) REFERENCES provincias (codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);

/* DML */

INSERT INTO comunidades_autonomas (nombre, poblacion, superficie) values 
('Cataluña', 7899056, 32108),
('Andalucía', 850018, 87599),
('Comunidad de Madrid', 6750336, 8028),
('Canarias', 2177701, 7447),
('País Vasco', 2208174, 7234);

INSERT INTO provincias (codigo_postal, nombre, poblacion, superficie, id_comunidad_autonoma) values 
('08001', 'Barcelona', 5658399, 7728, 1),
('41001', 'Sevilla', 1962999, 14036, 2),
('29001', 'Málaga', 1722388, 7306, 2),
('28001', 'Madrid', 6825005, 8028, 3),
('01006', 'Álava', 331103, 3037, 5);

INSERT INTO localidades (nombre, poblacion, codigo_postal) values 
('Barcelona', 1656725, '08001'),
('Sevilla', 688711, '41001'),
('Getafe', 180747, '28001'),
('Madrid', 3223162, '28001'),
('Álava', 327682, '01006');

INSERT INTO capitales_provincias (codigo_postal, id_localidad) values 
('08001', 1),
('41001', 2),
('28001', 4);

INSERT INTO capitales_comunidades_autonomas (id_comunidad_autonoma, codigo_postal) values 
(1, '08001'),
(2, '41001'),
(3, '28001');

UPDATE localidades SET nombre='Málaga'
WHERE nombre='Sevilla';

DELETE FROM comunidades_autonomas
WHERE nombre='Canarias';

SELECT provincias.nombre AS 'Provincia', comunidades_autonomas.nombre AS 'CCAA'
FROM provincias
INNER JOIN comunidades_autonomas
ON  comunidades_autonomas.id_comunidad_autonoma = provincias.id_comunidad_autonoma;