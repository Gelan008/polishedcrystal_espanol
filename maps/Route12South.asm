Route12South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 57, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  0, 42, ROUTE_11_GATE, 3
	warp_event  0, 43, ROUTE_11_GATE, 4
	warp_event 10,  1, ROUTE_12_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 43, BGEVENT_JUMPTEXT, Route12SignText
	bg_event 14, 15, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_12_HIDDEN_ELIXIR

	def_object_events
	object_event  7,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMartin, -1
	object_event 14, 33, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherStephen, -1
	object_event 12, 63, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerFisherBarney, -1
	object_event 10, 74, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherKyler, -1
	object_event 10, 24, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperJustin, -1
	object_event  7, 57, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperGail, -1
	object_event 10, 39, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara1, -1
	object_event 10, 38, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara2, -1
	object_event 14, 89, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  5, 68, CALCIUM, 1, EVENT_ROUTE_12_CALCIUM
	itemball_event  5, 82, NUGGET, 1, EVENT_ROUTE_12_NUGGET
	cuttree_event  6, 71, EVENT_ROUTE_12_CUT_TREE_1
	cuttree_event  9, 79, EVENT_ROUTE_12_CUT_TREE_2

GenericTrainerFisherMartin:
	generictrainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText

	text "Soy demasiado"
	line "impaciente para"
	cont "pescar…"
	done

FisherMartinSeenText:
	text "La paciencia es"
	line "la clave tanto al"
	cont "pescar como con"
	cont "los #mon."
	done

FisherMartinBeatenText:
	text "¡Guaaaaah!"
	done

GenericTrainerFisherStephen:
	generictrainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText

	text "¿Has escuchado la"
	line "radio de Kanto?"

	para "Hay programas muy"
	line "variados."
	done

FisherStephenSeenText:
	text "Me siento en paz"
	line "pescando mientras"
	cont "escucho música en"
	cont "mi radio."
	done

FisherStephenBeatenText:
	text "¡Esta radio me ha"
	line "despistado!"
	done

GenericTrainerFisherBarney:
	generictrainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText

	text "La electricidad"
	line "es vital en nues-"
	cont "tra vida diaria."

	para "Si no, la gente no"
	line "habría armado tan-"

	para "to jaleo cuando se"
	line "averió la Central"
	cont "Energía."
	done

FisherBarneySeenText:
	text "¿Qué es lo más im-"
	line "portante en nues-"
	cont "tra vida diaria?"
	done

FisherBarneyBeatenText:
	text "¡La respuesta a"
	line "continuación!"
	done

GenericTrainerFisherKyler:
	generictrainer FISHER, KYLER, EVENT_BEAT_FISHER_KYLER, .SeenText, .BeatenText

	text "¿En serio? ¿En vez"
	line "de atrapar #mon"
	cont "nuevos sin parar,"

	para "¿es mejor entre-"
	line "narlos?"
	done

.SeenText:
	text "¡Los combates"
	line "#mon pican el"
	cont "anzuelo de todos!"
	done

.BeatenText:
	text "¡Mi cubo #mon"
	line "está vacío!"
	done

GenericTrainerBird_keeperJustin:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JUSTIN, EVENT_BEAT_BIRD_KEEPER_JUSTIN, .SeenText, .BeatenText

	text "Como el viento ha"
	line "cambiado, pasaré"
	cont "desapercibido…"
	done

.SeenText:
	text "¿Eh? ¡El viento"
	line "ha cambiado de"
	cont "dirección!"
	done

.BeatenText:
	text "Uf…"
	done

GenericTrainerBird_keeperGail:
	generictrainer BIRD_KEEPER, GAIL, EVENT_BEAT_BIRD_KEEPER_GAIL, .SeenText, .BeatenText

	text "¿Pío-pío?"
	line "¡Píopío!"
	done

.SeenText:
	text "¡FLAP, FLAP, FLAP,"
	line "FLAP, FLAP!"
	done

.BeatenText:
	text "Pío, pío, pío…"
	done

GenericTrainerCoupleVicandtara1:
	generictrainer COUPLE, VICANDTARA1, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "Vic: Tara ya me"
	line "ha visto hacer el"
	cont "ridículo…"
	done

.SeenText:
	text "Vic: ¡Genial! ¡Voy"
	line "a poder lucirme"
	cont "ante Tara!"
	done

.BeatenText:
	text "Vic: ¡Vaya, mis"
	line "planes!"
	done

GenericTrainerCoupleVicandtara2:
	generictrainer COUPLE, VICANDTARA2, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "Tara: Aunque mi"
	line "novio haya perdi-"
	cont "do, ¡sigue siendo"
	cont "maravilloso!"
	done

.SeenText:
	text "Tara: ¡Me encanta"
	line "mirar la cara de"

	para "mi novio cuando"
	line "está luchando!"
	done

.BeatenText:
	text "Tara: ¡Oh, no!"
	line "¡Oh, no!…"
	done

Route12SignText:
	text "Ruta 12"

	para "Al norte:"
	line "Pueblo Lavanda"
	done