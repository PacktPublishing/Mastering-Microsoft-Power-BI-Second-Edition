let
// Customer History Date Bands
   CurrentDate = DateTime.Date(DateTime.LocalNow()),
   OneYearAgo = Date.AddYears(CurrentDate,-1),
   TwoYearsAgo = Date.AddYears(CurrentDate,-2),
   ThreeYearsAgo = Date.AddYears(CurrentDate,-3),
//Customer Dimension
    Source = WWISQLServer,
    Customer = Source{[Schema = "BI", Item = "dimCustomer"]}[Data],
    CustomerHistoryColumn = Table.AddColumn(Customer, "Customer History Segment", 
    each
    if [First Purchase] >= OneYearAgo then "First Year Customer" 
    else if [First Purchase] >= TwoYearsAgo and [First Purchase] < OneYearAgo then "Second Year Customer"
    else if [First Purchase] >= ThreeYearsAgo and [First Purchase] < TwoYearsAgo then "Third Year Customer" 
else "Legacy Customer", type text)
in
    CustomerHistoryColumn