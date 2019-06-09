----------------------------------------------------------------------- examen final

use concesionaria_Pettiti
go

----------------------------------------------------------------------- drops

drop table log_errores
go

drop table ultimos_ganadores
go

drop table cuotas
drop table adhesiones_planes
drop table clientes
drop table localidades
drop table provincias
drop table planes_versiones
drop table planes
drop table autos
drop table versiones
drop table modelos
drop table marcas
drop table medios_pago
drop table solicitantes_autorizados

go

-----------------------------------------------------------------------

create table solicitantes_autorizados
(
    identificador_solicitante   varchar(20) not null primary key
)
go

insert into solicitantes_autorizados(identificador_solicitante)
values ('GOBIERNO')
go

----------------------------------------------------------------------- 

create table marcas
(
    id_marca    smallint        not null    identity (1,1),
    nombre      varchar (20)    not null,

    constraint pk__marcas__end primary key (id_marca),
    constraint uq__marcas__1__end unique (nombre)
)
go

insert into marcas (nombre) values
  ('Renault'),
  ('Fiat'),
  ('Volvo'),
  ('Citroen'),
  ('Chevrolet'),
  ('Peugeot'),
  ('Volkswagen')
go

-----------------------------------------------------------------------

create table modelos
(
    id_marca    smallint        not null,
    id_modelo   smallint        not null,
    nombre      varchar (20)    not null,

    constraint pk__modelos__end primary key (id_marca, id_modelo),
    constraint uq__modelos__1__end unique (id_marca, nombre),
    constraint fk__modelos__marcas__1__end foreign key (id_marca)
        references marcas (id_marca)
)
go

insert into modelos (id_marca, id_modelo, nombre) values
  (1,1,'Megane'),
  (1,2,'Fluence'),
  (1,3,'Sandero'),
  (2,1,'Palio'),
  (2,2,'Punto'),
  (2,3,'Mobi'),
  (2,4,'Uno'),
  (3,1,'C30'),
  (3,2,'XC60'),
  (4,1,'C3'),
  (4,2,'C4 Lounge'),
  (5,1,'Tracker'),
  (5,2,'S10'),
  (5,3,'Cruze'),
  (5,4,'Cruze 5'),
  (6,1,'208'),
  (6,2,'308'),
  (6,3,'408'),
  (7,1,'Gol Trend'),
  (7,2,'Golf'),
  (7,3,'Suran'),
  (7,4,'Fox'),
  (7,5,'Crossfox')
go

create table versiones
(
    id_marca            smallint      not null,
    id_modelo           smallint      not null,
    id_version          tinyint       not null,
    nombre              varchar(50)   not null,
    precio              integer       not null,
    cilindrada          integer       not null,
    potencia            smallint      not null,
    traccion            char(1)       not null,
    transmision         char(2)       not null,
    ficha_tecnica_url   varchar(200)  not null,

    constraint pk__versiones__end primary key (id_marca,id_modelo,id_version),
    constraint fk__versiones__modelos__1__end foreign key (id_marca,id_modelo)
        references modelos (id_marca,id_modelo),
    constraint ch__transmision__1__end check(transmision in ('AT','MT')),
    constraint ch__traccion__1__end check(traccion in('D','T','I')),
)
go

insert into versiones (id_marca,id_modelo,id_version,nombre,precio,cilindrada,potencia,traccion,transmision,ficha_tecnica_url) values
  (3,1,1,'P1',300000,2000,145,'D','MT','http://url.ficha.tecnica.co'),
  (3,1,2,'T5',360000,2500,230,'D','MT','http://url.ficha.tecnica.co'),
  (6,1,1,'Allure', 1600,250000,110,'D','MT','http://url.ficha.tecnica.co'),
  (6,1,2,'Feline', 1600,270000,110,'D','MT','http://url.ficha.tecnica.co'),
  (7,1,1,'Super', 1600,270000,110,'D','MT','http://url.ficha.tecnica.co'),
  (7,2,1,'Mini', 1600,270000,110,'D','MT','http://url.ficha.tecnica.co'),
  (7,3,1,'Mix', 1600,270000,110,'D','MT','http://url.ficha.tecnica.co')
go
-----------------------------------------------------------------------

create table planes
(
    id_plan             smallint        not null identity(1,1),
    nombre_plan         varchar (50)    not null,
    cantidad_cuotas     tinyint         not null,
    cuota_entrega       tinyint         not null,

    constraint pk__planes__end primary key (id_plan),
    constraint ch__planes__1__end check (cantidad_cuotas > 0),
    constraint ch__planes__2__end check (cuota_entrega between 1 and cantidad_cuotas)
)
go

insert into planes (nombre_plan, cantidad_cuotas, cuota_entrega)
  values ('Plan Incentivo 0km Gobierno', 60, 6)
