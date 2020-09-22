abstract Food = Drink ** { -- extends Drink
  
  flags startcat = Phrase ;
  
  cat
    Phrase ; Item ; Quality ; Prefix ;

  fun
    Is : Prefix -> Item -> Quality -> Phrase ;
    IsQ : Prefix -> Item -> Quality -> Phrase ;
    This, That, These, Those : Kind -> Item ;
    QKind : Quality -> Kind -> Kind ;
    Cheese, Fish, Bread, Rice, IceCream : Kind ;
    Very : Quality -> Quality ;
    Fresh, Warm, Expensive, Cheap, Delicious, Disgusting, Boring : Quality ;
    Italian, German, Swedish : Quality ;
    ExcuseMeBut : Prefix ;
    NullPref : Prefix ;
}