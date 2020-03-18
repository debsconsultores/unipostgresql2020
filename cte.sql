select payment_date,count(amount) as monto
	from payment
	group by payment_date --14365
	having count(amount)<>1 --51

select * from (
	select payment_date,count(amount) as grp
		from payment
		group by payment_date 
	) grupo
	where grupo.grp>1
	
with fecha_duplicada as
(
	select payment_date,count(amount) as grp
		from payment
		group by payment_date 
)
select * from fecha_duplicada as f
	where f.grp<>1;
	

with cte_staff as (
select
	staff_id,
	count(rental_id) as conteo
	from rental
	group by staff_id
)
select s.staff_id,s.first_name,s.last_name,cs.conteo
	from staff s inner join cte_staff as cs on (s.staff_id=cs.staff_id)












