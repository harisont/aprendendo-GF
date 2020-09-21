concrete DrinkPor of Drink = open FoodResPor in {
    lincat Kind = {s : Number => Str; g : Gender} ;
    
    lin
        Wine = regKind "vinho" ;
        Beer = regKind "cerveja" ;
        Lemonade = regKind "limonada" ; -- TODO: actually make use of Femm
}