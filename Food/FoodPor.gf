concrete FoodPor of Food = DrinkPor ** { -- extend DrinkPor
  
  lincat
    Phrase, Item, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "é" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ item.s ++ "é" ++ quality.s ++ "?"} ;
    This kind = {s = "este" ++ kind.s} ;
    That kind = {s = "esse" ++ kind.s} ;
    QKind quality kind = {s = kind.s ++ quality.s} ;
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
    -- free variation
    Boring = {s = variants {"entediante" ; "enfadonho" ; "chato"}} ;
    Italian = {s = "italiano"} ;
    German = {s = "alemão"} ;
    Swedish = {s = "sueco"} ;
    ExcuseMeBut = {s = "desculpe-me, mas"} ;
    NullPref = {s = ""} ; -- isn't there a better way...?
}