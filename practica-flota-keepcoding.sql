create schema alveronicaflota_dll authorization gxghytif;  --miusuario



--- 1. Cars and its referenced tables

-- business group

create table alveronicaflota_dll.group(
	id_group varchar(20)  not null, --PK
	name_group varchar(200) not null
	
);

--PK (primary key)vadded to group

alter table alveronicaflota_dll.group
add constraint id_group_PK primary key(id_group);


-- brand 

create table alveronicaflota_dll.brand(
	id_brand varchar(20)  not null, --PK
	name_brand varchar(200) not null,
	id_group varchar(20) not null --FK
);

--PK (primary key)vadded to brand

alter table alveronicaflota_dll.brand
add constraint id_brand_PK primary key(id_brand);
--  FK (foreing key) added to group

alter table alveronicaflota_dll.brand
add constraint brand_FK foreign key(id_group)
references alveronicaflota_dll.group(id_group);

/* */
--model

create table alveronicaflota_dll.model(
	id_model varchar(20)  not null, --PK
	name_model varchar(200) not null,
	id_brand varchar(20) not null --FK
);

--PK (primary key) added to moodel

alter table alveronicaflota_dll.model
add constraint id_model_PK primary key(id_model);

--  FK (foreing key) added to model

alter table alveronicaflota_dll.model
add constraint model_FK foreign key(id_brand)
references alveronicaflota_dll.brand(id_brand);



-- color
create table alveronicaflota_dll.color(
	id_color varchar(50)  not null, --PK
	name_color varchar(200) not null
);

--PK (primary key) added to model

alter table alveronicaflota_dll.color
add constraint id_color_PK primary key(id_color);

-- type currency

create table alveronicaflota_dll.type_currency(
	type_currency varchar(50)  not null, --PK
	name_currency varchar(200) not null,
	description_currency varchar(512) null
);

--PK (primary key)vadded to type_currency

alter table alveronicaflota_dll.type_currency
add constraint id_type_currency_PK primary key(type_currency);

-- type status

create table alveronicaflota_dll.type_status(
	type_status varchar(50)  not null, --PK
	name_status varchar(200) not null,
	description_status varchar(512) null
);

--PK (primary key)vadded to type_status

alter table alveronicaflota_dll.type_status
add constraint id_type_status_PK primary key(type_status);

-- insurance company

create table alveronicaflota_dll.insurance_company(
	id_insure_company varchar(50)  not null, --PK
	name_insurance_company varchar(200) not null
);
--PK (primary key) added to insurance company

alter table alveronicaflota_dll.insurance_company
add constraint id_insurance_company_PK primary key(id_insure_company);

--insurance
create table alveronicaflota_dll.insurance(
	id_insurance varchar(50)  not null, --PK
	id_insure_company varchar(200) not null,
	id_policy varchar(200) not null --FK
);
--PK (primary key) added to insurance

alter table alveronicaflota_dll.insurance
add constraint id_insurance_PK primary key(id_insurance);
--  FK (foreing key) added to insurence

alter table alveronicaflota_dll.insurance
add constraint insurance_FK foreign key(id_insure_company)
references alveronicaflota_dll.insurance_company(id_insure_company);


-- Car service tech
create table alveronicaflota_dll.service(
	id_service varchar(50)  not null, --PK
	service_km varchar(200) not null,
	dt_service date not null,
	service_fee integer not null,
	type_currency varchar(50) not null --FK, 
	
);
--PK (primary key) added to servic

alter table alveronicaflota_dll.service
add constraint id_service_PK primary key(id_service);


--FK1
alter table alveronicaflota_dll.service
add constraint service_currency_FK foreign key(type_currency)
references alveronicaflota_dll.type_currency(type_currency);



-- cars //me quedo aqui crear pk fk de aqui y el de service car
create table alveronicaflota_dll.cars(
	id_car varchar(50) not null, --PK
	id_model varchar(20) not null, --FK1
	id_color varchar(50) not null, --FK2
	licence_plate varchar(100) not null,
	total_km varchar(100) not null,
	dt_registration date not null,
    id_insurance varchar(50) not null, --FK3
	type_status varchar(50) not null, --FK4,
	type_currency varchar(50) not null, --FK5,
	id_service varchar(50)  not null, --FK6
    initial_fee integer not null

);

--PK (primary key) added to car

alter table alveronicaflota_dll.cars
add constraint id_car_PK primary key(id_car);

--FK1 --cars -> models
alter table alveronicaflota_dll.cars
add constraint car_model_FK foreign key(id_model)
references alveronicaflota_dll.model(id_model);

--FK2--cars -> color
alter table alveronicaflota_dll.cars
add constraint car_color_FK foreign key(id_color)
references alveronicaflota_dll.color(id_color);

--FK3--cars -> Insurance

alter table alveronicaflota_dll.cars
add constraint car_insurance_FK foreign key(id_insurance)
references alveronicaflota_dll.insurance(id_insurance);

--FK4--cars -> Type Status

alter table alveronicaflota_dll.cars
add constraint car_type_status_FK foreign key(type_status)
references alveronicaflota_dll.type_status(type_status);

--FK5--cars -> Type Currency

alter table alveronicaflota_dll.cars
add constraint car_type_currency_FK foreign key(type_currency)
references alveronicaflota_dll.type_currency(type_currency);

