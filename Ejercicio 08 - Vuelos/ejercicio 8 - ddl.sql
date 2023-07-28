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
hora_legada time,
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
columna_asiento varchar(30),
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
tarjeta_credito int,
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
