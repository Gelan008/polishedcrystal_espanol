SilphCo1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .SilphCo1FMoveOfficerCallback

	def_warp_events
	warp_event  2,  9, SAFFRON_CITY, 7
	warp_event  3,  9, SAFFRON_CITY, 21
	warp_event 13,  0, SILPH_CO_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText

	def_object_events
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCoReceptionistText, -1
	object_event 11,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo1FGentlemanText, -1
	object_event  8,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo1FCooltrainerfText, -1

	object_const_def
	const SILPHCO1F_OFFICER

.SilphCo1FMoveOfficerCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .Nothing
	moveobject SILPHCO1F_OFFICER, 14, 1
.Nothing
	endcallback

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .OfficerScriptAfterPowerRestored
	jumpthisopenedtext

	text "Solo los empleados"
	line "tienen permiso"
	cont "para subir."

	para "La red principal"
	line "de energía falló,"
	cont "y el presidente"
	cont "ordenó máxima"
	cont "seguridad."

	para "Ya aprendimos la"
	line "lección hace"
	cont "tres años."
	done

.OfficerScriptAfterPowerRestored
	jumpthisopenedtext

	text "¿Has sido tú quien"
	line "ha restablecido el"
	cont "suministro?"

	para "¡Muchas gracias!"
	line "Ahora I+D puede"
	cont "continuar."

	para "Sube a echar un"
	line "vistazo si te"
	cont "apetece."
	done

SilphCoReceptionistText:
	text "¡Bienvenido a la"
	line "sede central de"
	cont "Silph S.A.!"
	done

SilphCo1FGentlemanText:
	text "Tengo una cita con"
	line "el ingeniero jefe"
	cont "aquí, en Silph"
	cont "S.A."
	done

SilphCo1FCooltrainerfText:
	text "Reúno el valor"
	line "para pedirle una"
	cont "cita a la"
	cont "recepcionista."

	para "En cuanto cuelgue"
	line "el teléfono…"
	done

SilphCoElevatorText:
	text "Fuera de servicio"
	done
