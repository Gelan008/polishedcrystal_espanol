BlackthornMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_BLACKTHORN
	object_event  7,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornMartCooltrainermText, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornMartBlackbeltText, -1
	object_event 11,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornMartSuperNerdText, -1

BlackthornMartCooltrainermText:
	text "No puedes comprar"
	line "Max. Revivir,"

	para "pero cura del to-"
	line "do a los #mon"
	cont "debilitados."

	para "Ojo: no restaura"
	line "los PP, los Pun-"
	cont "tos de Poder"

	para "necesarios para"
	line "los movimientos."
	done

BlackthornMartBlackbeltText:
	text "Máx Repel aleja a"
	line "los #mon débi-"
	cont "les de ti."

	para "Es el que más"
	line "dura de los"
	cont "repelentes."
	done

BlackthornMartSuperNerdText:
	text "Los pueblos de"
	line "Johto tienen nom-"
	cont "bres de plantas."

	para "¿Te habías dado"
	line "cuenta?"
	done
