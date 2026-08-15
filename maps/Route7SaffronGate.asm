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

	text "¿Te enteraste del"
	line "accidente de la"
	cont "Central Energía?"

	para "Está al este,"
	line "cerca de Pueblo"
	cont "Lavanda."
	done

Route7SaffronGuardSeriousText:
	text "Me tomo en serio"
	line "mi trabajo de"
	cont "guardia."

	para "¡Eh! Si tienes una"
	line "#dex."

	para "De acuerdo. Puedes"
	line "pasar."
	done

Route7SaffronGateSilphEmployeeText:
	text "Bruno, del Alto"
	line "Mando, solía pulir"

	para "su técnica en"
	line "Ciudad Azafrán."

	para "Entrenó con un"
	line "tal Marcial en"

	para "sus primeros"
	line "tiempos."
	done
