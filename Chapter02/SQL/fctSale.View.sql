/*
Database: WideWorldImportersDW
View: BI.fctSale
*/
CREATE OR ALTER VIEW BI.fctSale AS
SELECT [Sale Key]
      ,[City Key]
      ,[Customer Key]
      ,[Bill To Customer Key]
      ,[Stock Item Key]
      ,[Invoice Date Key]
      ,[Delivery Date Key]
      ,[Salesperson Key]
      ,[WWI Invoice ID]
      ,[Description]
      ,Package
      ,Quantity
      ,[Unit Price]
      ,[Tax Rate]
      ,[Total Excluding Tax]
      ,[Tax Amount]
      ,Profit
      ,[Total Including Tax]
      ,[Total Dry Items]
      ,[Total Chiller Items]
FROM WideWorldImportersDW.Fact.Sale
GO


