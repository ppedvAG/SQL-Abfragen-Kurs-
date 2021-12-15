/*

super praktisch
select f(sp), f(wert) from f(sp) where f(sp) > f(wert)

super langsam!


*/

create function f_zahl(@par1 int, @par2 int) returns int
as
BEGIN
	return (select @par1*@par2)
END

select f_zahl(100,5)
select dbo.f_zahl(100,5) --exakter Aufruf!!

select dbo.fBrutto(100) --> 119

create function dbo.fBrutto (@Netto as money) returns money
as
begin
	return (select @netto *1.19)
end


select 
		freight , dbo.fBrutto(freight) 
from orders
where 
		dbo.fbrutto(freight) < 100

select dbo.fRngSumme(10248) --> 440

select * from orders where  dbo.fRngSumme(orderid) < 500



---10248
select sum(unitprice*quantity) from [Order Details] where orderid = 10248

create function dbo.fRngSumme (@bestid int) returns money
as
BEGIN
	return (select sum(unitprice*quantity) from [Order Details] where orderid = @bestid)
END

select dbo.fRngsumme(10248)

select dbo.fRngsumme(orderid),* 
from orders 
where dbo.fRngsumme(orderid) < 1000



alter table orders add RngSumme as dbo.fRngsumme(orderid)

select * from orders where Rngsumme > 1000



create function fTab (@par1 varchar(50))
returns @tab table 
	(
	kdid char(5),
	Firma varchar(50),
	Land varchar(50),
	Stadt varchar(50)
	)
as
BEGIN
insert into @tab
select customerid, companyname, country, city from customers where
		country = @par1
return
END

select * from dbo.fTab('UK') --weniger als 1000

--VS SICHT + temp TABELLEN
--temp Tabellen ,wenn immer wieder gebraucht oder mehr als 1000 Zeilen
--sonst f()

--aber nach Neustart auch noch: Sicht..

--Allerdings: nur die temp Tabelle hat die Daten physisch abgelegt
--alle anderen müssen die Daten immer wieder frisch holen...


