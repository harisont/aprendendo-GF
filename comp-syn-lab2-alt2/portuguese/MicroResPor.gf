resource MicroResPor = open Prelude in {

param
  Number = Sg | Pl ;
  Gender = Masc | Femm ;
  Case = Nom | Acc ;
  Person = I | II | III ;

  NGAgreement = NGAgr Number Gender ; -- used e.g. for noun-adj agreement
  NPAgreement = NPAgr Number Person ; -- used e.g. for verb-subj (pron) agreement

  -- all forms of normal Por verbs, although not yet used in MiniGrammar
  VForm = Inf | PresSg3 | Past | PastPart | PresPart ; 

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

  Verb : Type = {s : VForm => Str} ;

  mkVerb : (inf,pres,past,pastpart,prespart : Str) -> Verb
    = \inf,pres,past,pastpart,prespart -> {
    s = table {
      Inf => inf ;
      PresSg3 => pres ;
      Past => past ;
      PastPart => pastpart ;
      PresPart => prespart
      }
    } ;

  regVerb : (inf : Str) -> Verb = \inf ->
    mkVerb inf (inf + "s") (inf + "ed") (inf + "ed") (inf + "ing") ;

  -- regular verbs with predictable variations
  smartVerb : Str -> Verb = \inf -> case inf of {
     pl  +  ("a"|"e"|"i"|"o"|"u") + "y" => regVerb inf ;
     cr  +  "y" =>  mkVerb inf (cr + "ies") (cr + "ied") (cr + "ied") (inf + "ing") ;
     lov + "e"  => mkVerb inf (inf + "s") (lov + "ed") (lov + "ed") (lov + "ing") ;
     kis + ("s"|"sh"|"x"|"o") => mkVerb inf (inf + "es") (inf + "ed") (inf + "ed") (inf + "ing") ;
     _ => regVerb inf
     } ;

  -- normal irregular verbs e.g. drink,drank,drunk
  irregVerb : (inf,past,pastpart : Str) -> Verb =
    \inf,past,pastpart ->
      let verb = smartVerb inf
      in mkVerb inf (verb.s ! PresSg3) past pastpart (verb.s ! PresPart) ;   

  -- two-place verb with "case" as preposition; for transitive verbs, c=[]
  Verb2 : Type = Verb ** {c : Str} ;

  be_Verb : Verb = mkVerb "are" "is" "was" "been" "being" ; ---s to be generalized


---s a very simplified verb agreement function for Micro
--  agr2vform : NPAgreement -> VForm = \a -> case a of {
--    Agr Sg => PresSg3 ;
--    Agr Pl => Inf
--    } ;
--
}
