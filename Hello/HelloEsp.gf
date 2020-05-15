-- concrete syntax (Spanish)
concrete HelloEsp of Hello = {
  
  -- linearization types definitions
  lincat Greeting, Recipient = {s : Str} ;
  
  -- linearization definitions (record notation)
  lin
    Hello recip = {s = "hola" ++ recip.s} ;
    Bye recip = {s = "adiós" ++ recip.s} ;
    GoodAfternoon recip = {s = "buenas tardes" ++ recip.s} ;
    GoodEvening recip = {s = "buenas tardes" ++ recip.s} ;
    World = {s = "mundo"} ;
    Mum = {s = "mamá"} ;
    Dad = {s = "papá"} ;
    Friends = {s = "amigos"} ;
}