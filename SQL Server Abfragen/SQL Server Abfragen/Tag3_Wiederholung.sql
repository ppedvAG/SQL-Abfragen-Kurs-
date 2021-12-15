--Allen Kunden sollen später die Lieferkosten erlassen werden, bei denen die Lieferung zu spät kam
-----Stelle alle Bestellungen mit Lieferverzögerungen dar

--eine LIste , in der nur die Best zu sehen sind, die eine Lieferverzögerung haben

--Orders: shippeddate Requireddate

40 37  37 23


select datediff(dd,shippeddate, requireddate),shippeddate, requireddate 
from orders 
where datediff(dd,shippeddate, requireddate) < 0 or ShippedDate is null

select isnull(2, 0)
select isnull(NULL, 0)


select orderid,
		datediff(dd, isnull (shippeddate, getdate()),requireddate),
		ShippedDate, requireddate 
 from orders
where datediff(dd, ShippedDate, requireddate) <0 or  shippeddate is null
order by 2


--Erstelle ein Histogramm, in dem je nach Altersgruppe der Verkauf von Alkohol dargestellt wird
--Altersgruppen: (Angestellte)

------------------------30 bis 40     
------------------------41-50   
------------------------51-60  
------------------------> 60

------------------------Alkohol ist ein Getränk aber nicht 1, 2, 24, 43

select Birthdate from employees
select * from orders
select * from [Order Details]
select * from products
select * from Categories
---Alkohol ist ein Getränk aber nicht 1, 2, 24, 43
select datediff(yy,birthdate, orderdate), p.productname, 
		cat.CategoryName, od.unitprice, quantity
from employees e 
inner join orders o on e.employeeid = o.employeeid 
inner join [order details] od on od.orderid = o.orderid
inner join products p on p.ProductID=od.productid
inner join Categories cat on cat.CategoryID=p.CategoryID
where cat.CategoryName like 'Bev%' and p.ProductID not in (1,2,24,43)

--case
--	when datediff(yy,birthdate, orderdate) between 30 and 40   then '30-40'
--	when datediff(yy,birthdate, orderdate) between 41 and 50   then '41-50'
--	when datediff(yy,birthdate, orderdate) between 41 and 50   then '41-50'
--end

301
case
	when sp > 50 then 'A'
	when sp > 100 then 'B'
	when sp > 300 then 'C'


end

select 
			CASE
					when datediff(yy,birthdate, orderdate) between 30 and 40  then '30 - 40'
					when datediff(yy,birthdate, orderdate) between 41  and 50 then '41- 50' 
					when datediff(yy,birthdate, orderdate) between 51  and 60 then '51- 60' 
					when datediff(yy,birthdate, orderdate) > 60 then '  > 60  ' 
			END as Altergruppe,
datediff(yy,birthdate, orderdate),
		 od.unitprice, quantity
from employees e 
inner join orders o on e.employeeid = o.employeeid 
inner join [order details] od on od.orderid = o.orderid
inner join products p on p.ProductID=od.productid
inner join Categories cat on cat.CategoryID=p.CategoryID
where cat.CategoryName like 'Bev%' and p.ProductID not in (1,2,24,43)
order by 1




select 
			CASE
					when datediff(yy,birthdate, orderdate) between 30 and 40  then '30 - 40'
					when datediff(yy,birthdate, orderdate) between 41  and 50 then '41- 50' 
					when datediff(yy,birthdate, orderdate) between 51  and 60 then '51- 60' 
					when datediff(yy,birthdate, orderdate) > 60 then '  > 60  ' 
			END as Altergruppe,
		 sum(od.unitprice*quantity) as Umsatz
from employees e 
inner join orders o on e.employeeid = o.employeeid 
inner join [order details] od on od.orderid = o.orderid
inner join products p on p.ProductID=od.productid
inner join Categories cat on cat.CategoryID=p.CategoryID
where cat.CategoryName like 'Bev%' and p.ProductID not in (1,2,24,43)
group by 
		 CASE
					when datediff(yy,birthdate, orderdate) between 30 and 40  then '30 - 40'
					when datediff(yy,birthdate, orderdate) between 41  and 50 then '41- 50' 
					when datediff(yy,birthdate, orderdate) between 51  and 60 then '51- 60' 
					when datediff(yy,birthdate, orderdate) > 60 then '  > 60  ' 
			END
		
order by 1




select 
			CASE
					when datediff(yy,birthdate, orderdate) between 30 and 40  then '30 - 40'
					when datediff(yy,birthdate, orderdate) between 41  and 50 then '41- 50' 
					when datediff(yy,birthdate, orderdate) between 51  and 60 then '51- 60' 
					when datediff(yy,birthdate, orderdate) > 60 then '  > 60  ' 
			END as Altergruppe,
		od.unitprice*quantity as PosSumme
into #txy
from employees e 
inner join orders o on e.employeeid = o.employeeid 
inner join [order details] od on od.orderid = o.orderid
inner join products p on p.ProductID=od.productid
inner join Categories cat on cat.CategoryID=p.CategoryID
where cat.CategoryName like 'Bev%' and p.ProductID not in (1,2,24,43)

Select Altergruppe, sum(Possumme) from #txy
group by Altergruppe

select * into k1 from customers


select * from k1 where country = 'UK'


select * from k1 where city = 'Bern'

