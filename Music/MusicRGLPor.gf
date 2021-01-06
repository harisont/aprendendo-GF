concrete MusicRGLPor of Music = open SyntaxPor, ParadigmsPor, Prelude in {
    lincat
        Phrase = Utt ;
        Action = VP ;
        Person = NP ;
        Instrument = NP ;

    lin
        negPhrase p a = mkUtt (mkS negativePol (mkCl p a)) ;
        posPhrase p a = mkUtt (mkS (mkCl p a)) ;
        playInstr i = mkVP playInstr_V2 i ;
        sing = mkVP (mkV "cantar") ;
        gil = mkNP (mkN "Gilberto Gil") ;
        iMascPerson = i_NP ;
        iFemPerson = i_NP ;
        youMascPerson = you_NP ;
        youFemPerson = you_NP ;
        hePerson = he_NP ;
        shePerson = she_NP ;
        guitar = mkNP (mkCN (mkN "guitarra")) ;
        bass = mkNP (mkCN (mkN "baixo")) ;
        violin = mkNP (mkCN (mkN "violino")) ;
        drumset = mkNP (mkCN (mkN "bateria")) ;
        piano = mkNP (mkCN (mkN "piano")) ;
        sax = mkNP (mkCN (mkN "saxofone")) ;
        flute = mkNP (mkCN (mkN "flauta")) ;

    oper
        -- TODO: fix (uses ficar for some reason)
        playInstr_V2 = mkV2 (mkV "tocar") ; 
}
