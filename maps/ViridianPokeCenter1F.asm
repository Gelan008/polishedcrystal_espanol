ViridianPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIRIDIAN_CITY, 5
	warp_event  6,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBlueScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokeCenter1FCooltrainermScript, -1
	object_event  8,  4, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FCooltrainerfText, -1
	object_event  3,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianPokeCenter1FBugCatcherText, -1

PokemonJournalBlueScript:
	setflag ENGINE_READ_BLUE_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Líder Azul!"

	para "Cuentan que Azul"
	line "visita a sus que-"
	cont "ridos #mon"

	para "cada año en la"
	line "Casa de las Almas."
	done

ViridianPokeCenter1FCooltrainermScript:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer .BlueText
	jumpthistextfaceplayer

	text "¿Dónde narices se"
	line "ha metido el Líder"

	para "de Ciudad Verde?"
	line "Quería retarle."
	done

.BlueText:
	text "Hay entrenadores"
	line "muy fuertes en el"

	para "Gimnasio de Ciudad"
	line "Verde."

	para "¡Algún día me uni-"
	line "ré a ellos!"
	done

ViridianPokeCenter1FCooltrainerfText:
	text "He oído que el"
	line "Gimnasio de Isla"
	cont "Canela ya no está."

	para "¿Qué habrá sido de"
	line "Blaine, su Líder"
	cont "de Gimnasio?"
	done

ViridianPokeCenter1FBugCatcherText:
	text "Mi sueño es llegar"
	line "a ser Líder de"
	cont "Gimnasio."
	done
