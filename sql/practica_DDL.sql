create schema PRACTICA_FINAL authorization svuctppe;

--Se crea la tabla coches
create table practica_final.coches (
	idcoche varchar(20) not null, --pk
	idmodelo varchar(20) not null, --fk modelo
	idcolor varchar(20) not null, --fk color
	matricula varchar(20) not null,
	total_km integer not null,
	idaseguradora varchar(20) not null, --fk aseguradora
	numero_poliza integer not null,
	fecha_compra date not null,
	fecha_baja date not null default('4000-12-31')
);
alter table practica_final.coches
add constraint coches_PK primary key (idcoche);

--Se crea la tabla revisiones
create table practica_final.revisiones (
	idcoche varchar(20) not null, --pk, fk1 coches
	idrevision varchar(20) not null, --pk
	kilometros integer not null,
	fecha_revision date not null,
	importe decimal(10,2) not null,
	idmoneda varchar(10) not null --fk moneda
);
alter table practica_final.revisiones 
add constraint revisiones_PK primary key (idcoche, idrevision);

--Se crea la tabla modelo
create table practica_final.modelo (
	idmodelo varchar(20) not null, --pk 
	nombre_modelo varchar(20) not null, 
	idmarca varchar(20) not null --fk marca
);	
alter table practica_final.modelo
add constraint modelo_PK primary key (idmodelo);

--Se crea la tabla color
create table practica_final.color (
	idcolor varchar(20) not null, --pk
	nombre_color varchar(20) not null
);
alter table practica_final.color
add constraint color_PK primary key (idcolor);

--Se crea la tabla aseguradora
create table practica_final.aseguradora (
	idaseguradora varchar(20) not null, --pk
	nombre_aseguradora varchar(20) not null
);
alter table practica_final.aseguradora
add constraint aseguradora_PK primary key (idaseguradora);

--Se crea la tabla marca
create table practica_final.marca (
	idmarca varchar(20) not null,
	nombre_marca varchar(20) not null,
	idgrupo varchar(20) not null
);
alter table practica_final.marca
add constraint marca_pk primary key (idmarca);

--Se crea la tabla grupo empresarial
create table practica_final.grupo_empresarial (
	idgrupo varchar(20) not null,
	nombre_grupo varchar(20) not null
);
alter table practica_final.grupo_empresarial
add constraint grupo_pk primary key (idgrupo);

--Se crea la tabla moneda
create table practica_final.moneda (
	idmoneda varchar(20),
	tipo_moneda varchar(20)
);
alter table practica_final.moneda
add constraint moneda_pk primary key (idmoneda);


--Creo las FK's
alter table practica_final.coches 
add constraint coches_modelo_FK foreign key (idmodelo)
references practica_final.modelo(idmodelo);

alter table practica_final.coches 
add constraint coches_color_FK foreign key (idcolor)
references practica_final.color(idcolor);

alter table practica_final.coches 
add constraint coches_aseguradora_FK foreign key (idaseguradora)
references practica_final.aseguradora(idaseguradora);

alter table practica_final.revisiones  
add constraint revisiones_coches_FK foreign key (idcoche)
references practica_final.coches(idcoche);

alter table practica_final.revisiones  
add constraint revisiones_moneda_FK foreign key (idmoneda)
references practica_final.moneda(idmoneda);

alter table practica_final.modelo  
add constraint modelo_marca_FK foreign key (idmarca)
references practica_final.marca(idmarca);

alter table practica_final.marca  
add constraint marca_grupo_FK foreign key (idgrupo)
references practica_final.grupo_empresarial(idgrupo);


--Insertando datos en tabla grupo_empresarial
insert into practica_final.grupo_empresarial  
(idgrupo, nombre_grupo)
values('001','VAN');

insert into practica_final.grupo_empresarial  
(idgrupo, nombre_grupo)
values('002','Toyota Motors');

insert into practica_final.grupo_empresarial  
(idgrupo, nombre_grupo)
values('003','Mercedes-Benz AG');


