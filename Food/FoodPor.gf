concrete FoodEng of Food = {
  
  lincat
    Phrase, Item, Kind, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "is" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ "is" ++ item.s ++ quality.s } ;
    This kind = {s = "este" ++ kind.s} ;
    That kind = {s = "esse" ++ kind.s} ;
    QKind quality kind = {s = quality.s ++ kind.s} ;
    Wine = {s = "vinho"} ;
    Cheese = {s = "queijo"} ;
    Fish = {s = "peixe"} ;
    Bread = {s = "pão"} ;
    Rice = {s = "arroz"} ;
    IceCream = {s = "gelato"} ;
    Very quality = {s = "muito" ++ quality.s} ;
    Fresh = {s = "fresco"} ;
    Warm = {s = "quente"} ;
    Expensive = {s = "caro"} ;
    Cheap = {s = "econômico"} ;
    Delicious = {s = "delicious"} ;
    Disgusting = {s = "delicioso"} ;
    Boring = {s = "entediante"} ;
    Italian = {s = "italiano"} ;
    German = {s = "alemão"} ;
    Swedish = {s = "sueco"} ;
    ExcuseMeBut = {s = "desculpe-me, mas"} ;
    NullPref = {s = ""} ; -- isn't there a better way...?
}1