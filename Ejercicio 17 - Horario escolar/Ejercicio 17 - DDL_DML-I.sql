DROP database horario_escolar;

create database horario_escolar;
use horario_escolar;

create table horarios(
	id_horario int auto_increment, 
    hora enum ('primera', 'segunda', 'tercera', 'cuarta', 'quinta', 'sexta') not null, 
    dia_semana enum ('lunes', 'martes', 'miércoles', 'jueves', 'viernes') not null,
    primary key (id_horario)
);
create table aulas(
	codigo_aula int auto_increment, 
    nombre varchar (50), 
    numero_aula int not null, 
    metros int,
    primary key (codigo_aula)
);
create table asignaturas(
	codigo_asignatura int auto_increment, 
    nombre varchar (50) not null, 
    codigo_europeo int,
    primary key (codigo_asignatura) 
);
create table horarios_aula_asignatura(
	id_horario int, 
    codigo_aula int, 
    codigo_asignatura int,
    primary key (id_horario, codigo_aula, codigo_asignatura),
    foreign key (id_horario) references horarios (id_horario)
		on delete cascade
        on update cascade,
	foreign key (codigo_aula) references aulas (codigo_aula)
		on delete cascade
        on update cascade,
	foreign key (codigo_asignatura) references asignaturas (codigo_asignatura)
		on delete cascade
        on update cascade
);
create table aprobado(
	codigo_asignatura int, 
    codigo_asignatura_dos int,
    primary key (codigo_asignatura, codigo_asignatura_dos),
    foreign key (codigo_asignatura) references asignaturas (codigo_asignatura)
		on delete cascade
        on update cascade,
	foreign key (codigo_asignatura_dos) references asignaturas (codigo_asignatura)
		on delete cascade
        on update cascade
);
create table ciclos(
	codigo_ciclo int auto_increment, 
    nombre varchar (50) not null, 
    grado varchar (50) not null,
    primary key (codigo_ciclo)
);
create table ciclo_asignatura(
	codigo_ciclo int, 
    codigo_asignatura int,
    primary key (codigo_ciclo, codigo_asignatura),
    foreign key (codigo_asignatura) references asignaturas (codigo_asignatura)
		on delete cascade
        on update cascade,
	foreign key (codigo_ciclo) references ciclos (codigo_ciclo)
		on delete cascade
        on update cascade
);
create table profesores(
	codigo_profesor int auto_increment, 
    dni varchar (13) not null, 
    nombre varchar (50), 
    direccion varchar (50), 
    telefono varchar (20), 
    email varchar  (50), 
    num_seg_social int, 
    tutor_antiguedad int, 
    codigo_ciclo int,
	UNIQUE (dni),
    primary key (codigo_profesor),
    foreign key (codigo_ciclo) references ciclos (codigo_ciclo)
		on delete cascade
        on update cascade
);
create table profesor_asignatura(
	codigo_profesor int, 
    codigo_asignatura int, 
    impartir_antiguedad int, 
    ano_inicio year not null, 
    ano_fin year,
    primary key (codigo_profesor, codigo_asignatura),
    foreign key (codigo_asignatura) references asignaturas (codigo_asignatura)
		on delete cascade
        on update cascade,
	foreign key (codigo_profesor) references profesores (codigo_profesor)
		on delete cascade
        on update cascade
);

/* ---------------------- DML I -------------------------- */
INSERT INTO horarios (hora, dia_semana) VALUES
    ('primera', 'lunes'),
    ('segunda', 'martes'),
    ('tercera', 'miércoles'),
    ('cuarta', 'jueves'),
    ('quinta', 'viernes'),
    ('sexta', 'lunes'),
    ('primera', 'martes'),
    ('segunda', 'miércoles'),
    ('tercera', 'jueves'),
    ('cuarta', 'viernes');
    
INSERT INTO aulas (nombre, numero_aula, metros) VALUES
    ('Aula 101', 101, 50),
    ('Aula 102', 102, 45),
    ('Aula 103', 103, 55),
    ('Aula 104', 104, 60),
    ('Aula 201', 201, 40),
    ('Aula 202', 202, 30),
    ('Aula 203', 203, 35),
    ('Aula 204', 204, 50),
    ('Aula 301', 301, 45),
    ('Aula 302', 302, 40);
    
