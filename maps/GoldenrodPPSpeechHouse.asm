GoldenrodPPSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPPSpeechHouseFisherText, -1
	object_event  5,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPPSpeechHouseLassText, -1

GoldenrodPPSpeechHouseFisherText:
	text "Una vez, en pleno"
	line "combate, mi"
	cont "#mon no pudo"
	cont "atacar."

	para "¡Se había quedado"
	line "sin Puntos de"
	cont "Poder, o PP!"
	done

GoldenrodPPSpeechHouseLassText:
	text "A veces un #mon"
	line "sano no puede usar"
	cont "sus movimientos."

	para "Si te pasa, cúralo"
	line "en un Centro"
	cont "#mon o dale un"
	cont "objeto."
	done
