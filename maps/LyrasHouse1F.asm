LyrasHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4
	warp_event  0,  0, LYRAS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_UP, LyrasFridgeScript
	bg_event  8,  1, BGEVENT_JUMPTEXT, LyrasSinkText
	bg_event  9,  1, BGEVENT_JUMPTEXT, LyrasStoveText
	bg_event  5,  1, BGEVENT_UP, LyrasTVScript

	def_object_events
	object_event  2,  3, SPRITE_DAD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LyrasDadScript, -1

LyrasDadScript:
	faceplayer
	opentext
	checkevent EVENT_LYRA_IN_HER_ROOM
	iffalsefwd .LyraInside
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .LyraTraining
	jumpopenedtext LyrasDadHelpingText

.LyraInside
	jumpopenedtext LyrasDadInsideText

.LyraTraining
	jumpopenedtext LyrasDadTrainingText

LyrasDadInsideText:
	text "Hi, <PLAYER>!"
	line "Lyra is upstairs."

	para "She's playing"
	line "with her #mon"
	cont "as usual."
	done

LyrasDadHelpingText:
	text "Hi, <PLAYER>!"
	line "Lyra isn't here."

	para "She's been busy"
	line "helping the prof-"
	cont "essor."
	done

LyrasDadTrainingText:
	text "Hi, <PLAYER>!"
	line "Lyra isn't here."

	para "She's collecting"
	line "Badges all over"
	cont "Johto!"
	done

LyrasFridgeScript:
	jumpthistext

	text "A ver qué hay"
	line "en la nevera…"

	para "¡Agua Fresca y"
	line "bolas de arroz!"
	done

LyrasSinkText:
	text "El fregadero está"
	line "impecable."
	done

LyrasStoveText:
	text "En los fogones"
	line "se cuece curry."
	done

LyrasTVScript:
	jumpthistext

	text "En la tele: Un"
	line "pirata con su"
	cont "tripulación busca"
	cont "un tesoro…"

	para "¡Yo también me voy"
	line "a poner en marcha!"
	done
