CREATE TABLE producto_2(
	id serial not null primary key,
	nombre varchar(50) not null
);

create table producto_log(
	id int,
	nombre varchar(50),
	fecha_cambio timestamp default now()
);

insert into producto_2 (nombre) values
('Mandarina'),('Agua'),('Laptop'),('TV'),('Celular');
select * from producto_2;
select * from producto_2 where nombre ilike '%v'

with prod_elim as (
	delete from producto_2 where nombre ilike '%lar'
	returning *
)
insert into producto_log (id,nombre)
select * from prod_elim

select * from producto_log
select * from producto_2 where nombre ilike '%lar'


alter table producto_2 add column precio numeric(14,2) default 0;
select * from producto_2
with t as (
	update producto_2 set precio = (id*1.15) + precio
	returning *
)
--select * from producto_2
select * from t





