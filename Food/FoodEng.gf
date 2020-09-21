concrete FoodEng of Food = DrinkEng ** open StrOper, FoodResEng in { -- extend DrinkEng
  -- examples of using opers defined in StrOper marked as --*
  
  lincat
    Phrase, Item, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "is" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ "is" ++ item.s ++ quality.s ++ "?"} ;
    -- only use singular for the moment (TODO: allow plural)
    This kind = {s = "this" ++ kind.s ! Sing} ;
    That kind = {s = "that" ++ kind.s ! Sing} ;
    QKind quality kind = {s = table { 
      _ => quality.s ++ kind.s ! Sing }
    } ;
    Cheese = regKind "cheese" ;
    Fish = regKind "fish" ; -- TODO: irregular plural
    Bread = regKind "bread" ;
    Rice = regKind "rice" ;
    IceCream = regKind "ice cream" ;
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