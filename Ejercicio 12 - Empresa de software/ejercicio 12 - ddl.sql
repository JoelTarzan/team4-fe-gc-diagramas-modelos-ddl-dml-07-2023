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