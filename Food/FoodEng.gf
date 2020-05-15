concrete FoodEng of Food = {
  
  lincat
    Phrase, Item, Kind, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "is" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ "is" ++ item.s ++ quality.s } ;
    This kind = {s = "this" ++ kind.s} ;
    That kind = {s = "that" ++ kind.s} ;
    QKind quality kind = {s = quality.s ++ kind.s} ;
    Wine = {s = "wine"} ;
    Cheese = {s = "cheese"} ;
    Fish = {s = "fish"} ;
    Bread = {s = "bread"} ;
    Beer = {s = "beer"} ;
    Sallad = {s = "sallad"} ;
    Rice = {s = "rice"} ;
    IceCream = {s = "ice cream"} ;
    Soup = {s = "soup"} ;
    Very quality = {s = "very" ++ quality.s} ;
    Fresh = {s = "fresh"} ;
    Warm = {s = "warm"} ;
    Expensive = {s = "expensive"} ;
    Cheap = {s = "cheap"} ;
    Delicious = {s = "delicious"} ;
    Disgusting = {s = "disgusting"} ;
    Boring = {s = "boring"} ;
    Italian = {s = "Italian"} ;
    German = {s = "German"} ;
    Swedish = {s = "Swedish"} ;
    ExcuseMeBut = {s = "excuse me but"} ;
    NullPref = {s = ""} ; -- isn't there a better way...?
}