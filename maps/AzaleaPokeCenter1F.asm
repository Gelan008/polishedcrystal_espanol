AzaleaPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, AZALEA_TOWN, 1
	warp_event  6,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBugsyScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokeCenter1FCooltrainermScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText, -1
	object_event  8,  1, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FSightseermText, -1
	object_event  2,  5, SPRITE_MATRON, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FPokefanfText, -1

PokemonJournalBugsyScript:
	setflag ENGINE_READ_BUGSY_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje especial"
	line "¡Líder Antón!"

	para "Se dice que Antón"
	line "ha ganado tantas"

	para "veces el Concurso"
	line "de Captura de"

	para "Bichos que ya ni"
	line "participa."
	done

AzaleaPokeCenter1FCooltrainermScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer .NiteText
	jumpthistextfaceplayer

	text "Para hacer unas"
	line "# Balls tan"

	para "buenas, César"
	line "no es muy buen"
	cont "entrenador."

	para "Tiene un #mon,"
	line "pero no lo"

	para "suele usar a"
	line "menudo."
	done

.NiteText:
	text "César y el Prof."
	line "Oak son viejos"
	cont "amigos."

	para "También se llevan"
	line "bien con Agatha,"

	para "ex miembro del"
	line "Alto Mando."
	done

AzaleaPokeCenter1FGentlemanText:
	text "¿Tus #mon"
	line "conocen MO?"

	para "Se pueden usar"
	line "incluso si tu"

	para "#mon se ha"
	line "debilitado."
	done

AzaleaPokeCenter1FSightseermText:
	text "Ese tal Bill creó"
	line "el sistema para"

	para "almacenar #mon"
	line "en el PC."

	para "El PC de Bill"
	line "puede guardar 20"
	cont "#mon por Caja."
	done

AzaleaPokeCenter1FPokefanfText:
	text "¿Conoces los"
	line "Bonguris?"

	para "Abre uno, vacíalo"
	line "y ponle un meca-"

	para "nismo especial."
	line "Entonces podrás"

	para "atrapar #mon"
	line "con él."

	para "Antes de inven-"
	line "tarse las #"
	cont "Balls,"

	para "todo el mundo"
	line "usaba Bonguris."
	done
