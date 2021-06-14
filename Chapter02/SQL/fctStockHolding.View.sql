/*
Database: WideWorldImportersDW
View: BI.fctStockHolding
*/
CREATE OR ALTER VIEW BI.fctStockHolding
AS
SELECT [Stock Holding Key]
      ,[Stock Item Key]
      ,[Quantity On Hand]
      ,[Bin Location]
      ,[Last Stocktake Quantity]
      ,[Last Cost Price]
      ,[Reorder Level]
      ,[Target Stock Level]
FROM WideWorldImportersDW.Fact.[Stock Holding]