let
    Source = Sql.Database(DevServer, DevDB),
    BI_fctSale = Source{[Schema="BI",Item="fctSale"]}[Data],
    #"Removed Columns" = Table.RemoveColumns(BI_fctSale,{"Total Dry Items", "Total Chiller Items"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Columns",{{"Invoice Date Key", type datetime}}),
    #"Filtered Rows" = Table.SelectRows(#"Changed Type", each [Invoice Date Key] >= RangeStart and [Invoice Date Key] < RangeEnd)
in
    #"Filtered Rows"