--Insertando datos en tabla marca
insert into practica_final.marca  
(idmarca, nombre_marca, idgrupo)
values('ma01','Volkswagen','001');

insert into practica_final.marca  
(idmarca, nombre_marca, idgrupo)
values('ma02','Toyota','002');

insert into practica_final.marca  
(idmarca, nombre_marca, idgrupo)
values('ma03','Mercedes','003');


--Insertando datos en tabla modelo
insert into practica_final.modelo  
(idmodelo, nombre_modelo, idmarca)
values('mo01','Golf','ma01');

insert into practica_final.modelo  
(idmodelo, nombre_modelo, idmarca)
values('mo02','Polo','ma01');

insert into practica_final.modelo  
(idmodelo, nombre_modelo, idmarca)
values('mo03','Corolla','ma02');

insert into practica_final.modelo  
(idmodelo, nombre_modelo, idmarca)
values('mo04','clase A','ma03');


--Insertando datos en tabla color
insert into practica_final.color  
(idcolor, nombre_color)
values('bl01','blanco');

insert into practica_final.color  
(idcolor, nombre_color)
values('ne01','negro');

insert into practica_final.color  
(idcolor, nombre_color)
values('gr01','gris metal');


--Insertando datos en tabla aseguradora
insert into practica_final.aseguradora 
(idaseguradora, nombre_aseguradora)
values('ase001','mapfre');

insert into practica_final.aseguradora 
(idaseguradora, nombre_aseguradora)
values('ase002','allianz');


--Insertando datos en tabla coches
insert into practica_final.coches  
(idcoche, idmodelo, idcolor, matricula, total_km, idaseguradora, numero_poliza, fecha_compra, fecha_baja)
values('flo001','mo01','bl01','1254 BDC',120000,'ase001',1200,'2020-06-22','2022-12-05');

insert into practica_final.coches  
(idcoche, idmodelo, idcolor, matricula, total_km, idaseguradora, numero_poliza, fecha_compra, fecha_baja)
values('flo002','mo04','bl01','2544 MMM',14500,'ase002',6000,'2021-04-25','4000-12-31');

insert into practica_final.coches  
(idcoche, idmodelo, idcolor, matricula, total_km, idaseguradora, numero_poliza, fecha_compra, fecha_baja)
values('flo003','mo02','ne01','8894 GHI',2500,'ase001',1201,'2022-03-12','4000-12-31');

insert into practica_final.coches  
(idcoche, idmodelo, idcolor, matricula, total_km, idaseguradora, numero_poliza, fecha_compra, fecha_baja)
values('flo004','mo03','gr01','2265 ZZI',17000,'ase002',2458,'2021-07-14','4000-12-31');

insert into practica_final.coches  
(idcoche, idmodelo, idcolor, matricula, total_km, idaseguradora, numero_poliza, fecha_compra, fecha_baja)
values('flo005','mo01','ne01','9864 OPI',6400,'ase001',3369,'2022-05-12','4000-12-31');


--Insertando datos en tabla moneda
insert into practica_final.moneda 
(idmoneda, tipo_moneda)
values('01','EURO');

insert into practica_final.moneda 
(idmoneda, tipo_moneda)
values('02','DOLAR');


--Insertando datos en tabla revisiones
insert into practica_final.revisiones  
(idcoche, idrevision, kilometros, fecha_revision, importe, idmoneda)
values('flo001','001','10000','2021-11-12','4000','01');

insert into practica_final.revisiones  
(idcoche, idrevision, kilometros, fecha_revision, importe, idmoneda)
values('flo001','002','25000','2021-01-09','4300','01');

insert into practica_final.revisiones  
(idcoche, idrevision, kilometros, fecha_revision, importe, idmoneda)
values('flo001','003','50500','2022-03-17','5000','01');

insert into practica_final.revisiones  
(idcoche, idrevision, kilometros, fecha_revision, importe, idmoneda)
values('flo001','004','100000','2022-10-24','5400','01');

insert into practica_final.revisiones  
(idcoche, idrevision, kilometros, fecha_revision, importe, idmoneda)
values('flo002','001','10000','2021-10-24','4200','01');

















