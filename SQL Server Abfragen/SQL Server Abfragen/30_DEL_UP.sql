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


select @@TRANCOUNT
update orders2 set freight = freight *100
rollback











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


