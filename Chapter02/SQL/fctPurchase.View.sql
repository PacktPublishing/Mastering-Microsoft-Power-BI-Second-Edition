/*
Database: WideWorldImportersDW
View: BI.fctPurchase
*/
CREATE OR ALTER VIEW BI.fctPurchase
AS
SELECT [Purchase Key]
      ,CAST([Date Key] AS DATETIME) AS [Date Key]
      ,[Supplier Key]
      ,[Stock Item Key]
      ,[WWI Purchase Order ID]
      ,[Ordered Outers]
      ,[Ordered Quantity]
      ,[Received Outers]
      ,Package
      ,[Is Order Finalized]
FROM WideWorldImportersDW.Fact.Purchase