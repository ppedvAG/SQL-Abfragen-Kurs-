
--Lösung:

select dateadd(dd,-333, getdate())

select dateadd(dd, 111, getdate())

select datename(dw,'1.1.2020')


select datediff(hh,getdate(), '20.7.1969 20:17:58.123')

select datediff(dd, getdate(), '1.1.2022') --1.1.2022 00:00:00.000

select getdate() +3

select 'AB' + 'C'

select '1.1.' + convert(varchar(50),year(getdate()))



--reverse: 08677-988940

select reverse(stuff(reverse('08677-988940'),1,3,'XXX'))

--select datalength('08677-988940')-2
select stuff('08677-988940',datalength('08677-988940')-2,3,'XXX')


select substring('08677-988940',1,datalength('08677-988940')-3)+ 'XXX'


