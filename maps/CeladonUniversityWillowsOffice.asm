CeladonUniversityWillowsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_UNIVERSITY_2F, 3
	warp_event  4,  5, CELADON_UNIVERSITY_2F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  0, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBlackboardText
	bg_event  1,  0, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBlackboardText
	bg_event  2,  1, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBookshelf1Text
	bg_event  3,  1, BGEVENT_JUMPTEXT, CeladonUniversityWillowsOfficeBookshelf2Text
	bg_event  5,  2, BGEVENT_RIGHT, CeladonUniversityWillowsOfficeComputer

	def_object_events
	object_event  0,  2, SPRITE_WILLOW, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityWillowsOfficeWillowText, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityWillowsOfficeScientistText, -1

CeladonUniversityWillowsOfficeWillowText:
	text "¡Hola, hola!"
	line "Soy el"
	cont "Prof. Willow."

	para "Superviso a Cande-"
	line "la, Blanche y"
	cont "Spark en sus cla-"

	para "ses e investiga-"
	line "ciones."

	para "Puede que te cru-"
	line "ces con ellos en"
	cont "clase."

	para "También estudio la"
	line "distribución y há-"
	cont "bitat de los"
	cont "#mon."

	para "Estoy muy ocupa-"
	line "do, pero mis ex-"

	para "celentes asisten-"
	line "tes me ayudan con"
	cont "el trabajo."
	done

CeladonUniversityWillowsOfficeScientistText:
	text "¡Trabajo como a-"
	line "yudante del"
	cont "Prof. Willow!"

	para "Estoy catalogando"
	line "mis observaciones"
	cont "de la Ruta 7."

	para "Hoy vi 42"
	line "Raticate y 37"
	cont "Pidgeotto…"
	cont "¡y un Vulpix!"
	done

CeladonUniversityWillowsOfficeBlackboardText:
	text "Alguien escribió"
	line "“NO BORRAR” con"

	para "una flecha hacia"
	line "un garabato"
	cont "ilegible…"
	done

CeladonUniversityWillowsOfficeBookshelf1Text:
	text "Es un libro de ni-"
	line "chos ecológicos"

	para "y cómo los #mon"
	line "encajan en sus"
	cont "entornos."
	done

CeladonUniversityWillowsOfficeBookshelf2Text:
	text "Es un folleto pro-"
	line "mocional de la"
	cont "Zona Safari."

	para "Lo adornan un"
	line "montón de #mon"
	cont "exóticos."
	done

CeladonUniversityWillowsOfficeComputer:
	jumpthistext

	text "“Sistema de Trans-"
	line "ferencia #mon”"
	cont "está en la panta-"
	cont "lla."
	done
