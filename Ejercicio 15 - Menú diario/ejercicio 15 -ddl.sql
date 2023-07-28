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
