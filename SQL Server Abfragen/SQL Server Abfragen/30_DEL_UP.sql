--UPDATE

update tabelle set spalte = Wert
			where spx = 10

select * into orders2 from orders



--Erhöhe die Frachtkoste um 10%


update orders2 set freight = freight *1.1


--senke die Frachtkosten um 20% beim Ang 5

update orders2 set freight = freight / 1.2
where employeeid = 5


--Senke Frachtkosten bei den Bestellungen, bei denen der Kunde aus DE kommt

--1: Suche alle raus die betroffen

select * from orders2 o inner join customers c on c.CustomerID=o.CustomerID
where 
		country = 'Germany'

--2. Wie geht das Update grundsätzlich

update orders2 set freight = freight *1.1

--3. Update über das SELECT , den SELECT bis ZUM FROM Auskommentieren
update orders2 set freight = freight *1.1
--select * 
from orders2 o inner join customers c on c.CustomerID=o.CustomerID
where 
		country = 'Germany'


--Wir erhöhen die Frachtkosten bei allen Getränken um 10 %


begin tran 

update orders2 set freight = freight *1.1
--where orderid in
--(select distinct o.orderid
from 
			orders2 o inner join [Order Details] od on o.orderid = od.OrderID 
			inner join Products p on p.ProductID= od.ProductID
			inner join Categories cat on cat.CategoryID=p.CategoryID
			where cat.CategoryName like 'Bev%' order by 1


---DELETE

delete from tabelle where sp = Wert
delete tabelle  

begin tran
select @@TRANCOUNT
delete from orders2 where orderid = 10250
rollback

delete  orders2
--select * 
from orders2 where 
customerid in (select customerid from customers where country = 'Germany')

rollback

--Lösche alle Bestellungen (aber mit TX)
--die vom Ang King verkauft wurden...


begin tran
select * 
from	 orders2 o
		inner join employees e on e.employeeid = o.employeeid
		where lastname = 'King'
delete  orders2 
-- select * 
from	 orders2 o
		inner join employees e on e.employeeid = o.employeeid
		where lastname = 'King'
select * 
from	 orders2 o
		inner join employees e on e.employeeid = o.employeeid
		where lastname = 'King'
Rollback
select * 
from	 orders2 o
		inner join employees e on e.employeeid = o.employeeid
		where lastname = 'King'


drop table orders2
select * into orders2 from orders



select @@TRANCOUNT
update orders2 set freight = freight *100
rollback

select * from orders2

--Lösche die Frachtkosten von Best 10248

update orders2 set freight = NULL  where orderid = 10248













--Tipp: ...der Weg zurück..

--Transaktionen


begin transaction

begin tran

commit --is drin

rollback --is wieder weg



begin tran
select * from customers
update customers set city = 'Bonn'
rollback


