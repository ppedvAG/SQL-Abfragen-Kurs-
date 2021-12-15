/*
Procedures

..wie ein Windows Batch

exec procname 
in einer Prozedur kann alles möglich sein: INS UP DEL SEL

meist ist eine komplette Logik drin

zentral auf dem Server: Verwaltung Code ändern

schneller als normal weil Routenplan vorliegt

wird immer per Exec ausgeführt
exec procname UK 500


Prozeduren sollten man immer mit GO abschliessen.
Evtl ist sonst der nachfolgende Code des Fesnters Bestandteil der Proc geworden.. ;-(


Proz können Parameter haben , die wie Variablen funkionien..

create proc gpxy @par1  int, @par2 int , ....
as
select ... where Sp = @par1 and sp2 = @par2


Prozeduren können auch Werte zurückgeben, für nachfolgende
SQL Statements..

dazu ist notwendig:
1. Anlegene einer Variablen vor Ausführung der Proz(dort kommt das Ergebnis rein)
2. Prozedure muss Ausgabe (output) beherrschen

	create proc gpxy @par1 int, @par2 int output <--!!

3. Beim Aufruf der Prozedur kann allerdings Outputparameter aber auch input sein
	Daher output angeben, wenn output gewünscht.
	Macht man das nicht, dann gilt es als Eingabeparameter
	
	declare @var int
	exec gpxy @par1=10, @par2 = @var output
	select @var -- Variable enthält das Ergebnis der Proc

	declare @var int= 333
	exec gpxy @par1=10, @par2 = @var 
	select @var -- Variable enthält 333 und die Prozedur kommt den Wert 333 zur Verarbeitung


	..und wenn Tabellen... #t..leider nicht, sondern ##t



*/


exec procname

--create procedure
-- sp werden in der DB master zuerst gesucht


create proc -- drop proc -- alter proc

alter proc gpName
as
select getdate()
select 100

exec gpName

create proc gpdemo
as
select 100

exec gpdemo

alter proc gpdemo
as
select getdate()
select 'XY'


exec gpdemo




alter proc gpdemo
as
select getdate()
select 'XY'
select 100
GO --GO !!
exec gpdemo


alter proc gpdemo @par1 int, @par2 int
as
select @par1+@par2
GO

exec gpdemo 5,100

alter proc gpdemo @Land varchar(50)
as
select * from customers where country = @land
GO

exec gpdemo 'UK'

--alle Bestellungn, die aus UK kamen und max 100 Frachtkosten hatten
exec gpSucheBestLandFrachtLimit  'UK', '100'


create proc gpSucheBestLandFrachtLimit @Land varchar(50), @FrachtLimit money
as
select * from orders where freight < @FrachtLimit and ShipCountry = @Land
GO

exec gpSucheBestLandFrachtLimit 'UK', 10
order by freight


create proc gpxy @LK money, @land varchar(50)
as
select * from orders where freight < @Lk and Shipcountry = @Land


--Parameter vertauschbar...

exec gpSucheBestLandFrachtLimit @Frachtlimit = 5, @Land='USA'


--defautl Parameter


alter proc gpSucheBestLandFrachtLimit @Land varchar(50) = 'Germany', @FrachtLimit money
as
select * from orders where freight < @FrachtLimit and ShipCountry = @Land
GO

--beim auslassen von Werten wg Default, üssen die anderen Parameter benannt werden...
exec gpSucheBestLandFrachtLimit @frachtlimit = 10


--. Lösche Kunden

exec gpDelKunde 'ALFKI'

delete from customers where customerid = 'ALFKI'

select * into kxy from customers
select * into  oxy from orders --des ALFKI
select * into odxy from  [Order Details] --des ALFKI

exec gpDelKunde 'ALFKI' ,1



alter proc gpDelKunde @kdid char(5),@sicher bit=0
as
IF @sicher =0
	BEGIN
	Select ' Du willst das wirklich löschen..?'
	select * from odxy where orderid in (select orderid from oxy where customerid = @kdid)
	select * from oxy where customerid = @kdid
	select * from kxy where customerid = @kdid
	select	' Bestelldetails: ' + 
			convert(varchar(1000),(select count(*) from odxy where orderid in (select orderid from oxy where customerid = @kdid)))+ 
			' Bestellungen: ' +
				convert(varchar(1000), (select count(*) from oxy where customerid = @kdid)) +
				' Kunden: ' +
				convert(varchar(100),(select count(*) from kxy where customerid = @kdid))
	END
ELSE
BEGIN
	delete from odxy where orderid in (select orderid from oxy where customerid = @kdid)
	delete from oxy where customerid = @kdid
	delete from kxy where customerid = @kdid
END



--Ausgabewerte der Prozeduren weiterverwenden
exec gpBestFrachtSchnitt 'UK' 
80

select * from orders where freight < @schnitt ??

create proc gpBestFrachtSchnitt @Land varchar(50)
as
select avg(freight) from orders where shipcountry = @Land
GO

exec gpBestFrachtschnitt 'UK' --zB 52,7548



alter proc gpBestFrachtSchnitt @Land varchar(50), @schnitt as money output -- output ist auch input
as
select avg(freight) from orders where shipcountry = @Land
GO

exec gpBestFrachtschnitt 'UK', 1000 output --output muss explizit angegeben werden

declare @frschnitt as money=100
exec gpBestFrachtSchnitt 'UK' , @schnitt = @frschnitt output
----------------------------------   -------------->
declare @frschnitt as money

exec gpBestFrachtSchnitt 'UK' , @schnitt = @frschnitt output
select @frschnitt
-----------------------------                 <---      ------------


alter proc gpBestFrachtSchnitt @Land varchar(50), @schnitt as money output -- output ist auch input
as
select @schnitt=avg(freight) from orders where shipcountry = @Land
GO



