DROP database recetas_cocina;

create database recetas_cocina;
use recetas_cocina;

create table recetas(
	id_receta int auto_increment,
    descripcion text,
    tiempo int,
    nombre varchar(30) not null,
    dificultat varchar(40) default 'facil',
    porciones int default 1,
    primary key (id_Receta)
);
create table categorias(
	id_categoria int auto_increment,
    nombre varchar(30) not null,
    descripcion varchar(255),
    primary key(id_categoria)
);
create table recetas_categoria(
	id_receta int,
    id_categoria int,
    primary key (id_receta, id_categoria),
    foreign key (id_receta) references recetas (id_receta)
    on delete cascade
    on update cascade,
    foreign key (id_categoria) references categorias (id_categoria)
    on delete cascade
    on update cascade
);
create table ingredientes(
	id_ingrediente int auto_increment,
    nombre varchar(30) not null,
    descripcion varchar(255),
    cantidad varchar(20),
    primary key (id_ingrediente)
);
create table recetas_ingredientes(
	id_receta int,
    id_ingrediente int,
    primary key (id_receta, id_ingrediente),
    foreign key (id_receta) references recetas (id_receta)
    on delete cascade
    on update cascade,
    foreign key (id_ingrediente) references ingredientes (id_ingrediente)
    on delete cascade
    on update cascade
);
create table pasos(
	id_paso int auto_increment,
    descripcion text,
    id_receta int,
    primary key (id_paso),
    foreign key (id_receta) references recetas (id_receta)
    on delete cascade
    on update cascade
);