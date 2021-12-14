--UNION fügt mehrere Ergebnisse zu einem zusammen
--die UNION müssen gleich vielel Felder haben
--und Datentyp kompatbel sein!
--UNION macht distinct
--der UNION ALL nicht


select 100 as SPX --erste Spalte gibt den Spaltennamen vor
UNION
select 200 as SPY

select 100
union --macht distinct
select 200
union 
select 300
union
select 100


select 100
union all--macht distinct
select 100

select 'A'
union
select 100

select convert(varchar(50), 100)


select 'A'
union
select convert(varchar(50), 100)


select 'A', 'C'
union
select 'B', NULL

--Alle Länder und Städte der Kunden und Angestellten
--als ein Ergebnis

select country, city from customers
union 
select country, city from employees


--Ergänze das Ergebnis um ein Merkmal ob die Kombi vom Kunden oder vom 
--Angestellten kommt

select country, city, 'K'  as Typ from customers
union 
select country, city ,'A' from employees
where typ = 'K'


--die Bestellung mit den niedrigsten Frachtkosten
--orderid, freight


select top 1 orderid, freight from orders order by freight  --0.02, 


--die Bestellung mit den höchsten Frachtkosten
--orderid, freight
select top 1 orderid, freight from orders order by freight  --1007,64

--und nun beides als ein Ergebnis: ;-)
select top 1 orderid, freight from orders-- order by freight asc
UNION ALL
select top 1 orderid, freight from orders
order by freight  desc 



select * from 
	(select top 1 orderid, freight from orders order by freight asc) t1
UNION
select * from 
	(select top 1 orderid, freight from orders order by freight desc) t2


select * from 
	(select top 1 orderid, freight as Fracht from orders order by freight asc) t1
	where t1.fracht

--im SEELCT darf nur ein!!!!! Wert rauskommen
select orderid, (select top 1 freight from orders order by freight asc)
from orders

select * from orders 
where 
	orderid in (select orderid from [order details])

	--bei = nur ein Wert 
select * from orders 
where 
	orderid = (select top 1 orderid from [order details])

--im where darf immer nur eine Spalte rauskommen
select * from orders 
where 
	orderid = (select top 1 orderid , freight from [order details])


	--tu dies nicht.. geht auch mit inner join

	select * from customers 
	where customerid in (select customerid from orders)
















