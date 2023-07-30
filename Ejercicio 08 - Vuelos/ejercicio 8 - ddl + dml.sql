create database vuelos;
use vuelos;

create table aeropuertos (
id_aeropuerto int auto_increment,
nombre varchar(30),
localidad varchar(30),
pais varchar(30),
primary key(id_aeropuerto)
);

create table aviones (
id_avion varchar(30),
num_plazas int,
primary key(id_avion)
);

create table asientos (
fila int,
columna varchar(30),
planta int,
id_avion varchar(30),
foreign key(id_avion) references aviones (id_avion)
on delete cascade
on update cascade,
primary key(fila, columna, planta)
);

create table vuelos (
id_vuelo int auto_increment,
fecha date,
hora_salida time,
hora_llegada time,
id_avion varchar(30),
id_aeropuerto int,
foreign key(id_avion) references aviones (id_avion)
on delete cascade
on update cascade,
foreign key(id_aeropuerto) references aeropuertos (id_aeropuerto)
on delete cascade
on update cascade,
primary key(id_vuelo)
);

create table clientes (
dni varchar(30),
nombre varchar(30),
apellidos varchar(30),
direccion varchar(30),
telefono varchar(30),
primary key(dni)
);

create table tarjetas_embarque (
id_tarjeta int auto_increment,
dni_cliente varchar(30),
fila_asiento int,
columna_asiento varchar(2),
planta_asiento int,
foreign key(dni_cliente) references clientes (dni)
on delete cascade
on update cascade,
foreign key(fila_asiento, columna_asiento, planta_asiento) 
references asientos (fila, columna, planta)
on delete cascade
on update cascade,
primary key(id_tarjeta)
);

create table reservas (
id_reserva int,
tarjeta_credito bigint,
plazas int,
dni_cliente varchar(30),
id_tarjeta int,
foreign key(dni_cliente) references clientes (dni)
on delete cascade
on update cascade,
foreign key(id_tarjeta) references tarjetas_embarque (id_tarjeta)
on delete cascade
on update cascade,
primary key(id_reserva)
);

/* DDL */

INSERT INTO aeropuertos (nombre, localidad, pais) VALUES
    ('Aeropuerto A', 'Ciudad A', 'País A'),
    ('Aeropuerto B', 'Ciudad B', 'País B'),
    ('Aeropuerto C', 'Ciudad C', 'País A'),
    ('Aeropuerto D', 'Ciudad D', 'País C'),
    ('Aeropuerto E', 'Ciudad E', 'País B');
    
INSERT INTO aviones (id_avion, num_plazas) VALUES
    ('A123', 150),
    ('B456', 200),
    ('C789', 180),
    ('D012', 250),
    ('E345', 190);

INSERT INTO asientos (fila, columna, planta, id_avion) VALUES
    (1, 'A', 1, 'A123'),
    (1, 'B', 1, 'A123'),
    (2, 'C', 1, 'A123'),
    (2, 'A', 2, 'B456'),
    (3, 'B', 2, 'B456');
    
INSERT INTO vuelos (fecha, hora_salida, hora_llegada, id_avion, id_aeropuerto) VALUES
    ('2023-08-15', '08:00:00', '10:30:00', 'A123', 1),
    ('2023-08-16', '14:30:00', '17:15:00', 'B456', 3),
    ('2023-08-17', '10:45:00', '13:20:00', 'C789', 2),
    ('2023-08-18', '09:20:00', '12:10:00', 'D012', 5),
    ('2023-08-19', '12:00:00', '15:45:00', 'E345', 4);
    
 INSERT INTO clientes (dni, nombre, apellidos, direccion, telefono) VALUES
    ('12345678A', 'Juan', 'Perez', 'Calle A, Ciudad A', '+123456789'),
    ('23456789B', 'Maria', 'Gomez', 'Calle B, Ciudad B', '+987654321'),
    ('34567890C', 'Pedro', 'Lopez', 'Calle C, Ciudad C', '+567891234'),
    ('45678901D', 'Laura', 'Rodriguez', 'Calle D, Ciudad D', '+345678912'),
    ('56789012E', 'Carlos', 'Fernandez', 'Calle E, Ciudad E', '+789012345');   
    
INSERT INTO tarjetas_embarque (dni_cliente, fila_asiento, columna_asiento, planta_asiento) VALUES
    ('12345678A', 1, 'A', 1),
    ('23456789B', 2, 'C', 1),
    ('34567890C', 2, 'A', 2),
    ('45678901D', 3, 'B', 2);
 
    
INSERT INTO reservas (id_reserva, tarjeta_credito, plazas, dni_cliente, id_tarjeta) VALUES
    (1, 111122223, 2, '12345678A', NULL),
    (2, 222233334, 1, '23456789B', NULL),
    (3, 333344445, 3, '34567890C', NULL),
    (4, 444455556, 2, '45678901D', NULL),
    (5, 555566667, 1, '56789012E', NULL);

    
UPDATE aeropuertos
SET nombre = 'Carlos'
WHERE id_aeropuerto = 1;

DELETE FROM tarjetas_embarque
WHERE dni_cliente = '23456789B';

DELETE FROM clientes
WHERE dni = '23456789B';

SELECT r.id_reserva, c.nombre AS nombre_cliente, c.apellidos AS apellidos_cliente, a.fila, a.columna, a.planta
FROM reservas r
INNER JOIN clientes c ON r.dni_cliente = c.dni
INNER JOIN tarjetas_embarque te ON r.id_tarjeta = te.id_tarjeta
INNER JOIN asientos a ON te.fila_asiento = a.fila AND te.columna_asiento = a.columna AND te.planta_asiento = a.planta;
    