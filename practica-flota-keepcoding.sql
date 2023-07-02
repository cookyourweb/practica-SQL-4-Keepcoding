
/*
 *     Practica Modelado y SQL. Keepcoding. 1  Parte
 * 
 */


  CREATE SCHEMA   practicasqlKCReentrega  AUTHORIZATION gxghytif;  --Para  generar  cambiar el usuario  'gxghytif' por  el propio

/* --------------------------------------------- */
/* Flota de coches                               */
/* --------------------------------------------- */

/* --------------------------------------------- */
/* Grupo Empresarial                 */
/* --------------------------------------------- */

create table practicasqlKCReentrega.group  (
    id_group SERIAL not null, /* PK tipo autonumerico*/  
    name_group varchar(200) not null,
    description_group varchar(512) null
);
--PK (primary key) added to insurance
alter table practicasqlKCReentrega.group
add constraint group_PK primary key (id_group);

--  FK (foreing key) added to insurence
insert into practicasqlKCReentrega.group (name_group, description_group) values('Grupo Volkswagen','Descripcion');
insert into practicasqlKCReentrega.group (name_group, description_group) values('Honda','Descripcion');


/* ------------- */
/* Marcas        */
/* ------------- */


create table practicasqlKCReentrega.brand(
    id_brand SERIAL not null, /* PK tipo autonumerico*/
    name_brand varchar(200) not null,
    id_group int not null, /*is FK*/
    description_group varchar(512) null
);
--PK (primary key) added to insurance
alter table practicasqlKCReentrega.brand
add constraint brand_PK primary key (id_brand);
--  FK (foreing key) added to insurence
alter table  practicasqlKCReentrega.brand
add constraint brand_FK foreign key (id_group) references practicasqlKCReentrega.group(id_group);

insert into practicasqlKCReentrega.brand(name_brand, id_group, description_group) values ('Grupo Volkswagen',1, NULL);
insert into practicasqlKCReentrega.brand(name_brand, id_group) values ('Audi',1);
insert into practicasqlKCReentrega.brand(name_brand, id_group) values ('SEAT',1);
insert into practicasqlKCReentrega.brand(name_brand, id_group) values ('ŠKODA',1);

insert into practicasqlKCReentrega.brand(name_brand, id_group) values ('Acura',2);
insert into practicasqlKCReentrega.brand(name_brand, id_group) values ('Honda',2);

/* --------------------------------------------- */
/* Modelos                                       */
/* --------------------------------------------- */

create table practicasqlKCReentrega.model(
    id_model SERIAL not null, /* tipo autonumerico*/
    id_brand  int not null, /*is FK*/
    name_model varchar(200) not null,
    description_model varchar(512) null 
);

--PK (primary key) added to insurance
alter table practicasqlKCReentrega.model
add constraint model_PK primary key (id_model);
--  FK (foreing key) added to insurence
alter table  practicasqlKCReentrega.model
add constraint model_FK foreign key (id_brand) references practicasqlKCReentrega.brand(id_brand);


insert into practicasqlKCReentrega.model  (name_model, id_brand,description_model) values ('Bentley', 1, 'Bentley description');
insert into practicasqlKCReentrega.model  (name_model, id_brand,description_model) values ('Passat', 1,  'Passat  description');


/* ------------------------------------- */
/* Aseguradora                           */
/* ------------------------------------- */

create table practicasqlKCReentrega.insurance_company(
    id_insurance_company SERIAL not null, /* tipo autonumerico*/
    name_insurance_company varchar(200) not null
);
--PK (primary key) added to insurance
alter table practicasqlKCReentrega.insurance_company
add constraint insurance_company_PK primary key (id_insurance_company);


insert into practicasqlKCReentrega.insurance_company (name_insurance_company) values ('Pelayo');
insert into practicasqlKCReentrega.insurance_company (name_insurance_company) values ('La Mutua');
insert into practicasqlKCReentrega.insurance_company (name_insurance_company) values ('Axa');


/* ------------------------------------- */
/* Poliza  seguro                        */
/* ------------------------------------- */

create table practicasqlKCReentrega.policy(
	id_policy SERIAL not null, /* tipo autonumerico*/
	id_insurance_company int not null, /*is FK*/
	num_policy varchar(200) not null 
);


--PK (primary key) added to policy

alter table practicasqlKCReentrega.policy
add constraint id_policy_PK primary key(id_policy);


--  FK (foreing key) added to insurence

alter table  practicasqlKCReentrega.policy
add constraint policy_FK foreign key (id_insurance_company) references practicasqlKCReentrega.insurance_company(id_insurance_company);

