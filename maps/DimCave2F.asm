DimCave2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, DimCave2FBouldersLand

	def_warp_events
	warp_event 15,  1, CERULEAN_CAPE, 2
	warp_event 29,  5, DIM_CAVE_3F, 4
	warp_event 27, 25, DIM_CAVE_3F, 5
	warp_event 14, 20, DIM_CAVE_3F, 6 ; hole
	warp_event 30,  2, DIM_CAVE_1F, 1
	warp_event  5, 17, DIM_CAVE_1F, 2
	warp_event 28, 18, DIM_CAVE_1F, 3
	warp_event  2, 28, DIM_CAVE_1F, 4

	def_coord_events

	def_bg_events
	bg_event  6,  4, BGEVENT_ITEM + STARDUST, EVENT_DIM_CAVE_2F_HIDDEN_STARDUST
	bg_event  2, 19, BGEVENT_ITEM + MOON_STONE, EVENT_DIM_CAVE_2F_HIDDEN_MOON_STONE

	def_object_events
	object_event 14, 21, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, DimCaveFallenBoulderText, EVENT_BOULDER_FELL_IN_DIM_CAVE_2F
	object_event 15, 12, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerEngineerLang, -1
	object_event  7, 16, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerDerrick, -1
	itemball_event 28, 12, MAX_REVIVE, 1, EVENT_DIM_CAVE_2F_MAX_REVIVE
	itemball_event  2, 15, IRON, 1, EVENT_DIM_CAVE_2F_IRON
	itemball_event 24, 18, LIGHT_CLAY, 1, EVENT_DIM_CAVE_2F_LIGHT_CLAY
	tmhmball_event  7, 29, TM_FACADE, EVENT_DIM_CAVE_2F_TM_FACADE

DimCave2FBouldersLand:
	checkevent EVENT_BOULDER_FELL_IN_DIM_CAVE_2F
	iftruefwd .skip
	changeblock 14, 20, $c5
	changeblock 26, 20, $ba
.skip
	endcallback

GenericTrainerEngineerLang:
	generictrainer ENGINEER, LANG, EVENT_BEAT_ENGINEER_LANG, .SeenText, .BeatenText

	text "Hace tres años la"
	line "Central Energía"
	cont "era una ruina."

	para "La pusimos en"
	line "marcha para dar"

	para "energía al Mag-"
	line "netotrén a Johto."
	done

.SeenText:
	text "¡Extrajimos"
	line "mineral de esta"

	para "montaña para re-"
	line "novar la Central"
	cont "Energía!"
	done

.BeatenText:
	text "¡Fallo eléctrico!"
	done

GenericTrainerHikerDerrick:
	generictrainer HIKER, DERRICK, EVENT_BEAT_HIKER_DERRICK, .SeenText, .BeatenText

	text "No hace falta ni"
	line "decirlo, pero me"

	para "encanta ir de"
	line "excursión con mis"
	cont "#mon."
	done

.SeenText:
	text "♪ A la montaña"
	line "iremos, a la mon-"
	cont "taña iremos... ♪"
	done

.BeatenText:
	text "♪ Eee-iiii-ah-"
	line "dee-oh, ¡a la"
	cont "montaña iremos! ♪"
	done

DimCaveFallenBoulderText:
	text "Está atascado en"
	line "el botón."
	done
