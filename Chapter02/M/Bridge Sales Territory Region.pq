let
    Source = Sql.Database(DevServer, DevDB),
    BI_dimTerritory = Source{[Schema="BI",Item="dimTerritory"]}[Data],
    SalesTerritory = BI_dimTerritory[Sales Territory],
    ConvertTable = Table.FromList(SalesTerritory, Splitter.SplitByNothing(), null, null,  ExtraValues.Error),
    Rename = Table.RenameColumns(ConvertTable,{{"Column1", "Sales Territory Region"}})
in
    Rename