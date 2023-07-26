/* DDL */

CREATE DATABASE twitter;
USE twitter;

CREATE TABLE usuarios(
    id_usuario int auto_increment,
    nombre varchar(50) not null,
    usuario varchar(30) not null,
    notificaciones int,
    seguidores int,
    siguiendo int,
    PRIMARY KEY(id_usuario)
);

CREATE TABLE mensajes(
    id_mensaje int auto_increment,
    id_emisor int,
    id_receptor int,
    contenido text,
    fecha datetime,
    PRIMARY KEY(id_mensaje),
    FOREIGN KEY(id_emisor) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_receptor) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE seguidores(
    id_usuario1 int,
    id_usuario2 int,
    PRIMARY KEY(id_usuario1, id_usuario2),
    FOREIGN KEY(id_usuario1) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_usuario2) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE tweets(
    id_tweet int auto_increment,
    contenido varchar(255),
    likes int,
    retweet int,
    id_usuario int,
    PRIMARY KEY(id_tweet),
    FOREIGN KEY(id_usuario) REFERENCES usuarios (id_usuario)
    ON DELETE cascade
    ON UPDATE cascade
);

/* DML */

/* Borra el contenido de la tabla */
DELETE FROM twitter.usuarios;

/* Altera la tabla para que el auto increment vuelva a 1 */
ALTER TABLE twitter.usuarios AUTO_INCREMENT = 1;

/* Añade registros en la tabla usuarios */
INSERT INTO twitter.usuarios (nombre, usuario, notificaciones, seguidores, siguiendo) VALUES 
('Fernando', 'Fernandito', 40, 1000, 30),
('Paula', 'MundoPaula', 13, 300, 10),
('Rick', 'Ricky', 1, 15, 40);

/* inserta registros que hacen referencia entre las 2 primary key (reflexiva)*/
INSERT INTO twitter.seguidores (id_usuario1, id_usuario2) VALUE
(3,1),
(3,2),
(2,1);

/* Actualiza el nombre de usuario de Fernandito a FernandoFE */
UPDATE twitter.usuarios SET usuario="FernandoFE" WHERE usuario="Fernandito";

/* Borra el usuario que tiene como nombre FernandoFE*/
DELETE FROM twitter.usuarios WHERE usuario="FernandoFE";
