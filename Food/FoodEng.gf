concrete FoodEng of Food = DrinkEng ** open StrOper in { -- extend DrinkEng
  -- examples of using opers defined in StrOper marked as --*
  
  lincat
    Phrase, Item, Kind, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "is" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ "is" ++ item.s ++ quality.s ++ "?"} ;
    This kind = {s = "this" ++ kind.s} ;
    That kind = prefix "that" kind ; --* (or even prefix "that" thanks to partial application)
    QKind quality kind = {s = quality.s ++ kind.s} ; --* or cc quality kind
    Cheese = {s = "cheese"} ;
    Fish = ss "fish" ; --*
    Bread = {s = "bread"} ;
    Rice = {s = "rice"} ;
    IceCream = {s = "ice cream"} ;
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