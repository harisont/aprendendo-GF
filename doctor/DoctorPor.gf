concrete DoctorPor of Doctor =
  open
    SyntaxPor,
    ParadigmsPor,
    CommonRomance,
    Prelude
  in {

-- application using standard RGL

lincat
  Phrase = Utt ;
  Fact = Cl ;
  Action = VP ;
  Property = VP ;
  Profession = CN ;
  Person = NP ;
  Place = {at,to : Adv} ;
  Substance = NP ;
  Illness = NP ** { isAcute : Bool } ;

lin
  presPosPhrase fact = mkUtt (mkS fact) ;
  presNegPhrase fact = mkUtt (mkS negativePol fact) ;
  pastPosPhrase fact = mkUtt (mkS anteriorAnt fact) ;
  pastNegPhrase fact = mkUtt (mkS anteriorAnt negativePol fact) ;
  presQuestionPhrase fact = mkUtt (mkQS (mkQCl fact)) ;
  pastQuestionPhrase fact = mkUtt (mkQS anteriorAnt (mkQCl fact)) ;

  impPosPhrase action = mkUtt (mkImp action) ;
  impNegPhrase action = mkUtt negativePol (mkImp action) ;

  actionFact person action = mkCl person action ;
  propertyFact person property = mkCl person property ;

  isProfessionProperty profession = mkVP (mkNP a_Det profession) ;
  needProfessionProperty profession = mkVP need_V2 (mkNP a_Det profession) ;
  isAtPlaceProperty place = mkVP place.at ;
  haveIllnessProperty illness = let illness_VP = {
      s = illness.s; 
      a = illness.a; 
      hasClit = illness.hasClit; 
      isNeg = illness.isNeg; 
      isPol = illness.isPol
    } in case illness.isAcute of {
      True => mkVP estar_V2 illness_VP ;
      False => mkVP have_V2 illness_VP
  } ;
  
  theProfessionPerson profession = mkNP the_Det profession ;

  iMascPerson = i_NP ;
  iFemPerson = i_NP ;
  youMascPerson = you_NP ;
  youFemPerson = you_NP ;
  hePerson = he_NP ;
  shePerson = she_NP ;

  goToAction place = mkVP (mkVP go_V) place.to ;
  stayAtAction place = mkVP (mkVP stay_V) place.at ;
  vaccinateAction person = mkVP vaccinate_V2 person ;
  examineAction person = mkVP examine_V2 person ;
  takeSubstanceAction substance = mkVP take_V2 substance ;

-- end of what could be a functor
--------------------------------

  coughAction = mkVP (mkV "tossir") ;
  breatheAction = mkVP (mkV "respirar") ;
  vomitAction = mkVP (mkV "vomitar") ;
  sleepAction = mkVP (mkV "dormir") ;
  undressAction = mkVP (mkV2 (mkV "tirar")) (mkNP theSg_Det (mkN "roupa")) ;
  dressAction = mkVP (mkV2 (mkV "vestir")) (mkNP theSg_Det (mkN "roupa")) ;
  eatAction = mkVP (mkV "comer") ;
  drinkAction = mkVP (mkV "beber") ;
  smokeAction = mkVP (mkV "fumar") ;
  measureTemperatureAction = mkVP (mkV2 (mkV "medir")) (mkNP the_Det (mkCN (mkA "corporal") (mkN "temperatura"))) ; -- adj (solved)
  measureBloodPressureAction = mkVP (mkV2 (mkV "medir")) (mkNP the_Det (mkCN (mkA "sanguínea") (mkN "pressão" Fem))) ; -- adj (solved)

  hospitalPlace = {at = pAdv "no hospital" ; to = pAdv "para o hospital"} ;
  homePlace = {at = pAdv "na casa" ; to = pAdv "para casa"} ;
  schoolPlace = {at = pAdv "na escola" ; to = pAdv "para a escola"} ;
  workPlace = {at = pAdv "no trabalho" ; to = pAdv "para o trabalho"} ;

  doctorProfession = mkCN (mkN "médico") ;
  nurseProfession = mkCN (mkN "enfermeira") ;
  interpreterProfession = mkCN (mkN "intérprete") ;

  bePregnantProperty = mkVP (mkA "grávida") ; -- estou gràvida
  beIllProperty = mkVP (mkA "doente") ; -- estou doente
  beWellProperty = mkVP (mkA "curado") ; -- estou curado/estou bem
  beDeadProperty = mkVP (mkA "morto") ; -- estou morto
  haveAllergiesProperty = mkVP have_V2 (mkNP aPl_Det (mkN "alergia")) ;
  havePainsProperty = mkVP have_V2 (mkNP (mkN "dores")) ; -- tenho dores
  haveChildrenProperty = mkVP have_V2 (mkNP (mkN "filho")) ; -- tenho filhos

  feverIllness = mkNP (mkN "febre") ** { isAcute = True } ;
  fluIllness = mkNP (mkN "gripe") ** { isAcute = True } ; 
  headacheIllness = mkNP (mkN "dor de cabeça") ** { isAcute = True } ;
  diarrheaIllness = mkNP (mkN "diarreia") ** { isAcute = True } ;
  heartDiseaseIllness = mkNP a_Det (mkN "doença do coração") ** { isAcute = False } ; -- agr
  lungDiseaseIllness = mkNP a_Det (mkN "doença pulmonar") ** { isAcute = False } ; -- agr
  hypertensionIllness = mkNP (mkN "hipertensão") ** { isAcute = False };

  alcoholSubstance = mkNP (mkN "álcool") ;
  medicineSubstance = mkNP a_Det (mkN "medicamento") ;
  drugsSubstance = mkNP aPl_Det (mkN "droga") ;

oper
  pAdv : Str -> Adv = ParadigmsPor.mkAdv ;

  go_V = mkV "ir" ;
  stay_V = mkV "ficar" ;
  need_V2 = mkV2 (mkV "precisar") ;
  take_V2 = mkV2 (mkV "tomar") ;
  vaccinate_V2 = mkV2 (mkV "vacinar") ;
  examine_V2 = mkV2 (mkV "examinar") ;
  estar_V2 = mkV2 (mkV "estar") (mkPrep "com") ;

}
