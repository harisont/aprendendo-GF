-- abstract syntax module
abstract Hello = {  -- module header
  
  -- initial symbol
  flags startcat = Greeting ;
  
  -- category declarations
  cat Greeting ; Recipient ;
  
  -- function declarations (for cat building)
  fun
    Hello : Recipient -> Greeting ;
    Bye : Recipient -> Greeting ;
    GoodEvening : Recipient -> Greeting ;
    GoodNight : Recipient -> Greeting ;
    World, Mum, Dad, Friends : Recipient ;
}