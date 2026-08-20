RedsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, RedsHouse2FPCText
	bg_event  3,  5, BGEVENT_JUMPTEXT, RedsHouse2FSNESText
	bg_event  4,  1, BGEVENT_READ, PokemonJournalProfOakScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalProfOakScript

	def_object_events

PokemonJournalProfOakScript:
	setflag ENGINE_READ_PROF_OAK_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Prof. Samuel Oak!"

	para "Azul y Dalia, los"
	line "nietos de Oak,"
	cont "viven cerca de su"
	cont "laboratorio."

	para "Se rumorea que su"
	line "primo Gabriel vive"
	cont "en Alola."
	done

RedsHouse2FPCText:
	text "Parece que no se"
	line "ha usado en mucho"
	cont "tiempo…"
	done

RedsHouse2FSNESText:
	text "¡<PLAYER> jugó a"
	line "la SNES!"

	para "Mejor ponerse en"
	line "marcha… ¡No hay"
	cont "tiempo que perder!"
	done
