Route1617Gate2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, ROUTE_16_17_GATE_2F, -1

	def_coord_events

	def_bg_events
	bg_event  1,  2, BGEVENT_UP, Route1617Gate2FBinoculars1
	bg_event  6,  2, BGEVENT_UP, Route1617Gate2FBinoculars2

	def_object_events
	object_event 2, 5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1617Gate2FPsychicScript, -1

Route1617Gate2FPsychicScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_TRICK_ROOM_INTRO
	iftruefwd Route1617Gate2FTutorTrickRoomScript
	writetext Route1617Gate2FPsychicText
	waitbutton
	setevent EVENT_LISTENED_TO_TRICK_ROOM_INTRO
Route1617Gate2FTutorTrickRoomScript:
	writetext Text_Route1617Gate2FTutorTrickRoom
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route1617Gate2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval TRICK_ROOM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "What a pity."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "But I'll need a"
	line "Silver Leaf first,"

	para "so come back when"
	line "you get one."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "My technique is"
	line "pretty clever,"
	cont "don't you think?"
	done

Route1617Gate2FBinoculars1:
	jumptext Route1617Gate2FBinoculars1Text

Route1617Gate2FBinoculars2:
	jumptext Route1617Gate2FBinoculars2Text

Route1617Gate2FPsychicText:
	text "Hay un Médium por"
	line "aquí que altera"
	cont "el entorno en los"
	cont "combates #mon."

	para "¡Me inspiró para"
	line "crear mi propia"
	cont "técnica secreta!"
	done

Text_Route1617Gate2FTutorTrickRoom:
	text "Puedo enseñarle a"
	line "tu #mon Espacio"
	cont "Raro."

	para "Hace que los"
	line "#mon más lentos"
	cont "ataquen antes por"
	cont "un tiempo."
	done

Text_Route1617Gate2FTutorQuestion:
	text "¿Me das una Hoja"
	line "Plata a cambio?"
	done

Route1617Gate2FBinoculars1Text:
	text "Looked into the"
	line "binoculars."

	para "It's Celadon Dept."
	line "Store!"
	done

Route1617Gate2FBinoculars2Text:
	text "Looked into the"
	line "binoculars."

	para "There's a long"
	line "path over water!"
	done
