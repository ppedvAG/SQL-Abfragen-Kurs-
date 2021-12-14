-- SELECT 

/*

SELECT 
	Zahl,
	Spalten,
	'Text',
	f(),
	Mathe,
	* steht für alle Spalten aus dem From
FROM
	TABELLE  oder was tabellenartiges

*/


use northwind;
GO --bis hierhin


select 'TEXT', 100, 100*3, orderid from orders

--Northwind: DB 

--DBDesign
--Normalisierung: keine red. Daten..mehr JOINS
--Redundanz.. schnell!-- zB temp Tabellen
--Generalsierung



.. 1NF 2 NF 3 NF ----ab hier Irrsinn: BC 4 NF 5 NF


select * from customers

delete from customers where customerid = 'ALFKI'


--Datentypen

--GebDatum: datetime (ms)..besser date
--                 smalldatetime (sek)
--                 datetime2  (ns)
--                 datetimeoffset (ms + Zeitzone)
--                 time

--Famname:  varchar(50) --max 50 Zeichen  Otto = 4
--                 nvarchar(50) -- UNICODE  'otto'  4*2 = 8 
--					nchar(50)-- Otto 50*2

--Menge:  int  +-2,1 Mrd
--             bigint
--            money ..keine Währung 8 Nachkommastellen
--           float > 20Nachkommastellen
--             decimal(18,0).. 18 Stellen davon 0 Nachkomma
--            decimal(5,2) ... Prozente  100,00%  99,98
--            numeric = decimal

-- xml Format, Geography , uniqueidentifier  GUID

select newid()

use northwind;
GO

select * from customers --91

select * from orders -- 830

select * from [order details]

select * from [order-details] -2155


--Aus Orders.. Lieferkosten (ffreight), BestNr Orderid


---Alias

select 2*3

select 
		*,
		  orderid
		, freight as Netto
    	, freight*1.19 as Brutto 
		, 'TEXT' as TXT, 2*3 as Mathe
from orders

select * from orders
--Liste aller Bestellungen mit zus. Info: Lieferverzögerung in Tagen
-- Minus = vor verabr Datum
-- Positiv ist zu spät

--Orderid, Shippdate, RequiredDate, Verzögerung

--datediff  dd  datediff(dd, Datum1, Datum2)


select 
	OrderID,--RequiredDate, ShippedDate,
	datediff(dd, RequiredDate, ShippedDate) as Lieferverz
from orders






select * from [Order Details] --2155


select orderid, freight as Netto, freight *1.19 as Brutto from orders

select sp from tabelle  STRG + SHIFT + R

--Gebe zusätzlich den Anteil der MwSt aus
select orders, Netto, Brutto, MwSt from orders

select orderid, freight as Netto, freight *1.19 as Brutto ,
(freight *1.19)- freight as Mwst
from orders

