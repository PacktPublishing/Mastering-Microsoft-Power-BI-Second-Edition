let
    Source = WWISQLServerDev,
    Sales = Source{[Schema = "BI", Item = "fctSale"]}[Data],
    TypeChanges = Table.TransformColumnTypes(Sales,
            {
                {"Quantity", Int64.Type}, // Whole Number 
                {"Total Excluding Tax", Currency.Type}, // Fixed Decimal Number
                {"Total Including Tax", type number} // Decimal Number
            })
in
    TypeChanges