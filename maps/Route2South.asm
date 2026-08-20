Route2South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 19,  3, ROUTE_2_GATE, 3
	warp_event  9,  7, VIRIDIAN_FOREST_VIRIDIAN_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 29, BGEVENT_JUMPTEXT, Route2SignText

	def_object_events
	object_event 14, 23, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBug_maniacRob, -1
	object_event  4, 16, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacDoug, -1
	itemball_event 18, 30, ELIXIR, 1, EVENT_ROUTE_2_ELIXIR
	cuttree_event 15, 16, EVENT_ROUTE_2_CUT_TREE_3
	cuttree_event 16, 24, EVENT_ROUTE_2_CUT_TREE_4
	cuttree_event 16, 30, EVENT_ROUTE_2_CUT_TREE_5

GenericTrainerBug_maniacRob:
	generictrainer BUG_MANIAC, ROB, EVENT_BEAT_BUG_MANIAC_ROB, Bug_maniacRobSeenText, Bug_maniacRobBeatenText

	text "Buscaré #mon"
	line "bicho que sean"
	cont "más fuertes."
	done

GenericTrainerBug_maniacDoug:
	generictrainer BUG_MANIAC, DOUG, EVENT_BEAT_BUG_MANIAC_DOUG, Bug_maniacDougSeenText, Bug_maniacDougBeatenText

	text "Los #mon bicho"
	line "se aplastan como"
	cont "peluches si les"
	cont "estrujas la tripa."

	para "¡Me encanta como"
	line "se siente!"
	done

Bug_maniacRobSeenText:
	text "Mis #mon bicho"
	line "son muy duros."
	cont "¡Vas a perder!"
	done

Bug_maniacRobBeatenText:
	text "Me han zurrado…"
	done

Bug_maniacDougSeenText:
	text "¿Por qué a las"
	line "chicas no les"
	cont "agradan los"
	cont "#mon bicho?"
	done

Bug_maniacDougBeatenText:
	text "¡No puede ser!"
	done

Route2SignText:
	text "Ruta 2"

	para "Ciudad Verde -"
	line "Ciudad Plateada"
	done
