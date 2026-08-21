Route7_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route7UndergroundPathSignText
	bg_event  6, 11, BGEVENT_JUMPTEXT, Route7LockedDoorText

	def_object_events
	object_event  1,  0, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route7Snorlax, EVENT_ROUTE_7_SNORLAX
	object_event 15, 11, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBreederCarlene, -1
	itemball_event 16,  1, MENTAL_HERB, 1, EVENT_ROUTE_7_MENTAL_HERB

	object_const_def
	const ROUTE7_BIG_SNORLAX

GenericTrainerBreederCarlene:
	generictrainer BREEDER, CARLENE, EVENT_BEAT_BREEDER_CARLENE, .SeenText, .BeatenText

	text "I make my Smeargle"
	line "Sketch a move,"

	para "then breed it"
	line "to pass the move"
	cont "down!"

	para "Isn't that smart?"
	done

.SeenText:
	text "¡Crié a mi equipo"
	line "para toda clase"
	cont "de situaciones!"
	done

.BeatenText:
	text "¡No hemos podido"
	line "contigo!"
	done

Route7Snorlax:
	opentext
	special SpecialSnorlaxAwake
	iftruefwd .Awake
	jumpopenedtext .AsleepText

.Awake:
	writetext .AwakeText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear ROUTE7_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

.AsleepText:
	text "Snorlax is snoring"
	line "peacefully…"
	done

.AwakeText:
	text "Suena el #gear"
	line "cerca de Snorlax…"

	para "…"

	para "¡Snorlax se ha"
	line "despertado!"
	done

Route7UndergroundPathSignText:
	text "¿Qué es este"
	line "folleto?"

	para "Muchos rivales"
	line "rudos han estado"
	cont "luchando en la"
	cont "Vía Subterránea."

	para "Por las continuas"
	line "quejas vecinales,"
	cont "la Vía queda"
	cont "clausurada por un"
	cont "tiempo indefinido."

	para "-- Policía Azulona"
	done

Route7LockedDoorText:
	text "Está cerrado…"
	done