--FK6--cars -> Service Tech  
-- TODO, FIX ERROR
alter table alveronicaflota_dll.cars
add constraint car_id_service_FK foreign key(id_service)
references alveronicaflota_dll.service(id_service);

--insert status  data
insert into alveronicaflota_dll.type_status values ('s02','active','status is active');
insert into alveronicaflota_dll.type_status (type_status,name_status,description_status) values('s01','not_active','status is not active');

-- select * from alveronicaflota_dll.type_status

--insert currency data

insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c001','Euro','€ - euro');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c002','Dollar','$ - dollar');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c003','Pound','£ - pound');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c004',' Dirham','DH - dirham');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c005',' Rupee','Re - rupee');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c006',' Franc','Fr - franc');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c007',' Dinar','Kd - dinar');
insert into alveronicaflota_dll.type_currency (type_currency ,name_currency,description_currency) values('c008',' Rupee','₹ - rupee');

--insert color  data

insert into alveronicaflota_dll.color (id_color ,name_color) values('col001','white');
insert into alveronicaflota_dll.color (id_color ,name_color) values('col002','black');
insert into alveronicaflota_dll.color (id_color ,name_color) values('col003','red');
insert into alveronicaflota_dll.color (id_color ,name_color) values('col004','gray');
insert into alveronicaflota_dll.color (id_color ,name_color) values('col005','blue');
insert into alveronicaflota_dll.color (id_color ,name_color) values('col006','yellow');
-- insert bussines group data
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge001','Grupo Volkswagen');
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge002','Honda Motor Company');
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge003','Hyundai Motor Company');
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge004','Tata Group');
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge005','Daimler');
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge006','BMW Group');
insert into alveronicaflota_dll.group (id_group ,name_group) values('ge007','Ford');
-- insert brand data
insert into alveronicaflota_dll.brand ( id_brand,name_brand,id_group) values ('b10001','RollsRoice','ge006');
insert into alveronicaflota_dll.brand ( id_brand,name_brand,id_group) values ('b10002','MINI','ge006');
insert into alveronicaflota_dll.brand ( id_brand,name_brand,id_group) values ('b10003','BMW','ge006');
insert into alveronicaflota_dll.brand ( id_brand,name_brand,id_group) values ('b20001','Ford','ge007');
insert into alveronicaflota_dll.brand ( id_brand,name_brand,id_group) values ('b20002','Lincon','ge007');




-- insert model data
insert into alveronicaflota_dll.model  (id_model,name_model,id_brand) values('m0001','Volkswagen','b10001');
insert into alveronicaflota_dll.model  (id_model,name_model,id_brand) values('m0004','BMW','b10003');
insert into alveronicaflota_dll.model  (id_model,name_model,id_brand) values('m0005','MINI','b10002');
insert into alveronicaflota_dll.model (id_model,name_model,id_brand) values('m0006','Rolls-Roice','b10001');

-- insert insurance company data
insert into alveronicaflota_dll.insurance_company  (id_insure_company,name_insurance_company) values('i0001','La Mutua');
insert into alveronicaflota_dll.insurance_company  (id_insure_company,name_insurance_company) values('i0002','Pelayo');
insert into alveronicaflota_dll.insurance_company  (id_insure_company,name_insurance_company) values('i0003','Allianz');
insert into alveronicaflota_dll.insurance_company  (id_insure_company,name_insurance_company) values('i0004','Axa');

-- insert insurance  data 
insert into alveronicaflota_dll.insurance  (id_insurance,id_insure_company,id_policy) values ('intodoriesgofran001','i0001','p00000001');
insert into alveronicaflota_dll.insurance  (id_insurance,id_insure_company,id_policy) values ('intodoriesgosinfran002','i0001','p00000002');
insert into alveronicaflota_dll.insurance  (id_insurance,id_insure_company,id_policy) values ('interceros0002','i0002','p00000001');
insert into alveronicaflota_dll.insurance  (id_insurance,id_insure_company,id_policy) values ('intercerosfran0002','i0002','p00000002');
insert into alveronicaflota_dll.insurance  (id_insurance,id_insure_company,id_policy) values ('interceros0003','i0003','p00000001');
insert into alveronicaflota_dll.insurance  (id_insurance,id_insure_company,id_policy) values ('interceros0004','i0004','p00000001');

-- insert service  data 

insert into alveronicaflota_dll.service  (id_service,service_km,dt_service,service_fee,type_currency)  values ('s00001','4500','1/1/2023','4000','c001');

insert into alveronicaflota_dll.service  (id_service,service_km,dt_service,service_fee,type_currency)  values ('s00002','4500','1/1/2022','2000','c001');


-- insert car
	insert into alveronicaflota_dll.cars (id_car,id_model,id_color,licence_plate,total_km,dt_registration,id_insurance,type_status,type_currency,id_service,initial_fee) values ('car000003','m0001','col001','3434 ABC','2000','1/1/2011','intercerosfran0002','s02','c003','s00001','15000');
	--insert into alveronicaflota_dll.cars (id_car,id_model,id_color,licence_plate,total_km,dt_registration,id_insurance,type_status,type_currency,id_service,initial_fee) values ('car000002','m0002','col002','2730 GKO','2000','1/1/2019','intercerosfran0002','s02','c001','s00002','15000');




