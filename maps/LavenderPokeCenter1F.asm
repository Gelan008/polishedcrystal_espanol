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

	text "#mon Journal"

	para "Editor: The shy"
	line "Mr.Fuji turned"

	para "down our interview"
	line "requests."

	para "He is a kindly man"
	line "who is adored and"

	para "respected in Lav-"
	line "ender Town."
	done

LavenderPokeCenter1FYoungsterScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer .NoMachinePartText
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iffalse_jumptextfaceplayer .NoExorcismText
	jumpthistextfaceplayer

	text "The Director of"
	line "the Radio Station"
	cont "sure was happy."

	para "He said they're"
	line "finally back on"
	cont "the air!"
	done

.NoMachinePartText:
	text "Si la Central"
	line "Energía no va,"
	cont "el Magnetotrén no"
	cont "podrá funcionar."

	para "¡Y la Torre Radio"
	line "tampoco emitirá!"
	done

.NoExorcismText:
	text "La Central Energía"
	line "funciona bien,"
	cont "pero la Torre"
	cont "Radio no emite."

	para "¿Qué ocurrirá"
	line "allí dentro?"
	done

LavenderPokeCenter1FGentlemanText:
	text "Al norte de Pueblo"
	line "Lavanda está el"
	cont "Túnel Roca."

	para "Crúzalo para ir a"
	line "la Central"
	cont "Energía."
	done

LavenderPokeCenter1FTeacherText:
	text "Hay un programa de"
	line "radio con música"
	cont "de # Flauta."

	para "A tu radio le hace"
	line "falta una Tarj."
	cont "Expansión para"
	cont "sintonizarlo."
	done
