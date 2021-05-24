/*
Database: WideWorldImportersDW
View: BI.dimItemCategory
*/

CREATE OR ALTER VIEW BI.dimItemCategory
AS
      SELECT 0 AS [ItemCategoryKey],'N/A' AS [Item Category],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 1 AS [ItemCategoryKey],'Novelties' AS [Item Category],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 2 AS [ItemCategoryKey],'Toys' AS [Item Category],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 3 AS [ItemCategoryKey],'Office Supplies' AS [Item Category],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 4 AS [ItemCategoryKey],'Candy' AS [Item Category],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To];
GO

