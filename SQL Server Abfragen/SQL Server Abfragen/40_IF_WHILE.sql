IF 1=0 select 'A'

IF Bedingung Code

IF 1=0
select 'A'
ELSE
select 'B'


IF 1=1
select 'A'
ELSE
select 'B'
select 'C' -- A C



IF 1=0
select 'A'
ELSE
	BEGIN
			select 'B'
			select 'C' -- A C
	END

IF 1=0
	BEGIN
		select 'A'
		SELECT 'E'
	END
ELSE
	BEGIN
			select 'B'
			select 'C' -- A C
	END

	IF (select count(*) from customers)  < 100
	BEGIN
		select 'weniger'
	END
	ELSE
	BEGIN
		select 'mehr'
	END

	IF (select count(*) from customers)  < 100 AND (Select..)
	BEGIN
		select 'weniger'
	END
	ELSE
	BEGIN
		select 'mehr'
	END
	
		--Wenn der Schnitt von Frachtkosten unter 80 liegt, dann erhöhe die Frachtkosten um 10 %


declare @schnitt as money 
select  @schnitt = avg(freight) from orders

If @schnitt < 80
	begin
		update orders set freight = freight *1.1
	end
else
	begin
		update orders set freight = freight /1.1
	end




--WHILE

declare @i as int=1

while @i<10
	begin 
	select getdate()	
	select @i=@i+1
	--select @i+=1
	--select @i=+1
	--BREAK --unterbricht sofort
	CONTINUE geht zum Schleifeneinstieg
	select 100
	end

	--erhöhe die orders2 Freight um 10 %  --5 mal
		
	declare @i as int=1

	begin tran

	while @i <= 5
		begin
			select @i
			update orders2 set freight = freight *1.1
			set @i+=1
		end
	rollback


	select 100
	GO 10














