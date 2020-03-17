select * from rental

select * into rental200505 from rental where return_date<='20050531'  --295
select * into rental200506 from rental where return_date::date between '20050601'::date and '20050630'::date  order by return_date desc --
select * into rental200507 from rental where return_date::date between '20050701'::date and '20050731'::date  order by return_date desc --
select * into rental200508 from rental where return_date::date between '20050801'::date and '20050831'::date  order by return_date desc --

select * into rental20050506 from rental where return_date::date between '20050515'::date and '20050615'::date  order by return_date desc --


select * from rental200505   --295
/*union 
select * from rental200506   --3071  --3366*/
intersect
select * from rental20050506  --1158
