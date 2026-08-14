FastShipCabins_NNW_NNE_NE_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  4,  5, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPILooker, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

	object_const_def
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR

GenericTrainerPILooker:
	generictrainer PI, LOOKER, EVENT_BEAT_PI_LOOKER, PILookerSeenText, PILookerBeatenText

	text "Mi nombre en cla-"
	line "ve es Looker."

	para "Así es como me"
	line "llaman todos."

	para "Estoy al acecho"
	line "de miembros del"
	cont "Team Rocket."

	para "¡¿Qué?! ¿Los"
	line "derrotaste?"

	para "¡Bravo!"
	done

GenericTrainerCooltrainermSean:
	generictrainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText

	text "Los entrenadores"
	line "de Johto pueden"

	para "luchar con los"
	line "Líderes de Kanto."
	done

GenericTrainerCooltrainerfCarol:
	generictrainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText

	text "¡Algún día voy a"
	line "derrotarte!"
	done

GenericTrainerPokemaniacEthan:
	generictrainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText

	text "Lily es genial y"
	line "¡Rosa es la mejor!"

	para "¡Quiero escuchar"
	line "los programas de"
	cont "radio de Johto!"
	done

GenericTrainerHikerNoland:
	generictrainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText

	text "Me pregunto si hay"
	line "alguna montaña"

	para "que valga la pena"
	line "escalar en Kanto."
	done

GenericTrainerGentlemanEdward:
	generictrainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText

	text "Me rindo."
	line "No tienes que"

	para "buscar. ¡Simple-"
	line "mente olvídalo!"
	done

GenericTrainerBurglarCorey:
	generictrainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText

	text "He encontrado una"
	line "moneda bonita."

	para "Alguien debe de"
	line "haberla perdido…"
	done

FastShipLazySailorScript:
	special SaveMusic
	playmusic MUSIC_HIKER_ENCOUNTER
	showtextfaceplayer SailorStanlySeenText
	winlosstext SailorStanlyBeatenText, SailorStanlyBeatenText
	loadtrainer SAILOR, STANLY
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	showtext SailorStanlyAfterBattleText
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FASTSHIPB1F_NOOP
	readvar VAR_FACING
	ifequalfwd $3, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipLazySailorLeavesMovement1:
	step_left
	step_left
	step_up
	step_up
	step_end

FastShipLazySailorLeavesMovement2:
	step_down
	step_left
	step_left
	step_up
	step_up
	step_up
	step_end

PILookerSeenText:
	text "¡¿QUÉEE?!"

	para "…¿Cómo lo"
	line "supiste? ¿Cómo me"

	para "desenmascaraste"
	line "como miembro de la"
	cont "Policía"
	cont "Internacional?!"
	done

PILookerBeatenText:
	text "¡Eres bastante"
	line "admirable!"
	done

CooltrainermSeanSeenText:
	text "Voy a Kanto para"
	line "probar mis habili-"
	cont "dades."
	done

CooltrainermSeanBeatenText:
	text "¡Quería ganar!"
	done

CooltrainerfCarolSeenText:
	text "¡Entreno para ser"
	line "la Campeona!"
	done

CooltrainerfCarolBeatenText:
	text "¿Qué nos hace"
	line "tan diferentes?"
	done

PokemaniacEthanSeenText:
	text "¿Conoces a Lily?"
	line "Es una gran DJ"
	cont "en Kanto."
	done

PokemaniacEthanBeatenText:
	text "¡Gyaaaah!"
	done

HikerNolandSeenText:
	text "¿Estás solo?"
	line "¡Entonces vamos a"
	cont "luchar!"
	done

HikerNolandBeatenText:
	text "¡Es demasiado para"
	line "mí!"
	done

SailorStanlySeenText:
	text "Sí, soy un mari-"
	line "nero."

	para "¡No estaba hacien-"
	line "do el vago!"

	para "¡Este camarote"
	line "estaba libre, así"
	cont "que eché una"
	cont "siestecita!"

	para "¡Ah, olvídalo!"
	line "¡A luchar!"
	done

SailorStanlyBeatenText:
	text "¡Perdón! ¡Es toda"
	line "mía la culpa!"
	done

SailorStanlyAfterBattleText:
	text "Al ser marinero,"
	line "tengo que hacer"
	cont "esfuerzo físico."
	cont "¡Es agotador!"
	done

GentlemanEdwardSeenText:
	text "Oh, no. He per-"
	line "dido algo que es"
	cont "muy importante."
	done

GentlemanEdwardBeatenText:
	text "Y... Yo no puedo"
	line "encontrarlo…"
	done

BurglarCoreySeenText:
	text "¡Yeehaw!"
	line "¡Qué suerte!"
	done

BurglarCoreyBeatenText:
	text "¡Qué mala suerte!"
	line "¡He perdido!"
	done
