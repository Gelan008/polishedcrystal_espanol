CliffEdgeGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 19, CIANWOOD_CITY, 8
	warp_event  3, 19, ROUTE_47, 1

	def_coord_events

	def_bg_events
	bg_event 17,  6, BGEVENT_ITEM + OVAL_STONE, EVENT_CLIFF_EDGE_GATE_HIDDEN_OVAL_STONE

	def_object_events
	object_event 11, 16, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CliffEdgeGateReceptionistText, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event  3,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide3Script, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	object_event 17, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM12, EVENT_CLEARED_YELLOW_FOREST

ProfOaksAide3Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide3HiText
	waitbutton
	setval16 45
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide3UhOhText

.HereYouGo
	writetext ProfOaksAide3HereYouGoText
	waitbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .NoRoom
	setevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
.Explain
	jumpopenedtext ProfOaksAide3ExplainText

.NoRoom
	jumpopenedtext ProfOaksAide3NoRoomText

GenericTrainerGruntM12:
	generictrainer GRUNTM, 12, EVENT_BEAT_ROCKET_GRUNTM_12, GruntM12SeenText, GruntM12BeatenText

	text "Yellow Forest is"
	line "full of rare"
	cont "#mon."

	para "We're nabbing them"
	line "all for ourselves!"
	done

CliffEdgeGateReceptionistText:
	text "¡El Bosq. Amarillo"
	line "está por aquí!"

	para "¡Es una zona muy"
	line "turística!"
	done

ProfOaksAide3HiText:
	text "¡Hola! Soy el"
	line "ayudante del"
	cont "Profesor Oak."

	para "Si has atrapado"
	line "45 tipos de"
	cont "#mon te daré un"
	cont "regalo."

	para "Así que, <PLAYER>,"
	line "¿tienes al menos"
	cont "45 #mon?"
	done

ProfOaksAide3UhOhText:
	text "Veamos… ¡Vaya!"
	line "Solo has atrapado"
	cont "a "
	text_decimal wTempDexOwn, 2, 3
	text " especies"
	line "de #mon."

	para "Vuelve a verme"
	line "cuando tengas al"
	cont "menos 45 tipos."
	done

ProfOaksAide3HereYouGoText:
	text "Veamos… ¡Genial!"
	line "Has atrapado a "
	text_decimal wTempDexOwn, 2, 3
	text " especies de"
	line "#mon."

	para "¡Enhorabuena!"
	line "¡Aquí tienes!"
	done

ProfOaksAide3NoRoomText:
	text "Oh! I see you"
	line "don't have any"
	cont "room for this."
	done

ProfOaksAide3ExplainText:
	text "That Macho Brace"
	line "helps a #mon"

	para "grow more from"
	line "battling, but"
	cont "slows it down."
	done

GruntM12SeenText:
	text "¿Tienes interés"
	line "en nuestros"
	cont "planes?"

	para "¡Vénceme y te los"
	line "contaré!"
	done

GruntM12BeatenText:
	text "¡Se suponía que"
	line "ibas a perder!"
	done