INSERT INTO asignaturas (nombre, codigo_europeo) VALUES
    ('Matemáticas', 101),
    ('Física', 102),
    ('Química', 103),
    ('Biología', 104),
    ('Historia', 105),
    ('Literatura', 106),
    ('Geografía', 107),
    ('Inglés', 108),
    ('Programación', 109),
    ('Economía', 110);
    
INSERT INTO horarios_aula_asignatura (id_horario, codigo_aula, codigo_asignatura) VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 1, 5),
    (6, 2, 6),
    (3, 3, 7),
    (4, 4, 8),
    (5, 1, 9),
    (6, 2, 10);
    
INSERT INTO aprobado (codigo_asignatura, codigo_asignatura_dos) VALUES
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8),
    (8, 9),
    (9, 10),
    (10, 1);
    
INSERT INTO ciclos (nombre, grado) VALUES
    ('Ciclo 1', 'Grado 1'),
    ('Ciclo 2', 'Grado 2'),
    ('Ciclo 3', 'Grado 3'),
    ('Ciclo 4', 'Grado 4'),
    ('Ciclo 5', 'Grado 5'),
    ('Ciclo 6', 'Grado 6'),
    ('Ciclo 7', 'Grado 7'),
    ('Ciclo 8', 'Grado 8'),
    ('Ciclo 9', 'Grado 9'),
    ('Ciclo 10', 'Grado 10');
    
INSERT INTO ciclo_asignatura (codigo_ciclo, codigo_asignatura) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
INSERT INTO profesores (dni, nombre, direccion, telefono, email, num_seg_social, tutor_antiguedad, codigo_ciclo) VALUES
    ('12345678X', 'Francisco Pérez', 'Calle 123', '123456789', 'juan@example.com', 123456, 5, 1),
    ('23456789Y', 'María López', 'Avenida 456', '987654321', 'maria@example.com', 987654, 3, 2),
    ('34567890Z', 'Jose Roriz', 'Plaza 789', '567890123', 'carlos@example.com', 567890, 2, 3),
    ('45678901A', 'Ana Martínez', 'Calle 890', '654321987', 'ana@example.com', 654321, 8, 4),
    ('56789012B', 'Pablo García', 'Avenida 765', '432109876', 'david@example.com', 432109, 4, 5),
    ('67890123C', 'Elena Sánchez', 'Plaza 654', '210987654', 'elena@example.com', 210987, 7, 6),
    ('78901234D', 'Nuria González', 'Calle 321', '890123456', 'pedro@example.com', 890123, 1, 7),
    ('89012345E', 'Ramirez Fernández', 'Avenida 210', '321098765', 'laura@example.com', 321098, 9, 8),
    ('90123456F', 'Sergio Ramírez', 'Plaza 109', '123450987', 'sergio@example.com', 123450, 6, 9),
    ('01234567G', 'Luisa Torres', 'Calle 678', '567890123', 'luisa@example.com', 567890, 10, 10);
    
INSERT INTO profesor_asignatura (codigo_profesor, codigo_asignatura, impartir_antiguedad, ano_inicio, ano_fin) VALUES
    (1, 1, 3, '2010', '2022'),
    (2, 2, 5, '2012', '2023'),
    (3, 3, 2, '2009', '2021'),
    (4, 4, 8, '2015', '2024'),
    (5, 5, 4, '2011', '2022'),
    (6, 6, 6, '2013', '2025'),
    (7, 7, 1, '2008', '2020'),
    (8, 8, 9, '2016', '2023'),
    (9, 9, 7, '2014', '2024'),
    (10, 10, 10, '2017', '2026');
    
    /* UPDATE */
    /* Cambia el aula de la asignatura Programacion */
    UPDATE horarios_aula_asignatura 
    join asignaturas on asignaturas.codigo_asignatura = horarios_aula_asignatura.codigo_asignatura 
    set horarios_aula_asignatura.codigo_aula = 10 where asignaturas.nombre = 'Programación';
    
    UPDATE profesores set nombre = 'Rosa Campos' where dni = '78901234D' and nombre like 'Nuria%';
    
    /* DELETE */
    
    DELETE from profesores limit 1;
    
    DELETE from aulas where nombre like '%204';