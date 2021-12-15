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




	/*


	IF BEDINGUNG -->CODE

	IF 
	CODE
	ELSE
	FALSE CODE

	IF  BEDINGUNG
		BEGIN 
			CODE
		END
	ELSE
		BEGIN
			CODE
		END

		IF 1=1 Select 


	IF (Select ..) >100 AND (SELECT ...) or 


	WHILE (Select ..) > 10 and | or (select ) < 10
		BEGIN
			CODE
			IF BREAK 
			IF CONTINUE
		--	select 'INFOS'

		END

*/
	select avg(freight), max(freight) from orders

	--86 1108

	select * into o3 from orders


	--Grenzwerte:  Schnitt : max 100 ...         Max Freight : 1500

	--Erhöhe die Frachtkosten um 10 % solange bis git
	--	--Grenzwerte:  Schnitt : max 100 ...         Max Freight : 1500
	--keiner dieser Werte darf überstiegen werden

	---Tipp mit TX , damit man nicht die Daten durch falsche Schleife versemmelt

	BEGIN TRAN

WHILE			(select avg(freight)*1.1 from o3) <= 100 /1.1
			and 
					(select max(freight) from o3) <= 1500 /1.1
		BEGIN
				update o3 set freight = freight *1.1 --104
    	END


		ROLLBACK


DECLARE @Avg money = (SELECT Avg(FREIGHT) FROM o3), 
				@Max money = (SELECT MAX(Freight) FROM o3)
BEGIN TRAN
SELECT Avg(FREIGHT),MAX(Freight)  FROM o3
WHILE    (SELECT Avg(FREIGHT) FROM o3) <= 100 AND         --         (@AVG<100 AND @MAX<1500 )
			(SELECT MAX(Freight) FROM o3) <=1500
	BEGIN
		UPDATE o3 SET freight = freight*1.1
		------------------------SET @AVG = (SELECT Avg(FREIGHT) FROM o3)
		------------------------SET @MAX = (SELECT MAX(Freight) FROM o3)
	END
SELECT Avg(FREIGHT),MAX(Freight)  FROM o3
UPDATE o3 SET freight = freight/1.1

SELECT Avg(FREIGHT),MAX(Freight)  FROM o3
ROLLBACK




begin tran
 SELECT Avg(FREIGHT),MAX(Freight)  FROM o3
while (select AVG(freight) from o3) <= 100 and (select max(freight) from o3) <= 1500 
    begin
        update o3 set freight = freight * 1.1
      --  select freight from o3
    end
SELECT Avg(FREIGHT),MAX(Freight)  FROM o3
rollback




































