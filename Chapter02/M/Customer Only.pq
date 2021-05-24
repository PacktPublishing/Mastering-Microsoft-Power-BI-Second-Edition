let
    Source = WWISQLServer,
    Customer = Source{[Schema = "BI", Item = "dimCustomer"]}[Data]
in
    Customer