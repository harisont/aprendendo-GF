concrete MusicRGLEng of Music = open SyntaxEng, ParadigmsEng, Prelude in {
    lincat
        Phrase = Utt ;
        Action = VP ;
        Person = NP ;
        Instrument = NP ;

    lin
        negPhrase p a = mkUtt (mkS negativePol (mkCl p a)) ;
        posPhrase p a = mkUtt (mkS (mkCl p a)) ;
        playInstr i = mkVP playInstr_V2 i ;
        sing = mkVP (mkV "sing" "sang" "sung") ;
        gil = mkNP (mkN "Gilberto Gil") ;
        iMascPerson = i_NP ;
        iFemPerson = i_NP ;
        youMascPerson = you_NP ;
        youFemPerson = you_NP ;
        hePerson = he_NP ;
        shePerson = she_NP ;
        guitar = mkNP the_Det (mkCN (mkN "guitar")) ;
        bass = mkNP the_Det (mkCN (mkN "bass")) ;
        violin = mkNP the_Det (mkCN (mkN "violin")) ;
        drumset = mkNP the_Det (mkCN (mkN "drumset")) ;
        piano = mkNP the_Det (mkCN (mkN "piano")) ;
        sax = mkNP the_Det (mkCN (mkN "saxophone")) ;
        flute = mkNP the_Det (mkCN (mkN "flute")) ;

    oper
        playInstr_V2 = mkV2 (mkV "play") ;
}