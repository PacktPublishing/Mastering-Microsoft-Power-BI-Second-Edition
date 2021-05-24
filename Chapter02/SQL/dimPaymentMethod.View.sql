/*
Database: WideWorldImportersDW
View: BI.dimPaymentMethod
*/
CREATE OR ALTER VIEW BI.dimPaymentMethod
AS
SELECT [Payment Method Key]
      ,[WWI Payment Method ID]
      ,[Payment Method]
      ,[Valid From]
      ,[Valid To]
FROM WideWorldImportersDW.Dimension.[Payment Method]