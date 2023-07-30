DROP database biblioteca2;

create database biblioteca2;
use biblioteca2;

/* ------------------------------ DDL --------------------------------- */
create table socios (
	codigo_socio int auto_increment,
    dni varchar(11) not null,
    nombre varchar(25) not null,
    apellido varchar(30),
	direccion varchar(50),
    telf_principal varchar(20) not null,
    primary key(codigo_socio)
);
create table telefonos (
	id_telefono int auto_increment, 
    num_telefono varchar(20) not null,
    codigo_socio int,
    primary key (id_telefono),
    foreign key(codigo_socio) references socios (codigo_socio)
    on update cascade
    on delete cascade
);
create table prestamos (
	id_prestamo int auto_increment,
    fecha_prestamo DATE not null,
    fecha_tope date not null,
    fecha_devolucion date,
    codigo_socio int,
    primary key (id_prestamo),
    foreign key(codigo_socio) references socios (codigo_socio)
    on update cascade
    on delete cascade
);
create table articulos (
	codigo_articulo int auto_increment,
	nombre varchar(50),
    ano_realizacion date,
    resumen text,
    deteriorado boolean not null default 0,
    comentario_deteriorado varchar(255),
    id_prestamo int,
    primary key (codigo_articulo),
    foreign key(id_prestamo) references prestamos (id_prestamo)
    on update cascade
    on delete cascade
);
create table autores (
	id_autor int auto_increment,
	nombre varchar(40),
    pais varchar(40),
    primary key (id_autor)
);
create table articulo_autor (
	id_autor int,
    codigo_articulo int,
    primary key (id_autor , codigo_articulo) ,
    foreign key (id_autor) references autores (id_autor)
    on update cascade
    on delete cascade,
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on update cascade
    on delete cascade
);
create table libros (
	codigo_articulo int,
	num_pagina int,
    primary key (codigo_articulo),
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on delete cascade
    on update cascade
);
create table cds (
	codigo_articulo int,
    num_canciones int,
     primary key (codigo_articulo),
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on delete cascade
    on update cascade
);
create table peliculas (
	codigo_articulo int,
    duracion int,
	primary key (codigo_articulo),
    foreign key (codigo_articulo) references articulos (codigo_articulo)
    on delete cascade
    on update cascade
);


