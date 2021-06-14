let Source = WWISQLServer,
    View =   Value.NativeQuery(Source, "Select CAST(Current_Timestamp as date) as [CurrentDate]")
in  
	View
