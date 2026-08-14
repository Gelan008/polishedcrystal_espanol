PewterPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, PEWTER_CITY, 4
	warp_event  6,  7, PEWTER_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBrockScript

	def_object_events
	pc_nurse_event  5, 1
	pokemon_event  2,  3, JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, PewterJigglypuffText, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_CHRIS, -1
	object_event 11,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterPokeCenter1FTeacherText, -1
	object_event  3,  3, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterPokeCenter1FChildText, -1

PokemonJournalBrockScript:
	setflag ENGINE_READ_BROCK_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Líder Brock!"

	para "Brock casi nunca"
	line "se ríe, pero di-"

	para "cen que si empie-"
	line "za, no puede pa-"
	cont "rar."
	done

PewterJigglypuffText:
	text "Jigglypuff:"
	line "♪ Puu pupuu. ♪"
	done

PewterPokeCenter1FTeacherText:
	text "…Sí, y el Gimna-"
	line "sio de Canela ha"

	para "desaparecido. Me"
	line "sorprendió mucho."

	para "… ¿Qué? Estoy ha-"
	line "blando por teléfo-"
	cont "no. ¡Largo!"
	done

PewterPokeCenter1FChildText:
	text "A la mayoría de"
	line "#mon les entra"

	para "sueño al oír can-"
	line "tar a Jigglypuff."

	para "Hay varios movi-"
	line "mientos que solo"

	para "se pueden usar si"
	line "el #mon duerme."
	done
