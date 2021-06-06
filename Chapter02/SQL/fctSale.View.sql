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
      ,[Tax Amount]
      ,Profit
      ,CAST([Unit Price] - (Profit / Quantity) AS DECIMAL(18,2)) AS [Stock Item Cost]
      ,[Total Dry Items]
      ,[Total Chiller Items]
FROM WideWorldImportersDW.Fact.Sale
GO


