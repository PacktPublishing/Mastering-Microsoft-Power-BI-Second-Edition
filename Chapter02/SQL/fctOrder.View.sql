/*
Database: WideWorldImportersDW
View: BI.fctOrder
*/
CREATE OR ALTER VIEW BI.fctOrder
AS
SELECT [Order Key]
      ,[City Key]
      ,[Customer Key]
      ,[Stock Item Key]
      ,[Order Date Key]
      ,[Picked Date Key]
      ,[Salesperson Key]
      ,[Picker Key]
      ,[WWI Order ID]
      ,[WWI Backorder ID]
      ,[Description]
      ,Package
      ,Quantity
      ,[Unit Price]
      ,[Tax Rate]
      ,[Total Excluding Tax]
      ,[Tax Amount]
      ,[Total Including Tax]
FROM WideWorldImportersDW.Fact.[Order]