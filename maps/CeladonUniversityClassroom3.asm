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
	line "Enseño Ciencias..."

	para "ahora mismo,"
	line "#biología."

	para "Estamos estudiando"
	line "cómo se reproducen"
	cont "los #mon."

	para "El Prof. Elm es el"
	line "pionero en este"
	cont "campo."

	para "¡Oh, le conoces!"
	line "¿Es cierto que de"
	cont "verdad vive en su"
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
	line "de # Balls se"

	para "convierten en luz,"
	line "y luego"

	para "vuelven a ser ma-"
	line "teria cuando salen"
	cont "fuera."

	para "No te preocupes,"
	line "¡no les duele en"
	cont "absoluto!"
	done

CeladonUniversityClassroom3LassText:
	text "Mi maestro dice"
	line "que Magneton es la"

	para "unión de tres Mag-"
	line "nemite, pero"

	para "Magneton es 10"
	line "veces más pesado"
	cont "que Magnemite."

	para "¡¿Cómo funciona"
	line "eso?!"
	done

CeladonUniversityClassroom3Super_nerdText:
	text "¿Has oído hablar"
	line "del #mon eléc-"
	cont "trico Mareep?"

	para "Su nombre deriva"
	line "de la unidad de"

	para "corriente eléc-"
	line "trica, “ampere”."

	para "¡Reorganiza sus"
	line "letras y lo verás!"
	done

CeladonUniversityClassroom3BlackboardText:
	text "Pone: 'Filogenéti-"
	line "ca'."

	para "...Los #mon se"
	line "dividen en 14"
	cont "Grupos Huevo,"
	cont "más Ditto."

	para "Los #mon Bebé"
	line "no pueden criar."

	para "Los #mon Le-"
	line "gendarios no han"
	cont "sido estudiados."
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
	cont "Ruinas Alfa”..."
	done
