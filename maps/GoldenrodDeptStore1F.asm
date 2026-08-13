GoldenrodDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 24
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FReceptionistText, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FPokefanFText, -1
	object_event  5,  5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FBugCatcherText, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore1FGentlemanText, -1

GoldenrodDeptStore1FReceptionistText:
	text "Bienvenido al Cen-"
	line "tro Comercial de"
	cont "Trigal."
	done

GoldenrodDeptStore1FGentlemanText:
	text "El Centro Comer-"
	line "cial tiene una"
	cont "buena selección."

	para "Pero algunos obje-"
	line "tos solo están"

	para "disponibles como"
	line "premios en el"
	cont "Casino."
	done

GoldenrodDeptStore1FPokefanFText:
	text "¡Estoy deseando ir"
	line "de compras hoy!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "A mamá se le da"
	line "bien buscar"
	cont "gangas."

	para "Siempre compra"
	line "cosas a los pre-"
	cont "cios más bajos."
	done

GoldenrodDeptStore1FDirectoryText:
	text "PB Mostrador de"
	line "   Servicio"

	para "P1 Mercado de"
	line "   Entrenadores"

	para "P2 Colección"
	line "   de Combate"

	para "P3 Botiquín"

	para "P4 Rincón MT"

	para "P5 Plaza de la"
	line "   Tranquilidad"

	para "Azotea Mirador"
	done
