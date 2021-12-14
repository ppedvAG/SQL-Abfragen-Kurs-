select distinct country from customers

select * from customers cross join Employees
/*
F() = Giftschrank
power(2,0.5)

SELECT 	DISTINCT
	Spalten, Mathe, Spalte*Zahl,
	'txt'  as ALIAS,
	F(Spalten), f(wert))
FROM
	TABELLE A LEFT|RIGHT|CROSS|INNER  JOIN TABELLE B
			ON A.sp = B.sp2
			        LEFT|RIGHT|CROSS|INNER  JOIN TABELLE C
			ON C.spx = A.Sp3
		....
WHERE 
		 A.sp  > < = != <= >= Wert
		 AND | OR
		 B.spx like Wert    
							Wildcards:
										%  beliebig viele Zeichen ( bis unendl viele Zeichen)
										_ steht für ein unbekanntes Zeichen
										[aeiou]  steht für ein Zeichen
										[a-e]
										[1-4]
										[a-e|0-3]
										[^0-3][a-e]

										[%]  Suche nach %
										''   Suchen nach Hochkomma

AND OR AND OR AND OR
AND ist immer stärker bindend, daher besser Klammern setzen












--Alle Bestellungen mit Frachtkosten < 10
--des Ang 5

*/

select * from orders where freight < 10 and employeeid = 5




--Alle Kunden, die im Namen ein  m haben und an vorletzter Stelle 
-- ein o
--(Firmenname)


select	companyname
from		customers
where	companyname like '%m%[o]_' 	
	   


--alle Firmen inkl, BestllNr  und Frachtkosten, die das Produkt  Chai kauften
--(Firmenname, BestellNr, Frachtkosten, Produktname)

select c.companyname, o.orderid, o.freight, p.productname
from customers c 
				inner join orders o 
								on c.CustomerID=o.CustomerID
				inner join [Order Details] od 
								on od.orderid = o.orderid
				inner join Products p 
								on p.ProductID=od.ProductID
where p.ProductName like 'Chai%'


--Welche Waren hat Robert King im 2. Quartal 1997 verhökert
--FamName des Angestellten, Produktname

Select 	distinct
			e.lastname, p.productname, o.orderdate as Datum
from 
							employees  e 
			inner join orders o					on o.EmployeeID = e.EmployeeID 
			inner join [Order Details] od   on od.OrderID      = o.orderid 
			inner join products p				on p.ProductID     = od.ProductID
where 
			e.lastname = 'King' and Firstname = 'Robert' 
			and 
			datepart(qq,o.orderdate) = 2 and year(orderdate) =1997
order by 
--		 2,4 --zweite und dann 4te Spalte
    	 datum asc, productname desc
		 --asc ist default




--vereinfache die Liste

--Lösungen




