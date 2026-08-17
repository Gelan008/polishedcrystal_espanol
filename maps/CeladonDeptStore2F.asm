CeladonDeptStore2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_3F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_1F, 3
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore2FDirectoryText

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_2F_1, -1
	object_event 14,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_CELADON_2F_2, -1
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore2FPokefanMText, -1
	object_event  6,  2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore2FYoungsterText, -1

CeladonDeptStore2FPokefanMText:
	text "Hace poco que soy"
	line "entrenador."

	para "Mi hijo me animó a"
	line "serlo."

	para "Me impresiona la"
	line "variedad de"
	cont "objetos tan útiles"
	done

CeladonDeptStore2FYoungsterText:
	text "A mi padre le"
	line "cuesta aprenderse"
	cont "los nombres de los"
	cont "objetos y cómo se"
	cont "usan…"
	done

CeladonDeptStore2FDirectoryText:
	text "¡Objetos de 1a"
	line "para Entrenadores!"

	para "P1: Mercado de"
	line "    Entrenadores"
	done
