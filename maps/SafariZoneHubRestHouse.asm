SafariZoneHubRestHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_HUB, 9
	warp_event  3,  7, SAFARI_ZONE_HUB, 9

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKogaScript

	def_object_events

PokemonJournalKogaScript:
	setflag ENGINE_READ_KOGA_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Koga, del Alto"
	cont "Mando!"

	para "Se dice que Koga"
	line "tiene grandes"

	para "conocimientos de"
	line "medicina."

	para "Incluso prepara su"
	line "propia medicina"

	para "para curar a sus"
	line "#mon."
	done
