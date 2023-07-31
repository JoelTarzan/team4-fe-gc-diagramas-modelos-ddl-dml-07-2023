/* DDL */

CREATE DATABASE organigrama;
USE organigrama;

CREATE TABLE departamentos(
	id_departamento int auto_increment,
    nombre varchar(50) not null,
    PRIMARY KEY(id_departamento)
);

CREATE TABLE empleados(
	codigo_empleado int auto_increment,
    dni varchar(9) not null,
    seguridad_social int,
    nombre varchar(50) not null,
    apellido varchar(50),
    direccion varchar(50),
    telefono int,
    id_departamento int,
    codigo_coordinador int null,
    PRIMARY KEY(codigo_empleado),
    FOREIGN KEY(id_departamento) REFERENCES departamentos (id_departamento)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_coordinador) REFERENCES empleados (codigo_empleado)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE coordinadores(
	codigo_empleado int,
    id_departamento int,
    PRIMARY KEY(codigo_empleado, id_departamento),
    FOREIGN KEY(codigo_empleado) REFERENCES empleados (codigo_empleado)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(id_departamento) REFERENCES departamentos (id_departamento)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE categorias(
	id_categoria int auto_increment,
    nombre varchar(50) not null,
    PRIMARY KEY(id_categoria)
);

CREATE TABLE contratos(
	id_contrato int auto_increment,
    fecha_inicio date,
    fecha_final date,
    id_categoria int,
    codigo_empleado int,
    PRIMARY KEY(id_contrato),
    FOREIGN KEY(id_categoria) REFERENCES categorias (id_categoria)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(codigo_empleado) REFERENCES empleados (codigo_empleado)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE nominas(
	id_nomina int auto_increment,
    fecha date,
    salario float,
    id_contrato int,
    PRIMARY KEY(id_nomina),
    FOREIGN KEY(id_contrato) REFERENCES contratos (id_contrato)
    ON DELETE cascade
    ON UPDATE cascade
);

/* DML */

INSERT INTO departamentos (nombre) values 
('Ventas'),
('Recursos Humanos'),
('Marketing'),
('Compras'),
('Logística');

INSERT INTO empleados (dni, seguridad_social, nombre, apellido, direccion, telefono, id_departamento, codigo_coordinador) values 
('46770880X', 855388098, 'Scotti', 'Rodenhurst', '35 Glacier Hill Center', 132512820, 3, 1),
('35813754B', 766946134, 'Rickert', 'Rolfs', '252 Jenna Court', 275261195, 1, 1),
('48149667E', 518382708, 'Egbert', 'Stannion', '76686 Aberg Hill', 443294403, 5, 2),
('42927057B', 702020804, 'Dicky', 'Sokill', '949 Meadow Vale Junction', 135840852, 5, 3),
('44800954W', 511667756, 'Sampson', 'Sisey', '13 Mosinee Junction', 738640470, 3, 4);

INSERT INTO coordinadores (codigo_empleado, id_departamento) values 
(1, 2),
(2, 3),
(3, 1),
(4, 5),
(1, 4);

INSERT INTO categorias (nombre) values 
('Dirigido'),
('Forzoso'),
('Ley'),
('Subcontrato'),
('Autocontrato');

INSERT INTO contratos (fecha_inicio, fecha_final, id_categoria, codigo_empleado) values 
('2023-09-10', '2023-11-04', 1, 1),
('2023-03-23', '2023-12-01', 3, 3),
('2023-03-24', '2023-08-16', 2, 2),
('2023-01-01', '2023-02-26', 5, 4),
('2023-03-19', '2023-07-13', 4, 3);

INSERT INTO nominas (fecha, salario, id_contrato) values 
('2023-10-30', 2544.3, 4),
('2023-05-30', 3136.2, 1),
('2023-07-30', 1827.39, 5),
('2023-01-30', 2499.25, 2),
('2023-04-30', 3297.12, 3);

UPDATE contratos SET fecha_final='2023-09-13'
WHERE codigo_empleado=3 AND fecha_inicio='2023-03-19';

DELETE FROM nominas
WHERE fecha='2023-01-30';

SELECT empleados.nombre, nominas.fecha, nominas.salario
FROM empleados
INNER JOIN contratos
ON empleados.codigo_empleado = contratos.codigo_empleado
INNER JOIN nominas
ON nominas.id_contrato = contratos.id_contrato;