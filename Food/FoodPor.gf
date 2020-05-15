concrete FoodPor of Food = {
  
  lincat
    Phrase, Item, Kind, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "é" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ item.s ++ "é" ++ quality.s} ;
    This kind = {s = "este" ++ kind.s} ;
    That kind = {s = "esse" ++ kind.s} ;
    QKind quality kind = {s = kind.s ++ quality.s} ;
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
    Delicious = {s = "delicioso"} ;
    Disgusting = {s = "nojento"} ;
    Boring = {s = "entediante"} ;
    Italian = {s = "italiano"} ;
    German = {s = "alemão"} ;
    Swedish = {s = "sueco"} ;
    ExcuseMeBut = {s = "desculpe-me, mas"} ;
    NullPref = {s = ""} ; -- isn't there a better way...?
}