resource FoodResEng = {
    param 
        Number = Sing | Plur ;

    -- example paradigm
    oper regNoun : Str -> {s : Number => Str} = \drink -> {
      s = table {
        Sg => drink ;
        Pl => drink + "s" -- gluing operator
        }
      } ;
}

