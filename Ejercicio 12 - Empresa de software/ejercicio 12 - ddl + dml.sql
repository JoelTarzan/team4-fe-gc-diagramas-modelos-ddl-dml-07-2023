create database empresa_software;
use empresa_software;

create table trabajadores (
codigo_trabajador int auto_increment,
dni varchar(30),
nombre varchar(30),
apellidos varchar(30),
primary key(codigo_trabajador)
);

create table profesiones (
codigo_profesion int auto_increment,
nombre varchar (30),
primary key(codigo_profesion)
);

create table proyectos (
id_proyecto int auto_increment,
nombre varchar(30),
primary key(id_proyecto)
);

create table trabajadores_profesiones_proyectos (
codigo_trabajador int,
codigo_profesion int,
id_proyecto int,
horas_trabajadas int,
foreign key (codigo_trabajador) references trabajadores (codigo_trabajador)
on update cascade
on delete cascade,
foreign key (codigo_profesion) references profesiones (codigo_profesion)
on update cascade
on delete cascade,
foreign key (id_proyecto) references proyectos (id_proyecto)
on update cascade
on delete cascade,
primary key(codigo_trabajador, codigo_profesion, id_proyecto)
);

create table empresas (
codigo_empresa int auto_increment,
cif varchar(30),
nombre varchar(30),
direccion varchar(30),
telefono varchar (30),
primary key(codigo_empresa)
);

create table empresas_proyectos (
id_proyecto int,
id_empresa int,
foreign key (id_proyecto) references proyectos (id_proyecto)
on update cascade
on delete cascade,
foreign key (id_empresa) references empresas (codigo_empresa)
on update cascade
on delete cascade,
primary key(id_proyecto, id_empresa)
);

/* DDL */

INSERT INTO trabajadores (dni, nombre, apellidos) VALUES
('123456789A', 'Juan', 'Gomez'),
('987654321B', 'Maria', 'Lopez'),
('456789123C', 'Pedro', 'Ramirez'),
('789123456D', 'Ana', 'Martinez'),
('321654987E', 'Carlos', 'Sanchez');

INSERT INTO profesiones (nombre) VALUES
('Ingeniero'),
('Programador'),
('Diseñador'),
('Contador'),
('Técnico');

INSERT INTO proyectos (nombre) VALUES
('Proyecto A'),
('Proyecto B'),
('Proyecto C'),
('Proyecto D'),
('Proyecto E');

INSERT INTO trabajadores_profesiones_proyectos (codigo_trabajador, codigo_profesion, id_proyecto, horas_trabajadas) VALUES
(1, 1, 1, 40),
(2, 2, 1, 30),
(3, 3, 2, 20),
(4, 4, 2, 25),
(5, 5, 3, 35);

INSERT INTO empresas (cif, nombre, direccion, telefono) VALUES
('A12345678', 'Empresa 1', 'Calle Principal 123', '123456789'),
('B87654321', 'Empresa 2', 'Avenida Central 456', '987654321'),
('C65432187', 'Empresa 3', 'Plaza Mayor 789', '654321987'),
('D78965432', 'Empresa 4', 'Calle Secundaria 10', '321987654'),
('E98765432', 'Empresa 5', 'Avenida Secundaria 20', '789654321');

INSERT INTO empresas_proyectos (id_proyecto, id_empresa) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4);

UPDATE trabajadores
SET nombre = 'Luis'
WHERE codigo_trabajador = 3;

DELETE FROM proyectos
WHERE id_proyecto = 4;

SELECT e.nombre AS nombre_empresa, p.nombre AS nombre_proyecto
FROM empresas e
JOIN empresas_proyectos ep ON e.codigo_empresa = ep.id_empresa
JOIN proyectos p ON ep.id_proyecto = p.id_proyecto;
