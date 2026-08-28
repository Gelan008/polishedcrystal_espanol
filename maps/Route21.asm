Route21_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 14, 37, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_21_HIDDEN_STARDUST_1
	bg_event  5, 66, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_21_HIDDEN_STARDUST_2

	def_object_events
	object_event  8, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNikki, -1
	object_event  3, 29, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfChelan, -1
	object_event  5, 46, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKendra, -1
	object_event 16, 72, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermEsteban, -1
	object_event 15, 85, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermDuane, -1
	object_event  2, 89, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermSeth, -1
	object_event  5, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMurphy, -1
	object_event 16, 25, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherArnold, -1
	object_event  8, 36, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherLiam, -1
	object_event  4, 55, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherGideon, -1
	object_event 15, 62, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperKinsley, -1
	object_event  7, 83, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperEaston, -1
	itemball_event 13, 26, STAR_PIECE, 1, EVENT_ROUTE_21_STAR_PIECE
	fruittree_event 12,  3, FRUITTREE_ROUTE_21, ENIGMA_BERRY, PAL_NPC_BLACK

GenericTrainerSwimmerfNikki:
	generictrainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText

	text "Debo tener cuidado"
	line "con las manchas"
	cont "que causa el sol."
	done

SwimmerfNikkiSeenText:
	text "¡Si gano, tendrás"
	line "que ponerme crema"
	cont "bronceadora!"
	done

SwimmerfNikkiBeatenText:
	text "Me preocupan las"
	line "quemaduras de sol…"
	done

GenericTrainerSwimmerfChelan:
	generictrainer SWIMMERF, CHELAN, EVENT_BEAT_SWIMMERF_CHELAN, .SeenText, .BeatenText

	text "¡Un bikini que dé"
	line "electricidad te"
	cont "daría un calambre!"
	done

.SeenText:
	text "¡Con un bikini"
	line "térmico, podría"
	cont "llevarlo incluso"
	cont "en invierno!"
	done

.BeatenText:
	text "¡Ooooh…!"
	done

GenericTrainerSwimmerfKendra:
	generictrainer SWIMMERF, KENDRA, EVENT_BEAT_SWIMMERF_KENDRA, .SeenText, .BeatenText

	text "¿Venderán ropa de"
	line "baño para #mon"
	cont "en alguna tienda?"
	done

.SeenText:
	text "¡Hola! ¿Por qué no"
	line "te pones también"
	cont "un bañador?"
	done

.BeatenText:
	text "No quería perder…"
	done

GenericTrainerSwimmermEsteban:
	generictrainer SWIMMERM, ESTEBAN, EVENT_BEAT_SWIMMERM_ESTEBAN, .SeenText, .BeatenText

	text "¡Al profe le"
	line "decíamos Profesor"
	cont "Poliwhirl!"
	done

.SeenText:
	text "Mi entrenador de"
	line "natación tenía la"
	cont "cara igual que un"
	cont "Poliwhirl."
	done

.BeatenText:
	text "Lo siento, profe…"
	done

GenericTrainerSwimmermDuane:
	generictrainer SWIMMERM, DUANE, EVENT_BEAT_SWIMMERM_DUANE, .SeenText, .BeatenText

	text "¡Para ganar más,"
	line "debo mejorar mi"
	cont "resistencia!"
	done

.SeenText:
	text "¡Nadar entrena todo"
	line "el cuerpo y te"
	cont "pone fuerte!"
	done

.BeatenText:
	text "Mis #mon y yo"
	line "no tenemos fuerzas"
	done

GenericTrainerSwimmermSeth:
	generictrainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText

	text "Había un tipo muy"
	line "arrogante en el"
	cont "volcán de Canela."
	done

SwimmermSethSeenText:
	text "¡Veo tierra firme!"
	line "¡Hay que seguir!"
	done

SwimmermSethBeatenText:
	text "Glup…"
	done

GenericTrainerFisherMurphy:
	generictrainer FISHER, MURPHY, EVENT_BEAT_FISHER_MURPHY, .SeenText, .BeatenText

	text "¡El #mon que se"
	line "escapó era enorme!"
	done

.SeenText:
	text "¿Eh? ¡He pescado a"
	line "un entrenador en"
	cont "vez de a un"
	cont "#mon!"
	done

.BeatenText:
	text "¡Se me ha roto el"
	line "sedal!"
	done

GenericTrainerFisherArnold:
	generictrainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText

	text "Volveré a pescar"
	line "y ya está…"
	done

FisherArnoldSeenText:
	text "Me aburre pescar."
	line "¡Luchemos!"
	done

FisherArnoldBeatenText:
	text "Fracaso total…"
	done

GenericTrainerFisherLiam:
	generictrainer FISHER, LIAM, EVENT_BEAT_FISHER_LIAM, .SeenText, .BeatenText

	text "Debí pedirte que"
	line "esperaras a que"
	cont "recogiese ese"
	cont "#mon…"
	done

.SeenText:
	text "¡Picaron! ¿Eh, un"
	line "combate? ¡Vale!"
	done

.BeatenText:
	text "Quien mucho abarca"
	line "poco aprieta…"
	done

GenericTrainerFisherGideon:
	generictrainer FISHER, GIDEON, EVENT_BEAT_FISHER_GIDEON, .SeenText, .BeatenText

	text "¿Por qué motivo te"
	line "hiciste entrenador"
	cont "#mon?"
	done

.SeenText:
	text "¿Soy Pescador por"
	line "ser paciente o me"
	cont "hice paciente por"
	cont "ser Pescador?"
	done

.BeatenText:
	text "Mmm… Esto…"
	done

GenericTrainerBird_keeperKinsley:
	generictrainer BIRD_KEEPER, KINSLEY, EVENT_BEAT_BIRD_KEEPER_KINSLEY, .SeenText, .BeatenText

	text "¡Solo tengo que"
	line "practicar más el"
	cont "aleteo!"
	done

.SeenText:
	text "¡Algún día podré"
	line "volar como mis"
	cont "#mon pájaro!"
	done

.BeatenText:
	text "No pude volar…"
	done

GenericTrainerBird_keeperEaston:
	generictrainer BIRD_KEEPER, EASTON, EVENT_BEAT_BIRD_KEEPER_EASTON, .SeenText, .BeatenText

	text "¿Usamos a los"
	line "#mon o ellos"
	cont "a nosotros?"
	done

.SeenText:
	text "¡Los Ornitólogos"
	line "somos geniales con"
	cont "los #mon"
	cont "pájaro!"
	done

.BeatenText:
	text "No estuve a la"
	line "altura…"
	done
