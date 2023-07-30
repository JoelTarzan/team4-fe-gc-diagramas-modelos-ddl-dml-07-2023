create database menu_diario;
use menu_diario;

create table platos (
id_plato int auto_increment,
nombre varchar(30),
descripcion varchar(50),
tipo enum("primero", "segundo", "postre"),
primary key(id_plato)
);

create table menus (
id_menu int auto_increment,
primary key(id_menu)
);

create table platos_menus (
id_plato int,
id_menu int,
foreign key(id_plato) references platos (id_plato)
on update cascade
on delete cascade,
foreign key(id_menu) references menus (id_menu)
on update cascade
on delete cascade,
primary key(id_plato, id_menu)
);

create table dias (
fecha date,
numero_personas int,
temperatura float,
id_menu int,
foreign key(id_menu) references menus (id_menu)
on update cascade
on delete cascade,
primary key(fecha)
);

create table platos_dias (
id_plato int,
fecha date,
veces_servido int,
foreign key(id_plato) references platos (id_plato)
on update cascade
on delete cascade,
foreign key(fecha) references dias (fecha)
on update cascade
on delete cascade,
primary key(id_plato)
);

/* DDL */

INSERT INTO platos (nombre, descripcion, tipo)
VALUES
  ('Pasta Carbonara', 'Deliciosa pasta con salsa cremosa', 'primero'),
  ('Pollo a la Parrilla', 'Pollo jugoso hecho en parrilla', 'segundo'),
  ('Brownie de Chocolate', 'Postre fundente de chocolate', 'postre'),
  ('Ensalada César', 'Ensalada clásica con aderezo César', 'primero'),
  ('Estofado de Ternera', 'Sabroso guiso de ternera con champiñones', 'segundo');

INSERT INTO menus (id_menu) VALUES (NULL);
INSERT INTO menus (id_menu) VALUES (NULL);
INSERT INTO menus (id_menu) VALUES (NULL);
INSERT INTO menus (id_menu) VALUES (NULL);
INSERT INTO menus (id_menu) VALUES (NULL);

INSERT INTO platos_menus (id_plato, id_menu)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (1, 2),
  (4, 2);

INSERT INTO dias (fecha, numero_personas, temperatura, id_menu)
VALUES
  ('2023-07-30', 4, 25.5, 1),
  ('2023-07-31', 3, 28.0, 2),
  ('2023-08-01', 5, 24.0, 3),
  ('2023-08-02', 2, 26.5, 4),
  ('2023-08-03', 6, 23.0, 5);

INSERT INTO platos_dias (id_plato, fecha, veces_servido)
VALUES
  (1, '2023-07-30', 2),
  (2, '2023-07-30', 1),
  (3, '2023-07-30', 3),
  (4, '2023-07-31', 1),
  (5, '2023-07-31', 2);

UPDATE platos
SET descripcion = 'Exquisita pasta con salsa de huevo y panceta'
WHERE nombre = 'Pasta Carbonara';

DELETE FROM platos
WHERE nombre = 'Estofado de Ternera';

SELECT * FROM platos
WHERE tipo = 'primero';

SELECT p.nombre AS plato, m.id_menu AS menu
FROM platos p
JOIN platos_menus pm ON p.id_plato = pm.id_plato
JOIN menus m ON pm.id_menu = m.id_menu;
