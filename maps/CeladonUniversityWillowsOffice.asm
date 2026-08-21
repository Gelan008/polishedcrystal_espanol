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

	para "Superviso a"
	line "Candela, Blanche y"
	cont "Spark en sus"
	cont "investigaciones."

	para "Puede que los veas"
	line "en sus aulas."

	para "También estudio el"
	line "hábitat de los"
	cont "#mon."

	para "Estoy ocupadísimo,"
	line "pero mis geniales"
	cont "ayudantes me echan"
	cont "una mano."
	done

CeladonUniversityWillowsOfficeScientistText:
	text "¡Soy ayudante del"
	line "Prof. Willow!"

	para "Catalogó mis"
	line "observaciones en"
	cont "la Ruta 7."

	para "Hoy vi 42"
	line "Raticate y 37"
	cont "Pidgeotto…"
	cont "¡y un Vulpix!"
	done

CeladonUniversityWillowsOfficeBlackboardText:
	text "Pone “NO BORRAR”"
	line "con una flecha"
	cont "hacia un garabato"
	cont "ilegible…"
	done

CeladonUniversityWillowsOfficeBookshelf1Text:
	text "Es un libro sobre"
	line "nichos ecológicos"
	cont "y el hábitat de"
	cont "los #mon."
	done

CeladonUniversityWillowsOfficeBookshelf2Text:
	text "Es un folleto de"
	line "la Zona Safari."

	para "Lo adornan muchos"
	line "#mon exóticos."
	done

CeladonUniversityWillowsOfficeComputer:
	jumpthistext

	text "“Transferencia"
	line "#mon” se lee en"
	cont "la pantalla."
	done
