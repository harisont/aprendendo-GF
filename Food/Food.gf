abstract Food = {
  
  flags startcat = Phrase ;
  
  cat
    Phrase ; Item ; Kind ; Quality ; Prefix ;

  fun
    Is : Prefix -> Item -> Quality -> Phrase ;
    IsQ : Prefix -> Item -> Quality -> Phrase ;
    This, That : Kind -> Item ;
    QKind : Quality -> Kind -> Kind ;
    Wine, Cheese, Fish, Bread, Beer, Sallad, Rice, IceCream, Soup : Kind ;
    Very : Quality -> Quality ;
    Fresh, Warm, Expensive, Cheap, Delicious, Disgusting, Boring : Quality ;
    Italian, German, Swedish : Quality ;
    ExcuseMeBut : Prefix ;
    NullPref : Prefix ;
}