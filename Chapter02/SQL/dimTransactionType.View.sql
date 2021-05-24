/*
Database: WideWorldImportersDW
View: BI.dimTransactionType
*/
CREATE OR ALTER VIEW BI.dimTransactionType
AS
SELECT [Transaction Type Key]
      ,[WWI Transaction Type ID]
      ,[Transaction Type]
      ,[Valid From]
      ,[Valid To]
FROM WideWorldImportersDW.Dimension.[Transaction Type]