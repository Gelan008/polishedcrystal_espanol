Route49_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  5, VALENCIA_PORT, 1

	def_coord_events

	def_bg_events
	bg_event 31, 11, BGEVENT_JUMPTEXT, Route49SignText

	def_object_events
	object_event  5, 12, SPRITE_LADY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route49LadyText, -1
	object_event 31, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route49YoungsterText, -1
	object_event 15,  8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSightseermHari, -1
	object_event 12, 16, SPRITE_TAMER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerJordan, -1
	object_event 25, 19, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyPeony, -1
	object_event 25,  7, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGuitaristmGeddy, -1
	itemball_event 21,  6, WHITE_HERB, 1, EVENT_ROUTE_49_WHITE_HERB
	itemball_event 18, 20, CALCIUM, 1, EVENT_ROUTE_49_CALCIUM
	fruittree_event 29, 14, FRUITTREE_ROUTE_49, LUM_BERRY, PAL_NPC_GREEN
	cuttree_event 26, 12, EVENT_ROUTE_49_CUT_TREE_1
	cuttree_event 20, 15, EVENT_ROUTE_49_CUT_TREE_2

Route49LadyText:
	text "¡Mira la hierba y"
	line "los árboles de"
	cont "aquí!"

	para "Isla Valencia está"
	line "llena de una flo-"
	cont "ra única."
	done

Route49YoungsterText:
	text "¡Este paisaje me"
	line "hace sentir como"

	para "un aventurero en"
	line "plena jungla!"
	done

GenericTrainerSightseermHari:
	generictrainer SIGHTSEERM, HARI, EVENT_BEAT_SIGHTSEERM_HARI, .SeenText, .BeatenText

	text "He viajado mucho"
	line "solo para conocer"

	para "a todos los Prof."
	line "#mon."

	para "¿Quieres ver las"
	line "fotos que saqué?"
	done

.SeenText:
	text "¡Oye! ¡He venido"
	line "aquí a conocer a"
	cont "la Prof. Ivy!"
	done

.BeatenText:
	text "¿Qué? ¿Ya la"
	line "conoces?"
	done

GenericTrainerTamerJordan:
	generictrainer TAMER, JORDAN, EVENT_BEAT_TAMER_JORDAN, .SeenText, .BeatenText

	text "¿Cómo domaste tan"
	line "bien a tus #-"
	cont "mon?"

	para "Son fuertes, pero"
	line "tranquilos al mis-"
	cont "mo tiempo."
	done

.SeenText:
	text "¡Cuidado! ¡Los"
	line "#mon de aquí"
	cont "pueden ser muy"
	cont "fieros!"
	done

.BeatenText:
	text "¡Guau! Parece que"
	line "los tuyos son más"
	cont "fieros."
	done

GenericTrainerAromaLadyPeony:
	generictrainer AROMA_LADY, PEONY, EVENT_BEAT_AROMA_LADY_PEONY, .SeenText, .BeatenText

	text "A mi Bellossom le"
	line "encanta vivir en"

	para "esta pequeña isla"
	line "tan pacífica."
	done

.SeenText:
	text "¿Quieres ver a mi"
	line "Bellossom?"
	done

.BeatenText:
	text "Vaya… Bellossom no"
	line "quería combatir…"
	done

GenericTrainerGuitaristmGeddy:
	generictrainer GUITARISTM, GEDDY, EVENT_BEAT_GUITARISTM_GEDDY, .SeenText, .BeatenText

	text "¿Crees que toco la"
	line "guitarra? ¡Pues te"
	cont "equivocas!"

	para "Es un bajo de seis"
	line "cuerdas."
	done

.SeenText:
	text "Creo que podría"
	line "vivir la vida mu-"

	para "cho mejor de lo"
	line "que lo hago…"

	para "Por eso me llaman…"

	para "¡El currante me"
	line "llaman!"
	done

.BeatenText:
	text "¡Buen combate!"
	line "Quizá componga una"
	cont "canción sobre él."
	done

Route49SignText:
	text "Ruta 49"
	line "Isla Valencia"
	done
