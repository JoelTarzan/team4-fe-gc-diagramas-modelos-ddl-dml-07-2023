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
	id_ingrediente int auto_increment, 
    nombre varchar(40) not null,
    primary key (id_ingrediente)
);
create table almacenes(
	num_almacen int auto_increment, 
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
    primary key (id_estante),
    /* Con el unique le indicamos que por cada almacen solo puede haber una letra, 
    y en 2 almacenes diferentes se pueden repetir.
    ejemplo:(1-A "correcto", 2-A "correcto", 1-A "error duplicate")*/
    unique(letras, num_almacen),
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

/* --------------------------------------------- DML I ----------------------------*/
/* Insert */
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('f87e9f32', '154656191', 'Justino', 'Lickorish', '8609695926', '9249682497');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('5f646ca3', '159444822', 'Hercule', 'I''anson', '9161826740', '5511796956');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('c90c24e7', '111703205', 'Philbert', 'De Biasi', '5047210757', '5574266960');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('f9557928', '604030714', 'Judith', 'Ligoe', '3084641676', '2226240145');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('ecdc6dea', '168436909', 'Marven', 'Risom', '6139464591', '1118614729');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('a56edf5e', '326506063', 'Merna', 'Ramsell', '5421283795', '8291407188');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('b85b1a9e', '173637148', 'Samuel', 'Liddell', '1608274026', '5391821391');
insert into empleados (dni, numero_ss, nombre, apellidos, telefono_fijo, telefono_movil) values ('e6f471ef', '721269912', 'Oralla', 'Peele', '2506913525', '8586882688');

insert into pinches (dni, fecha_nacimiento) values ('f87e9f32', '2000-01-20');
insert into pinches (dni, fecha_nacimiento) values ('f9557928', '1990-07-25');
insert into pinches (dni, fecha_nacimiento) values ('b85b1a9e', '1992-08-16');

insert into cocineros (dni, anos_servicio, subordinado_pinche_dni) values ('5f646ca3', 3, 'f87e9f32');
insert into cocineros (dni, anos_servicio, subordinado_pinche_dni) values ('c90c24e7', 1, 'f9557928');
insert into cocineros (dni, anos_servicio, subordinado_pinche_dni) values ('a56edf5e', 3, 'b85b1a9e');

insert into platos (nombre, precio, tipo) values ('Solomillo con salsa verde', 23.02, 'entrante');
insert into platos (nombre, precio, tipo) values ('Corvina asada con puré de boniato', 22.4, 'primer plato');
insert into platos (nombre, precio, tipo) values ('Tortilla de patatas', 27.49, 'entrante');
insert into platos (nombre, precio, tipo) values ('pimientos al fuego', 9.24, 'primer plato');
insert into platos (nombre, precio, tipo) values ('Dorada con ensalada de lombarda', 9.35, 'segundo plato');
insert into platos (nombre, precio, tipo) values ('Brocheta de calabacín y pollo al limón', 23.83, 'primer plato');
insert into platos (nombre, precio, tipo) values ('pimientos al infierno', 27.61, 'entrante');

insert into cocineros_platos (dni_cocinero, id_plato) values ('5f646ca3', 2);
insert into cocineros_platos (dni_cocinero, id_plato) values ('5f646ca3', 6);
insert into cocineros_platos (dni_cocinero, id_plato) values ('c90c24e7', 6);
insert into cocineros_platos (dni_cocinero, id_plato) values ('a56edf5e', 6);
insert into cocineros_platos (dni_cocinero, id_plato) values ('5f646ca3', 3);
insert into cocineros_platos (dni_cocinero, id_plato) values ('a56edf5e', 4);
insert into cocineros_platos (dni_cocinero, id_plato) values ('c90c24e7', 3);

insert into ingredientes (nombre) values ('Pear - Asian');
insert into ingredientes (nombre) values ('Tuna - Loin');
insert into ingredientes (nombre) values ('Flour - Bran, Red');
insert into ingredientes (nombre) values ('Blueberries');
insert into ingredientes (nombre) values ('Beef Wellington');
insert into ingredientes (nombre) values ('Orange Roughy 4/6 Oz');
insert into ingredientes (nombre) values ('Pork - Side Ribs');

insert into almacenes (nombre, descripcion) values ('reserva 1', 'lorem id ligula suspendisse ornare consequat lectus in est risus');
insert into almacenes (nombre, descripcion) values ('reserva 2', 'quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam');

insert into platos_ingredientes (id_plato, id_ingrediente) values (2, 7, '12kg');
insert into platos_ingredientes (id_plato, id_ingrediente) values (7, 2, '500g');
insert into platos_ingredientes (id_plato, id_ingrediente) values (4, 2, '12kg');
insert into platos_ingredientes (id_plato, id_ingrediente) values (4, 3, '12l');
insert into platos_ingredientes (id_plato, id_ingrediente) values (7, 4, '12kg');
insert into platos_ingredientes (id_plato, id_ingrediente) values (1, 6, '600g');
insert into platos_ingredientes (id_plato, id_ingrediente) values (6, 1, '2kg');
insert into platos_ingredientes (id_plato, id_ingrediente) values (3, 2, '3l');
insert into platos_ingredientes (id_plato, id_ingrediente) values (7, 3, '500ml');
insert into platos_ingredientes (id_plato, id_ingrediente) values (4, 1, '1,5l');
insert into platos_ingredientes (id_plato, id_ingrediente) values (4, 7, '7kg');
insert into platos_ingredientes (id_plato, id_ingrediente) values (2, 4, '100g');
insert into platos_ingredientes (id_plato, id_ingrediente) values (2, 3, '10');

insert into estantes (letras, tamano, num_almacen) values ('A', 69.53, 2);
insert into estantes (letras, tamano, num_almacen) values ('A', 22.85, 1);
insert into estantes (letras, tamano, num_almacen) values ('D', 67.03, 1);
insert into estantes (letras, tamano, num_almacen) values ('B', 50.74, 1);
insert into estantes (letras, tamano, num_almacen) values ('B', 16.69, 2);
insert into estantes (letras, tamano, num_almacen) values ('C', 51.26, 1);

insert into ingredientes_estantes (id_ingrediente, id_estante, cantidad) values (3, 6, '100 gr');
insert into ingredientes_estantes (id_ingrediente, id_estante, cantidad) values (4, 1, '2 l');
insert into ingredientes_estantes (id_ingrediente, id_estante, cantidad) values (1, 3, '3 onzas');
insert into ingredientes_estantes (id_ingrediente, id_estante, cantidad) values (6, 3, '4');
insert into ingredientes_estantes (id_ingrediente, id_estante, cantidad) values (7, 1, '90 gr');
insert into ingredientes_estantes (id_ingrediente, id_estante, cantidad) values (2, 2, '10');

/* UPDATE */
/* Pone un precio estandard y reducido para los entrantes*/
UPDATE platos set precio = 20.00 where tipo = 'entrante';

/* Modifica los estantes con la letra A que estan en el almacen 2*/
UPDATE estantes set letras = 'C', tamano = 40.00 where letras = 'A' and num_almacen = 2;

/* DELETE */
/* elimina los estantes con la letra B */
DELETE from estantes where letras = 'B';
/* Borra los registros en los que el plato 7 este */
DELETE from platos_ingredientes where id_plato = 7;

/* --------------------------------------------- DML II ----------------------------*/
SELECT e.nombre AS cocineros, p.nombre AS ayudante, group_concat(pl.nombre separator ',  ') AS especializado_plato FROM empleados e
JOIN
    cocineros c ON e.dni = c.dni
LEFT JOIN
    empleados p ON c.subordinado_pinche_dni = p.dni
LEFT JOIN
    cocineros_platos cp ON c.dni = cp.dni_cocinero
LEFT JOIN
    platos pl ON cp.id_plato = pl.id_plato
group by cocineros, ayudante;