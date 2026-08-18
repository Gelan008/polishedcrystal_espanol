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
	jumpthisopenedtext

	text "¡Hola, <PLAYER>!"
	line "Lira no está."

	para "Ha estado ocupada"
	line "ayudando al"
	cont "Profesor."
	done

.LyraInside
	jumpthisopenedtext

	text "¡Hola, <PLAYER>!"
	line "Lira está arriba."

	para "Está jugando con"
	line "sus #mon, como"
	cont "siempre."
	done

.LyraTraining
	jumpthisopenedtext

	text "¡Hola, <PLAYER>!"
	line "Lira no está aquí."

	para "¡Está reuniendo"
	line "Medallas por todo"
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
	cont "el One Piece…"

	para "¡Yo también me voy"
	line "a poner en marcha!"
	done
