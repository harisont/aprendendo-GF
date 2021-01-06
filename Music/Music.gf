abstract Music = {
    flags startcat = Phrase ;

    cat
        Phrase ;
        Action ;
        Person ;
        Instrument ;

    fun
        negPhrase : Person -> Action -> Phrase ;
        posPhrase : Person -> Action -> Phrase ;
        playInstr : Instrument -> Action ;
        sing : Action ;
        gil : Person ;
        iMascPerson : Person ;
        iFemPerson : Person ;
        youMascPerson : Person ;
        youFemPerson : Person ;
        hePerson : Person ;
        shePerson : Person ;
        guitar : Instrument ;
        bass : Instrument ;
        violin : Instrument;
        drumset : Instrument ;
        piano : Instrument ;
        sax : Instrument ;
        flute : Instrument ;

}