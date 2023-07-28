drop database academia_clases;

CREATE database academia_clases;
USE academia_clases;

CREATE TABLE empresas(
	cif varchar(12),
    nombre varchar(30) not null,
    direccion varchar(50) ,
    telefono varchar(20),
    PRIMARY KEY(cif)
);

CREATE TABLE alumnos(
	dni varchar(11),
    nombre varchar(30),
    direccion varchar(50),
    telefono varchar(20),
    edad int,
    cif_empresa varchar(12),
    PRIMARY KEY(dni),
    FOREIGN KEY(cif_empresa) REFERENCES empresas (cif)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE cursos(
	codigo_curso int auto_increment, 
    titulo varchar(50),
    duracion int,
    programa varchar(50),
    PRIMARY KEY (codigo_curso)
);

CREATE TABLE notas (
	dni varchar(11),
    codigo_curso int,
    nota float,
    PRIMARY KEY (dni, codigo_curso),
    FOREIGN KEY (dni) REFERENCES alumnos (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    /*PRIMARY KEY (dcodigo_curso),*/
    FOREIGN KEY (codigo_curso) REFERENCES cursos (codigo_curso)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE profesores (
	dni varchar(11),
    nombre varchar(50),
    apellidos varchar(50),
    direccion varchar(50),
    telefono varchar(20),
    PRIMARY KEY(dni)
);

CREATE TABLE impartidos (
	num_curso int auto_increment,
    fecha_inicio date,
    fecha_fin date,
    codigo_curso int,
    dni_profesor varchar(11),
    primary key (num_curso),
    foreign key (codigo_curso) references  cursos (codigo_curso)
    on update cascade
    on delete cascade,
    foreign key (dni_profesor) references  profesores (dni)
    on update cascade
    on delete cascade
);
    