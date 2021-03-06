/*
Database: WideWorldImportersDW
View: BI.dimDate
*/

CREATE OR ALTER VIEW BI.dimDate
AS
SELECT  TRY_CAST(CAST(DATEPART(YEAR,d.[Date]) AS [CHAR](4)) + RIGHT('0' + CAST(DATEPART(MONTH,d.[Date]) AS [VARCHAR](2)),2) + RIGHT('0' + CAST(DATEPART(D,d.[Date]) AS [VARCHAR](2)),2) AS INT) AS [Date Key]
       ,d.[Date]
       ,d.[Calendar Year]
       ,d.[Calendar Year Label]
       ,d.[Month] AS [Calendar Month]
       ,d.[Short Month]
       ,d.[Calendar Month Number]
       ,DATEPART(WEEK, d.[Date]) AS [Calendar Week Number in Year]
       ,'Wk' + CAST(d.[ISO Week Number] AS [CHAR](2)) AS [Calendar Week in Year]
       ,TRY_CAST(CAST(DATEPART(YEAR,d.[Date]) AS [CHAR](4)) + '-Q' + CAST(DATEPART(QUARTER,d.[Date]) AS CHAR) AS CHAR) AS [Calendar Yr-Qtr]
       ,CAST(CAST(DATEPART(YEAR,d.[Date]) AS CHAR(4)) + CAST(FORMAT(DATEPART(QUARTER,d.[Date]),'00') AS [CHAR](2)) AS INT) AS [Calendar Yr-Qtr Sort]
       ,TRY_CAST(CAST(DATEPART(YEAR,d.[Date]) AS [CHAR](4)) + '-' + FORMAT(d.[Date], 'MMM') AS CHAR) AS [Calendar Yr-Mo]
       ,TRY_CAST(CAST(DATEPART(YEAR,d.[Date]) AS [CHAR](4)) + RIGHT('0' + CAST(DATEPART(MONTH,d.[Date]) AS [VARCHAR](2)),2) AS INT) AS [Calendar Yr-Mo Sort]
       ,CAST(DATEPART(YEAR,d.[Date]) AS [CHAR](4)) + '-Wk' + CAST(d.[ISO Week Number] AS [CHAR](2)) AS [Calendar Yr-Wk]
       ,CAST(CAST(DATEPART(YEAR,d.[Date]) AS CHAR(4)) + CAST(FORMAT(d.[ISO Week Number],'00') AS [CHAR](2)) AS INT) AS [Calendar Yr-Wk Sort]
       ,DENSE_RANK() OVER ( ORDER BY DATEPART(YEAR, d.[Date]), DATEPART(MONTH, d.[Date])) AS [Calendar Year Month Number]
       ,DENSE_RANK() OVER ( ORDER BY DATEPART(YEAR, d.[Date]), DATEPART(WEEK, d.[Date]) )AS [Calendar Year Week Number]
       ,d.[ISO Week Number] 
       ,CASE WHEN YEAR(d.[Date]) = YEAR(CURRENT_TIMESTAMP) THEN 'Current Calendar Year'
             WHEN YEAR(d.[Date]) = YEAR(CURRENT_TIMESTAMP) - 1 THEN 'Prior Calendar Year'
             WHEN YEAR(d.[Date]) = YEAR(CURRENT_TIMESTAMP) - 2 THEN '2 Yrs Prior Calendar Year'
             WHEN YEAR(d.[Date]) = YEAR(CURRENT_TIMESTAMP) - 3 THEN '3 Yrs Prior Calendar Year'
             ELSE 'Other Calendar Year'
        END AS [Calendar Year Status]
       ,CASE WHEN YEAR(d.[Date]) = YEAR(CURRENT_TIMESTAMP) AND MONTH (d.[Date]) = MONTH (CURRENT_TIMESTAMP) THEN 'Current Calendar Month'
             WHEN YEAR(d.[Date]) = YEAR(DATEADD(MONTH, -1, CAST(CURRENT_TIMESTAMP AS DATE))) AND MONTH(d.[Date]) = MONTH(DATEADD(MONTH, -1, CAST(CURRENT_TIMESTAMP AS DATE))) THEN 'Prior Calendar Month'
             WHEN YEAR(d.[Date]) = YEAR(DATEADD(MONTH, -2, CAST(CURRENT_TIMESTAMP AS DATE))) AND MONTH(d.[Date]) = MONTH(DATEADD(MONTH, -2, CAST(CURRENT_TIMESTAMP AS DATE))) THEN '2 Mo Prior Calendar Month'
             WHEN YEAR(d.[Date]) = YEAR(DATEADD(MONTH, -3, CAST(CURRENT_TIMESTAMP AS DATE))) AND MONTH(d.[Date]) = MONTH(DATEADD(MONTH, -3, CAST(CURRENT_TIMESTAMP AS DATE))) THEN '3 Mo Prior Calendar Month'
             ELSE 'Other Calendar Month'
        END AS [Calendar Month Status]
       ,CASE WHEN YEAR(d.[Date]) = YEAR (CURRENT_TIMESTAMP) AND  DATEPART (WEEK, d.[Date]) = DATEPART(WEEK, CURRENT_TIMESTAMP) THEN 'Current Calendar Week'
             WHEN YEAR(d.[Date]) = YEAR (DATEADD(WEEK, -1, CAST(CURRENT_TIMESTAMP AS DATE))) AND DATEPART(WEEK, d.[Date]) = DATEPART(WEEK, DATEADD(WEEK, -1, CAST(CURRENT_TIMESTAMP AS DATE))) THEN 'Prior Calendar Week'
             WHEN YEAR(d.[Date]) = YEAR (DATEADD(WEEK, -2, CAST(CURRENT_TIMESTAMP AS DATE))) AND DATEPART(WEEK, d.[Date]) = DATEPART(WEEK, DATEADD(WEEK, -2, CAST(CURRENT_TIMESTAMP AS DATE))) THEN '2 Wk Prior Calendar Week'
             WHEN YEAR(d.[Date]) = YEAR (DATEADD(WEEK, -3, CAST(CURRENT_TIMESTAMP AS DATE))) AND DATEPART(WEEK, d.[Date]) = DATEPART(WEEK, DATEADD(WEEK, -3, CAST(CURRENT_TIMESTAMP AS DATE))) THEN '3 Wk Prior Calendar Week'
             ELSE 'Other Calendar Week'
        END AS [Calendar Week Status]
       ,DATEPART(q,d.[Date]) AS [Quarter]
       ,CASE WHEN DATENAME(QUARTER,d.[Date]) = 1 THEN 'First'
             WHEN DATENAME(QUARTER,d.[Date]) = 2 THEN 'Second'
             WHEN DATENAME(QUARTER,d.[Date]) = 3 THEN 'Third'
             WHEN DATENAME(QUARTER,d.[Date]) = 4 THEN 'Fourth'
         END AS [Quarter Name]
       ,DENSE_RANK() OVER ( ORDER BY DATEPART(YEAR, d.[Date]), DATEPART(q, d.[Date]) )AS [Calendar Year Quarter Number]
       ,DATEADD(YEAR, -1, d.[Date]) AS [Prior Calendar Year Date]
       ,DATEADD(MONTH, -1, d.[Date]) AS [Prior Calendar Month Date]
       ,DATEADD(WEEK, -1, d.[Date]) AS [Prior Calendar Week Date]
       --,d.[Date Number]
       --,d.[Fiscal Quarter]
       --,d.[Fiscal Period]
       ,DATEADD(DAY, 7 - (DATEPART(WEEKDAY, d.[Date])), d.[Date]) AS [Calendar Week Ending Date]
       ,DATEPART(WEEKDAY,d.[Date]) AS [Weekday Sort]
       ,LEFT(DATENAME(WEEKDAY,d.[Date]),3) AS [Weekday Abbr]
       ,DATENAME(WEEKDAY,d.[Date]) AS [Weekday]
       --,d.[Fiscal Yr-Wk Sort]
       --,d.[Fiscal Yr-Wk]
       --,d.[Fiscal Yr-Qtr]
       --,d.[Fiscal Yr-Period]
       --,d.[Fiscal Yr-Period Sort]
       ,d.[Fiscal Year]
       ,d.[Fiscal Year Label]
       ,d.[Fiscal Month Number]
       ,d.[Fiscal Month Label] AS [Fiscal Yr-Mo]
       --,d.[Fiscal Week Sort]
       --,d.[Fiscal Yr-Qtr Sort]
       --,d.[Fiscal Date Last Year]
       --,d.[Fiscal Week Sequence]
       --,d.[Fiscal Week of Period]
       --,d.[Full Date Description]
       --,d.[Day Number in Calendar Month]
       --,d.[Day Number in Calendar Year]
       --,d.[Calendar Quarter in Year]
       --,d.[Calendar Quarter Number in Year]
       ,CASE DATENAME(WEEKDAY,d.[Date]) WHEN 'Saturday' THEN 1
                                        WHEN 'Sunday'   THEN 1
                                        ELSE 0 END AS [Weekday Indicator]
       --,d.[Holiday Indicator]
       --,d.[Calendar Week in Month]
       ,DATEADD (YEAR, -1, CAST(CURRENT_TIMESTAMP AS DATE)) AS [One Year Prior Date]
       --,d.[DST Flag]
       ,EOMONTH(d.[Date]) AS [Calendar Month Ending Date]
       ,CASE WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) = 0 THEN 'Current Calendar Month'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 1, 2, 3 ) THEN 'Trailing 1-3 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 4, 5, 6 ) THEN 'Trailing 4-6 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 7, 8, 9 ) THEN 'Trailing 7-9 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 10, 11, 12 ) THEN 'Trailing 10-12 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 13, 14, 15 ) THEN 'Trailing 13-15 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 16, 17, 18 ) THEN 'Trailing 16-18 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 19, 20, 21 ) THEN 'Trailing 19-21 Calendar Months'
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 22, 23, 24 ) THEN 'Trailing 22-24 Calendar Months'
             ELSE 'Older Periods'
        END AS [Trailing 3 Calendar Month Periods]
       ,CASE WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) = 0 THEN 1
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 1, 2, 3 ) THEN 2
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 4, 5, 6 ) THEN 3
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 7, 8, 9 ) THEN 4
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 10, 11, 12 ) THEN 5
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 13, 14, 15 ) THEN 6
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 16, 17, 18 ) THEN 7
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 19, 20, 21 ) THEN 8
             WHEN DATEDIFF(MONTH, d.[Date], CAST(CURRENT_TIMESTAMP AS DATE)) IN ( 22, 23, 24 ) THEN 9
             ELSE 10
        END AS [Trailing 3 Calendar Month Period Sort]
FROM    Dimension.[Date] AS d
WHERE   d.[Calendar Year] >= DATEPART(YEAR, CURRENT_TIMESTAMP) - 9 AND d.[Date] <= CAST(CURRENT_TIMESTAMP AS DATE);