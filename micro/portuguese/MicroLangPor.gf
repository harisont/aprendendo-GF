--# -path=.:../abstract
concrete MicroLangPor of MicroLang = open MicroResPor, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    Adv = {s : Str} ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin already_Adv = mkAdv "já" ;
lin animal_N = mkN "animal" ;
lin apple_N = mkN "maçã" ;
lin baby_N = mkN "bebê" ;
lin bad_A = mkA "mau" "má" "más" "maus";
lin beer_N = mkN "cerveja" ;
lin big_A = mkA "grande" ;
lin bike_N = mkN "bicicleta" ;
lin bird_N = mkN "pássaro" ;
lin black_A = mkA "preto" ;
lin blood_N = mkN "sangue" Masc ;
lin blue_A = mkA "azul" ;
lin boat_N = mkN "barco" ;
lin book_N = mkN "livro" ;
lin boy_N = mkN "menino" ;
lin bread_N = mkN "pão" ;
lin break_V2 = mkV2 (mkV "quebrar") ;
lin buy_V2 = mkV2 (mkV "comprar") ;
lin car_N = mkN "carro" ;
lin cat_N = mkN "gato" ;
lin child_N = mkN "criança" ;
lin city_N = mkN "cidade" ;
lin clean_A = mkA "limpo" ;
lin clever_A = mkA "inteligente" ;
lin cloud_N = mkN "nuvem" ;
lin cold_A = mkA "frio" ;
lin come_V = mkV "vir" ;
lin computer_N = mkN "computador" ;
lin cow_N = mkN "vaca" ;
lin dirty_A = mkA "sujo" ;
lin dog_N = mkN "cachorro" ;
lin drink_V2 = mkV2 (mkV "beber") ;
lin eat_V2 = mkV2 (mkV "comer") ;
lin find_V2 = mkV2 (mkV "encontrar") ;
lin fire_N = mkN "fogo" ;
lin fish_N = mkN "peixe" ;
lin flower_N = mkN "flor" ;
lin friend_N = mkN "amigo" ;
lin girl_N = mkN "menina" ;
lin good_A = mkA "bom" "bons" "boa" "boas" ;
lin go_V = mkV "ir" ;
lin grammar_N = mkN "gramática" ;
lin green_A = mkA "verde" ;
lin heavy_A = mkA "pesado" ;
lin horse_N = mkN "cavalo" ;
lin hot_A = mkA "quente" ;
lin house_N = mkN "casa" ;
lin jump_V = mkV "pular" ;
lin kill_V2 = mkV2 "matar" ;
lin language_N = mkN "idioma" ;
lin live_V = mkV "viver" ;
lin love_V2 = mkV2 (mkV "amar") ;
lin man_N = mkN "homem" "homem" ;
lin milk_N = mkN "leite" ;
lin music_N = mkN "música" ;
lin new_A = mkA "novo" ;
lin now_Adv = mkAdv "agora" ;
lin old_A = mkA "velho" ;
lin play_V = mkV "jogar" ;
lin read_V2 = mkV2 (mkV "ler") ;
lin ready_A = mkA "pronto" ;
lin red_A = mkA "vermelho" ;
lin river_N = mkN "rio" ;
lin run_V = mkV "correr" ;
lin sea_N = mkN "mar" ;
lin see_V2 = mkV2 (mkV "ver") ;
lin ship_N = mkN "navio" ;
lin sleep_V = mkV "dormir" ;
lin small_A = mkA "pequeno" ;
lin star_N = mkN "estrela" ;
lin swim_V = mkV "nadar" ;
lin teach_V2 = mkV2 (mkV "ensinar") ;
lin train_N = mkN "treinar" ;
lin travel_V = mkV "viajar" ;
lin tree_N = mkN "árvore" ;
lin understand_V2 = mkV2 (mkV "entender") ;
lin wait_V2 = mkV2 "esperar" ;
lin walk_V = mkV "andar" ;
lin warm_A = mkA "cálido" ;
lin water_N = mkN "água" ;
lin white_A = mkA "branco" ;
lin wine_N = mkN "vinho" ;
lin woman_N = mkN "mulher" ;
lin yellow_A = mkA "amarelo" ;
lin young_A = mkA "jovem" "jovens" "jovem" "jovens" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun -- predictable noun, e.g. livro-livros, cor-cores, questão-questões, lençol-lençóis
      = \n -> lin N (regNoun n) ;
    mkN : Str -> Gender -> Noun -- regular noun with unpredicable gender, e.g. poeta-poetas
      = \sg,gn -> lin N (mkNoun sg (plural sg) gn) ;
    mkN : Str -> Str -> Noun -- irregular noun with predictable gender, e.g. alemão-alemães
      = \sg,pl -> lin N (mkNoun sg pl (nounGender sg)) ;
    mkN : Str -> Str -> Gender -> Noun  -- irregular noun with unpredictable gender, e.g. cinema-cinemas
      = \sg,pl,gn -> lin N (mkNoun sg pl gn) ;
    } ;

  mkA = overload {
    mkA : Str -> Adjective -- predictable adjective, e.g. velho(s)-velha(s)
      = \s -> lin A (smartAdjective s) ;
    mkA : Str -> Str -> Adjective -- adjective with predictable plural but unpredictable gender inflection, e.g. motor-motriz
      = \m,f -> lin A (mkAdjective m (plural m) f (plural f)) ;
    mkA : Str -> Str -> Str -> Str -> Adjective -- completely crazy adjective, I can't even think of an example
      = \msg,mpl,fsg,fpl -> lin A (mkAdjective msg mpl fsg fpl)
  } ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. correr
      = \s -> lin V (smartVerb s) ;
    mkV : (iinf,ppass,pressg1,pressg2,pressg3,prespl1,prespl2,prespl3,impsg2,imppl2 : Str) -> V  -- irregular verb, e.g. ir
      = \iinf,ppass,pressg1,pressg2,pressg3,prespl1,prespl2,prespl3,impsg2,imppl2 -> lin V (mkVerb iinf ppass pressg1 pressg2 pressg3 prespl1 prespl2 prespl3 impsg2 imppl2) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
}
