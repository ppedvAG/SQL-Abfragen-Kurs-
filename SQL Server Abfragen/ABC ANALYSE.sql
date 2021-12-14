/*
A B C Analyse

*/

select * from orders

--Companyname, Umsatzsumme, A | B | C

--C  unter    5000 Dollar
--über 20000 Dollar A 
--Rest B

select 200, 'X'

select Companyname, sum(unitprice*quantity)  as Umsatz , 'A Kunde' as Typ
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname having sum(unitprice*quantity) < 5000




----------------------------------------------------------------
--UNION-----------------------------------------------------
----------------------------------------------------------------





select  Companyname, sum(unitprice*quantity) as Umsatz , 'C' as KundenTyp
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname having sum(unitprice*quantity) < 5000 
UNION ALL
select  companyname, sum(unitprice*quantity) as Umsatz , 'A' as KundenTyp
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by companyname having sum(unitprice*quantity) > 20000
UNION ALL
select  Companyname, sum(unitprice*quantity) as Umsatz , 'B' as KundenTyp
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname having sum(unitprice*quantity) between 5000 and 20000



----------------------------------------------------------------
--temp Tabelle--------------------------------------------------
----------------------------------------------------------------


select 
		 companyname ,		
				case
					when umsatz < 5000 then 'A Kunde'
					when Umsatz > 20000 then 'C Kunde'
					else 'B Kunde'
				 end
from #t1




select  Companyname, sum(unitprice*quantity) as Umsatz 
into #t1
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname



select *, 'A Kunde' as Kunde from #t1 where Umsatz < 5000
UNION ALL
select *, 'C Kunde' as Kunde from #t1 where Umsatz > 20000
UNION ALL
select *, 'B Kunde' as Kunde from #t1 where Umsatz between 5000 and 20000




----------------------------------------------------------------
--MIT SICHT-------------------------------------------------
-- Performance aber schlechter, da zus. Products und
--Employees abgefragt wird, die nicht notwendig sind
----------------------------------------------------------------


select Companyname, sum(possumme) as Umsatz, 'A' Typ
from vKundeUmsatz
group by Companyname having sum(possumme) > 20000
UNION ALL
select Companyname, sum(possumme) as Umsatz, 'C' Typ
from vKundeUmsatz
group by Companyname having sum(possumme) < 5000
UNION ALL
select Companyname, sum(possumme) as Umsatz, 'B' Typ
from vKundeUmsatz
group by Companyname having sum(possumme) between 5000 and 20000

----------------------------------------------------------------
--ALS CTE-----------------------------------------------------
----------------------------------------------------------------
with cte
as(
select  Companyname, sum(unitprice*quantity) as Umsatz , 'C' as KundenTyp
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname having sum(unitprice*quantity) < 5000
UNION 
select  Companyname, sum(unitprice*quantity) as Umsatz , 'A' as KundenTyp
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname having sum(unitprice*quantity) > 20000 
UNION 
select  Companyname, sum(unitprice*quantity) as Umsatz , 'B' as KundenTyp
from 
					  customers c 
	inner join  orders o					on c.CustomerID=o.CustomerID
	inner join [Order Details] od	on o.orderid=od.OrderID
group by Companyname having sum(unitprice*quantity) between 5000 and 20000)
select * from cte where Kundentyp = 'A'
