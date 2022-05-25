resource MicroResPor = open Prelude in {

param
  Number = Sg | Pl ;
  Gender = Masc | Femm ;
  Case = Nom | Acc ;
  Person = I | II | III ;

  NGAgreement = NGAgr Number Gender ; -- used e.g. for noun-adj agreement
  NPAgreement = NPAgr Number Person ; -- used e.g. for verb-subj (pron) agreement

  -- source: https://pt.wikipedia.org/wiki/Gram%C3%A1tica_da_l%C3%ADngua_portuguesa#Tempos_e_aspectos
  VForm = InfImp
        -- | InfPess -- TODO: infinitivo pessoal
        | PartPass
        | IndPres NPAgreement
        | ImpPres NPAgreement ; -- using the Brazilian "você" rather than the Portuguese "tu", so imperative does not change according to polarity (source: https://www.practiceportuguese.com/learning-notes/the-imperative/)

oper

  -- used both for nouns and adjectives
  -- source: https://pt.wikipedia.org/wiki/Gram%C3%A1tica_da_l%C3%ADngua_portuguesa#Da_flex%C3%A3o_dos_substantivos
  plural : Str -> Str = \sg -> case sg of {
    x + ("s" | "z" | "r") => x + "es" ;
    x + "ão" => x + "ões" ;
    anim + "al" => anim + "ais" ;
    lenç + "ol" => lenç + "ois" ;
    pa + "ul" => pa + "uis" ;
    x => x + "s"
  } ;

  Noun : Type = {
    s : Number => Str;
    g : Gender
    } ;

  mkNoun : Str -> Str -> Gender -> Noun = \sg,pl,gn -> {
    s = table {Sg => sg ; Pl => pl};
    g = gn
    } ;

  regNoun : Str -> Noun = \sg -> mkNoun sg (plural sg) (nounGender sg) ;

  -- infers gender for regular nouns
  -- source: https://pt.wikipedia.org/wiki/Gram%C3%A1tica_da_l%C3%ADngua_portuguesa#Da_flex%C3%A3o_dos_substantivos
  nounGender : Str -> Gender = \s -> case s of {
    x + ("o" | "i" | "u" | "é" | "em" | "im" | "om" | "um" | "r" | "s" | "l") => Masc ;
    x + ("a" | "ã" | "ão" | "gem" | "dade" | "ice" | "e" | "ê") => Femm ;
    _ => Predef.error("Gender of " ++ s ++ " is unknown")
  } ;

  Adjective : Type = { s : NGAgreement => Str; } ;

  mkAdjective : Str -> Str -> Str -> Str -> Adjective = \msg,mpl,fsg,fpl -> {
    s = table {
      NGAgr Sg Masc => msg ;
      NGAgr Pl Masc => mpl ;
      NGAgr Sg Femm => fsg ;
      NGAgr Pl Femm => fpl 
    } ;
  } ;

  -- source: https://pt.wikipedia.org/wiki/Gram%C3%A1tica_da_l%C3%ADngua_portuguesa#Flex%C3%B5es_do_adjetivo
  feminine : Str -> Str = \sg -> case sg of {
    x + ("és" | "or" | "u") => sg + "a" ;
    europ + "eu" => europ + "éia" ;
    pront + "o" => pront + "a" ;
    _ => Predef.error("The feminine form of " ++ sg ++ " is unknown")
  } ;

  -- source: https://pt.wikipedia.org/wiki/Gram%C3%A1tica_da_l%C3%ADngua_portuguesa#Flex%C3%B5es_do_adjetivo
  smartAdjective : Str -> Adjective = \msg -> case msg of {
    -- uniformes
    x + ("al" | "el" | "il" | "ul" | "ar" | "er" | "az" | "iz" | "oz" | "uz" | "e" | "em") => let pl = plural msg in mkAdjective msg pl msg pl ;
    -- biformes
    _ => let fsg = feminine msg in mkAdjective msg (plural msg) fsg (plural fsg)
  } ;

  -- source: https://www.conjugacao.com.br/
  Verb : Type = {s : VForm => Str} ;

  mkVerb : (iinf,ppass,pressg1,pressg2,pressg3,prespl1,prespl2,prespl3,impsg2,imppl2 : Str) -> Verb
    = \iinf,ppass,pressg1,pressg2,pressg3,prespl1,prespl2,prespl3,impsg2,imppl2 -> {
    s = table {
      InfImp => iinf ;
      PresPart => ppass ;
      IndPres (NPAgr Sg I) => pressg1 ;
      IndPres (NPAgr Sg II) => pressg2 ;
      IndPres (NPAgr Sg III) => pressg3 ;
      IndPres (NPAgr Pl I) => prespl1 ;
      IndPres (NPAgr Pl II) => prespl2 ;
      IndPres (NPAgr Pl III) => prespl3 ;
      ImpPres (NPAgr Sg II) => impsg2 ;
      ImpPres (NPAgr Sg III) => imppl2 ;
      _ => nonExist
      }
    } ;

  smartVerb : (inf : Str) -> Verb = \inf -> case inf of {
    encontr + "ar" => conjugAr encontr ;
    corr + "er" => conjugEr corr ;
    abr + "ir" => conjugIr abr 
  } ;

   conjugAr : Str -> Verb = \encontr -> mkVerb 
    (encontr + "ar") 
    (encontr + "ada")
    (encontr + "o")
    (encontr + "as")
    (encontr + "a")
    (encontr + "amos")
    (encontr + "ais")
    (encontr + "an")
    (encontr + "e")
    (encontr + "em") ;

   conjugEr : Str -> Verb = \corr -> mkVerb 
    (corr + "er") 
    (corr + "ido")
    (corr + "o")
    (corr + "es")
    (corr + "e")
    (corr + "emos")
    (corr + "eis")
    (corr + "em")
    (corr + "a")
    (corr + "am") ;

  conjugIr : Str -> Verb = \abr -> mkVerb
    (abr + "ir") 
    (abr + "erto")
    (abr + "o")
    (abr + "es")
    (abr + "e")
    (abr + "imos")
    (abr + "is")
    (abr + "em")
    (abr + "a")
    (abr + "am") ;

  -- two-place verb with "case" as preposition; for transitive verbs, c=[]
  Verb2 : Type = Verb ** {c : Str} ;

  be_Verb : Verb = mkVerb "ser" "sido" "sou" "és" "é" "somos" "sois" "são" "seja" "sejam" ;


---s a very simplified verb agreement function for Micro
--  agr2vform : NPAgreement -> VForm = \a -> case a of {
--    Agr Sg => PresSg3 ;
--    Agr Pl => Inf
--    } ;
--
}
