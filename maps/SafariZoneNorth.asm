SafariZoneNorth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 41, 32, SAFARI_ZONE_EAST, 3
	warp_event 41, 33, SAFARI_ZONE_EAST, 4
	warp_event 10, 37, SAFARI_ZONE_WEST, 3
	warp_event 11, 37, SAFARI_ZONE_WEST, 4
	warp_event 22, 37, SAFARI_ZONE_HUB, 7
	warp_event 23, 37, SAFARI_ZONE_HUB, 8
	warp_event 37,  5, SAFARI_ZONE_NORTH_REST_HOUSE, 1
	warp_event  4, 37, SAFARI_ZONE_WEST, 1
	warp_event  5, 37, SAFARI_ZONE_WEST, 2

	def_coord_events

	def_bg_events
	bg_event 15, 33, BGEVENT_JUMPTEXT, SafariZoneNorthAreaSignText
	bg_event 38,  6, BGEVENT_JUMPTEXT, SafariZoneNorthRestHouseSignText
	bg_event 28, 30, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips1SignText
	bg_event 20, 34, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips2SignText
	bg_event  5, 27, BGEVENT_JUMPTEXT, SafariZoneNorthTrainerTips3SignText
	bg_event 31, 19, BGEVENT_ITEM + LUCKY_PUNCH, EVENT_SAFARI_ZONE_NORTH_HIDDEN_LUCKY_PUNCH

	def_object_events
	object_event 18, 23, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBattleGirlPadma, -1
	object_event  7,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterTyler, -1
	object_event 36,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyRachael, -1
	object_event 15, 14, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneNorthCooltrainerFScript, -1
	itemball_event 24, 18, EVIOLITE, 1, EVENT_SAFARI_ZONE_NORTH_EVIOLITE
	itemball_event 21,  9, PROTEIN, 1, EVENT_SAFARI_ZONE_NORTH_PROTEIN

GenericTrainerBattleGirlPadma:
	generictrainer BATTLE_GIRL, PADMA, EVENT_BEAT_BATTLE_GIRL_PADMA, BattleGirlPadmaSeenText, BattleGirlPadmaBeatenText

	text "¡Entrena con ganas"
	line "y pasión, y te"
	cont "harás más fuerte!"
	done

GenericTrainerYoungsterTyler:
	generictrainer YOUNGSTER, TYLER, EVENT_BEAT_YOUNGSTER_TYLER, YoungsterTylerSeenText, YoungsterTylerBeatenText

	text "Los #mon saltan"
	line "cuando menos te lo"
	cont "esperas."
	done

GenericTrainerBeautyRachael:
	generictrainer BEAUTY, RACHAEL, EVENT_BEAT_BEAUTY_RACHAEL, BeautyRachaelSeenText, BeautyRachaelBeatenText

	text "Hace solo un año"
	line "era un Karateka."

	para "¡La medicina obra"
	line "maravillas! ¿A"
	cont "que sí?"
	done

SafariZoneNorthCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
	iftruefwd SafariZoneNorthTutorDoubleEdgeScript
	writetext SafariZoneNorthCooltrainerFText
	waitbutton
	setevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
SafariZoneNorthTutorDoubleEdgeScript:
	writetext Text_SafariZoneNorthTutorDoubleEdge
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_SafariZoneNorthTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DOUBLE_EDGE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "En fin."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes ninguna"
	line "Hoja Plata…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Listo! ¡Tu"
	line "#mon ya sabe"
	cont "Doble Filo!"
	done

BattleGirlPadmaSeenText:
	text "¡Entreno con mis"
	line "#mon para"
	cont "mejorar en equipo!"
	done

BattleGirlPadmaBeatenText:
	text "¡Tendremos que"
	line "entrenar más duro!"
	done

YoungsterTylerSeenText:
	text "¡Puedes hallar"
	line "#mon donde sea!"

	para "¡En la hierba, en"
	line "el agua, en cuevas"
	cont "o en los árboles!"
	done

YoungsterTylerBeatenText:
	text "¡Tendré que seguir"
	line "buscando!"
	done

BeautyRachaelSeenText:
	text "¡Mi vestido es"
	line "ideal para pasar"
	cont "el día en la Zona"
	cont "Safari!"
	done

BeautyRachaelBeatenText:
	text "No es muy bueno"
	line "para combatir…"
	done

SafariZoneNorthCooltrainerFText:
	text "¡He atrapado a"
	line "un Chansey!"

	para "¡Qué suerte tengo!"

	para "Le enseñaré a dar"
	line "un placaje muy"
	cont "potente."

	para "¡Compartiré mi"
	line "suerte contigo!"
	done

Text_SafariZoneNorthTutorDoubleEdge:
	text "Enseñaré Doble"
	line "Filo a tu #mon"
	cont "por una"
	cont "Hoja Plata."
	done

Text_SafariZoneNorthTutorQuestion:
	text "¿Debería enseñar"
	line "Doble Filo a"
	cont "tu #mon?"
	done

SafariZoneNorthAreaSignText:
	text "Zona Safari"
	line "Area Norte"
	done

SafariZoneNorthRestHouseSignText:
	text "Casa de Descanso"
	done

SafariZoneNorthTrainerTips1SignText:
	text "Pistas Entrenador"

	para "Movimientos del"
	line "mismo tipo pueden"
	cont "ser físicos,"
	cont "especiales o"
	cont "de estado."
	done

SafariZoneNorthTrainerTips2SignText:
	text "Pistas Entrenador"

	para "¡Los #mon se"
	line "ocultan en la"
	cont "hierba alta!"

	para "¡Camina en zigzag"
	line "para hacerlos"
	cont "salir!"
	done

SafariZoneNorthTrainerTips3SignText:
	text "Pistas Entrenador"

	para "El resto del"
	line "cartel está"
	cont "roto…"
	done
