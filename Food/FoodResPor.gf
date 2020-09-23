resource FoodResPor = {
    param 
        Number = Sing | Plur ;
        Gender = Masc | Femm ;
        
    oper
      Noun : Type = { -- Kinds are in fact nouns
          s : Number => Str ; -- inflectional
          g : Gender -- inherent
      } ;

      regNoun : Str -> Noun = \bebida -> {
        s = table {
          Sing => bebida ;
          Plur => bebida + "s" -- gluing operator
          } ;
        g = getGender bebida
      } ;

      getGender : Str -> Gender = \sing -> case sing of {
          (gelat + "o") => Masc ;
          (cervej + "a") => Femm ;
          _ => Masc -- TODO: do not just default to masc
      } ;

      -- oversimplifcation (no person, no tense, no mood...)
      copula : Number -> Str = \n ->
        case n of {
          Sing => "é" ;
          Plur => "são"
        } ;

      det : Str -> Number -> {s : Number => Str} -> {s : Str ; a : Number} =
        \det,n,kind -> {
          s = det ++ kind.s ! n ;
          a = n
        } ;

      este = table {
        Masc => "este" ;
        Femm => "esta"
      } ;

      esse = table {
        Masc => "esse" ;
        Femm => "essa"
      } ;

      estos = table {
        Masc => "estos" ;
        Femm => "estas"
      } ;

      esses = table {
        Masc => "esses" ;
        Femm => "essas"
      } ;
}