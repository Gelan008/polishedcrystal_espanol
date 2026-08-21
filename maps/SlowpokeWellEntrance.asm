SlowpokeWellEntrance_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  7, AZALEA_TOWN, 6
	warp_event  7,  5, SLOWPOKE_WELL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  6, 13, BGEVENT_ITEM + SUPER_POTION, EVENT_SLOWPOKE_WELL_ENTRANCE_HIDDEN_SUPER_POTION

	def_object_events
	object_event  8,  9, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SlowpokeWellEntranceKurtText, EVENT_SLOWPOKE_WELL_KURT

SlowpokeWellEntranceKurtText:
	text "César: ¡Hola,"
	line "<PLAYER>!"

	para "El guardia de"
	line "arriba huyó cuando"
	cont "le grité."

	para "Pero luego me caí"
	line "por el pozo."

	para "Me lastimé la"
	line "espalda y no me"
	cont "puedo mover."

	para "¡Maldición! Si no"
	line "estuviera herido,"
	cont "mis #mon les"
	cont "darían su castigo…"

	para "En fin, no hay más"
	line "remedio."

	para "¡<PLAYER>, lucha"
	line "con agallas en mi"
	cont "lugar!"
	done
