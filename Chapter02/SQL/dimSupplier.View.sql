/*
Database: WideWorldImportersDW
View: BI.dimSupplier
*/
CREATE OR ALTER VIEW BI.dimSupplier
AS
SELECT [Supplier Key]
      ,[WWI Supplier ID]
      ,Supplier
      ,Category
      ,[Primary Contact]
      ,[Supplier Reference]
      ,[Payment Days]
      ,[Postal Code]
      ,[Valid From]
      ,[Valid To]
FROM WideWorldImportersDW.Dimension.Supplier