/* -------------------------------------------- DML I --------------------------------------- */
/* INICIO INSERTS */
/*Insert tabla socios*/
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('8b02af1a', 'Derick', 'Gusney', '634 Summerview Circle', '9592199898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('4aa74568', 'Verene', 'Backe', '29477 Anderson Junction', '9602199898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('2fb6c52c', 'Dame', 'Kennewell', '5336 Westerfield Lane', '9592178898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('0cf47c12', 'Sascha', 'Sherborne', '70 Nevada Plaza', '9592449898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('07e5d7e8', 'Terza', 'Verriour', '53902 Forest Place', '9592341898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('c2948605', 'Celia', 'Riggulsford', '676 Cottonwood Pass', '9592197688');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('a4ea3db2', 'Olag', 'Curds', '14124 Reinke Crossing', '9592133898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('9d680fb7', 'Rem', 'Umpleby', '60824 Hermina Crossing', '9592145698');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('b898754e', 'Genevieve', 'Dulling', '5395 Meadow Vale Court', '9592334898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('20025a74', 'Edgard', 'Sherston', '4 Talmadge Avenue', '9592149898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('72026e3b', 'Alric', 'Saker', '51240 Miller Circle', '9592892398');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('e2b31b7c', 'Alasteir', 'Gossling', '9 Kropf Pass', '9595594898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('f90882a2', 'Quent', 'Agent', '71336 Kensington Trail', '9592234898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('b1a94d4b', 'Jillane', 'Cleever', '21 Rockefeller Crossing', '9592223898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('473833cc', 'Beret', 'Gianullo', '2 Fairview Park', '9592439898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('535f9561', 'Jackelyn', 'Fosberry', '20 Eggendart Point', '9592123298');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('38e6e3c1', 'Lacee', 'Jerger', '1144 Bowman Center', '6192199898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('1a8670b8', 'Daloris', 'Muggeridge', '4287 Norway Maple Road', '9592161898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('0411f26c', 'Pammie', 'Heald', '47095 Orin Center', '9592199898');
insert into socios (dni, nombre, apellido, direccion, telf_principal) values ('19e81b69', 'Constantine', 'Behling', '843 Coolidge Plaza', '9561199898');

/*Insert tabla telefonos*/
insert into telefonos (num_telefono, codigo_socio) values ('9592199898', 1);
insert into telefonos (num_telefono, codigo_socio) values ('1068559587', 4);
insert into telefonos (num_telefono, codigo_socio) values ('8419673340', 20);
insert into telefonos (num_telefono, codigo_socio) values ('9781873212', 4);
insert into telefonos (num_telefono, codigo_socio) values ('7525893933', 12);
insert into telefonos (num_telefono, codigo_socio) values ('8598579637', 1);
insert into telefonos (num_telefono, codigo_socio) values ('2656821518', 10);
insert into telefonos (num_telefono, codigo_socio) values ('2138103402', 3);
insert into telefonos (num_telefono, codigo_socio) values ('6582395162', 7);
insert into telefonos (num_telefono, codigo_socio) values ('7322727524', 18);
insert into telefonos (num_telefono, codigo_socio) values ('8429730249', 7);
insert into telefonos (num_telefono, codigo_socio) values ('2039592989', 3);
insert into telefonos (num_telefono, codigo_socio) values ('6324365548', 20);
insert into telefonos (num_telefono, codigo_socio) values ('7778866378', 19);
insert into telefonos (num_telefono, codigo_socio) values ('3885231818', 5);
insert into telefonos (num_telefono, codigo_socio) values ('1268802783', 1);
insert into telefonos (num_telefono, codigo_socio) values ('2485052090', 17);
insert into telefonos (num_telefono, codigo_socio) values ('8478420968', 18);
insert into telefonos (num_telefono, codigo_socio) values ('3873513891', 20);
insert into telefonos (num_telefono, codigo_socio) values ('4579426872', 6);

/* Insert tabla prestamos*/
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-10-08', '2022-08-20', '2023-02-14', 5);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2023-05-04', '2023-06-12', null, 9);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-12-06', '2022-09-15', '2022-11-10', 11);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2023-02-01', '2023-04-27', '2023-07-17', 14);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2023-01-13', '2022-08-04', null, 19);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-09-03', '2022-11-27', null, 17);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-09-01', '2023-03-07', '2023-05-08', 20);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-12-16', '2023-04-03', '2023-04-05', 3);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-09-21', '2022-08-15', '2022-09-26', 9);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2023-07-09', '2023-02-27', null, 20);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-09-12', '2023-04-15', '2022-11-25', 17);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-12-09', '2022-09-26', '2022-12-16', 19);
insert into prestamos (fecha_prestamo, fecha_tope, fecha_devolucion, codigo_socio) values ('2022-10-26', '2022-12-30', '2022-11-05', 5);

/* Insert tabla articulos*/
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('harry potter', '2023-04-15', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', true, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 9);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('señor de los anillos', '2021-06-20', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', false, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 5);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('it', '2019-12-31', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', false, 'Morbi non lectus.', 2);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('Elantris', '2021-08-06', 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', false, 'Maecenas rhoncus aliquam lacus.', 10);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('Graceling', '2023-02-11', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', true, 'Quisque porta volutpat erat.', 1);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('La Guerra', '2021-03-14', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', true, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 8);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('El niño en pijama de rayas', '2021-10-03', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', true, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 10);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('El conejo que robo hitler', '2021-12-21', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', false, null, 5);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('El profesor de matematicas asesinado', '2020-12-18', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', false, null, 7);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('La venganza', '2021-04-14', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', true, 'Vestibulum ac est lacinia nisi venenatis tristique.', 9);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('El país de nunca jamas escarlata', '2022-03-22', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', false, 'Integer tincidunt ante vel ipsum.', 11);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('El fuego interno', '2023-06-27', 'Nulla mollis molestie lorem. Quisque ut erat.', false, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 7);
insert into articulos (nombre, ano_realizacion, resumen, deteriorado, comentario_deteriorado, id_prestamo) values ('El emblema de Arturo', '2022-04-11', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.', false, 'Integer non velit.', 9);

/* Insert tabla autor */
insert into autores (nombre, pais) values ('Janene', 'Peru');
insert into autores (nombre, pais) values ('Fransisco', 'Vietnam');
insert into autores (nombre, pais) values ('Betta', 'Switzerland');
insert into autores (nombre, pais) values ('Culley', 'Brazil');
insert into autores (nombre, pais) values (null, 'Philippines');
insert into autores (nombre, pais) values ('Cortney', 'Czech Republic');
insert into autores (nombre, pais) values ('Jenny', 'Serbia');
insert into autores (nombre, pais) values ('Ekaterina', 'Brazil');
insert into autores (nombre, pais) values ('Marthe', 'Portugal');
insert into autores (nombre, pais) values ('Marius', 'Belarus');
insert into autores (nombre, pais) values ('Radcliffe', 'Denmark');
insert into autores (nombre, pais) values ('Wilhelmina', 'Philippines');
insert into autores (nombre, pais) values (null, 'China');
insert into autores (nombre, pais) values ('Ardith', 'Albania');
insert into autores (nombre, pais) values ('Zacharias', 'Argentina');
insert into autores (nombre, pais) values ('Annadiane', 'Ukraine');
insert into autores (nombre, pais) values ('Noel', 'Jordan');
insert into autores (nombre, pais) values ('Byram', 'Brazil');
insert into autores (nombre, pais) values (null, 'Portugal');
insert into autores (nombre, pais) values ('Adela', 'Brazil');

/* Insert tabla relacional entre autor y articulo */
insert into articulo_autor (id_autor, codigo_articulo) values (15, 5);
insert into articulo_autor (id_autor, codigo_articulo) values (16, 7);
insert into articulo_autor (id_autor, codigo_articulo) values (14, 5);
insert into articulo_autor (id_autor, codigo_articulo) values (10, 3);
insert into articulo_autor (id_autor, codigo_articulo) values (16, 10);
insert into articulo_autor (id_autor, codigo_articulo) values (20, 6);
insert into articulo_autor (id_autor, codigo_articulo) values (7, 1);
insert into articulo_autor (id_autor, codigo_articulo) values (14, 12);
insert into articulo_autor (id_autor, codigo_articulo) values (2, 11);
insert into articulo_autor (id_autor, codigo_articulo) values (9, 1);
insert into articulo_autor (id_autor, codigo_articulo) values (2, 10);
insert into articulo_autor (id_autor, codigo_articulo) values (15, 2);
insert into articulo_autor (id_autor, codigo_articulo) values (4, 3);
insert into articulo_autor (id_autor, codigo_articulo) values (17, 7);
insert into articulo_autor (id_autor, codigo_articulo) values (1, 13);
insert into articulo_autor (id_autor, codigo_articulo) values (5, 3);
insert into articulo_autor (id_autor, codigo_articulo) values (1, 7);
insert into articulo_autor (id_autor, codigo_articulo) values (14, 2);
insert into articulo_autor (id_autor, codigo_articulo) values (20, 1);
insert into articulo_autor (id_autor, codigo_articulo) values (20, 13);

/* Libros */
insert into libros (codigo_articulo, num_pagina) values (11, 162);
insert into libros (codigo_articulo, num_pagina) values (1, 227);

/* CD Musica */
insert into cds (codigo_articulo, num_canciones) values (5, 1);
insert into cds (codigo_articulo, num_canciones) values (6, 14);

/* pelicula */
insert into peliculas (codigo_articulo, duracion) values (13, 84);
insert into peliculas (codigo_articulo, duracion) values (2, 65);
/* FIN INSERTS */

/*INICIO  UPDATE */
update autores set nombre='Gerard', pais='España' where nombre='Cortney';

update articulos set nombre = concat(nombre, ' (viejo)') where deteriorado=true;
/*FIN UPDATE*/

/* INICIO DELETE */
/* borra los 2 registros que estan al principio */
delete from biblioteca2.socios limit 2;

/* borra el registro de prestamo con la id 13 */
delete from biblioteca2.prestamos where id_prestamo = 13;

/* borra registros con un id mayor y igual a 10 con un limite de 4*/
delete from biblioteca2.autores where id_autor >=10 limit 4;

/* borra lo registros que tengan por id 4, 10 o 2 y que sean mayores a 8 */
delete from biblioteca2.articulos where codigo_articulo in (4, 10, 2) and codigo_articulo > 8;
/* FIN DELETE */

