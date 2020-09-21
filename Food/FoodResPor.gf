resource FoodResPor = {
    param 
        Number = Sing | Plur ;
        Gender = Masc | Femm ;
        
    oper
        Noun : Type = { -- Kinds are in fact nouns
            s : Number => Str ; -- inflectional
            g : Gender -- inherent
        } ;

        -- example paradigm
        regKind : Str -> Noun = \bebida -> {
          s = table {
            Sg => bebida ;
            Pl => bebida + "s" -- gluing operator
            } ;
          g = getGender bebida
        } ;

        getGender : Str -> Gender = \sing -> case sing of {
            (gelat + "o") => Masc ;
            (cervej + "a") => Femm ;
            _ => Masc -- TODO: do not just default to masc
        } ;
}