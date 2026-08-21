Route7SaffronGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
	object_event  3,  3, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route7SaffronGateSilphEmployeeText, -1

Route7SaffronGuardScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer Route7SaffronGuardSeriousText
	jumpthistextfaceplayer

	text "Did you hear about"
	line "the accident at"
	cont "the Power Plant?"

	para "It's located in"
	line "the East, close to"
	cont "Lavender Town."
	done

Route7SaffronGuardSeriousText:
	text "Me tomo en serio"
	line "mi trabajo de"
	cont "guardia."

	para "¡Eh! Si tienes una"
	line "#dex."

	para "De acuerdo, puedes"
	line "pasar."
	done

Route7SaffronGateSilphEmployeeText:
	text "Bruno, del Alto"
	line "Mando, solía pulir"
	cont "su técnica en"
	cont "Ciudad Azafrán."

	para "Entrenó con un"
	line "tal Marcial en sus"
	cont "primeros tiempos."
	done