go
-----------------------------------------------------------------------

create table autos
(
    id_auto       integer       not null identity(1,1),
    id_marca      smallint      not null,
    id_modelo     smallint      not null,
    id_version    tinyint       not null,
    dominio       varchar(7)    null,
    num_motor     varchar(15)   not null,
    num_chasis    varchar(15)   not null,
    año           smallint      not null,
    color         varchar(20)   not null,

    constraint pk__autos__end primary key(id_auto),
    constraint fk__autos__versiones__1__end foreign key (id_marca,id_modelo,id_version)
          references versiones(id_marca,id_modelo,id_version),
)
go

insert into autos(id_marca,id_modelo,id_version,dominio,num_motor,num_chasis,año,color) values
    (3,1,1,'BBB121','OVU765ASDFSDDFF','Y78IJADSFDFSUVO',2012,'Brown'),
    (3,1,2,'BBB122','AVU765H8LKJI87Y','Y78IJKLFFFFFFVA',2013,'Blanco'),
    (6,1,1,'BBB123','BBBB65H8LKJI87Y','Y78IJKL8H56HHHB',2013,'Blanco perlado'),
    (6,1,2,'BBB124','BVU765H8LKJI87Y','Y78IJKL8H56RTYS',2014,'Blanco'),
    (7,1,1,'BBB125','CVU765H8LKJI87Y','Y78IJKL8HRGGRVC',2015,'Blanco'),
    (7,2,1,'BBB126','DVU765H8LKJI87Y','Y78IJKL8GFDFGVD',2016,'Bordo'),
    (7,3,1,'BBB127','EVU765H8LKJI87Y','Y78IJKL8H567UVE',2017,'Bordo')
go
-----------------------------------------------------------------------

create table planes_versiones
(
    id_plan             smallint      not null,
    id_marca            smallint      not null,
    id_modelo           smallint      not null,
    id_version          tinyint       not null,

    constraint pk__planes_versiones__end primary key (id_plan,id_marca,id_modelo,id_version),
    constraint fk__planes_versiones__planes__1__end foreign key (id_plan)
          references planes (id_plan),
    constraint fk__planes_versiones__versiones__1__end foreign key (id_marca,id_modelo,id_version)
          references versiones(id_marca,id_modelo,id_version)
)
go

insert into planes_versiones (id_plan,id_marca,id_modelo,id_version) values
    (1,3,1,1),
    (1,3,1,2),
    (1,6,1,1),
    (1,6,1,2),
    (1,7,1,1),
    (1,7,2,1),
    (1,7,3,1)
go

-----------------------------------------------------------------------

create table provincias
(
    id_provincia    tinyint         not null    identity (1,1),
    nombre          varchar (50)    not null,

    constraint pk__provincias__end primary key (id_provincia),
    constraint uq__provincias__end unique (nombre)
)
go

-----------------------------------------------------------------------

insert into provincias (nombre)
values
	('Buenos Aires'),
	('Catamarca'),
	('Chaco'),
	('Chubut'),
	('Cordoba'),
	('Corrientes'),
	('Entre Rios'),
	('Formosa'),
	('Jujuy'),
	('La Pampa'),
	('La Rioja'),
	('Mendoza'),
	('Misiones'),
	('Neuquen'),
	('Rio Negro'),
	('Salta'),
	('San Juan'),
	('San Luis'),
	('Santa Cruz'),
	('Santa Fe'),
	('Santiago del Estero'),
	('Tierra del Fuego'),
	('Tucuman')
go

select * from provincias
go

-----------------------------------------------------------------------

create table localidades
(
    id_provincia    tinyint         not null,
    id_localidad    smallint        not null,
    nombre          varchar (50)    not null,

    constraint pk__localidades__end primary key (id_provincia, id_localidad),
    constraint fk__localidades__provincias__1__end foreign key (id_provincia)
        references provincias (id_provincia),
    constraint uq__localidades__1__end unique (id_provincia, nombre)
)
go

----------------------------------

