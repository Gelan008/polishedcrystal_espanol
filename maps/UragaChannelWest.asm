UragaChannelWest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 16,  9, SCARY_CAVE_1F, 2

	def_coord_events

	def_bg_events
	bg_event 17, 11, BGEVENT_JUMPTEXT, ScaryCaveWestSignText
	bg_event 15, 11, BGEVENT_ITEM + BIG_PEARL, EVENT_URAGA_CHANNEL_WEST_HIDDEN_BIG_PEARL

	def_object_events
	object_event 13,  9, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, UragaChannelWestEngineerText, -1

UragaChannelWestEngineerText:
	text "Las corrientes"
	line "arrastran todo ti-"
	cont "po de restos aquí."

	para "Uso un detector"
	line "de metales para"

	para "buscar objetos"
	line "ocultos."

	para "Aunque un Buscaob-"
	line "jetos funcionaría"
	cont "mejor…"
	done

ScaryCaveWestSignText:
	text "Canal Uraga"
	line "adelante"

	para "¡Entrada solo por"
	line "el oeste desde la"
	cont "Ruta 18!"
	done
