/*
Database: WideWorldImportersDW
View: BI.dimCity
*/
CREATE OR ALTER VIEW BI.dimCity AS
SELECT c.[City Key]
      ,c.[WWI City ID]
      ,t.[Territory Key]
      ,c.City
      ,c.[State Province]
      ,c.Country
      ,c.[Location]
      ,c.[Latest Recorded Population]
      ,c.[Valid From]
      ,c.[Valid To]
FROM WideWorldImportersDW.Dimension.City c
INNER JOIN BI.dimTerritory t ON t.[Sales Territory] = c.[Sales Territory];
GO


