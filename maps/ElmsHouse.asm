ElmsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  4, NEW_BARK_TOWN, 5
	warp_event  7,  5, NEW_BARK_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPTEXT, ElmsHouseFridgeText
	bg_event  6,  1, BGEVENT_JUMPTEXT, ElmsHousePCText
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsWifeText, -1
	object_event  4,  5, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ElmsSonText, -1

ElmsWifeText:
	text "¡Hola, <PLAYER>!"
	line "Mi marido siempre"

	para "está ocupado. Es-"
	line "pero que esté"
	cont "bien."

	para "Cuando está inmer-"
	line "so en sus investi-"
	cont "gaciones #mon,"

	para "hasta se olvida de"
	line "comer."
	done

ElmsSonText:
	text "¡De mayor, voy a"
	line "ayudar a mi papá!"

	para "¡Seré un gran"
	line "profesor #mon!"
	done

ElmsHouseFridgeText:
	text "Aquí hay algo de"
	line "comida. Debe de"
	cont "ser para #mon."
	done

ElmsHousePCText:
	text "#mon. ¿De dónde"
	line "vienen?"

	para "¿Hacia dónde van?"

	para "¿Por qué nunca na-"
	line "die ha presenciado"
	cont "el nacimiento de"
	cont "un #mon?"

	para "¡Quiero saberlo!"
	line "¡Dedicaré mi vida"

	para "al estudio de los"
	line "#mon!"

	para "..."

	para "Es un fragmento de"
	line "los trabajos de"
	cont "investigación del"
	cont "Prof. Elm."
	done
