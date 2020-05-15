-- concrete syntax (Portuguese)
concrete HelloPor of Hello = {
  
  -- linearization types definitions
  lincat Greeting, Recipient = {s : Str} ;
  
  -- linearization definitions (record notation)
  lin
    Hello recip = {s = "olá" ++ recip.s} ;
    Bye recip = {s = "adeus" ++ recip.s} ;
    GoodEvening recip = {s = "boa noite" ++ recip.s} ;
    GoodNight recip = {s = "boa noite" ++ recip.s} ;
    World = {s = "mundo"} ;
    Mum = {s = "mãe"} ;
    Dad = {s = "pai"} ;
    Friends = {s = "amigos"} ;
}