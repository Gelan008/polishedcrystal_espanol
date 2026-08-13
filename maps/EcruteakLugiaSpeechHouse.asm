EcruteakLugiaSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakLugiaSpeechHouseGrampsText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakLugiaSpeechHouseYoungsterText, -1

EcruteakLugiaSpeechHouseGrampsText:
	text "Esto sucedió cuan-"
	line "do era joven."

	para "El cielo se vol-"
	line "vió negro de re-"
	cont "pente. Un #mon"

	para "volador gigante"
	line "estaba tapando"
	cont "el sol."

	para "Me pregunto qué"
	line "#mon sería."

	para "Era como un pájaro"
	line "y un dragón."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "¿De verdad hay un"
	line "#mon tan gran-"
	cont "de?"

	para "Si existe, debe"
	line "ser muy poderoso."
	done
