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

/* ------------------ DML I ----------------- */
/* Insert */
insert into empresas (cif, nombre, direccion, telefono) values ('3a415198', 'Egor', 'Carey', '9997066423');
insert into empresas (cif, nombre, direccion, telefono) values ('a17b8156', 'Aland', 'Forest', '1378898735');
insert into empresas (cif, nombre, direccion, telefono) values ('8da32280', 'Prudy', 'Homewood', '2754845342');
insert into empresas (cif, nombre, direccion, telefono) values ('b601b6ab', 'Bronny', 'Bunker Hill', '9902041024');
insert into empresas (cif, nombre, direccion, telefono) values ('2e7e9c73', 'Lynnette', 'Sutteridge', '8479912824');
insert into empresas (cif, nombre, direccion, telefono) values ('8eaa9da1', 'Odessa', 'Acker', '7915906715');
insert into empresas (cif, nombre, direccion, telefono) values ('4f7ef4fb', 'Tim', 'Lien', '8489451045');
insert into empresas (cif, nombre, direccion, telefono) values ('512747c9', 'Wynne', 'Southridge', '5686688813');

insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('b0f2e351', 'Gwennie', 'Golf View', '2013798129', 19, '3a415198');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('90e8975b', 'Hildagarde', 'Mallory', '3037844085', 25, '8eaa9da1');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('f5cba6c6', 'Caril', 'Victoria', '1226589070', 30, '4f7ef4fb');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('d156a34f', 'Lorrayne', 'Troy', '8772374957', 23, '8da32280');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('1fa1b40c', 'Lavinie', 'Rusk', '1415037560', 20, 'b601b6ab');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('56f43d60', 'Ophelia', 'Dottie', '2229314686', 19, '3a415198');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('9f6c7b84', 'Howey', 'Browning', '9094329559', 31, 'b601b6ab');
insert into alumnos (dni, nombre, direccion, telefono, edad, cif_empresa) values ('495e4548', 'Allina', 'Loftsgordon', '7951919678', 27, '512747c9');
    
insert into cursos (titulo, duracion, programa) values ('Media Manager IV', 618, 'parcial');
insert into cursos (titulo, duracion, programa) values ('Computer Systems Analyst III', 1193, 'completo');
insert into cursos (titulo, duracion, programa) values ('Mechanical Systems Engineer', 886, 'completo');
insert into cursos (titulo, duracion, programa) values ('Accountant IV', 622, 'parcial');
insert into cursos (titulo, duracion, programa) values ('GIS Technical Architect', 973, 'completo');
insert into cursos (titulo, duracion, programa) values ('Chemical Engineer', 1331, 'completo');
insert into cursos (titulo, duracion, programa) values ('Systems Administrator I', 1416, 'completo');
insert into cursos (titulo, duracion, programa) values ('Nurse', 576, 'parcial');

insert into notas (dni, codigo_curso, nota) values ('b0f2e351', 2, 7.4);
insert into notas (dni, codigo_curso, nota) values ('90e8975b', 1, 7.5);
insert into notas (dni, codigo_curso, nota) values ('f5cba6c6', 3, 6.6);
insert into notas (dni, codigo_curso, nota) values ('d156a34f', 5, 1.7);
insert into notas (dni, codigo_curso, nota) values ('1fa1b40c', 4, 1.1);
insert into notas (dni, codigo_curso, nota) values ('56f43d60', 7, 6.8);
insert into notas (dni, codigo_curso, nota) values ('9f6c7b84', 6, 7.5);
insert into notas (dni, codigo_curso, nota) values ('495e4548', 8, 6.5);    

insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('6c92de32', 'Karlan', 'Gotch', 'Doe Crossing', '3989282665');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('5cce8dab', 'Cornelle', 'Dinwoodie', 'Twin Pines', '6529064264');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('b115b825', 'Shana', 'Baggarley', 'Jenifer', '5091958883');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('722175de', 'Wye', 'Sides', 'Fisk', '1586146418');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('c8dbe043', 'Noby', 'Ewins', 'Summerview', '3956876690');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('638c49e4', 'Hillard', 'Coulter', 'La Follette', '7652294574');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('af59364b', 'Sibeal', 'Choppen', 'Forest Run', '2573690929');
insert into profesores (dni, nombre, apellidos, direccion, telefono) values ('3b5fc1e7', 'Andrea', 'Dehn', 'Paget', '1639825513');

insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2023-04-27', '2022-08-28', '1', '6c92de32');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2022-12-28', '2023-07-18', '2', '5cce8dab');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2023-01-21', '2023-06-25', '3', 'b115b825');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2022-11-12', '2022-08-20', '4', '722175de');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2022-12-13', '2022-11-04', '5', 'c8dbe043');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2023-05-06', '2022-08-26', '6', '638c49e4');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2022-10-17', '2023-01-18', '7', 'af59364b');
insert into impartidos (fecha_inicio, fecha_fin, codigo_curso, dni_profesor) values ('2022-12-24', '2022-08-17', '8', '3b5fc1e7');

/* UPDATE  */
UPDATE alumnos set nombre = 'Gerard' where dni='1fa1b40c';
UPDATE alumnos set nombre = 'Marco' where dni='9f6c7b84';
UPDATE alumnos set nombre = 'Joel' where dni='b0f2e351';

UPDATE profesores set nombre = 'Jose', telefono = 610998822 where dni='722175de';

/* Modifica la nota del alumno Gerard mediante un Join ya que desde la tabla notas no se sabe el nombre*/
UPDATE notas join alumnos on notas.dni = alumnos.dni set nota = 10 where alumnos.nombre = 'Gerard';

/* Delete */
delete from profesores where nombre = 'Sibeal';
delete from impartidos limit 1;