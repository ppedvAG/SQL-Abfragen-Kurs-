--AGGREGATE

--SUM(), MIN(), MAX(), AVG(), COUNT()

select min(freight) , max(freight), sum(freight) , count(freight)
from orders

--Anzah der Kunden pro Land

select country, count(*) as Anz from customers
group by country
order by anz desc

select country, city,count(*) as Anz from customers
group by country, city
order by anz desc


--alles im SELECT muss in group by ausser AGG selber und Aliase
select country as Land, city,
count(*) as Anz 
from customers group by country, city

--pro BestllNr Rechnugsumme
select * from [Order Details]

--orderid, sum(unitprice*quantity)
select orderid, sum(unitprice*quantity) as RngSumme
from [Order Details]
group by  orderid

--where ? 
select orderid, sum(unitprice*quantity) as RngSumme
from [Order Details]
where  productid = 10
group by  orderid


--Wir brauchen die Umsätz der Kunden aus Deutschland
--Companyname, Umsatz


select			companyname ,sum(unitprice*quantity) as Umsatz 
from				customers c
inner join		orders o					on o.CustomerID=c.CustomerID
inner join		[Order Details] od	on od.OrderID=o.OrderID
where			c.country = 'Germany'
group by 
					companyname
order by 
					Umsatz desc


--Welcher Angstellte hat den höchsten Umsatz generiert

--Lastname, Umsatz


select top 1 e.lastname, sum(unitprice*quantity) as Umsatz
from 
							employees e 
			inner join orders o					on e.EmployeeID=o.EmployeeID
			inner join [Order Details] od	on od.OrderID=o.orderid
group by 
				e.lastname
order by 
				Umsatz desc

--WITH CUBE WITH ROLLUP

select country, city, count(*)
from customers
group by country, city with cube  order by 1,2,3 --158


---Die Rechnungsummen der Kunden
--Companyname, RngSumme
--abst sortieren nach Rngsumme!!

select t.companyname, Rngsumme from 
(
select	top 100 percent 
			companyname, o.orderid, 
			sum(unitprice*quantity) as RngSumme
from 
	customers c inner join orders o				 on c.customerid=o.customerid
						inner join [Order Details] od on od.orderid = o.orderid
group by companyname, o.orderid
order by RngSumme desc
) t



--Summe aller Frachtkosten pro Land und Stadt der Kunden
--Land = Deutschland
--Frachtkosten müssen über 2000 sein

--LAND STADT SUMMEFRACHT
select sum(freight) from orders


--HAVING ist das WHERE für das Group by 
select country, city, sum(o.freight) as Fracht
from customers c inner join orders o on o.CustomerID=c.customerid
where c.country = 'Germany' 
group by country, city having sum(freight) > 2000

--Tu nie im Having etwas filtern, was ein Where kann
--im having sollte nur agg gefiltert



--Bestellugen mit höchstem Rechnungswert
--und mit geringsten Rechnungswert



select top 1 o.orderid, sum(unitprice*quantity) as RNGSUMME
from orders o inner join [Order Details] od on o.orderid = od.orderid
group by o.orderid 
order by RNGSUMME desc

select top 1 o.orderid, sum(unitprice*quantity) as RNGSUMME
from orders o inner join [Order Details] od on o.orderid = od.orderid
group by o.orderid 
order by RNGSUMME asc



select * from 
(		select top 1 o.orderid, sum(unitprice*quantity) as RNGSUMME
		from orders o inner join [Order Details] od on o.orderid = od.orderid
		group by o.orderid 
		order by RNGSUMME asc     ) t1
UNION ALL --weils schnell sein soll
select * from 
(		select top 1 o.orderid, sum(unitprice*quantity) as RNGSUMME
		from orders o inner join [Order Details] od on o.orderid = od.orderid
		group by o.orderid order by RNGSUMME desc ) t2


select  o.orderid, sum(unitprice*quantity) as RNGSUMME
	into #t2
		from orders o inner join [Order Details] od on o.orderid = od.orderid
		group by o.orderid 

	select * from #t2
		where Rngsumme = (select max(rngsumme) from #t2)
					or
					Rngsumme = (Select min(rngsumme) from #t2)

	select top 1 o.orderid, sum(unitprice*quantity) as RNGSUMME
	into #t5
		from orders o inner join [Order Details] od on o.orderid = od.orderid
		group by o.orderid order by RNGSUMME desc

		select top 1 o.orderid, sum(unitprice*quantity) as RNGSUMME
		into #t6
		from orders o inner join [Order Details] od on o.orderid = od.orderid
		group by o.orderid order by RNGSUMME asc

		select * from #t5
		UNION ALL
		select * from #t6




WITH CTE
as
(
	select  top 100 percent o.orderid, sum(unitprice*quantity) as RNGSUMME, rank() over (order by sum(unitprice*quantity) ) as RANG
		from orders o inner join [Order Details] od on o.orderid = od.orderid
		group by o.orderid 
		order by RNGSUMME)
select * from cte where RANG = 1 or RANG = (select max(rang) from cte)












select 
		  country, sum(quantity)
from 
where productid..
group by country
order by

















select country, city, count(*)
from customers
group by country, city with rollup order by 1,2,3 --90





select country, city, count(*) as Anz
into #t --reguläre Tabelle
from customers
group by country, city with rollup order by 1,2,3 --90

--Fenster schliessen #t weg
--drop table #t




select * from #t where country = 'Italy'


















order by anz desc