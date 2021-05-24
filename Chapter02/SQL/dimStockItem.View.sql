/*
Database: WideWorldImportersDW
View: BI.dimStockItem
*/
CREATE OR ALTER VIEW BI.dimStockItem
AS
SELECT  i.[Stock Item Key]
       ,CASE WHEN i.[Stock Item] LIKE '%Slippers%'       THEN 1
             WHEN i.[Stock Item] LIKE '%Jacket%'         THEN 1
             WHEN i.[Stock Item] LIKE '%Hoodie%'         THEN 1
             WHEN i.[Stock Item] LIKE '%Shirt%'          THEN 1
             WHEN i.[Stock Item] LIKE '%Socks%'          THEN 1
             WHEN i.[Stock Item] LIKE '%joke%'           THEN 1
             WHEN i.[Stock Item] LIKE '%flash drive%'    THEN 1
             WHEN i.[Stock Item] LIKE '%novelty%'        THEN 1
             WHEN i.[Stock Item] LIKE '%Halloween%'      THEN 1
             WHEN i.[Stock Item] LIKE '%truck%'          THEN 2
             WHEN i.[Stock Item] LIKE '%toy%'            THEN 2
             WHEN i.[Stock Item] LIKE '%launcher%'       THEN 2
             WHEN i.[Stock Item] LIKE '%action figures%' THEN 2
             WHEN i.[Stock Item] LIKE '%blade%'          THEN 3
             WHEN i.[Stock Item] LIKE '%tape%'           THEN 3
             WHEN i.[Stock Item] LIKE '%office%'         THEN 3
             WHEN i.[Stock Item] LIKE '%void fill%'      THEN 3
             WHEN i.[Stock Item] LIKE '%air cushion%'    THEN 3
             WHEN i.[Stock Item] LIKE '%shipping%'       THEN 3
             WHEN i.[Stock Item] LIKE '%dispenser%'      THEN 3
             WHEN i.[Stock Item] LIKE '%marker%'         THEN 3
             WHEN i.[Stock Item] LIKE '%post%'           THEN 3
             WHEN i.[Stock Item] LIKE '%wrap%'           THEN 3
             WHEN i.[Stock Item] LIKE '%chocolate%'      THEN 4
        ELSE 0 END AS [ItemCategoryKey]
       ,CASE WHEN i.[Stock Item] LIKE '%Slippers%'       THEN 1
             WHEN i.[Stock Item] LIKE '%Jacket%'         THEN 1
             WHEN i.[Stock Item] LIKE '%Hoodie%'         THEN 1
             WHEN i.[Stock Item] LIKE '%Shirt%'          THEN 1
             WHEN i.[Stock Item] LIKE '%Socks%'          THEN 1
             WHEN i.[Stock Item] LIKE '%mug%'            THEN 8
             WHEN i.[Stock Item] LIKE '%flash drive%'    THEN 6
             WHEN i.[Stock Item] LIKE '%chocolate%'      THEN 7
             WHEN i.[Stock Item] LIKE '%Halloween%'      THEN 2
             WHEN i.[Stock Item] LIKE '%Ride on%'        THEN 5
             WHEN i.[Stock Item] LIKE '%USB%'            THEN 6
             WHEN i.[Stock Item] LIKE '%action figures%' THEN 3
             WHEN i.[Stock Item] LIKE '%blade%'          THEN 9
             WHEN i.[Stock Item] LIKE '%tape%'           THEN 10
             WHEN i.[Stock Item] LIKE '%office%'         THEN 10
             WHEN i.[Stock Item] LIKE '%void fill%'      THEN 9
             WHEN i.[Stock Item] LIKE '%air cushion%'    THEN 9
             WHEN i.[Stock Item] LIKE '%shipping%'       THEN 9
             WHEN i.[Stock Item] LIKE '%dispenser%'      THEN 9
             WHEN i.[Stock Item] LIKE '%marker%'         THEN 10
             WHEN i.[Stock Item] LIKE '%post%'           THEN 9
             WHEN i.[Stock Item] LIKE '%wrap%'           THEN 9
             WHEN i.[Stock Item] LIKE '%radio control%'  THEN 4
             WHEN i.[Stock Item] LIKE '%RC %'            THEN 4
        ELSE 0 END AS [ItemSubCategoryKey]
       ,i.[WWI Stock Item ID]
       ,i.[Stock Item]
       ,CASE WHEN Color = 'N/A' AND CHARINDEX('(White)',[Stock Item]) > 0 THEN 'White'
             WHEN Color = 'N/A' AND CHARINDEX('(Blue)',[Stock Item]) > 0 THEN 'Blue'
             WHEN Color = 'N/A' AND CHARINDEX('(Red)',[Stock Item]) > 0 THEN 'Red'
             WHEN Color = 'N/A' AND CHARINDEX('(Black)',[Stock Item]) > 0 THEN 'Black'
             WHEN Color = 'N/A' AND CHARINDEX('(Brown)',[Stock Item]) > 0 THEN 'Brown'
             WHEN Color = 'N/A' AND CHARINDEX('(Yellow)',[Stock Item]) > 0 THEN 'Yellow'
             WHEN Color = 'N/A' AND CHARINDEX('(Green)',[Stock Item]) > 0 THEN 'Green'
             WHEN Color = 'N/A' AND CHARINDEX('(Pink)',[Stock Item]) > 0 THEN 'Pink'
        ELSE Color END AS Color
       ,i.[Selling Package]
       ,i.Brand
       ,i.Size
       ,i.[Tax Rate]
       ,i.[Unit Price]
       ,i.[Valid From]
       ,i.[Valid To]
FROM    WideWorldImportersDW.Dimension.[Stock Item] i
GO


