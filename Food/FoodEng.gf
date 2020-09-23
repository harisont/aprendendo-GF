concrete FoodEng of Food = DrinkEng ** open StrOper, FoodResEng in { -- extend DrinkEng
  
  lincat
    Phrase, Quality, Prefix = {s : Str} ;
    Item = {s : Str ; a : Number} ;

  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ copula item.a ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ copula item.a ++ item.s ++ quality.s ++ "?"} ;
    This = det "this" Sing ;
    That = det "that" Sing ;
    These = det "these" Plur ;
    Those = det "those" Plur ;
    QKind quality kind = {s = table { 
      n => quality.s ++ kind.s ! n }
    } ;
    Cheese = regNoun "cheese" ;
    Fish = regNoun "fish" ; -- TODO: irregular plural
    Bread = regNoun "bread" ;
    Rice = regNoun "rice" ;
    IceCream = regNoun "ice cream" ;
    Very quality = {s = "very" ++ quality.s} ;
    Fresh = {s = "fresh"} ;
    Warm = {s = "warm"} ;
    Expensive = {s = "expensive"} ;
    -- free variation examples
    Cheap = {s = variants {"cheap" ; "inexpensive"}} ;
    Delicious = {s = variants {"delicious" ; "exquisit"}} ;
    Disgusting = {s = "disgusting"} ;
    Boring = {s = "boring"} ;
    Italian = {s = "Italian"} ;
    German = {s = "German"} ;
    Swedish = {s = "Swedish"} ;
    ExcuseMeBut = {s = "excuse me but"} ;
    NullPref = {s = ""} ; -- isn't there a better way...?
}