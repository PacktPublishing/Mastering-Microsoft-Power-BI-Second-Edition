/*
Filter context example
*/

Use WideWorldImportersDW;
GO

SELECT ic.[Item Category]
      ,c.[Buying Group]
      ,FORMAT (SUM(s.[Unit Price] * s.Quantity), '$#,###') AS [Gross Sales]
FROM BI.fctSale s
INNER JOIN BI.dimDate d ON d.[Date] = s.[Invoice Date Key]
INNER JOIN BI.dimStockItem si ON si.[Stock Item Key] = s.[Stock Item Key]
INNER JOIN BI.dimItemCategory ic ON ic.ItemCategoryKey = si.ItemCategoryKey
INNER JOIN BI.dimCustomer c ON c.[Customer Key] = s.[Customer Key]
INNER JOIN BI.dimEmployee e ON e.[Employee Key] = s.[Salesperson Key]
INNER JOIN BI.dimCity ct ON ct.[City Key] = s.[City Key]
INNER JOIN BI.dimTerritory t ON t.[Territory Key] = ct.[Territory Key]
WHERE d.[Calendar Year Status] = 'Prior Calendar Year' 
  AND e.[Is Salesperson] = 1
  AND t.[Sales Territory] = 'Southeast'
GROUP BY ic.[Item Category]
        ,c.[Buying Group]
ORDER BY ic.[Item Category];