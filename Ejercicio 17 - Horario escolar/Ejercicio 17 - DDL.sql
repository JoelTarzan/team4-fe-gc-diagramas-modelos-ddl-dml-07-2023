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