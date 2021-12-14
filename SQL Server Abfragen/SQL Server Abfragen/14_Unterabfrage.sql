--Unterabfrage

select * from  (select * from orders order by 2) o



select * from 
	(select top 1 orderid, freight from orders order by freight asc) t1
UNION
select * from 
	(select top 1 orderid, freight from orders order by freight desc) t2


select * from 
	(select top 1 orderid, freight as Fracht from orders order by freight asc) t1
	where t1.fracht

--im SEELCT darf nur ein!!!!! Wert rauskommen
select orderid, (select top 1 freight from orders order by freight asc)
from orders