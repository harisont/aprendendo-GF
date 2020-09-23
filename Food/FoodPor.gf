concrete FoodPor of Food = DrinkPor ** open FoodResPor in { -- extend DrinkPor
  
  lincat
    Phrase, Quality, Prefix = {s : Str} ;
    Item = {s : Str ; a : Number} ;
  
  lin
    Is prefix item quality = {s = prefix.s ++ item.s ++ copula item.a ++ quality.s} ;
    IsQ prefix item quality = {s = prefix.s ++ item.s ++ copula item.a ++ quality.s ++ "?"} ;
    This kind = det (este ! kind.g) Sing kind ;
    That kind = det (esse ! kind.g) Sing kind ;
    These kind = det (estos ! kind.g) Plur kind ;
    Those kind = det (esses ! kind.g) Plur kind ;
    QKind quality kind = {
      s = table {
      _ => kind.s ! Sing ++ quality.s 
      } ;
      g = Masc
    } ;
    Cheese = regNoun "queijo" ;
    Fish = regNoun "peixe" ; -- TODO: irregular (?) gender
    Bread = regNoun "pão" ;
    Rice = regNoun "arroz" ; -- TODO: irregular number
    IceCream = regNoun "gelato" ;
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