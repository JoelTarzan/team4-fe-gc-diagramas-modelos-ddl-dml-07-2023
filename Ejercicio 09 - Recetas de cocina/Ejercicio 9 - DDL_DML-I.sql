DROP database recetas_cocina;

create database recetas_cocina;
use recetas_cocina;

create table recetas(
	id_receta int auto_increment,
    descripcion text,
    tiempo int,
    nombre varchar(255) not null,
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

/* ----------------------------DML I --------------------------*/
/* Insert*/
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci.', 1, 'Tortilla de patatas', 'facil', 1);
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 2, 'pimientos al fuego', 'intermedio', 2);
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 3, 'Falso pastel de carne al horno', 'dificil', 3);
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4, 'Solomillo con salsa verde', 'facil', 4);
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 6, 'Dorada con ensalada de lombarda', 'dificil', 6);
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 7, 'Corvina asada con puré de boniato', 'muy dificil', 7);
insert into recetas (descripcion, tiempo, nombre, dificultat, porciones) values ('Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 8, 'Brocheta de calabacín y pollo al limón', 'facil', 8);

insert into categorias (nombre, descripcion) values ('entrante', 'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue');
insert into categorias (nombre, descripcion) values ('principal', 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque');
insert into categorias (nombre, descripcion) values ('acompañamiento', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac');
insert into categorias (nombre, descripcion) values ('postre', 'vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio');
insert into categorias (nombre, descripcion) values ('vegetal', 'in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient');

insert into recetas_categoria (id_receta, id_categoria) values (4, 5);
insert into recetas_categoria (id_receta, id_categoria) values (2, 3);
insert into recetas_categoria (id_receta, id_categoria) values (4, 4);
insert into recetas_categoria (id_receta, id_categoria) values (3, 1);
insert into recetas_categoria (id_receta, id_categoria) values (3, 5);
insert into recetas_categoria (id_receta, id_categoria) values (1, 2);
insert into recetas_categoria (id_receta, id_categoria) values (6, 3);
insert into recetas_categoria (id_receta, id_categoria) values (7, 5);

insert into ingredientes (nombre, descripcion, cantidad) values ('Salt - Sea', 'amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam', 10);
insert into ingredientes (nombre, descripcion, cantidad) values ('Pepper - Green', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget', 8);
insert into ingredientes (nombre, descripcion, cantidad) values ('Piping - Bags Quizna', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', 10);
insert into ingredientes (nombre, descripcion, cantidad) values ('Flower - Carnations', 'ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu', 3);
insert into ingredientes (nombre, descripcion, cantidad) values ('Cheese - Grie Des Champ', 'ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', 3);
insert into ingredientes (nombre, descripcion, cantidad) values ('Pork - Bacon, Double Smoked', 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 4);
insert into ingredientes (nombre, descripcion, cantidad) values ('Pineapple - Golden', 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', 6);
insert into ingredientes (nombre, descripcion, cantidad) values ('Muffin Carrot - Individual', 'tempus sit amet sem fusce consequat nulla nisl nunc nisl duis', 3);

insert into recetas_ingredientes (id_receta, id_ingrediente) values (7, 1);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (4, 7);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (7, 5);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (7, 6);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (7, 2);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (3, 6);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (1, 7);
insert into recetas_ingredientes (id_receta, id_ingrediente) values (5, 2);

insert into pasos (descripcion, id_receta) values ('Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 1);
insert into pasos (descripcion, id_receta) values ('Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 2);
insert into pasos (descripcion, id_receta) values ('Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 3);
insert into pasos (descripcion, id_receta) values ('Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 4);
insert into pasos (descripcion, id_receta) values ('Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 5);
insert into pasos (descripcion, id_receta) values ('Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 6);
insert into pasos (descripcion, id_receta) values ('Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 7);

/* UPDATE */
/* en algunas descripciones de las recetes añade una advertencia para los intolerantes */
UPDATE recetas set descripcion = concat(descripcion,' (no apto para intolerantes a la lactosa)') where id_receta in (1, 4, 7);

/* Modifica el ingrediente pimenta verde por pimienta negra */
UPDATE ingredientes set nombre = 'Pimienta (negra)' where nombre like ('Pepper%');

/* modifica una de la tablas relacionales cambiando su relacion, con esto cambia la categoria de 'postre' a 'plato entrante' */
UPDATE recetas_categoria set id_categoria = 1 where id_receta = 4 and id_categoria = 4;

/* DELETE */
/* borra los ingredientes que empiecen por Flower */
delete from ingredientes where nombre like('Flower%');

/* Borra el primer registro */
delete from pasos limit 1;