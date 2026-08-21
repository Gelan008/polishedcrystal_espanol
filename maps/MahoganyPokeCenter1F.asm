MahoganyPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, MAHOGANY_TOWN, 4
	warp_event  6,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalPryceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FPokefanmText, -1
	object_event  1,  3, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FYoungsterText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FCooltrainerfText, -1

PokemonJournalPryceScript:
	setflag ENGINE_READ_PRYCE_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Pryce!"

	para "Pryce's middle name"
	line "is Willow."

	para "His fighting style"
	line "is said to be as"

	para "flexible as a"
	line "willow tree in"
	cont "winter, which has"

	para "earned him the"
	line "nickname “the"
	cont "winter trainer”."
	done

MahoganyPokeCenter1FPokefanmText:
	text "¿Cómo? ¿Ha vuelto"
	line "el Team Rocket?"

	para "Vi a hombres de"
	line "negro en el Lago"
	cont "de la Furia…"
	done

MahoganyPokeCenter1FYoungsterText:
	text "No dejo que"
	line "mis #mon"
	cont "evolucionen"
	cont "demasiado pronto."

	para "Así aprenden más"
	line "ataques antes de"
	cont "evolucionar."
	done

MahoganyPokeCenter1FCooltrainerfText:
	text "Los #mon ganan"
	line "fuerza al"
	cont "evolucionar, pero"
	cont "aprenden ataques"
	cont "más despacio."
	done
