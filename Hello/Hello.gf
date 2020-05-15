-- abstract syntax module
abstract Hello = {
  
  -- initial symbol
  flags startcat = Greeting ;
  
  -- category declarations
  cat Greeting ; Recipient ;
  
  -- function declarations
  fun
    Hello : Recipient -> Greeting ;
    Bye : Recipient -> Greeting ;
    GoodAfternoon : Recipient -> Greeting ;
    GoodEvening : Recipient -> Greeting ;
    World, Mum, Dad, Friends : Recipient ;
}