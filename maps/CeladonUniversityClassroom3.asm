CeladonUniversityClassroom3_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 8
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 8

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom3Bookshelf2Text

	def_object_events
	object_event  2,  1, SPRITE_SPARK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3SparkText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3TeacherText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3ChildText, -1
	object_event  3,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3LassText, -1
	object_event  4,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom3Super_nerdText, -1

CeladonUniversityClassroom3SparkText:
	text "¡Oye! Soy Spark."
	line "Enseño Ciencias…"
	cont "más concretamente,"
	cont "#biología."

	para "Estudiamos cómo se"
	line "reproducen los"
	cont "#mon."

	para "El Prof. Elm es el"
	line "pionero en este"
	cont "campo."

	para "¡Oh, le conoces!"
	line "¿Es verdad que"
	cont "vive dentro de su"
	cont "laboratorio?"
	done

CeladonUniversityClassroom3TeacherText:
	text "¿Estás buscando"
	line "a Spark?"

	para "Volverá mañana"
	line "por la mañana."
	done

CeladonUniversityClassroom3ChildText:
	text "Los #mon dentro"
	line "de las # Balls"
	cont "se vuelven luz, y"
	cont "luego materia al"
	cont "salir fuera."

	para "No te preocupes,"
	line "¡no les duele en"
	cont "absoluto!"
	done

CeladonUniversityClassroom3LassText:
	text "Mi profesor dice"
	line "que Magneton surge"
	cont "de tres Magnemite,"
	cont "¡pero pesa 10"
	cont "veces más!"

	para "¿Cómo puede ser?"
	done

CeladonUniversityClassroom3Super_nerdText:
	text "¿Conoces al"
	line "#mon eléctrico"
	cont "Mareep?"

	para "Su nombre viene"
	line "de la unidad de"
	cont "amperio (ampere)."

	para "¡Cambia el orden"
	line "de letras y verás!"
	done

CeladonUniversityClassroom3BlackboardText:
	text "Pone: Filogenia."

	para "…Los #mon se"
	line "dividen en 14"
	cont "Grupos Huevo,"
	cont "además de Ditto."

	para "Los #mon Bebé"
	line "no pueden criar."

	para "Los Legendarios"
	line "no han sido aún"
	cont "estudiados."
	done

CeladonUniversityClassroom3Bookshelf1Text:
	text "Es un libro de"
	line "diseños prototipo"

	para "de dispositivos"
	line "tecnológicos."

	para "¡Eh! ¡Aquí hay un"
	line "diagrama de uno de"
	cont "los primeros"
	cont "#gear!"
	done

CeladonUniversityClassroom3Bookshelf2Text:
	text "Es un documento"
	line "escrito por el"
	cont "Prof. Silktree."

	para "“Informe de"
	line "Investigación de"
	cont "Ruinas Alfa”…"
	done
