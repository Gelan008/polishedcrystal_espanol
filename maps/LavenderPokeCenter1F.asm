LavenderPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, LAVENDER_TOWN, 1
	warp_event  6,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMrFujiScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokeCenter1FYoungsterScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderPokeCenter1FGentlemanText, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderPokeCenter1FTeacherText, -1

PokemonJournalMrFujiScript:
	setflag ENGINE_READ_MR_FUJI_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Editor: El tímido"
	line "Sr. Fuji rechazó"

	para "nuestras peticio-"
	line "nes de entrevista."

	para "Es un hombre ama-"
	line "ble adorado y res-"
	cont "petado en Pueblo"

	para "Lavanda."
	done

LavenderPokeCenter1FYoungsterScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer .NoMachinePartText
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iffalse_jumptextfaceplayer .NoExorcismText
	jumpthistextfaceplayer

	text "El Director de"
	line "la Torre Radio"
	cont "estaba muy feliz."

	para "Dijo que al fin"
	line "volvían a emitir."
	done

.NoMachinePartText:
	text "Si la Central"
	line "Energía no funcio-"
	cont "na, tampoco lo ha-"
	cont "rá el Magnetotrén."

	para "Y eso también"
	line "significa que la"
	cont "Torre Radio no"
	cont "puede emitir..."
	done

.NoExorcismText:
	text "La Central Energía"
	line "vuelve a funcionar"
	cont "sin problemas, pe-"

	para "ro la Torre Radio"
	line "aún no emite."

	para "¿Qué estará pasan-"
	line "do allí?"
	done

LavenderPokeCenter1FGentlemanText:
	text "Al norte de La-"
	line "vanda está el"
	cont "Túnel Roca."

	para "Crúzalo para lle-"
	line "gar a la Central"
	cont "Energía."
	done

LavenderPokeCenter1FTeacherText:
	text "Hay un programa"
	line "de radio que pone"
	cont "música de #"
	cont "Flauta."

	para "¿Ah, sí? A tu ra-"
	line "dio le hace falta"
	cont "una T. Expansión"
	cont "para sintonizarlo."
	done
