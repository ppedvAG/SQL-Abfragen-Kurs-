--DATUM

-- Getdate() --akt Datum und Uhrzeit

Select getdate() --auf ms genau  

--intervalle
--dd Tage
--yy Jahr
--qq Quartal
--ww Woche
--mi Minute
--Sekunde

--zu Datum etwas dazurechnen
select dateadd(dd,10, getdate())
select dateadd(MI,2, Getdate()) 

--Datumdiffrenz errechnen.. zischen 2 Terminen.. pos oder neg
select datediff(dd, getdate(), '1.10.2022') -- +292
select datediff(dd,'1.10.2022',getdate()) --   -292

select datepart(yy, getdate())
select year(getdate()), month(getdate()), DAY(Getdate())

--datename ..gibt den Namen eines Datumanteil aus
--Wochentag.. dd = 13    dw = 1 = Montag
select datename(dw, getdate())

-- select datediff(dd, getdate(), '1.10.2022') 
select datediff(dd, RequiredDate, ShippedDate) from orders

--Textmanipukation 


--Problem Serienbrief
HERRN
Otto                                                                         Maier


--char(50) fixe Länge   varchar(50) variabel

--Leerzeichen am Ende oder am Anfang entfernen
ltrim  rtim
select rtrim('Otto                                             ') --4 Zeichen nicht 50 
select ltrim(' Otto') --4 Zeichen

select left('12345678',2) --12
select right('abcdefg',2) ---fg


--Teil einer Zeichenkette zurückgeben
select substring('abcdefgh',3,2) --cd


--ZK umdrehen
select reverse('abcdefgH')--

--in einer ZK einen best Teil ersetzen
select stuff('abcdefgh',3,2,'XXXXX')


--Lautmalersische Suche: Schmitt oder Schmid
select soundex('Meyr') --M600

--Längen feststellen.. Achtung Leerzeichen mitberechnen oder nicht

--LEN trimmt!
select len('Otto        ') -2 --len macht automatisch auch ein trim 

--datalength nicht!
select datalength (rtrim('otto     '))-2

















