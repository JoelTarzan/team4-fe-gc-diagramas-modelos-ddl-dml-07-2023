DROP database biblioteca2;

create database biblioteca2;
use biblioteca2;

create table socios (
	codigo_socio int auto_increment,
    dni varchar(11) not null,
    nombre varchar(25) not null,
    apellido varchar(30),
	direccion varchar(50),
    primary key(codigo_socio)
);
create table telefonos (
	id_telefono int auto_increment, 
    num_telf varchar(20) not null,
    codigo_socio int,
    primary key (id_telefono),
    foreign key(codigo_socio) references socios (codigo_socio)
    on update cascade
    on delete cascade
);
create table prestamos (
	id_prestamo int auto_increment,
    fecha_prestamo DATE not null,
    fecha_tope date not null,
    fecha_devolucion date,
    codigo_socio int,
    primary key (id_prestamo),
    foreign key(codigo_socio) references socios (codigo_socio)
    on update cascade
    on delete cascade
);
create table articulos (
	codigo_articulo int auto_increment,
	nombre varchar(50),
    ano_realizacion date,
    resumen text,
    deteriorado boolean not null default 0,
    comentario_deteriorado varchar(255),
    id_prestamo int,
    primary key (codigo_articulo),
    foreign key(id_prestamo) references prestamos (id_prestamo)
    on update cascade
    on delete cascade
);
create table autor (
	id_autor int auto_increment,
	nombre varchar(40),
    pais varchar(40),
    primary key (id_autor)
);
create table articulo_autor (
	id_autor int,
    codigo_articulo int,
    primary key (id_autor , codigo_articulo) ,
    foreign key (id_autor) references autor (id_autor)
    on update cascade
    on delete cascade,
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on update cascade
    on delete cascade
);
create table libros (
	codigo_articulo int,
	num_pagina int,
    primary key (codigo_articulo),
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on delete cascade
    on update cascade
);
create table cds (
	codigo_articulo int,
    num_canciones int,
     primary key (codigo_articulo),
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on delete cascade
    on update cascade
);
create table peliculas (
	codigo_articulo int,
    duracion int,
	primary key (codigo_articulo),
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on delete cascade
    on update cascade
);