concrete DrinkEng of Drink = open FoodResEng in {

    -- Kind is linearize as a 1-param table
    lincat Kind = {s : Number => Str} ;

    lin
        Wine = regNoun "wine" ;
        Beer = regNoun "beer" ;
        Lemonade = regNoun "lemonade" ;
}
