/*
Database: WideWorldImportersDW
View: BI.dimTerritory
*/
CREATE OR ALTER VIEW BI.dimTerritory AS 
WITH cteTerr
AS (SELECT DISTINCT [Sales Territory]
          ,Continent
          ,Region
          ,Subregion
    FROM WideWorldImportersDW.Dimension.City
    WHERE Region <> 'N/A'
    )
SELECT 0 AS [Territory Key]
      ,'N/A' AS [Sales Territory]
      ,'N/A' AS Continent
      ,'N/A' AS Region
      ,'N/A' AS Subregion
UNION
SELECT ROW_NUMBER() OVER (ORDER BY [Sales Territory]) AS [Territory Key]
      ,c.[Sales Territory]
      ,c.Continent
      ,c.Region
      ,c.Subregion
FROM cteTerr c;