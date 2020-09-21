-- concrete syntax (English)
concrete HelloEng of Hello = {
  
  -- linearization types definitions
  lincat Greeting, Recipient = {s : Str} ;
  
  -- linearization definitions (fun definitions, using record notation)
  lin
    Hello recip = {s = "hello" ++ recip.s} ;
    Bye recip = {s = "bye" ++ recip.s} ;
    GoodEvening recip = {s = "good evening" ++ recip.s} ;
    GoodNight recip = {s = "good night" ++ recip.s} ;
    World = {s = "world"} ;
    Mum = {s = "mum"} ;
    Dad = {s = "dad"} ;
    Friends = {s = "friends"} ;
}