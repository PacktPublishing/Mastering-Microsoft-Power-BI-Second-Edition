/*
Database: WideWorldImportersDW
View: BI.dimItemSubCategory
*/
CREATE OR ALTER VIEW BI.dimItemSubCategory
AS
      SELECT 0 AS [ItemSubCategoryKey],'N/A' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 1 AS [ItemSubCategoryKey],'Clothing' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 2 AS [ItemSubCategoryKey],'Holiday' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 3 AS [ItemSubCategoryKey],'Action Figures' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 4 AS [ItemSubCategoryKey],'Radio Control' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 5 AS [ItemSubCategoryKey],'Battery Toy Cars' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 6 AS [ItemSubCategoryKey],'Electronics' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 7 AS [ItemSubCategoryKey],'Chocolate' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 8 AS [ItemSubCategoryKey],'Glassware' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 9 AS [ItemSubCategoryKey],'Shipping' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To]
UNION SELECT 10 AS [ItemSubCategoryKey],'Desk Items' AS [Item SubCategory],'01/01/2013' AS [Valid From],'12/31/9999' AS [Valid To];
GO

