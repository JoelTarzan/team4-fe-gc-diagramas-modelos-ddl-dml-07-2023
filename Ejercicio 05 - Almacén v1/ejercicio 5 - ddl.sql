create database almacen;
use almacen;

create table almacenes (
codigo_almacen int auto_increment,
descripcion text,
num_piezas int,
primary key(codigo_almacen)
);

create table estanterias(
codigo_estanteria varchar(30),
nombre varchar(30),
codigo_almacen int,
foreign key(codigo_almacen) references almacenes (codigo_almacen)
on delete cascade
on update cascade,
primary key(codigo_estanteria)
);

create table piezas (
codigo_pieza varchar(30),
descripcion text,
precio float,
codigo_estanteria varchar(30),
foreign key(codigo_estanteria) references estanterias (codigo_estanteria)
on delete cascade
on update cascade,
primary key(codigo_pieza)
);

create table piezas_compuestas (
codigo_pieza1 varchar(30),
codigo_pieza2 varchar(30),
foreign key(codigo_pieza1) references piezas (codigo_pieza)
on delete cascade
on update cascade,
foreign key(codigo_pieza2) references piezas (codigo_pieza)
on delete cascade
on update cascade,
primary key(codigo_pieza1, codigo_pieza2)
);