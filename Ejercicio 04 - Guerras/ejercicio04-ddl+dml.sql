/* ddl */

CREATE database guerras;
USE guerras;

CREATE TABLE guerras(
	id_guerra int auto_increment,
    ano_inicio year,
    ano_fin year,
    nombre varchar(30),
    PRIMARY KEY(id_guerra)
);

CREATE TABLE bandos(
	id_bando int auto_increment, 
    nombre varchar(30),
    PRIMARY KEY(id_bando)
);

CREATE TABLE guerras_bandos(
	id_guerra int,
    id_bando int,
	FOREIGN KEY(id_guerra) REFERENCES guerras (id_guerra)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_bando) REFERENCES bandos (id_bando)
    ON DELETE cascade
    ON UPDATE cascade,
    ganar boolean,
    PRIMARY KEY(id_guerra, id_bando)
);

CREATE TABLE paises(
	id_pais int auto_increment,
    nombre varchar(30),
    PRIMARY KEY(id_pais)
);

CREATE TABLE bandos_paises(
	id_bando int,
    id_pais int,
    abandono boolean,
	FOREIGN KEY(id_bando) REFERENCES bandos (id_bando)
    ON DELETE cascade
    ON UPDATE cascade,
	FOREIGN KEY(id_pais) REFERENCES paises (id_pais)
    ON DELETE cascade
    ON UPDATE cascade,
    PRIMARY KEY(id_bando, id_pais)
);

CREATE TABLE periodos_independencia(
	id_periodo int auto_increment,
    id_pais int,
    inicio date,
    fin date,
    FOREIGN KEY(id_pais) REFERENCES paises (id_pais)
    ON DELETE cascade
    ON UPDATE cascade,
    PRIMARY KEY(id_periodo, id_pais)
);

/* dml */

DELETE FROM paises;

INSERT INTO paises (nombre) VALUES
("Italia"),
("Japon"),
("Uganada");

INSERT INTO bandos (nombre) VALUES
("Gran bando de bandos"),
("Viva Uganda");

INSERT INTO bandos_paises (id_bando, id_pais) VALUES
(2, 3);

UPDATE paises SET nombre="India"
WHERE nombre="Italia";

DELETE FROM paises
WHERE nombre="Japon";