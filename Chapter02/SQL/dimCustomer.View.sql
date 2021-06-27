/*
Database: WideWorldImportersDW
View: BI.dimCustomer
*/
CREATE OR ALTER   VIEW [BI].[dimCustomer] 
AS
WITH cteMinOrder
AS (SELECT c.[Customer Key]
          ,MIN(o.[Order Date Key]) AS OrderDate
    FROM WideWorldImportersDW.Dimension.Customer c
    LEFT JOIN fact.[Order] o ON o.[Customer Key] = c.[Customer Key] 
    GROUP BY c.[Customer Key]
   )
SELECT c.[Customer Key]
      ,c.[WWI Customer ID]
      ,c.Customer
      ,c.[Bill To Customer]
      ,c.Category
      ,c.[Buying Group]
      ,c.[Primary Contact]
      ,c.[Postal Code]
      ,COALESCE(m.OrderDate,'01/01/2019') AS [First Purchase]
      ,c.[Valid From]
      ,c.[Valid To]
FROM WideWorldImportersDW.Dimension.Customer c
LEFT JOIN cteMinOrder m ON m.[Customer Key] = c.[Customer Key];
GO