insert into localidades (id_provincia,id_localidad,nombre)
values
	(1,1,'25 de Mayo'),
	(1,2,'9 de Julio'),
	(1,3,'Adolfo Alsina'),
	(1,4,'Adolfo Gonzales Chaves'),
	(1,5,'Alberti'),
	(1,6,'Almirante Brown'),
	(1,7,'Arrecifes'),
	(1,8,'Avellaneda'),
	(1,9,'Ayacucho'),
	(1,10,'Azul'),
	(1,11,'Bahia Blanca'),
	(1,12,'Balcarce'),
	(1,13,'Baradero'),
	(1,14,'Benito Juarez'),
	(1,15,'Berazategui'),
	(1,16,'Berisso'),
	(1,17,'Bolivar'),
	(1,18,'Bragado'),
	(1,19,'Brandsen'),
	(1,20,'Cañuelas'),
	(1,21,'Campana'),
	(1,22,'Capitan Sarmiento'),
	(1,23,'Carlos Casares'),
	(1,24,'Carlos Tejedor'),
	(1,25,'Carmen de Areco'),
	(1,26,'Castelli'),
	(1,27,'Chacabuco'),
	(1,28,'Chascomus'),
	(1,29,'Chivilcoy'),
	(1,30,'Colon'),
	(1,31,'Coronel de Marina L. Rosales'),
	(1,32,'Coronel Dorrego'),
	(1,33,'Coronel Pringles'),
	(1,34,'Coronel Suarez'),
	(1,35,'Daireaux'),
	(1,36,'Dolores'),
	(1,37,'Ensenada'),
	(1,38,'Escobar'),
	(1,39,'Esteban Echeverria'),
	(1,40,'Exaltacion de la Cruz'),
	(1,41,'Ezeiza'),
	(1,42,'Florencio Varela'),
	(1,43,'Florentino Ameghino'),
	(1,44,'General Alvarado'),
	(1,45,'General Alvear'),
	(1,46,'General Arenales'),
	(1,47,'General Belgrano'),
	(1,48,'General Guido'),
	(1,49,'General Juan Madariaga'),
	(1,50,'General La Madrid'),
	(1,51,'General Las Heras'),
	(1,52,'General Lavalle'),
	(1,53,'General Paz'),
	(1,54,'General Pinto'),
	(1,55,'General Pueyrredon'),
	(1,56,'General Rodriguez'),
	(1,57,'General San Martin'),
	(1,58,'General Viamonte'),
	(1,59,'General Villegas'),
	(1,60,'Guamini'),
	(1,61,'Hipolito Yrigoyen'),
	(1,62,'Hurlingham'),
	(1,63,'Ituzaingo'),
	(1,64,'Jose C. Paz'),
	(1,65,'Junin'),
	(1,66,'La Costa'),
	(1,67,'La Matanza'),
	(1,68,'La Plata'),
	(1,69,'Lanus'),
	(1,70,'Laprida'),
	(1,71,'Las Flores'),
	(1,72,'Leandro N. Alem'),
	(1,73,'Lincoln'),
	(1,74,'Loberia'),
	(1,75,'Lobos'),
	(1,76,'Lomas de Zamora'),
	(1,77,'Lujan'),
	(1,78,'Magdalena'),
	(1,79,'Maipu'),
	(1,80,'Malvinas Argentinas'),
	(1,81,'Mar Chiquita'),
	(1,82,'Marcos Paz'),
	(1,83,'Mercedes'),
	(1,84,'Merlo'),
	(1,85,'Monte'),
	(1,86,'Monte Hermoso'),
	(1,87,'Moron'),
	(1,88,'Moreno'),
	(1,89,'Navarro'),
	(1,90,'Necochea'),
	(1,91,'Olavarria'),
	(1,92,'Patagones'),
	(1,93,'Pehuajo'),
	(1,94,'Pellegrini'),
	(1,95,'Pergamino'),
	(1,96,'Pila'),
	(1,97,'Pilar'),
	(1,98,'Pinamar'),
	(1,99,'Presidente Peron'),
	(1,100,'Puan'),
	(1,101,'Punta Indio'),
	(1,102,'Quilmes'),
	(1,103,'Ramallo'),
	(1,104,'Rauch'),
	(1,105,'Rivadavia'),
	(1,106,'Rojas'),
	(1,107,'Roque Perez'),
	(1,108,'Saavedra'),
	(1,109,'Saladillo'),
	(1,110,'Salliquelo'),
	(1,111,'Salto'),
	(1,112,'San Andres de Giles'),
	(1,113,'San Antonio de Areco'),
	(1,114,'San Cayetano'),
	(1,115,'San Fernando'),
	(1,116,'San Isidro'),
	(1,117,'San Miguel'),
	(1,118,'San Nicolas'),
	(1,119,'San Pedro'),
	(1,120,'San Vicente'),
	(1,121,'Suipacha'),
	(1,122,'Tandil'),
	(1,123,'Tapalque'),
	(1,124,'Tigre'),
	(1,125,'Tordillo'),
	(1,126,'Tornquist'),
	(1,127,'Trenque Lauquen'),
	(1,128,'Tres Arroyos'),
	(1,129,'Tres de Febrero'),
	(1,130,'Tres Lomas'),
	(1,131,'Vicente Lopez'),
	(1,132,'Villa Gesell'),
	(1,133,'Villarino'),
	(1,134,'Zarate'),
	(5,1,'Calamuchita'),
	(5,2,'Capital'),
	(5,3,'Colon'),
	(5,4,'Cruz del Eje'),
	(5,5,'General Roca'),
	(5,6,'General San Martin'),
	(5,7,'Ischilin'),
	(5,8,'Juarez Celman'),
	(5,9,'Marcos Juarez'),
	(5,10,'Minas'),
	(5,11,'Pocho'),
	(5,12,'Presidente Roque Saenz Peña'),
	(5,13,'Punilla'),
	(5,14,'Rio Cuarto'),
	(5,15,'Rio Primero'),
	(5,16,'Rio Seco'),
	(5,17,'Rio Segundo'),
	(5,18,'San Alberto'),
	(5,19,'San Javier'),
	(5,20,'San Justo'),
	(5,21,'Santa Maria'),
	(5,22,'Sobremonte'),
	(5,23,'Tercero Arriba'),
	(5,24,'Totoral'),
	(5,25,'Tulumba'),
	(5,26,'Union')
