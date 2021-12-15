/*

temp Tabelle



#t lokale temp Tabelle. wird in der Praxis am meisten verwendet
--

nur der Ersteller kann sie in der Session verwenden 
in der er sie erstellt hat
exisistiert nur solange bis Ersteller sie löscht oder die Verbinung schliesst

## globale temp Tabelle
jeder kann darauf zurückgreifen
exisistiert nur solange bis Ersteller sie löscht oder die Verbinung schliesst

temp Tabellen werden nciht aktualisiert

*/

select * into #kunden from customers
select * into ##kunden from customers

select * from #kunden
select * from ##kunden
