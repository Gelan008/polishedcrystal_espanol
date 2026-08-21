CianwoodLugiaSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  1,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodLugiaSpeechHouseTeacherText, -1
	object_event  6,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodLugiaSpeechHouseLassText, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodLugiaSpeechHouseTwinText, -1
	object_event  5,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodHouseBlackBeltScript, -1

CianwoodHouseBlackBeltScript:
	checkevent EVENT_GOT_ASSAULT_VEST_FROM_CIANWOOD
	iftrue_jumptextfaceplayer CianwoodHouseBlackBeltText2
	faceplayer
	opentext
	writetext CianwoodHouseBlackBeltText1
	promptbutton
	verbosegiveitem ASSAULT_VEST
	iffalse_endtext
	setevent EVENT_GOT_ASSAULT_VEST_FROM_CIANWOOD
	jumpopenedtext CianwoodHouseBlackBeltText2

CianwoodHouseBlackBeltText1:
	text "Fui al Gimnasio"
	line "con este chaleco,"
	cont "¡pero se rieron de"
	cont "mí y me echaron!"

	para "No puedo volver a"
	line "llevarlo allí,"
	cont "así que quédatelo."
	done

CianwoodHouseBlackBeltText2:
	text "¡Entrenaré duro y"
	line "me ganaré mi sitio"
	cont "en el Gimnasio!"
	done

CianwoodLugiaSpeechHouseTeacherText:
	text "¿Viniste desde"
	line "Olivo?"

	para "¿Recuerdas las"
	line "cuatro islas del"
	cont "camino?"

	para "He oído que una"
	line "mítica criatura"
	cont "marina se esconde"
	cont "en ellas."
	done

CianwoodLugiaSpeechHouseLassText:
	text "Dicen que solo se"
	line "deja ver si tienes"
	cont "un Ala Plateada."

	para "Debe de tener el"
	line "mismo olor que la"
	cont "criatura."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "Dicen que esa gran"
	line "criatura marina"
	cont "crea los remolinos"
	cont "de las islas."

	para "Necesitarás un"
	line "mov. especial para"
	cont "atravesarlos."
	done
