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

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Bugsy!"

	para "Bugsy is reported"
	line "to have won the"

	para "Bug-Catching Con-"
	line "test so often that"

	para "he no longer par-"
	line "ticipates."
	done

AzaleaPokeCenter1FCooltrainermScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer .NiteText
	jumpthistextfaceplayer

	text "For a guy who"
	line "makes # Balls,"

	para "Kurt isn't much of"
	line "a trainer."

	para "He does have a"
	line "#mon, but he"

	para "doesn't use it"
	line "much."
	done

.NiteText:
	text "César y el Prof."
	line "Oak son viejos"
	cont "amigos."

	para "También se llevan"
	line "bien con Agatha,"
	cont "ex miembro del"
	cont "Alto Mando."
	done

AzaleaPokeCenter1FGentlemanText:
	text "¿Tus #mon"
	line "conocen MO?"

	para "Se pueden usar"
	line "incluso si tu"
	cont "#mon se ha"
	cont "debilitado."
	done

AzaleaPokeCenter1FSightseermText:
	text "Ese tal Bill creó"
	line "el sistema para"
	cont "almacenar #mon"
	cont "en el PC."

	para "El PC de Bill"
	line "puede guardar 20"
	cont "#mon por Caja."
	done

AzaleaPokeCenter1FPokefanfText:
	text "¿Conoces los"
	line "Bonguris?"

	para "Abre uno, vacíalo"
	line "y ponle un"
	cont "mecanismo"
	cont "especial."

	para "Entonces podrás"
	line "atrapar #mon"
	cont "con él."

	para "Antes de inventar"
	line "las # Balls,"
	cont "todo el mundo"
	cont "usaba Bonguris."
	done