go

----------------------------------

create table clientes
(
    id_cliente      integer         not null    identity (1,1),
    nombre          varchar (50)    not null,
    apellido        varchar (50)    not null,
    dni             integer         not null,
    mail            varchar (50)    not null,
    telefono        varchar (20)    not null,
    fecha_ingreso   date            not null    default getdate(),
    id_provincia    tinyint         not null,
    id_localidad    smallint        not null,
    direccion       varchar(50)     not null,

    constraint pk__clientes__end primary key (id_cliente),
    constraint uq__clientes__1__end unique (dni),
    constraint fk__clientes__localidades__1__end foreign key (id_provincia,id_localidad)
                references localidades (id_provincia, id_localidad)
)
go

insert into clientes(nombre,apellido,dni,mail,telefono,id_provincia,id_localidad,direccion) values
  ('Emiliano','Redondo','11111111','eredondo@gmail.com','3512262941',5,2,'Donato Alvarez 380'),
  ('Rodrigo','Castro','11111112','rcastro@gmail.com','3515456466',5,2,'Arrambide 6239'),
  ('Valentina','Elizondo','11111113','velizondo@gmail.com','3515433942',5,5,'Uriburu 6239'),
  ('Marino','Lopez','11111114','lopezm@gmail.com','355433942',1,4,'Josefe 6239'),
  ('Franco','di Bartolo','11111115','fdibart@gmail.com','3513354342',1,5,'Chochi 6239')
go
-----------------------------------------------------------------------

create table adhesiones_planes
(
    id_adhesion_plan      integer     not null    identity(1,1),
    identificador_gob     varchar(20) null		default('NUEVOCOMPRADOR'),
    id_cliente            integer     not null,
    id_plan               smallint    not null,
    id_marca              smallint    not null,
    id_modelo             smallint    not null,
    id_version            tinyint     not null,
    id_auto               integer     null,
    fecha_suscripcion     date        not null    default getdate(),

    constraint pk__adhesiones_planes__end primary key(id_adhesion_plan),
    constraint fk__adhesiones_planes__versiones__1__end foreign key (id_marca,id_modelo,id_version)
          references versiones(id_marca,id_modelo,id_version),
    constraint fk__adhesiones_planes__planes__1__end foreign key (id_plan)
          references planes (id_plan),
    constraint fk__adhesiones_planes__autos__1__end foreign key (id_auto)
          references autos(id_auto),
    constraint fk__adhesiones_planes__clientes__1__end foreign key (id_cliente)
          references clientes(id_cliente)
)
go

insert into adhesiones_planes(id_cliente,id_plan,id_marca,id_modelo,id_version,id_auto) values
    (1,1,3,1,1,1),
    (2,1,3,1,2,2),
    (3,1,6,1,1,null),--3
    (4,1,7,1,1,5),
    (5,1,7,3,1,7)
go

select * from adhesiones_planes
go

----------------------------------------------------------------------- 

drop procedure set_token
go

create procedure set_token(@dni integer, @token varchar(20))
as
begin

    declare @idCli integer
    set @idCli = (select top 1 id_cliente from clientes where dni = @dni)

    update adhesiones_planes
       set identificador_gob = @token
     where id_cliente = @idCli

end
go

-------------------------------------
create table medios_pago
(
    id_medio_pago   tinyint     not null  identity(1,1) primary key,
    nombre          varchar(50) not null,
)
go

insert into medios_pago (nombre) values
    ('T. Credito Visa'),
    ('T. Credito Mastercard'),
    ('Efectivo'),
    ('MercadoPago')
go

-----------------------------------------------------------------------

create table cuotas
(
    id_adhesion_plan  integer     not null,
    id_cuota          smallint    not null,
    fecha_vencimiento date        not null,
    fecha_pago        date        null,
    id_medio_pago     tinyint     null,

    constraint pk__cuotas__end primary key (id_cuota, id_adhesion_plan),
    constraint fk__cuotas__adhesiones_planes__1__end foreign key (id_adhesion_plan)
        references adhesiones_planes (id_adhesion_plan),
    constraint fk__cuotas__medios_pago__1__end foreign key(id_medio_pago)
        references medios_pago (id_medio_pago)
)
go

