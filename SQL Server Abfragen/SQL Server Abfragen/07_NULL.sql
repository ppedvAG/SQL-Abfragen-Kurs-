--NULL


0 ist nicht NULL
NULL ist auch nicht ''

NULL ist NULL
jede mathem. Operation mit NULL führt zu NULL



select * into o1 from orders 

update o1 set freight = NULL where shipcity = 'London'
select * from o1 where freight < 1

select * from o1 where freight is null

select 3*0
select 3*NULL

select 3 + NULL