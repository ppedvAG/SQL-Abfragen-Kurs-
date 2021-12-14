--Fallunterscheidung mit Case
--Case im Select stellt eine Ergebnisspalte dar
--CASe kann wie ein where behandelt werden
--like = in Between etc..

--Aufbau:
CASE
-	when ... then
	when ..then
END

select  
		country,
		case 
				when Country in ('Italy', 'Germany', 'France', 'Austria') then 'EU'
				when country like 'U%' then 'Brexit'
				else 'not EU'
		end as EUnotEU, *
from customers


select 
			case 
				when freight < 10 then 'Super günstig'
				when freight > 100 then 'Sauteuer'
				else 'dazwischen'
			end as Typ, freight
from orders