insert into cuotas(id_adhesion_plan,id_cuota,fecha_vencimiento,fecha_pago,id_medio_pago) values
  (1,1,'20-01-2016','10-01-2016',1),
  (1,2,'20-02-2016','10-02-2016',1),
  (1,3,'20-03-2016','10-03-2016',1),
  (1,4,'20-04-2016','10-04-2016',1),
  (1,5,'20-05-2016','10-05-2016',1),
  (1,6,'20-06-2016','10-06-2016',1),
  (1,7,'20-07-2016','10-07-2016',1),
  (1,8,'20-08-2016','10-08-2016',1),
  (1,9,'20-09-2016','10-09-2016',1),
  (1,10,'20-10-2016','10-10-2016',1),
  (1,11,'20-11-2016','10-11-2016',1),
  (1,12,'20-12-2016','10-12-2016',1),
  (1,13,'20-01-2017','10-01-2017',1),
  (1,14,'20-02-2017',null,null),
  (1,15,'20-03-2017',null,null),
  (1,16,'20-04-2017',null,null),
  (1,17,'20-05-2017',null,null),
  (1,18,'20-06-2017',null,null),
  (1,19,'20-07-2017',null,null),
  (1,20,'20-08-2017',null,null),
  (1,21,'20-09-2017',null,null),
  (1,22,'20-10-2017',null,null),
  (1,23,'20-11-2017',null,null),
  (1,24,'20-12-2017',null,null),
  (1,25,'20-01-2018',null,null),
  (1,26,'20-02-2018',null,null),
  (1,27,'20-03-2018',null,null),
  (1,28,'20-04-2018',null,null),
  (1,29,'20-05-2018',null,null),
  (1,30,'20-06-2018',null,null),
  (1,31,'20-07-2018',null,null),
  (1,32,'20-08-2018',null,null),
  (1,33,'20-09-2018',null,null),
  (1,34,'20-10-2018',null,null),
  (1,35,'20-11-2018',null,null),
  (1,36,'20-12-2018',null,null),
  (1,37,'20-01-2019',null,null),
  (1,38,'20-02-2019',null,null),
  (1,39,'20-03-2019',null,null),
  (1,40,'20-04-2019',null,null),
  (1,41,'20-05-2019',null,null),
  (1,42,'20-06-2019',null,null),
  (1,43,'20-07-2019',null,null),
  (1,44,'20-08-2019',null,null),
  (1,45,'20-09-2019',null,null),
  (1,46,'20-10-2019',null,null),
  (1,47,'20-11-2019',null,null),
  (1,48,'20-12-2019',null,null),
  (1,49,'20-01-2020',null,null),
  (1,50,'20-02-2020',null,null),
  (1,51,'20-03-2020',null,null),
  (1,52,'20-04-2020',null,null),
  (1,53,'20-05-2020',null,null),
  (1,54,'20-06-2020',null,null),
  (1,55,'20-07-2020',null,null),
  (1,56,'20-08-2020',null,null),
  (1,57,'20-09-2020',null,null),
  (1,58,'20-10-2020',null,null),
  (1,59,'20-11-2020',null,null),
  (1,60,'20-12-2020',null,null)
go

