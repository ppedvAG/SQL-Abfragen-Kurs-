with cte
as
(
select country, city, count(*) as Anzahl from customers group by country, city
)
select * from cte 

--Was ist der Durschnitt der maix Frachtkosten pro Cutomerid
;with cte as
(
select customerid, max(freight) as maxfracht from orders group by customerid 
) 
select avg(maxFracht) from cte




