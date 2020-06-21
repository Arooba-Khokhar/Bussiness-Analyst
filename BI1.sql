


WITH d as (
	select p.id_person, p.name, p.surname, a.account_type, a.id_account
	from person as p left join account as a
	on a.id_person = p.id_person
	where p.id_person in (345, 1234)
)
select d.id_person, (date_part('month', t.transaction_date) || '.' || date_part('year', t.transaction_date)) as month, 
round(sum(t.transaction_amount))
from d left join transaction as t
on d.id_account = t.id_account
where t.transaction_date between '2020-02-15' AND '2020-06-06'
group by d.id_person, month
order by d.id_person desc;t
