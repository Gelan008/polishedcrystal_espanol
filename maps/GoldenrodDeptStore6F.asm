GoldenrodDeptStore6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, GOLDENROD_DEPT_STORE_5F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 13,  0, GOLDENROD_DEPT_STORE_ROOF, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, GoldenrodDeptStore6FDirectoryText

	def_object_events
	object_event 10,  2, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore6FLassText, -1
	object_event  8,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodDeptStore6FSuperNerdText, -1

GoldenrodDeptStore6FLassText:
	text "¿Escuchas el Canal"
	line "Suerte?"

	para "Para ganar, cambia"
	line "#mon con mucha"
	cont "gente y reúne IDs"
	cont "diferentes."
	done

GoldenrodDeptStore6FSuperNerdText:
	text "Si estás cansado,"
	line "prueba las bebidas"
	cont "de la máquina."

	para "¡A tus #mon"
	line "les encantarán!"
	done

GoldenrodDeptStore6FDirectoryText:
	text "¡Descansa de las"
	line "compras!"

	para "P5 Plaza de la"
	line "   Tranquilidad"
	done
