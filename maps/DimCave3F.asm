DimCave3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, DimCave3FBouldersLand
	callback MAPCALLBACK_CMDQUEUE, DimCave3FSetUpStoneTable

	def_warp_events
	warp_event  5,  5, DIM_CAVE_4F, 4
	warp_event 28, 22, DIM_CAVE_4F, 5
	warp_event 15, 10, DIM_CAVE_4F, 6 ; hole
	warp_event 29,  5, DIM_CAVE_2F, 2
	warp_event 27, 25, DIM_CAVE_2F, 3
	warp_event 14, 21, DIM_CAVE_2F, 4

	def_coord_events

	def_bg_events
	bg_event  2,  5, BGEVENT_ITEM + STAR_PIECE, EVENT_DIM_CAVE_3F_HIDDEN_STAR_PIECE
	bg_event 26,  6, BGEVENT_ITEM + ZINC, EVENT_DIM_CAVE_3F_HIDDEN_ZINC

	def_object_events
	strengthboulder_event  3, 17, EVENT_BOULDER_IN_DIM_CAVE_3F
	object_event 15,  8, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, DimCaveFallenBoulderText, EVENT_BOULDER_FELL_IN_DIM_CAVE_3F
	object_event 14,  4, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerHugo, -1
	object_event 22, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBlackbeltTakeo, -1
	object_event 10, 27, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerFloyd, -1
	object_event 25, 22, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DimCave3FPokefanmScript, -1
	itemball_event 18,  3, METAL_COAT, 1, EVENT_DIM_CAVE_3F_METAL_COAT
	itemball_event 10, 29, ESCAPE_ROPE, 1, EVENT_DIM_CAVE_3F_ESCAPE_ROPE
	tmhmball_event 20,  9, TM_REST, EVENT_DIM_CAVE_3F_TM_REST

	object_const_def
	const DIMCAVE3F_BOULDER

DimCave3FBouldersLand:
	checkevent EVENT_BOULDER_FELL_IN_DIM_CAVE_3F
	iftruefwd .skip
	changeblock 14, 8, $c7
	changeblock 14, 26, $cf
.skip
	endcallback

DimCave3FSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 6, DIMCAVE3F_BOULDER, .Boulder
	db -1 ; end

.Boulder:
	disappear DIMCAVE3F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_2F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "La roca cayó por"
	line "el agujero."
	done

GenericTrainerEngineerHugo:
	generictrainer ENGINEER, HUGO, EVENT_BEAT_ENGINEER_HUGO, .SeenText, .BeatenText

	text "El ruido de esa"
	line "vagoneta me dio"
	cont "un buen susto."

	para "Siempre hay que"
	line "estar alerta por"
	cont "los derrumbes."
	done

.SeenText:
	text "¡Derrumbe!"
	done

.BeatenText:
	text "¡Ah, solo has"
	line "movido una roca!"
	done

GenericTrainerBlackbeltTakeo:
	generictrainer BLACKBELT_T, TAKEO, EVENT_BEAT_BLACKBELT_TAKEO, .SeenText, .BeatenText

	text "Solo quiero"
	line "entrenar en paz."
	done

.SeenText:
	text "Estoy entrenando"
	line "aquí a solas con"
	cont "mis #mon."

	para "¡Vete de una vez!"
	done

.BeatenText:
	text "Está claro que"
	line "necesito entrenar"
	cont "más…"
	done

GenericTrainerHikerFloyd:
	generictrainer HIKER, FLOYD, EVENT_BEAT_HIKER_FLOYD, .SeenText, .BeatenText

	text "¡Estoy SÚPER"
	line "perdido aquí!"

	para "Debería hacer solo"
	line "rutas al aire"
	cont "libre."
	done

.SeenText:
	text "¡Esta cueva me"
	line "ENFADA muchísimo!"

	para "¡Lucharé para"
	line "desahogarme!"
	done

.BeatenText:
	text "¡Me ha derrotado"
	line "un crío!"
	done

DimCave3FPokefanmScript:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iftrue_jumpopenedtext .YesText
	jumpthisopenedtext

	text "¡¿Qué?! ¿Tienes"
	line "un mapa?"
	done

.QuestionText:
	text "¿Estás perdido?"
	done

.YesText:
	text "¡Yo también!"

	para "La Central de"
	line "Energía estropea"
	cont "mi brújula y no"
	cont "tengo mapa."
	done
