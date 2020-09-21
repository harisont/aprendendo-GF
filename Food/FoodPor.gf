concrete FoodPor of Food = DrinkPor ** open FoodResPor in { -- extend DrinkPor
  
  lincat
    Phrase, Item, Quality, Prefix = {s : Str} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ "é" ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ item.s ++ "é" ++ quality.s ++ "?"} ;
    -- only use singular masculine for the moment (TODO: allow plural + feminine)
    This kind = {s = "este" ++ kind.s ! Sing} ;
    That kind = {s = "esse" ++ kind.s ! Sing} ;
    QKind quality kind = {
      s = table {
      _ => kind.s ! Sing ++ quality.s 
      } ;
      g = Masc
    } ;
    Cheese = regKind "queijo" ;
    Fish = regKind "peixe" ; -- TODO: irregular (?) gender
    Bread = regKind "pão" ;
    Rice = regKind "arroz" ; -- TODO: irregular number
    IceCream = regKind "gelato" ;
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