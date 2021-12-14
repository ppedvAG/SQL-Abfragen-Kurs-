select top 3 * from customers

select top 10 * from orders order by freight asc  --desc

--top mit order

--welche Bestellung hat die höchsten Frachtkosten

select  top 1 orderid , freight from orders order by freight desc

--Wilde 13..
--suche nach den top 13 Kunden mit geringsten Frachtkosten

select top 13 with ties customerid  from orders order by freight ----
--LONEP

select top 10 percent *  from customers

