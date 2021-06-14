let
// Customer History Date Bands

   CurrentDate = DateTime.Date(DateTime.LocalNow()),
   OneYearAgo = Date.AddYears(CurrentDate,-1),
   TwoYearsAgo = Date.AddYears(CurrentDate,-2),
   ThreeYearsAgo = Date.AddYears(CurrentDate,-3),

//Customer Dimension View

    Source = WWISQLServer,
    Customer = Source{[Schema = "BI", Item = "dimCustomer"]}[Data],

//Customer History Segment Column

    CustomerHistoryColumn = Table.AddColumn(Customer, "Customer History Segment", each
    if [First Purchase] >= OneYearAgo then "First Year Customer" 
    else if [First Purchase] >= TwoYearsAgo and [First Purchase] < OneYearAgo then "Second Year Customer"
    else if [First Purchase] >= ThreeYearsAgo and [First Purchase] < TwoYearsAgo then "Third Year Customer" 
else "Legacy Customer", type text),
   
//Customer History Segment Column Sort
 
    CustomerHistColSort = Table.AddColumn(CustomerHistoryColumn, "Customer History Segment Sort", each 
    if [First Purchase] >= OneYearAgo then 1 
    else if [First Purchase] >= TwoYearsAgo and [First Purchase] < OneYearAgo then 2
    else if [First Purchase] >= ThreeYearsAgo and [First Purchase] < TwoYearsAgo then 3 
    else 4, Int64.Type)
in
    CustomerHistColSort