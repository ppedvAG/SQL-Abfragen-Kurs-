--Sichten  Views

--gemerkte Abfrage

--Sicht führt die Abfrage aus, die hinter der Sicht steckt

--auf Sicht auch  INS UP DEL, aber nicht  immer

--Abfragen deutlich vereinfachen

--Sichten können wie Tabellen auch Rechte haben


--Umsatz pro Kundenland

select country, sum(unitprice*quantity) from vKundeumsatz





group by country




create view vKunden
as
select * from customers

--Sicht wird wie Tabelle behandelt

select * from vKunden


--create alter drop
alter view vKundeUmsatz
as
select 
			c.CustomerID, c.CompanyName, c.City, c.Country,
			o.orderid, o.freight, o.orderdate,
			od.UnitPrice, od.Quantity, od.ProductID,
			p.ProductName,
			e.LastName,
			(od.unitprice*od.quantity) as Possumme
from customers c inner join orders o on c.CustomerID=o.CustomerID
					         inner join [Order Details] od on od.orderid = o.orderid
							 inner join Products p on p.ProductID=od.ProductID
							 inner join employees e on e.EmployeeID=o.EmployeeID



select Companyname, productname from vKundeUmsatz


select country, sum(possumme)  from vKundeumsatz
group by country

create view vANGUK
as
select Lastname, homephone from employees where country = 'UK'

select * from vAngUK --Recht zu lesen...

select * from employees  --kann verboten werden


---Tu nie ..!



select * from vKundeUmsatz --alle Kunden aus UK.. Companyname

-
select
distinct
companyname from vKundeumsatz where country = 'UK'

select
companyname from customers where country = 'UK'

