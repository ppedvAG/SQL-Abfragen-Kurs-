-select datepart  

select 
	*
from tabelle 

select sp1, sp2 from tabelle

select 'txt', 100, 100* 3 from tabelle


select * from orders

select orderid, freight, freight*100*3 as Mathe from orders

select orderid, freight as Netto, freight *1.19 as Brutto from orders

select sp from tabelle  STRG + SHIFT + R

--Gebe zusätzlich den Anteil der MwSt aus
select orders, Netto, Brutto, MwSt from orders









