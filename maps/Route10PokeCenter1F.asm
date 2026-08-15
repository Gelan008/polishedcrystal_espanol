Route10PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_10_NORTH, 1
	warp_event  6,  7, ROUTE_10_NORTH, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalAgathaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10PokeCenter1FGymGuyScript, -1
	object_event  9,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FGentlemanText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route10PokeCenter1FCooltrainerfText, -1

PokemonJournalAgathaScript:
	setflag ENGINE_READ_AGATHA_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Agatha, exmiembro"
	cont "del Alto Mando!"

	para "De jóvenes, Agatha"
	line "y el Prof. Oak"
	cont "fueron rivales que"

	para "competían por el"
	line "título de mejor"
	cont "entrenador."
	done

Route10PokeCenter1FGymGuyScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "El Director de la"
	line "Central Energía"

	para "busca a alguien"
	line "fuerte con los"
	cont "#mon."

	para "Necesita ayuda"
	line "para recuperar"

	para "algo que le han"
	line "robado."
	done

.Text2:
	text "Oí que el Team"
	line "Rocket se volvió"
	cont "a reunir en Johto,"

	para "pero los vencieron"
	line "enseguida."

	para "No tenía ni idea"
	line "de todo eso."
	done

Route10PokeCenter1FGentlemanText:
	text "¿Un Centro #mon"
	line "junto a una cueva?"

	para "¡Qué gran como-"
	line "didad!"
	done

Route10PokeCenter1FCooltrainerfText:
	text "Al salir fuera,"
	line "puedes ver el te-"
	cont "cho de un gran"
	cont "edificio."

	para "Es la Central"
	line "Energía."
	done