select top 10 * 
into o2
from orders where freight < 10

insert into o1
SELECT 
      [CustomerID]
      ,[EmployeeID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipAddress]
      ,[ShipCity]
      ,[ShipRegion]
      ,[ShipPostalCode]
      ,[ShipCountry]
  FROM [dbo].[Orders] where freight > 500


  insert into o2 (customerid, freight, shipcountry, shipcity)
  values
					  ('ALFKI', 20.02,'Germany','Bonn'),
					  ('BLAUS', 22.02,'Germany','Bonn'),
					  ('FISSA', 20.03,'Italy','Rom')