insert into cuotas(id_adhesion_plan,id_cuota,fecha_vencimiento,fecha_pago,id_medio_pago) values
  (2,1, '20-08-2014','10-08-2014',1),
  (2,2, '20-09-2014','10-09-2014',1),
  (2,3, '20-10-2014','10-10-2014',1),
  (2,4, '20-11-2014','10-11-2014',1),
  (2,5, '20-12-2014','10-12-2014',1),
  (2,6, '20-01-2015','10-01-2015',1),
  (2,7, '20-02-2015','10-02-2015',1),
  (2,8, '20-03-2015','10-03-2015',1),
  (2,9, '20-04-2015','10-04-2015',1),
  (2,10,'20-05-2015','10-05-2015',1),
  (2,11,'20-06-2015','10-06-2015',1),
  (2,12,'20-07-2015','10-07-2015',1),
  (2,13,'20-08-2015','10-08-2015',1),
  (2,14,'20-09-2015','10-09-2015',1),
  (2,15,'20-10-2015','10-10-2015',1),
  (2,16,'20-11-2015','10-11-2015',1),
  (2,17,'20-12-2015','10-12-2015',1),
  (2,18,'20-01-2016','10-01-2016',1),
  (2,19,'20-02-2016','10-02-2016',1),
  (2,20,'20-03-2016','10-03-2016',1),
  (2,21,'20-04-2016','10-04-2016',1),
  (2,22,'20-05-2016','10-05-2016',1),
  (2,23,'20-06-2016','10-06-2016',1),
  (2,24,'20-07-2016','10-07-2016',1),
  (2,25,'20-08-2016','10-08-2016',1),
  (2,26,'20-09-2016','10-09-2016',1),
  (2,27,'20-10-2016','10-10-2016',1),
  (2,28,'20-11-2016','10-11-2016',1),
  (2,29,'20-12-2016','10-12-2016',1),
  (2,30,'20-01-2017','10-01-2016',1),
  (2,31,'20-02-2017','10-02-2016',1),
  (2,32,'20-03-2017',null,null),
  (2,33,'20-04-2017',null,null),
  (2,34,'20-05-2017',null,null),
  (2,35,'20-06-2017',null,null),
  (2,36,'20-07-2017',null,null),
  (2,37,'20-08-2017',null,null),
  (2,38,'20-09-2017',null,null),
  (2,39,'20-10-2017',null,null),
  (2,40,'20-11-2017',null,null),
  (2,41,'20-12-2017',null,null),
  (2,42,'20-01-2018',null,null),
  (2,43,'20-02-2018',null,null),
  (2,44,'20-03-2018',null,null),
  (2,45,'20-04-2018',null,null),
  (2,46,'20-05-2018',null,null),
  (2,47,'20-06-2018',null,null),
  (2,48,'20-07-2018',null,null),
  (2,49,'20-08-2018',null,null),
  (2,50,'20-09-2018',null,null),
  (2,51,'20-10-2018',null,null),
  (2,52,'20-11-2018',null,null),
  (2,53,'20-12-2018',null,null),
  (2,54,'20-01-2019',null,null),
  (2,55,'20-02-2019',null,null),
  (2,56,'20-03-2019',null,null),
  (2,57,'20-04-2019',null,null),
  (2,58,'20-05-2019',null,null),
  (2,59,'20-06-2019',null,null),
  (2,60,'20-07-2019',null,null)
go

insert into cuotas(id_adhesion_plan,id_cuota,fecha_vencimiento,fecha_pago,id_medio_pago) values
  (3,1, '20-08-2014','10-08-2014',1),
  (3,2, '20-09-2014','10-09-2014',1),
  (3,3, '20-10-2014','10-10-2014',1),
  (3,4, '20-11-2014','10-11-2014',1),
  (3,5, '20-12-2014','10-12-2014',1),
  (3,6, '20-01-2015','10-01-2015',1),
  (3,7, '20-02-2015','10-02-2015',1),
  (3,8, '20-03-2015','10-03-2015',1),
  (3,9, '20-04-2015','10-04-2015',1),
  (3,10,'20-05-2015','10-05-2015',1),
  (3,11,'20-06-2015','10-06-2015',1),
  (3,12,'20-07-2015','10-07-2015',1),
  (3,13,'20-08-2015','10-08-2015',1),
  (3,14,'20-09-2015','10-09-2015',1),
  (3,15,'20-10-2015','10-10-2015',1),
  (3,16,'20-11-2015','10-11-2015',1),
  (3,17,'20-12-2015','10-12-2015',1),
  (3,18,'20-01-2016','10-01-2016',1),
  (3,19,'20-02-2016','10-02-2016',1),
  (3,20,'20-03-2016','10-03-2016',1),
  (3,21,'20-04-2016','10-04-2016',1),
  (3,22,'20-05-2016','10-05-2016',1),
  (3,23,'20-06-2016','10-06-2016',1),
  (3,24,'20-07-2016','10-07-2016',1),
  (3,25,'20-08-2016','10-08-2016',1),
  (3,26,'20-09-2016','10-09-2016',1),
  (3,27,'20-10-2016','10-10-2016',1),
  (3,28,'20-11-2016','10-11-2016',1),
  (3,29,'20-12-2016','10-12-2016',1),
  (3,30,'20-01-2017','10-01-2017',1),
  (3,31,'20-02-2017','10-02-2017',1),
  (3,32,'20-03-2017',null,null),
  (3,33,'20-04-2017',null,null),
  (3,34,'20-05-2017',null,null),
  (3,35,'20-06-2017',null,null),
  (3,36,'20-07-2017',null,null),
  (3,37,'20-08-2017',null,null),
  (3,38,'20-09-2017',null,null),
  (3,39,'20-10-2017',null,null),
  (3,40,'20-11-2017',null,null),
  (3,41,'20-12-2017',null,null),
  (3,42,'20-01-2018',null,null),
  (3,43,'20-02-2018',null,null),
  (3,44,'20-03-2018',null,null),
  (3,45,'20-04-2018',null,null),
  (3,46,'20-05-2018',null,null),
  (3,47,'20-06-2018',null,null),
  (3,48,'20-07-2018',null,null),
  (3,49,'20-08-2018',null,null),
  (3,50,'20-09-2018',null,null),
  (3,51,'20-10-2018',null,null),
  (3,52,'20-11-2018',null,null),
  (3,53,'20-12-2018',null,null),
  (3,54,'20-01-2019',null,null),
  (3,55,'20-02-2019',null,null),
  (3,56,'20-03-2019',null,null),
  (3,57,'20-04-2019',null,null),
  (3,58,'20-05-2019',null,null),
  (3,59,'20-06-2019',null,null),
  (3,60,'20-07-2019',null,null)
