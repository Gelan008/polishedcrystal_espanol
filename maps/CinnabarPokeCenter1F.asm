CinnabarPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CINNABAR_ISLAND, 1
	warp_event  6,  7, CINNABAR_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBlaineScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  2,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CinnabarPokeCenter1FCooltrainerfText, -1
	object_event  9,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CinnabarPokeCenter1FFisherText, -1

PokemonJournalBlaineScript:
	setflag ENGINE_READ_BLAINE_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Edición especial:"
	line "¡Líder Blaine!"

	para "Dicen que Blaine"
	line "solo se quita las"
	cont "gafas al idear un"
	cont "nuevo acertijo."
	done

CinnabarPokeCenter1FCooltrainerfText:
	text "Dicen que Blaine,"
	line "el Líder de Gim."
	cont "de Isla Canela,"

	para "vive solo en la"
	line "cueva de las Islas"
	cont "Espuma…"
	done

CinnabarPokeCenter1FFisherText:
	text "Ha pasado un año"
	line "desde que el"
	cont "volcán entró en"
	cont "erupción."
	done
