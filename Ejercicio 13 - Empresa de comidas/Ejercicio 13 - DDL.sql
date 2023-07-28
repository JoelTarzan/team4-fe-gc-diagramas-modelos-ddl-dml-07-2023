DROP database empresa_comidas;

create database empresa_comidas;
use empresa_comidas;

create table empleados(
	dni varchar(13), 
    numero_ss int, 
    nombre varchar(40) not null,
    apellidos varchar(50), 
    telefono_fijo varchar (20),
    telefono_movil varchar (20) not null,
    primary key (dni)

);
create table pinches(
	dni varchar(13), 
    fecha_nacimiento date,
    primary key (dni),
    foreign key (dni) references empleados (dni)
    on delete cascade
    on update cascade
);
create table cocineros(
	dni varchar(13), 
    anos_servicio int not null default 0,
    subordinado_pinche_dni varchar(13),
    primary key (dni),
    foreign key (subordinado_pinche_dni) references pinches (dni)
    on delete cascade
    on update cascade,
    foreign key (dni) references empleados (dni)
    on delete cascade
    on update cascade
);
create table platos(
	id_plato int auto_increment, 
    nombre varchar(40), 
    precio float, 
    tipo enum ('entrante', 'primer plato', 'segundo plato', 'postre'),
    primary key (id_plato)
);
create table cocineros_platos(
	dni_cocinero varchar(13),
    id_plato int,
    primary key (dni_cocinero, id_plato),
    foreign key (dni_cocinero) references cocineros (dni)
    on delete cascade
    on update cascade,
    foreign key (id_plato) references platos (id_plato)
    on delete cascade
    on update cascade
);
create table ingredientes(
	id_ingrediente int, 
    nombre varchar(40) not null,
    primary key (id_ingrediente)
);
create table almacenes(
	num_almacen int, 
    nombre varchar (40) not null, 
    descripcion text,
    primary key (num_almacen)
);
create table platos_ingredientes(
	id_plato int, 
    id_ingrediente int, 
    cantidad varchar(30),
    primary key(id_plato, id_ingrediente),
    foreign key (id_ingrediente) references ingredientes (id_ingrediente)
    on delete cascade
    on update cascade,
    foreign key (id_plato) references platos (id_plato)
    on delete cascade
    on update cascade
);
create table estantes(
	id_estante int auto_increment, 
    letras varchar(2),
    tamano float, 
    num_almacen int,
    primary key (id_estante, num_almacen),
    foreign key (num_almacen) references almacenes (num_almacen)
    on delete cascade
    on update cascade
);
create table ingredientes_estantes(
	id_ingrediente int, 
    id_estante int, 
    cantidad varchar(20),
    primary key (id_ingrediente, id_estante),
    foreign key (id_ingrediente) references ingredientes (id_ingrediente)
    on delete cascade
    on update cascade,
    foreign key (id_estante) references estantes (id_estante)
    on delete cascade
    on update cascade
);