VermilionPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VERMILION_CITY, 2
	warp_event  6,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLtSurgeScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  2, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokeCenter1FSightseerMScript, -1
	object_event  2,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPokeCenter1FSailorText, -1
	object_event  9,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionPokeCenter1FBugCatcherText, -1

PokemonJournalLtSurgeScript:
	setflag ENGINE_READ_LT_SURGE_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Líder Lt. Surge!"

	para "Dicen que el Lt."
	line "Surge fue piloto"

	para "cuando vivía en"
	line "América."

	para "Utilizaba la elec-"
	line "tricidad creada"

	para "por sus #mon"
	line "para mover su"
	cont "avión."
	done

VermilionPokeCenter1FSightseerMScript:
	checkevent EVENT_VERMILION_CITY_SNORLAX
	iftrue_jumptextfaceplayer .SnorlaxText
	jumpthistextfaceplayer

	text "Hay un #mon"
	line "dormido delante de"
	cont "la Cueva Diglett."

	para "¡Es una gran opor-"
	line "tunidad de atra-"
	cont "parlo!"

	para "Pero ¿cómo se le"
	line "puede despertar?"
	done

.SnorlaxText:
	text "Había un #mon"
	line "dormido delante de"
	cont "la Cueva Diglett."

	para "Pero parece que ha"
	line "desaparecido."
	done

VermilionPokeCenter1FSailorText:
	text "El Magnetotrén y"
	line "el S.S. Aqua son"

	para "ideales para lu-"
	line "char con otros"
	cont "entrenadores."
	done

VermilionPokeCenter1FBugCatcherText:
	text "¿Eh? Tienes algu-"
	line "nas Medallas que"
	cont "no había visto."

	para "Ah, ya entiendo."
	line "Las conseguiste en"
	cont "Johto."
	done