go

insert into cuotas(id_adhesion_plan,id_cuota,fecha_vencimiento,fecha_pago,id_medio_pago) values
  (4,1, '20-08-2014','10-08-2014',1),
  (4,2, '20-09-2014','10-09-2014',1),
  (4,3, '20-10-2014','10-10-2014',1),
  (4,4, '20-11-2014','10-11-2014',1),
  (4,5, '20-12-2014','10-12-2014',1),
  (4,6, '20-01-2015','10-01-2015',1),
  (4,7, '20-02-2015','10-02-2015',1),
  (4,8, '20-03-2015','10-03-2015',1),
  (4,9, '20-04-2015','10-04-2015',1),
  (4,10,'20-05-2015','10-05-2015',1),
  (4,11,'20-06-2015','10-06-2015',1),
  (4,12,'20-07-2015','10-07-2015',1),
  (4,13,'20-08-2015','10-08-2015',1),
  (4,14,'20-09-2015','10-09-2015',1),
  (4,15,'20-10-2015','10-10-2015',1),
  (4,16,'20-11-2015','10-11-2015',1),
  (4,17,'20-12-2015','10-12-2015',1),
  (4,18,'20-01-2016','10-01-2016',1),
  (4,19,'20-02-2016','10-02-2016',1),
  (4,20,'20-03-2016','10-03-2016',1),
  (4,21,'20-04-2016','10-04-2016',1),
  (4,22,'20-05-2016','10-05-2016',1),
  (4,23,'20-06-2016','10-06-2016',1),
  (4,24,'20-07-2016','10-07-2016',1),
  (4,25,'20-08-2016','10-08-2016',1),
  (4,26,'20-09-2016','10-09-2016',1),
  (4,27,'20-10-2016','10-10-2016',1),
  (4,28,'20-11-2016','10-11-2016',1),
  (4,29,'20-12-2016','10-12-2016',1),
  (4,30,'20-01-2017','10-01-2017',1),
  (4,31,'20-02-2017','10-02-2017',1),
  (4,32,'20-03-2017',null,null),
  (4,33,'20-04-2017',null,null),
  (4,34,'20-05-2017',null,null),
  (4,35,'20-06-2017',null,null),
  (4,36,'20-07-2017',null,null),
  (4,37,'20-08-2017',null,null),
  (4,38,'20-09-2017',null,null),
  (4,39,'20-10-2017',null,null),
  (4,40,'20-11-2017',null,null),
  (4,41,'20-12-2017',null,null),
  (4,42,'20-01-2018',null,null),
  (4,43,'20-02-2018',null,null),
  (4,44,'20-03-2018',null,null),
  (4,45,'20-04-2018',null,null),
  (4,46,'20-05-2018',null,null),
  (4,47,'20-06-2018',null,null),
  (4,48,'20-07-2018',null,null),
  (4,49,'20-08-2018',null,null),
  (4,50,'20-09-2018',null,null),
  (4,51,'20-10-2018',null,null),
  (4,52,'20-11-2018',null,null),
  (4,53,'20-12-2018',null,null),
  (4,54,'20-01-2019',null,null),
  (4,55,'20-02-2019',null,null),
  (4,56,'20-03-2019',null,null),
  (4,57,'20-04-2019',null,null),
  (4,58,'20-05-2019',null,null),
  (4,59,'20-06-2019',null,null),
  (4,60,'20-07-2019',null,null)
go

