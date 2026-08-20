UnionCaveB1FSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, UNION_CAVE_1F, 2
	warp_event 17,  3, UNION_CAVE_B2F, 1
	warp_event  5, 33, MURKY_SWAMP, 3
	warp_event 17, 23, ROUTE_32_COAST, 1

	def_coord_events

	def_bg_events
	bg_event  2, 18, BGEVENT_ITEM + X_SP_DEF, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_X_SP_DEF
	bg_event 12, 25, BGEVENT_ITEM + NUGGET, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_NUGGET
	bg_event  4, 30, BGEVENT_ITEM + FULL_RESTORE, EVENT_UNION_CAVE_B1F_SOUTH_HIDDEN_FULL_RESTORE

	def_object_events
	object_event  5,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacAndrew, -1
	object_event 17,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacCalvin, -1
	object_event 16, 13, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerPhillip, -1
	object_event 14, 30, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerLeonard, -1
	object_event  3, 20, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherJay, -1
	object_event  7, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuper_nerdRory, -1
	object_event 12, 17, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacGlyn, -1
	strengthboulder_event 14, 4
	strengthboulder_event  8, 32
	smashrock_event 11, 15
	smashrock_event 12, 24
	itemball_event 14, 20, DUSK_STONE, 1, EVENT_UNION_CAVE_B1F_SOUTH_DUSK_STONE
	itemball_event  8, 26, SUPER_REPEL, 1, EVENT_UNION_CAVE_B1F_SOUTH_SUPER_REPEL
	itemball_event  2, 28, LIGHT_CLAY, 1, EVENT_UNION_CAVE_B1F_SOUTH_LIGHT_CLAY

GenericTrainerPokemaniacAndrew:
	generictrainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText

	text "Solo mis #mon"
	line "y yo. ¡Me muero"
	cont "de felicidad!"
	done

PokemaniacAndrewSeenText:
	text "¿Quién anda ahí?"

	para "¡Dejadnos a mis"
	line "#mon y a mí en"
	cont "paz!"
	done

PokemaniacAndrewBeatenText:
	text "¡Fuera!…"
	line "¡Largo de aquí!"
	done

GenericTrainerPokemaniacCalvin:
	generictrainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText

	text "Debería publicar"
	line "mis estudios."

	para "¡Igual hasta me"
	line "hago famoso como"
	cont "el Prof. Elm!"
	done

PokemaniacCalvinSeenText:
	text "He venido hasta"
	line "aquí a estudiar a"
	cont "los #mon."

	para "¡Demostraré mis"
	line "hallazgos en un"
	cont "combate real!"
	done

PokemaniacCalvinBeatenText:
	text "¡Vaya demostración"
	line "me has dado!"
	done

GenericTrainerHikerPhillip:
	generictrainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText

	text "Llevo mucho tiempo"
	line "perdido…"

	para "No me disgusta"
	line "este lugar, ¡pero"
	cont "muero de hambre!"
	done

HikerPhillipSeenText:
	text "Hacía tiempo que"
	line "no veía a otra"
	cont "persona."

	para "No te cortes."
	line "¡A luchar!"
	done

HikerPhillipBeatenText:
	text "Uurggh…"
	done

GenericTrainerHikerLeonard:
	generictrainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText

	text "Vivo aquí abajo."

	para "Tú también puedes"
	line "si quieres."

	para "Como ves, sobra el"
	line "espacio."
	done

HikerLeonardSeenText:
	text "¡Vaya! ¡Una"
	line "visita!"
	done

HikerLeonardBeatenText:
	text "¡Jajaja! ¡Tienes"
	line "mucho genio!"
	done

GenericTrainerFirebreatherJay:
	generictrainer FIREBREATHER, JAY, EVENT_BEAT_FIREBREATHER_JAY, .SeenText, .BeatenText

	text "Una vez se me"
	line "quemó el gorro."

	para "Parecía un Magmar…"
	line "¡y cómo dolía!"
	done

.SeenText:
	text "¡Aprendí a escupir"
	line "fuego observando"
	cont "a mis #mon!"
	done

.BeatenText:
	text "Nuestro fuego no"
	line "ha podido contigo…"
	done

GenericTrainerSuper_nerdRory:
	generictrainer SUPER_NERD, RORY, EVENT_BEAT_SUPER_NERD_RORY, .SeenText, .BeatenText

	text "Un santiamén es el"
	line "término científico"
	cont "para 1/100 de un"
	cont "segundo."
	done

.SeenText:
	text "Esto se acaba en"
	line "un santiamén."
	done

.BeatenText:
	text "Puede que haya"
	line "errado el cálculo…"
	done

GenericTrainerRuin_maniacGlyn:
	generictrainer RUIN_MANIAC, GLYN, EVENT_BEAT_RUIN_MANIAC_GLYN, .SeenText, .BeatenText

	text "Las rocas esconden"
	line "muchos objetos"
	cont "muy curiosos."
	done

.SeenText:
	text "¡Mis #mon"
	line "vienen de fósiles"
	cont "que hallé en esta"
	cont "misma cueva!"
	done

.BeatenText:
	text "¡Y han perdido en"
	line "esta misma cueva"
	cont "también!"
	done
