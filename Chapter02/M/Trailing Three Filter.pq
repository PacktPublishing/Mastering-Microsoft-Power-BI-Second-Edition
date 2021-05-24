let
//Trailing Three Year Date Values
    CurrentDate = DateTime.Date(DateTime.LocalNow()),
    StartYear = Date.Year(CurrentDate)-3,
    StartDate = #date(StartYear,1,1), 
//Sales View
    Source = WWISQLServerDev,
    Sales = Source{[Schema = "BI", Item = "fctSale"]}[Data], 
//Trailing Three-Year Filter
    FilterSales = 
        Table.SelectRows(Sales, each [Invoice Date Key] >= StartDate and [Invoice Date Key] <= CurrentDate)
in
    FilterSales