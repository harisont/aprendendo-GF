resource FoodResEng = {
    param 
        Number = Sing | Plur ;

    -- example paradigm
    oper 
      regNoun : Str -> {s : Number => Str} = \drink -> {
        s = table {
          Sing => drink ;
          Plur => drink + "s" -- gluing operator
        }
      } ;

      copula : Number -> Str = \n ->
        case n of {
          Sing => "is" ;
          Plur => "are"
        } ;

      det : Str -> Number -> {s : Number => Str} -> {s : Str ; a : Number} =
        \det,n,kind -> {
          s = det ++ kind.s ! n ;
          a = n
        } ;
}

