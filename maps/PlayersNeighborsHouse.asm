PlayersNeighborsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, InitialRadio

	def_object_events
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborText, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsDaughterText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsHusbandText, -1

PlayersNeighborsDaughterText:
	text "Pikachu es un"
	line "#mon evolucio-"
	cont "nado."

	para "Me asombraron los"
	line "hallazgos del"
	cont "Prof. Elm."

	para "Es muy famoso por"
	line "sus estudios so-"
	cont "bre evolución"
	cont "#mon."

	para "… Uf…"

	para "Ojalá pudiera ser"
	line "una investigadora"
	cont "como él…"
	done

PlayersNeighborsHusbandText:
	text "Este pueblo es el"
	line "que está más al"

	para "sureste de todo"
	line "Johto."
	done

PlayersNeighborText:
	text "Mi hija está empe-"
	line "ñada en ser la"

	para "ayudante del"
	line "Prof. Elm."

	para "¡Le encantan los"
	line "#mon!"

	para "¡Aunque a mí tam-"
	line "bién me encantan!"
	done
