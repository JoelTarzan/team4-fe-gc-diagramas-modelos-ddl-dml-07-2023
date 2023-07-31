/* DDL */

CREATE DATABASE inmuebles;
USE inmuebles;

CREATE TABLE personas(
	codigo_personal int auto_increment,
    dni varchar(9) not null,
    telefono_fijo varchar(15),
    telefono_movil varchar(15),
    nombre varchar(50),
    apellidos varchar(50),
    es_trabajador boolean,
    PRIMARY KEY(codigo_personal)
);

CREATE TABLE negociaciones(
	codigo_personal int,
    codigo_personal_dos int,
    PRIMARY KEY(codigo_personal, codigo_personal_dos),
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_personal_dos) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE inmuebles(
	id_inmueble int auto_increment,
    metros float,
    descripcion text,
    direccion varchar(50),
    PRIMARY KEY(id_inmueble)
);

CREATE TABLE locales(
	id_inmueble int,
    servicio boolean,
    uso varchar(50),
    PRIMARY KEY(id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pisos(
	codigo_piso int,
	id_inmueble int,
    PRIMARY KEY(codigo_piso, id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE garajes(
	id_inmueble int,
    num_garaje int,
    planta varchar(30),
    codigo_piso int null,
    PRIMARY KEY(id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_piso) REFERENCES pisos (codigo_piso)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE compras(
	codigo_compra int auto_increment,
	fecha date,
    valor float,
    id_inmueble int,
    PRIMARY KEY(codigo_compra),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE personas_compras(
	codigo_personal int,
	codigo_compra int,
    PRIMARY KEY(codigo_personal, codigo_compra),
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_compra) REFERENCES compras (codigo_compra)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE alquileres(
	id_alquiler int auto_increment,
	num_alquiler int,
    id_inmueble int,
    codigo_personal int,
    PRIMARY KEY(id_alquiler),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles (id_inmueble)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE gestiones_alquileres(
	codigo_personal int,
	id_alquiler int,
    PRIMARY KEY(codigo_personal, id_alquiler),
    FOREIGN KEY(codigo_personal) REFERENCES personas (codigo_personal)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_alquiler) REFERENCES alquileres (id_alquiler)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pagos_alquileres(
	id_pago int auto_increment,
	mes enum('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'),
    ano year,
    valor float,
    PRIMARY KEY(id_pago)
);

CREATE TABLE alquileres_pagos_alquileres(
	id_alquiler int,
    id_pago int,
    PRIMARY KEY(id_alquiler, id_pago),
    FOREIGN KEY(id_alquiler) REFERENCES alquileres (id_alquiler)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_pago) REFERENCES pagos_alquileres (id_pago)
    ON DELETE cascade
    ON UPDATE cascade
);

/* DML */

INSERT INTO personas (dni, telefono_fijo, telefono_movil, nombre, apellidos, es_trabajador) values 
('46770880X', 855388098, '633412912', 'Scotti', 'Rodenhurst', true),
('35813754B', 766946134, '622912321', 'Rickert', 'Rolfs', false),
('48149667E', 518382708, '837122371', 'Egbert', 'Stannion', false),
('42927057B', 702020804, '127361782', 'Dicky', 'Sokill', true),
('44800954W', 511667756, '468738321', 'Sampson', 'Sisey', true);

INSERT INTO negociaciones (codigo_personal, codigo_personal_dos) values 
(4, 2),
(1, 3),
(1, 5),
(5, 2),
(4, 5);

INSERT INTO inmuebles (metros, descripcion, direccion) values 
(80, 'nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', '56912 Jackson Terrace'),
(5, 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum', '88914 La Follette Circle'),
(73, 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus', '5 Cottonwood Center'),
(6, 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at', '983 Thompson Trail'),
(170, 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet', '10156 Pawling Drive'),
(192, 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', '15 Merchant Court'),
(12, 'faucibus orci luctus et ultrices posuere cubilia', '20 Terrace Follette');

INSERT INTO locales (id_inmueble, servicio, uso) values 
(5, false, 'non velit nec nisi vulputat'),
(6, true, 'eu orci mauris lacinia');

INSERT INTO pisos (codigo_piso, id_inmueble) values 
(103, 1),
(201, 3);

INSERT INTO garajes (id_inmueble, num_garaje, planta, codigo_piso) values 
(2, 36, 3, 103),
(4, 9, 1, null);

INSERT INTO compras (fecha, valor, id_inmueble) values 
('2023-06-07', 16148.09, 1),
('2023-02-05', 131231.43, 5),
('2023-09-11', 239289.23, 6);

INSERT INTO personas_compras (codigo_personal, codigo_compra) values 
(3, 1),
(2, 2),
(5, 3);

INSERT INTO alquileres (num_alquiler, id_inmueble, codigo_personal) values 
(32, 2, 3),
(16, 3, 4),
(28, 4, 1);

INSERT INTO gestiones_alquileres (codigo_personal, id_alquiler) values 
(5, 1),
(1, 2),
(4, 3);

INSERT INTO pagos_alquileres (mes, ano, valor) values 
('Abril', 2022, 543.21),
('Julio', 2023, 433.35),
('Enero', 2020, 1137.42);

INSERT INTO alquileres_pagos_alquileres (id_alquiler, id_pago) values 
(1, 2),
(2, 3),
(3, 1);

UPDATE garajes SET codigo_piso=201
WHERE num_garaje=9;

DELETE FROM inmuebles
WHERE id_inmueble=7;

SELECT personas.nombre, personas.apellidos, alquileres.id_inmueble, pagos_alquileres.ano, pagos_alquileres.mes, pagos_alquileres.valor
FROM personas
INNER JOIN alquileres
ON personas.codigo_personal = alquileres.codigo_personal
INNER JOIN alquileres_pagos_alquileres
ON alquileres_pagos_alquileres.id_alquiler = alquileres.id_alquiler
INNER JOIN pagos_alquileres
ON pagos_alquileres.id_pago = alquileres_pagos_alquileres.id_pago;