/* DDL */

CREATE DATABASE red_social;
USE red_social;

CREATE TABLE usuarios(
	id_usuario int auto_increment,
    contrasena varchar(50) not null,
    nombre varchar(50),
    apellidos varchar(50),
    direccion varchar(50),
    email varchar(50),
	foto blob,
    es_celebridad boolean,
    PRIMARY KEY(id_usuario)
);

CREATE TABLE contactos(
	id_usuario int,
    id_usuario2 int,
    PRIMARY KEY(id_usuario, id_usuario2),
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_usuario2) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE bloqueados(
	id_usuario int,
    id_usuario_bloqueado int,
    PRIMARY KEY(id_usuario, id_usuario_bloqueado),
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_usuario_bloqueado) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE telefonos(
	id_telf int auto_increment,
    num_telf varchar(15),
    id_usuario int,
    PRIMARY KEY(id_telf),
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE grupos(
	id_grupo int auto_increment,
    nombre varchar(30),
    PRIMARY KEY(id_grupo)
);

CREATE TABLE usuarios_grupos(
	id_grupo int,
    id_usuario int,
    PRIMARY KEY(id_grupo, id_usuario),
    FOREIGN KEY(id_grupo) REFERENCES grupos (id_grupo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE comentarios(
	id_comentario int auto_increment,
    texto text,
    imagen blob,
    id_usuario int,
    PRIMARY KEY(id_comentario),
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE visibilidad_comentarios(
    id_usuario int,
	id_comentario int,
    PRIMARY KEY(id_usuario, id_comentario),
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_comentario) REFERENCES comentarios (id_comentario)
    ON DELETE cascade
    ON UPDATE cascade
);

/* DML */

INSERT INTO usuarios (contrasena, nombre, apellidos, direccion, email, es_celebridad) values 
('cA6/rfUx>', 'Noreen', 'Tran', '58454 Colorado Trail', 'ntran0@gmail.com', false),
('sE7#>7AX1)Irc4', 'Pierre', 'Headan', '1 Portage Plaza', 'pheadan1@gmail.com', true),
('cH8|aaN\L@y<\*Z', 'Joann', 'Siman', '67033 Washington Park', 'jsiman2@gmail.com', false),
('xU2")eN,|u', 'Shepherd', 'Bezant', '5348 Autumn Leaf Terrace', 'sbezant3@gmail.com', false),
('dZ4}9rfH.x{', 'Nina', 'Crumbleholme', '6880 Waywood Crossing', 'ncrumbleholme4@gmail.com', true);

INSERT INTO contactos (id_usuario, id_usuario2) values 
(1, 4),
(2, 1),
(5, 2),
(3, 2),
(2, 4);

INSERT INTO bloqueados (id_usuario, id_usuario_bloqueado) values 
(1, 3),
(1, 5),
(5, 1),
(3, 4),
(4, 5);

INSERT INTO telefonos (num_telf, id_usuario) values 
('644288123', 3),
('628173612', 3),
('611281273', 1),
('627137123', 4),
('822716212', 5);

INSERT INTO grupos (nombre) values 
('Equipo B'),
('DAW Tardes'),
('Family'),
('Clase 3A'),
('Colchoneros ATM');

INSERT INTO usuarios_grupos (id_grupo, id_usuario) values 
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 5);

INSERT INTO comentarios (texto, id_usuario) values 
('elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam', 3),
('urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis', 1),
('tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at', 2),
('vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna', 5),
('justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 4);

INSERT INTO visibilidad_comentarios (id_usuario, id_comentario) values 
(1, 3),
(1, 4),
(2, 5),
(3, 4),
(5, 5);

UPDATE telefonos SET num_telf='622448002'
WHERE id_telf=2;

DELETE FROM comentarios
WHERE id_usuario=3;

SELECT CONCAT(usuarios.nombre, ' ', usuarios.apellidos) AS 'usuario', comentarios.texto
FROM usuarios
INNER JOIN comentarios
ON usuarios.id_usuario = comentarios.id_usuario;