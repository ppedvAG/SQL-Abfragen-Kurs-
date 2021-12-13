--WHERE.. für Filterung und Performance zuständig

/*

..kommt immer nach dem From (inkl Joins)
select ...from
where 

Vergleichsoperatoren

> < != =  <=  >=

between
vereinfacht Bereichsabfrage mit AND auf diesselbe Spalte
where sp >= Wert and Sp <= Wert
einfacher ...
where sp between Wert1 and Wert2
kann nie Wildcards haben

in 
ersetzt viele or Anweisungen mit gleicher Spalte
kann nie Wildcards haben

and or
Bedingungen können verknüpft werden,
wichtig: Klammern setzen. SQL bindet immer das AND stärker


Wildcardsuchen

geht nur mit like 
Wildcards

%  steht für beliebig viele Zeichen .. auch 0

[] .. steht für genau ein Zeichen
	..kann auch Wertebereiche abdecken
	[a-e]
	[abdkl] a oder b oder d oder k oder l

--Wildcard für genau eine unbekannte Position: _


*/

select o.OrderID, o.Freight from orders o
where
		o.Freight < 10

--wieviele Best gibts mit über 500 Frachkostenwert

select o.OrderID, o.Freight from orders o
where
		o.Freight > 500

select o.OrderID, o.Freight from orders o
where
		o.Freight >= 500


select * from customers where city = 'Berlin'

select * from customers where customerid > 'C'

select * from orders
	where shipcountry = 'UK'
			  and 
			  Freight > 100


select * from orders
	where 
	shipcountry = 'USA'
	or 
	employeeid = 3


select * from orders where employeeid != 3
--korrekt aber langsam
select * from orders
	where 
			year(orderdate) = 1997

		--Suche alle Bestllungen aus dem Jahr 1997
		-- ohne datepart oder year

		--theoretisch Falsch! aber schnell
select * from orders
where orderdate >= '1.1.1997' and orderdate <= '31.12.1997'

--falsch, weil von 1998 3 Stück
select * from orders
where orderdate >= '1.1.1997' and orderdate <'31.12.1997 23:59:59.999'

--datetime geht auf ms ist aber ungenau: 2 bis 3 ms

--Between

select * from orders
	where freight between 100 and 500

	--where freight >= 100 and freight <= 500

--Suchen nach allen Kunden (Customers) aus UK USA und Germany
select * from customers
	where
			country = 'UK'
			or 
			Country = 'USA'
			or
			Country = 'Germany'

--besser mit in

select * from customers
where country in ('USA', 'UK', 'Germany')


select * from customers
where customerid like 'A%'

--schlimmer gehts net
select * from customers
where left(customerid,1) = 'A' --jede Zeile muss untersucht werden

--Tipp: keine F() um eine Spalte im Where... vermeide das , wo es nur geht..!

select * from customers
where customerid like '%A'


--Suche nach allen Angestellten die heute im Rentenalter sind
--65 Jahre

select * from employees


select dateadd(yy, -65, getdate())

select * from employees
	where birthdate <dateadd(yy, -65, getdate())

--so nicht
select * from employees
	where datediff(yy, birthdate, Getdate()) > 65

--Suche alle Firmen heraus, die im comanyname ein y haben

select * from customers
	where 
			companyname like '%y%'

--fies.. Suche alle , die ein  ' im Namen haben....
--Companyname inkl ' 

--statt einem ' 2 '   ''
select * from customers
	where 
			companyname like '%''%'

--Suche nach allen Fimen, die ein % im Namen haben

select * from customers
	where companyname like '%%%%' -- 0 '%'

select * from customers
where CompanyName like '%[%]%' -- mit [] Wertebereich

select * from customers
where CompanyName like '%!%%' ESCAPE '!'



--Suche alle Customerid die mit a beginnen und mit i enden

select * from customers
where
customerid like 'a%i'


--Suche alle Customerid die mit a,b, c beginnen und mit i,o,u enden


--[] steht für genau einen Wert

--[abc] a oder b oder c

select * from customers
where
customerid like '[abc]%[iou]'

--a bis i ´beginnend

--[a-i][0-4]  RegEx
--[a-d|l-r].. steht für a bis d und ! l bis r

-- PIN.. Website varchar...> G43X

--Wie finde ich diejenigen, die (k)eine gültige PIN

where PIN < 9999-- 0003.. nee...Datentyp kann nicht int
--char(4)

where pin not like '[0-9][0-9][0-9][0-9]'


--017x-45623x4



--wie finde ich die Kunden, die an vorltzere Stelle ein K


--Wildcard für genau eine unbekannte Position: _

select * from customers where 
	customerid like '_L%'

	--suche alle Kunden die mit einem Vokal an vorletzter Position
	--enden
	--a e i o u

	select * from customers
	where
	customerid like '%[aeiou]_'


	--Suche nach 


--Suche nach alle Kunden, die
--entweder aus UK, USA --oder Frankreich stammen
--und die aus Berlin oder Rom 
--kommen undund im Firmennamen eine A haben


--Customers: Country, city, Companyname

--das AND ist immer stärker binden
--immer Klammern schreiben
select * from customers
where 
		(country in ('UK', 'USA', 'France')
		OR
		CITY in ('Berlin', 'rom')) --blabla
		AND
		Companyname like '%A%'







select * into o1 from orders --Kopie der Orders

update o1 set freight = NULL 
where shipcity = 'London'

select * from o1

select * from o1 where freight <1 

select * from o1 where freight < 1

