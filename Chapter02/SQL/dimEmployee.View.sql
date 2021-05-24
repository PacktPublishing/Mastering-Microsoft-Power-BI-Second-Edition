/*
Database: WideWorldImportersDW
View: BI.dimEmployee
*/
CREATE OR ALTER VIEW BI.dimEmployee
AS
SELECT [Employee Key]
      ,[WWI Employee ID]
      ,Employee
      ,[Preferred Name]
      ,[Is Salesperson]
      ,[Valid From]
      ,[Valid To]
FROM WideWorldImportersDW.Dimension.Employee;