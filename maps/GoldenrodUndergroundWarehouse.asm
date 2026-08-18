GoldenrodUndergroundWarehouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitches

	def_warp_events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	itemball_event 18, 15, MAX_ETHER, 1, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	tmhmball_event 13,  9, TM_X_SCISSOR, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_X_SCISSOR
	itemball_event  2,  1, ULTRA_BALL, 1, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL

GenericTrainerGruntM24:
	generictrainer GRUNTM, 24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText

	text "El Team Rocket"
	line "seguirá adelante"
	cont "hasta el regreso"
	cont "de Giovanni."

	para "¡Haremos lo que"
	line "haga falta!"
	done

GenericTrainerGruntM14:
	generictrainer GRUNTM, 14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText

	text "He perdido…"

	para "¡Perdóname,"
	line "Giovanni!"
	done

GenericTrainerGruntM15:
	generictrainer GRUNTM, 15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText

	text "¡Je, je, je!"
	line "¡Qué pasada!"
	cont "¡Me acordaré"
	cont "de ti!"
	done

GoldenrodUndergroundWarehouseDirectorScript:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue_jumptextfaceplayer DirectorAfterText
	faceplayer
	opentext
	writetext DirectorIntroText
	promptbutton
	verbosegivekeyitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
	jumpopenedtext DirectorAfterText

GruntM24SeenText:
	text "¿Cómo has llegado"
	line "hasta aquí?"

	para "No hay remedio."
	line "¡Me desharé de ti!"
	done

GruntM24BeatenText:
	text "Se deshicieron"
	line "de mí…"
	done

GruntM14SeenText:
	text "¡No vas a ir más"
	line "lejos!"

	para "No tengo piedad"
	line "con mis enemigos,"
	cont "¡ni siquiera con"
	cont "los mocosos!"
	done

GruntM14BeatenText:
	text "¡Maldición!"
	done

GruntM15SeenText:
	text "¡Je, je, je!"
	line "¡Me acuerdo de ti!"

	para "¡Me zurraste en"
	line "nuestra guarida!"
	done

GruntM15BeatenText:
	text "¡Je, je, je!"
	line "Entonces, ¿así?"
	done

DirectorIntroText:
	text "Director: ¿Eh?"
	line "¿Has venido a"
	cont "rescatarme?"

	para "¡Muchas gracias!"

	para "¿La Torre Radio?"
	line "¿Qué ocurre allí?"

	para "¿La tomó el"
	line "Team Rocket?"

	para "Toma. ¡Llévate"
	line "esta Llave Magné.!"
	done

DirectorCardKeyText:
	text "Director: Úsala"
	line "para abrir las"
	cont "persianas de la"
	cont "P3."
	done

DirectorAfterText:
	text "Te ruego que nos"
	line "ayudes."

	para "No se sabe qué"
	line "harán si dominan"
	cont "el transmisor."

	para "¡Podrían llegar a"
	line "controlar a los"
	cont "#mon con una"
	cont "señal especial!"

	para "Solo puedo pedirte"
	line "ayuda a ti."

	para "Por favor, ¡salva"
	line "la Torre Radio y a"
	cont "todos los #mon!"
	done
