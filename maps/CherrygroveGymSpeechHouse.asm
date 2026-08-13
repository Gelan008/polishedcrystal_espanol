CherrygroveGymSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveGymSpeechHousePokefanMText, -1
	object_event  5,  5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveGymSpeechHouseBugCatcherText, -1

CherrygroveGymSpeechHousePokefanMText:
	text "¿Estás intentando"
	line "ver lo bueno que"

	para "eres como entre-"
	line "nador #mon?"

	para "Deberías visitar"
	line "los Gimnasios"

	para "#mon por todo"
	line "Johto y ganar"
	cont "Medallas."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Cuando sea mayor,"
	line "¡voy a ser Líder"
	cont "de Gimnasio!"

	para "¡Hago combatir"
	line "a mis #mon"

	para "con los de mi"
	line "amigo para hacer-"
	cont "los más duros!"
	done
