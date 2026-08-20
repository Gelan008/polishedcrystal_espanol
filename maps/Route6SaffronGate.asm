Route6SaffronGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, SAFFRON_CITY, 12
	warp_event  5,  0, SAFFRON_CITY, 13
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1

Route6SaffronGuardScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer Route6SaffronGuardMagnetTrainText
	jumpthistextfaceplayer

	text "¡Bienvenido a"
	line "Ciudad Azafrán,"
	cont "la sede del"
	cont "Magnetotrén!"

	para "…O eso te diría"
	line "normalmente, pero"
	cont "ahora no marcha."

	para "No tiene corriente"
	line "por un problema en"
	cont "la Central"
	cont "Energía."
	done

Route6SaffronGuardMagnetTrainText:
	text "El Magnetotrén es"
	line "lo más famoso de"
	cont "Ciudad Azafrán."
	done
