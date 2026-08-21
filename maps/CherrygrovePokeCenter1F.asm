CherrygrovePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_CITY, 2
	warp_event  6,  7, CHERRYGROVE_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalRedScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokeCenter1FTeacherScript, -1
	object_event  8,  1, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FFisherText, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FGentlemanText, -1
	object_event  9,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FLadyText, -1
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygrovePokeCenter1FSuperNerdText, -1



PokemonJournalRedScript:
	setflag ENGINE_READ_RED_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Entrenador Rojo!"

	para "Dicen que Rojo"
	line "derrotó a su rival"
	cont "Azul por el título"
	cont "de Campeón de la"
	cont "Liga #mon en"
	cont "un tiempo récord."
	done

CherrygrovePokeCenter1FTeacherScript:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "El Centro de Unión"
	line "de arriba acaba de"
	cont "ser construido."

	para "Pero todavía lo"
	line "están terminando."
	done

.Text2:
	text "El Centro de Unión"
	line "de arriba acaba de"
	cont "ser construido."

	para "¡Ya intercambié"
	line "#mon allí!"
	done

CherrygrovePokeCenter1FFisherText:
	text "Es genial. Puedo"
	line "guardar todos los"
	cont "#mon que quiera"
	cont "¡y todo gratis!"
	done

CherrygrovePokeCenter1FGentlemanText:
	text "Ese PC es libre y"
	line "gratuito para todo"
	cont "el que lo use."
	done

CherrygrovePokeCenter1FLadyText:
	text "Las revistas"
	line "#mon tienen"
	cont "historias geniales"

	para "Vengo aquí a leer"
	line "las últimas,"
	cont "pero hay más"
	cont "sitios suscritos."
	done

CherrygrovePokeCenter1FSuperNerdText:
	text "¡Hola! Soy"
	line "Gelan008, el"
	cont "traductor al"
	cont "español de este"
	cont "juego."

	para "Te he dejado un"
	line "regalito en la"
	cont "Ruta 29."

	para "¡El objeto que"
	line "había ya no es"
	cont "una Poción!"
	done



