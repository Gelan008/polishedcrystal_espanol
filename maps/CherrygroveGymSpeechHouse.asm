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
	text "¿Quieres ver cómo"
	line "de bueno eres como"
	cont "entrenador #mon?"

	para "Deberías visitar"
	line "los Gimnasios de"
	cont "todo Johto y ganar"
	cont "Medallas."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Cuando sea mayor,"
	line "¡voy a ser Líder"
	cont "de Gimnasio!"

	para "¡Hago luchar a mis"
	line "#mon contra los"
	cont "de mi amigo para"
	cont "hacerlos fuertes!"
	done
