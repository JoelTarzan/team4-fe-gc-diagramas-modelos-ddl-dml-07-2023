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

CREATE TABLE usuarios_comentarios(
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