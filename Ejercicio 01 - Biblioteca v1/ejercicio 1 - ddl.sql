create database biblioteca; 
use biblioteca;

create table autores(
id_autor int auto_increment,
nombre varchar(30),
primary key(id_autor)
);

create table libros (
isbn varchar(30),
editorial varchar(30),
ano_escritura year,
primary key(isbn)
);

create table autores_libros (
id_autor int,
isbn varchar(30),
foreign key(id_autor) references autores (id_autor)
on delete cascade
on update cascade,
foreign key(isbn) references libros (isbn)
on delete cascade
on update cascade
);

create table volumenes (
id_volumen int auto_increment,
deteriorado boolean,
isbn varchar(30),
foreign key(isbn) references libros (isbn)
on delete cascade
on update cascade,
primary key(id_volumen)
);

create table personas (
cod_socio int auto_increment,
dni varchar(30),
nombre varchar(30),
apellidos varchar(30),
direccion varchar(50),
telefono varchar(30),
primary key(cod_socio)
);

create table prestamos (
id_prestamo int auto_increment,
fecha_prestamo date,
fecha_real date,
id_volumen int,
cod_socio int,
foreign key(id_volumen) references volumenes (id_volumen)
on delete cascade
on update cascade,
foreign key(cod_socio) references personas (cod_socio)
on delete cascade
on update cascade,
primary key(id_prestamo)
);

