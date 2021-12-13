--JOIN --> Ziel Spalten nebeneinander
--LEFT RIGHT INNER FULL CROSS JOIN

--LEFT: von links alle von rechts nur die passenden
--RIGHT vo rechts alle und von links die passenden
--Cross: jeder mit jeden verknüpft.. karthesisches Produkt.. lann echt viel werden

--Full Join : Kombi aus RIGHT ND LEFT JOIN


/*
select * --A und B Spalten 
from Tabelle A inner join Tabelle B ON A.sp1 = B.sp3

select* 
from Tabelle A inner join Tabelle B on A.sp1=b.Sp2
						inner join TABELLE C on c.sp3 = B.sp2
						inner join TABELLE D on d.sp3 = a.sp1
						usw...


A						A
B						B
C		
D						D
E						E

LEFT

A			A
B		    B
C          NULL
D         D
E          E


RIGHT
A						A
B						B
C						F
D						D
E						E

A       A
B        B
NULL F
D      D
E       E

select * from tabelle A left join tabelle B on A.sp1 = B.sp2

-----------------left von join = a

select * from tabelle A right  join tabelle B on A.sp1 = B.sp2

--------------------------------------------Right = B



*/

select * from customers
select * from orders

select c.CustomerID,c.Country, o.orderid, o.freight
from customers c inner join orders o 
			on c.CustomerID = o.CustomerID
			

	select * --A und B Spalten 
from Tabelle A inner join Tabelle B ON A.sp1 = B.sp3


--Liste alle order details auf , aber inkl Produktname

select * from [Order Details]
select * from products


select od.*, p.ProductName
from [Order Details] od inner join products p
						on od.ProductID=p.ProductID

--Bestellungen haben AngNr (employeeid)

select * from orders
select * from employees

--Ausgabe: BestellNr, AngId, Nachname, freight
select	 o.orderid, o.freight
			, e.employeeid	, e.Lastname		
from orders o inner join Employees e
					on e.EmployeeID=o.EmployeeID
where
		o.freight < 100

	

select * from customers c inner join orders o
					on c.CustomerID=o.CustomerID
										inner join Employees e
					on e.EmployeeID=o.EmployeeID
										inner join ....
										on


--Ausgabe : Firma (companyname) und unser Ansprechpartner (Lastname)

select distinct companyname , lastname --830 (orderstabelle)
from
		customers c inner join orders o		  on c.customerid =  o.CustomerID
						    inner join Employees	e on e.employeeid = o.employeeid

--Alle Kunden die nichts kauften
--alle Kunden zurückgeben und aus orders die Orderid ausgeben (null) 
--mit LEFT JOIN .. alle Kunden auflisten und aus Orders orderid

select c.CustomerID, o.CustomerID, o.orderid
from 
	customers c left join orders o on c.CustomerID=o.CustomerID 
where o.orderid is null
	
--aus dem  LEFT wird ein Right Join ...

select c.CustomerID, o.CustomerID, o.orderid
from 
	orders o right join customers c on c.CustomerID=o.CustomerID 
where o.orderid is null

--FULL JOIN .. beides LEFT und RIGHT

--Abfrage:  guggste Diagramm..;-)
--Customerid, companyname, city, country (Customers)
--orderid, freight, orderdate (orders)
--unitprice, quantity, , productid (order details)
--productname  Products)
--Lastname    (employees)
------komplette Umsatz
select 
			c.CustomerID, c.CompanyName, c.City, c.Country,
			o.orderid, o.freight, o.orderdate,
			od.UnitPrice, od.Quantity, od.ProductID,
			p.ProductName,
			e.LastName
from customers c inner join orders o on c.CustomerID=o.CustomerID
					         inner join [Order Details] od on od.orderid = o.orderid
							 inner join Products p on p.ProductID=od.ProductID
							 inner join employees e on e.EmployeeID=o.EmployeeID


--Employees: Liste der Ang und deren pot Stellvertreter
--Stellvertreter = wer in der gleich Stadt wohnt

--Lastname, City, country, StvLastname , StvCity, StvCountry
--JOIN auf sich selber

select e1.LastName, e1.city, e2.city, e2.lastname 
from employees e1 inner join employees e2 on e1.city=e2.city 
where 
	e1.lastname != e2.lastname














	--CROSS JOIN

	select * from customers, orders, [Order Details]

	select 91*830*2155

	select * from customers cross join orders

	select * from Categories