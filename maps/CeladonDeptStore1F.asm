CeladonDeptStore1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore1FDirectoryText

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FReceptionistText, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FGentlemanText, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore1FTeacherText, -1

CeladonDeptStore1FReceptionistText:
	text "¡Hola! ¡Bienvenido"
	line "al C. C. Azulona!"

	para "El directorio está"
	line "en la pared."
	done

CeladonDeptStore1FGentlemanText:
	text "Este Centro"
	line "Comercial es de la"
	cont "misma cadena que"
	cont "el de Trigal."

	para "Ambos fueron"
	line "renovados al mismo"
	cont "tiempo."
	done

CeladonDeptStore1FTeacherText:
	text "Es la primera vez"
	line "que vengo."

	para "¡Es tan grande!"
	line "Me da miedo"
	cont "perderme."
	done

CeladonDeptStore1FDirectoryText:
	text "PB: Mostrador de"
	line "    Atención"

	para "P1: Mercado de"
	line "    Entrenadores"

	para "P2: Tienda Tecn."

	para "P3: Regalos Sabio"

	para "P4: Farmacia"

	para "P5: Atrio de la"
	line "    Azotea"
	done
