SaffronOrreSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 17
	warp_event  3,  7, SAFFRON_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseSilphEmployeeText, -1
	object_event  5,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronOrreSpeechHouseCooltrainerMText, -1

SaffronOrreSpeechHouseSilphEmployeeText:
	text "He oído hablar de"
	line "un método para ce-"
	cont "rrar el corazón"
	cont "de los #mon"

	para "y forzarlos a ata-"
	line "car a la gente."

	para "¡¿Cómo puede al-"
	line "guien hacerle algo"

	para "tan horrible a los"
	line "#mon?!"
	done

SaffronOrreSpeechHouseCooltrainerMText:
	text "Acabamos de volver"
	line "de ver a un amigo"
	cont "en otra región."

	para "Tuvieron muchos"
	line "problemas por dos"
	cont "bandas criminales,"

	para "pero un talentoso"
	line "entrenador dio un"

	para "paso al frente y"
	line "los salvó."
	done
