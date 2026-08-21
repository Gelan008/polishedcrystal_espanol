CeladonUniversity1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 14, 19, CELADON_CITY, 13
	warp_event 15, 19, CELADON_CITY, 13
	warp_event 25, 12, CELADON_UNIVERSITY_2F, 1
	warp_event 21, 12, CELADON_UNIVERSITY_LIBRARY_1F, 1
	warp_event 15,  0, CELADON_UNIVERSITY_PRINCIPALS_OFFICE, 1
	warp_event  3,  4, CELADON_UNIVERSITY_CLASSROOM_1, 1
	warp_event  9,  4, CELADON_UNIVERSITY_CLASSROOM_2, 1
	warp_event 21,  4, CELADON_UNIVERSITY_CLASSROOM_3, 1
	warp_event 27,  4, CELADON_UNIVERSITY_CLASSROOM_4, 1
	warp_event  3, 12, CELADON_UNIVERSITY_LOUNGE, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonUniversity1FPrincipalsOfficeSignText
	bg_event  2,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom1SignText
	bg_event  8,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom2SignText
	bg_event 20,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom3SignText
	bg_event 26,  4, BGEVENT_JUMPTEXT, CeladonUniversity1FClassroom4SignText
	bg_event  2, 12, BGEVENT_JUMPTEXT, CeladonUniversity1FStudentLoungeSignText
	bg_event 20, 12, BGEVENT_JUMPTEXT, CeladonUniversity1FLibrarySignText
	bg_event 22,  5, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event 23,  5, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event  6, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event  7, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FTrophyCaseSignText
	bg_event 26, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FBookshelfText
	bg_event 27, 13, BGEVENT_JUMPTEXT, CeladonUniversity1FBookshelfText

	def_object_events
	object_event  6,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FSuperNerdText, -1
	object_event 16,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FLassText, -1
	object_event 25,  5, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FCooltrainermText, -1
	object_event 13,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FYoungsterText, -1
	object_event  4, 15, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, (1 << MORN) | (1 << DAY), PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FChildText, -1
	object_event  6, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, (1 << EVE) | (1 << NITE), PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FPokefanmText, -1
	object_event 14, 14, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FReceptionistText, -1
	object_event 23, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversity1FCooltrainerfText, -1

CeladonUniversity1FSuperNerdText:
	text "Varios expertos"
	line "creen que existen"
	cont "otros universos"
	cont "paralelos a este."

	para "¿Significa que hay"
	line "un universo sin"
	cont "#mon?"

	para "¡Sería trágico!"
	done

CeladonUniversity1FLassText:
	text "Aquí dan cursos"
	line "de todo, ¡desde"
	cont "arreglos florales"
	cont "hasta psicología"
	cont "#mon!"
	done

CeladonUniversity1FCooltrainermText:
	text "Todos en esta"
	line "universidad son"
	cont "entrenadores"
	cont "#mon."

	para "Para entrar debes"
	line "aprobar unos tests"
	cont "de combates"
	cont "#mon."
	done

CeladonUniversity1FYoungsterText:
	text "Magikarp es la"
	line "mascota de la"
	cont "universidad."

	para "¡Es un símbolo de"
	line "que todos pueden"
	cont "alcanzar la"
	cont "grandeza!"
	done

CeladonUniversity1FChildText:
	text "¡Uf! No encuentro"
	line "mi clase…"

	para "¡Llegaré tarde!"
	done

CeladonUniversity1FPokefanmText:
	text "¡Soy el conserje!"

	para "¡Cuidado, el suelo"
	line "está mojado!"
	done

CeladonUniversity1FReceptionistText:
	text "¡Bienvenido a la"
	line "Univ. de Azulona!"

	para "Las aulas y la"
	line "Dirección están al"
	cont "fondo."

	para "La biblioteca está"
	line "a la derecha y la"
	cont "sala de estar a la"
	cont "izquierda."

	para "La cafetería,"
	line "la piscina y la"
	cont "enfermería están"
	cont "arriba."
	done

CeladonUniversity1FCooltrainerfText:
	text "Estudio para ser"
	line "enfermera #mon."

	para "¡Con tantas"
	line "especies hay mucho"
	cont "que aprender!"
	done

CeladonUniversity1FPrincipalsOfficeSignText:
	text "Dirección"
	done

CeladonUniversity1FClassroom1SignText:
	text "Arte O2"
	done

CeladonUniversity1FClassroom2SignText:
	text "Historia O1"
	done

CeladonUniversity1FClassroom3SignText:
	text "Ciencia E1"
	done

CeladonUniversity1FClassroom4SignText:
	text "Combate E2"
	done

CeladonUniversity1FStudentLoungeSignText:
	text "Sala Estudiantes"
	done

CeladonUniversity1FLibrarySignText:
	text "Biblioteca"
	done

CeladonUniversity1FTrophyCaseSignText:
	text "La vitrina está"
	line "llena de trofeos"
	cont "y medallas."
	done

CeladonUniversity1FBookshelfText:
	text "Hay un montón de"
	line "anuarios aquí."

	para "Los alumnos han"
	line "garabateado por"
	cont "todo el libro."
	done
