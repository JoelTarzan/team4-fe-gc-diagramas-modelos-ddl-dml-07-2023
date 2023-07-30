create database biblioteca; 
use biblioteca;

create table autores(
id_autor int auto_increment,
nombre varchar(30),
primary key(id_autor)
);

create table libros (
isbn varchar(30),
editorial varchar(30),
ano_escritura year,
primary key(isbn)
);

create table autores_libros (
id_autor int,
isbn varchar(30),
foreign key(id_autor) references autores (id_autor)
on delete cascade
on update cascade,
foreign key(isbn) references libros (isbn)
on delete cascade
on update cascade
);

create table volumenes (
id_volumen int auto_increment,
deteriorado boolean,
isbn varchar(30),
foreign key(isbn) references libros (isbn)
on delete cascade
on update cascade,
primary key(id_volumen)
);

create table personas (
cod_socio int auto_increment,
dni varchar(30),
nombre varchar(30),
apellidos varchar(30),
direccion varchar(50),
telefono varchar(30),
primary key(cod_socio)
);

create table prestamos (
id_prestamo int auto_increment,
fecha_prestamo date,
fecha_real date,
id_volumen int,
cod_socio int,
foreign key(id_volumen) references volumenes (id_volumen)
on delete cascade
on update cascade,
foreign key(cod_socio) references personas (cod_socio)
on delete cascade
on update cascade,
primary key(id_prestamo)
);

/* DML */

INSERT INTO autores (nombre) VALUES
  ('Juan Pérez'),
  ('María Gómez'),
  ('Luis Martínez'),
  ('Ana Rodríguez'),
  ('Carlos Sánchez');
  
INSERT INTO libros (isbn, editorial, ano_escritura) VALUES
  ('978-0061120084', 'HarperCollins', 2003),
  ('978-0545582933', 'Scholastic', 2008),
  ('978-0345391803', 'Ballantine Books', 1996),
  ('978-0060558122', 'HarperCollins', 2003),
  ('978-0141439600', 'Penguin Classics', 2002);

INSERT INTO autores_libros (id_autor, isbn) VALUES
  (1, '978-0061120084'),
  (2, '978-0545582933'),
  (3, '978-0345391803'),
  (4, '978-0060558122'),
  (5, '978-0141439600');

INSERT INTO volumenes (deteriorado, isbn) VALUES
  (false, '978-0061120084'),
  (true, '978-0545582933'),
  (false, '978-0345391803'),
  (true, '978-0060558122'),
  (false, '978-0141439600');
  
INSERT INTO personas (dni, nombre, apellidos, direccion, telefono) VALUES
  ('12345678A', 'Juan', 'Pérez', 'Calle Mayor 123', '123456789'),
  ('87654321B', 'María', 'Gómez', 'Avenida Principal 456', '987654321'),
  ('56789012C', 'Luis', 'Martínez', 'Plaza Central 789', '456789012'),
  ('90123456D', 'Ana', 'Rodríguez', 'Carretera Secundaria 321', '789012345'),
  ('65432109E', 'Carlos', 'Sánchez', 'Camino Vecinal 654', '012345678');
  
INSERT INTO prestamos (fecha_prestamo, fecha_real, id_volumen, cod_socio) VALUES
  ('2023-07-15', '2023-07-30', 1, 1),
  ('2023-07-20', '2023-08-03', 2, 2),
  ('2023-07-22', '2023-08-02', 3, 3),
  ('2023-07-25', NULL, 4, 4),
  ('2023-07-28', NULL, 5, 5);
  
UPDATE personas
SET nombre = 'Laura', apellidos = 'González'
WHERE cod_socio = 3;

DELETE FROM prestamos
WHERE id_prestamo = 2;

SELECT p.id_prestamo, p.fecha_prestamo, p.fecha_real, v.id_volumen, pe.nombre, pe.apellidos
FROM prestamos p
JOIN volumenes v ON p.id_volumen = v.id_volumen
JOIN personas pe ON p.cod_socio = pe.cod_socio;