insert into practicasqlKCReentrega.policy  (id_insurance_company,num_policy) values (1, 'A11111111111');

/* ----------------------- */
/* Color                 */
/* ----------------------- */

create table practicasqlKCReentrega.color(
    id_color SERIAL not null, /* tipo autonumerico*/
    name_color varchar(200) not null
);
--PK (primary key) added to policy
alter table practicasqlKCReentrega.color
add constraint color_PK primary key (id_color);

insert into practicasqlKCReentrega.color (name_color) values ('Blanco');
insert into practicasqlKCReentrega.color (name_color) values ('Negro');  
insert into practicasqlKCReentrega.color (name_color) values ('Rojo');
insert into practicasqlKCReentrega.color (name_color) values ('Azul');      
insert into practicasqlKCReentrega.color (name_color) values ('Verde');



/* --------------------------------------------- */
/* Tipo moneda                                  */
/* --------------------------------------------- */

create table practicasqlKCReentrega.currency(
    id_currency varchar(10) not null, 
 name_currency varchar(200) not null,
    description_currency varchar(512) null 
);
--PK (primary key) added to policy
alter table practicasqlKCReentrega.currency
add constraint currency_PK primary key (id_currency);


insert into practicasqlKCReentrega.currency (id_currency, name_currency) values ('EUR', 'Euro');
insert into practicasqlKCReentrega.currency (id_currency, name_currency) values ('DOL', 'Dolar');


/* -------------------- */
/* Coches  KeepCoding            */
/* -------------------- */


create table practicasqlKCReentrega.kc_cars(
    id_kc_cars SERIAL not null, /* PK, autonumeric*/
    id_model int not null, --FK . modelo coche
    dt_registration date not null,
    dt_termination date null default '4000-01-01',
    licence_plate varchar(20) not null,
    id_color int not null, --FK - colores
    poli int null default 0,
    id_insurance_company int not null, -- FK- aseguradora
    description_kc_cars varchar(512) null
);

--PK
alter table practicasqlKCReentrega.kc_cars
add constraint kc_cars_PK primary key (id_kc_cars);

--FK modelo
alter table  practicasqlKCReentrega.kc_cars
add constraint kc_cars_model_FK foreign key (id_model) references practicasqlKCReentrega.model(id_model);

--FK colores
alter table  practicasqlKCReentrega.kc_cars
add constraint kc_cars_color_FK foreign key (id_color) references practicasqlKCReentrega.color(id_color);

--FK aseguradoras
alter table  practicasqlKCReentrega.kc_cars
add constraint kc_cars_aseguradora_FK foreign key (id_insurance_company) references practicasqlKCReentrega.insurance_company(id_insurance_company);



insert into practicasqlKCReentrega.kc_cars (id_model, dt_registration, licence_plate, id_color, tot_kms, id_insurance_company) values (1, '2022-08-01','2234 LZV', 2, 850,1);
insert into practicasqlKCReentrega.kc_cars (id_model, dt_registration, licence_plate, id_color, tot_kms, id_insurance_company) values (1, '2022-09-21','2345 GFH', 1, 1200,1);
insert into practicasqlKCReentrega.kc_cars (id_model, dt_registration, dt_termination, licence_plate, id_color, tot_kms, id_insurance_company) values (1, '2022-09-21','2023-09-21','454 TTT', 1, 1200,1);

/* -------------------- */
/* Revisiones           */
/* -------------------- */


create table practicasqlKCReentrega.car_service(
    
    id_car_service SERIAL not null,
    id_kc_cars  int not null, --FK .  coche
    dt_revision date not null,  
    initial_fee decimal not null,
    id_currency varchar(20) not null, --FK
    kms int not null,
    description_car_service varchar(512) null
);


--PK

alter table practicasqlKCReentrega.car_service
add constraint car_service_PK primary key (id_car_service);

--FK coches kc

alter table  practicasqlKCReentrega.car_service
add constraint car_service_FK foreign key (id_kc_cars) references practicasqlKCReentrega.kc_cars(id_kc_cars);

--FK currency  carservice

alter table  practicasqlKCReentrega.car_service
add constraint currency_car_FK foreign key (id_currency) references practicasqlKCReentrega.currency(id_currency);

insert into practicasqlKCReentrega.car_service values (1, 1,'2022-01-01', 350.5, 'EUR', 800, 'Descripcion de la revision');
insert into practicasqlKCReentrega.car_service values (2, 2,'2022-01-01', 300, 'EUR', 1200, 'Descripcion de la revision');