insert into cuotas(id_adhesion_plan,id_cuota,fecha_vencimiento,fecha_pago,id_medio_pago) values
  (5,1, '20-08-2014','10-08-2014',1),
  (5,2, '20-09-2014','10-09-2014',1),
  (5,3, '20-10-2014','10-10-2014',1),
  (5,4, '20-11-2014','10-11-2014',1),
  (5,5, '20-12-2014','10-12-2014',1),
  (5,6, '20-01-2015','10-01-2015',1),
  (5,7, '20-02-2015','10-02-2015',1),
  (5,8, '20-03-2015','10-03-2015',1),
  (5,9, '20-04-2015','10-04-2015',1),
  (5,10,'20-05-2015','10-05-2015',1),
  (5,11,'20-06-2015','10-06-2015',1),
  (5,12,'20-07-2015','10-07-2015',1),
  (5,13,'20-08-2015','10-08-2015',1),
  (5,14,'20-09-2015','10-09-2015',1),
  (5,15,'20-10-2015','10-10-2015',1),
  (5,16,'20-11-2015','10-11-2015',1),
  (5,17,'20-12-2015','10-12-2015',1),
  (5,18,'20-01-2016','10-01-2016',1),
  (5,19,'20-02-2016','10-02-2016',1),
  (5,20,'20-03-2016','10-03-2016',1),
  (5,21,'20-04-2016','10-04-2016',1),
  (5,22,'20-05-2016','10-05-2016',1),
  (5,23,'20-06-2016','10-06-2016',1),
  (5,24,'20-07-2016','10-07-2016',1),
  (5,25,'20-08-2016','10-08-2016',1),
  (5,26,'20-09-2016','10-09-2016',1),
  (5,27,'20-10-2016','10-10-2016',1),
  (5,28,'20-11-2016','10-11-2016',1),
  (5,29,'20-12-2016',null,null),
  (5,30,'20-01-2017',null,null),
  (5,31,'20-02-2017',null,null),
  (5,32,'20-03-2017',null,null),
  (5,33,'20-04-2017',null,null),
  (5,34,'20-05-2017',null,null),
  (5,35,'20-06-2017',null,null),
  (5,36,'20-07-2017',null,null),
  (5,37,'20-08-2017',null,null),
  (5,38,'20-09-2017',null,null),
  (5,39,'20-10-2017',null,null),
  (5,40,'20-11-2017',null,null),
  (5,41,'20-12-2017',null,null),
  (5,42,'20-01-2018',null,null),
  (5,43,'20-02-2018',null,null),
  (5,44,'20-03-2018',null,null),
  (5,45,'20-04-2018',null,null),
  (5,46,'20-05-2018',null,null),
  (5,47,'20-06-2018',null,null),
  (5,48,'20-07-2018',null,null),
  (5,49,'20-08-2018',null,null),
  (5,50,'20-09-2018',null,null),
  (5,51,'20-10-2018',null,null),
  (5,52,'20-11-2018',null,null),
  (5,53,'20-12-2018',null,null),
  (5,54,'20-01-2019',null,null),
  (5,55,'20-02-2019',null,null),
  (5,56,'20-03-2019',null,null),
  (5,57,'20-04-2019',null,null),
  (5,58,'20-05-2019',null,null),
  (5,59,'20-06-2019',null,null),
  (5,60,'20-07-2019',null,null)
go

----------------------------------------------------------------------- 

create table ultimos_ganadores
(
    id_ganador              integer         not null    identity (1,1),
    nombre_concesionaria    varchar (50)    not null,
    nombre                  varchar (50)    not null,
    apellido                varchar (50)    not null,

    constraint pk__ultimos_ganadores__end primary key (id_ganador)
)
go

----------------------------------------------------------------------

create table log_errores
(
    id_error    integer         not null    identity (1,1),
    fecha       date            not null    default getdate(),
    descripcion varchar (500)   not null,

    constraint pk__log_errores__end primary key (id_error)
)
go

----------------------------------------------------------------------

drop procedure get_clientes
go

create procedure get_clientes
(
    @solicitante    varchar(100)
)
as
begin

    select distinct 
           ap.identificador_gob,
           c.nombre,
           c.apellido,
           c.dni,
           c.mail,
           p.nombre as provincia,
           l.nombre as localidad,
           c.direccion,
           m.nombre as marca,
           mo.nombre as modelo,
           v.nombre as version,
           a.dominio,
           a.num_motor,
           a.num_chasis,
           a.color,
           a.año,
           cuo.id_cuota,
           cuo.fecha_vencimiento,
           cuo.fecha_pago
      from clientes c
      join provincias p
        on c.id_provincia = p.id_provincia
 left join localidades l
        on c.id_provincia = l.id_provincia
       and c.id_localidad = l.id_localidad
      join adhesiones_planes ap
        on c.id_cliente = ap.id_cliente
      join modelos mo
        on ap.id_marca = mo.id_marca
       and ap.id_modelo = mo.id_modelo
      join versiones v
        on ap.id_marca = v.id_marca
       and ap.id_modelo = v.id_modelo
       and ap.id_version = v.id_version
      join marcas m
        on m.id_marca = ap.id_marca
 left join autos a
        on a.id_marca = ap.id_marca
       and a.id_modelo = ap.id_modelo
       and a.id_version = ap.id_version
       and a.id_auto = ap.id_auto
      join cuotas cuo
        on ap.id_adhesion_plan = cuo.id_adhesion_plan
     where @solicitante = 'GOBIERNO'
end
go

execute get_clientes 'GOBIERNO'
go

----------------------------------------------------------------------