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

/* DDL */

INSERT INTO almacenes (descripcion, num_piezas) VALUES
('Almacén 1', 100),
('Almacén 2', 150),
('Almacén 3', 200),
('Almacén 4', 120),
('Almacén 5', 80);

INSERT INTO estanterias (codigo_estanteria, nombre, codigo_almacen) VALUES
('EST001', 'Estantería A', 1),
('EST002', 'Estantería B', 2),
('EST003', 'Estantería C', 1),
('EST004', 'Estantería D', 3),
('EST005', 'Estantería E', 2);

INSERT INTO piezas (codigo_pieza, descripcion, precio, codigo_estanteria) VALUES
('PZA001', 'Pieza 1', 10.5, 'EST001'),
('PZA002', 'Pieza 2', 15.2, 'EST002'),
('PZA003', 'Pieza 3', 5.8, 'EST003'),
('PZA004', 'Pieza 4', 20.0, 'EST004'),
('PZA005', 'Pieza 5', 8.7, 'EST005');

INSERT INTO piezas_compuestas (codigo_pieza1, codigo_pieza2) VALUES
('PZA001', 'PZA002'),
('PZA002', 'PZA003'),
('PZA004', 'PZA005'),
('PZA005', 'PZA001'),
('PZA003', 'PZA004');

UPDATE piezas
SET descripcion = 'Nueva descripción de la Pieza 1', precio = 12.5
WHERE codigo_pieza = 'PZA001';

DELETE FROM estanterias
WHERE codigo_estanteria = 'EST004';

SELECT piezas.codigo_pieza, piezas.descripcion AS pieza_descripcion, piezas.precio,
estanterias.codigo_estanteria, estanterias.nombre AS estanteria_nombre
FROM piezas
JOIN estanterias ON piezas.codigo_estanteria = estanterias.codigo_estanteria;
