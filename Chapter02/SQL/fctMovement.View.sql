/*
Database: WideWorldImportersDW
View: BI.fctMovement
*/
CREATE OR ALTER VIEW BI.fctMovement
AS
SELECT [Movement Key]
      ,[Date Key]
      ,[Stock Item Key]
      ,[Customer Key]
      ,[Supplier Key]
      ,[Transaction Type Key]
      ,[WWI Stock Item Transaction ID]
      ,[WWI Invoice ID]
      ,[WWI Purchase Order ID]
      ,Quantity
FROM WideWorldImportersDW.Fact.[Movement]