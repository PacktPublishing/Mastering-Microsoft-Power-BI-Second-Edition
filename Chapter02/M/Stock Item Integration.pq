let
    Source = WWISQLServer,
//StockItem Dimension Table Views
    StockItem = Source{[Schema = "BI", Item = "dimStockItem"]}[Data],
    ItemCat = Source{[Schema = "BI", Item = "dimItemCategory"]}[Data],
    ItemSubCat = Source{[Schema = "BI", Item = "dimItemSubCategory"]}[Data], 

//StockItem Outer Joins 
    StockItemJoinCat = Table.NestedJoin(StockItem,"ItemCategoryKey",ItemCat,"ItemCategoryKey","StockItemCatTableCol",JoinKind.LeftOuter),
    StockItemJoinCatCol = Table.ExpandTableColumn(StockItemJoinCat,"StockItemCatTableCol",{"Item Category"}),

    StockItemJoinSubCat = Table.NestedJoin(StockItemJoinCatCol,"ItemSubCategoryKey",ItemSubCat,"ItemSubCategoryKey","StockItemSubCatTableCol",JoinKind.LeftOuter),
    StockItemJoinSubCatCol = Table.ExpandTableColumn(StockItemJoinSubCat,"StockItemSubCatTableCol",{"Item SubCategory"}),

//Select and Rename Columns
    StockItemDimCols = Table.SelectColumns(StockItemJoinSubCatCol,{"Stock Item Key","ItemCategoryKey","Item Category","ItemSubCategoryKey","Item SubCategory","WWI Stock Item ID","Stock Item","Color","Selling Package","Brand","Size","Tax Rate","Unit Price","Valid From","Valid To"}),
    StockItemDimRenameCols = Table.RenameColumns(StockItemDimCols,{{"ItemCategoryKey", "Item Category Key"},{"ItemSubCategoryKey","Item Subcategory Key"}}),

//Remove Null Values 
    UndefinedCatAndSubcat = Table.ReplaceValue(StockItemDimRenameCols,null,"Undefined",Replacer.ReplaceValue,{"Item SubCategory","Item Category"})
in
    UndefinedCatAndSubcat
