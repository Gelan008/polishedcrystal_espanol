TrainerHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, VIRIDIAN_CITY, 3
	warp_event  5, 11, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, TrainerHouseSign1Text
	bg_event  9,  0, BGEVENT_JUMPTEXT, TrainerHouseSign2Text
	bg_event  4,  6, BGEVENT_JUMPTEXT, TrainerHouseIllegibleText

	def_object_events
	object_event  0, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FReceptionistText, -1
	object_event  8, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerMText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerFText, -1
	object_event  7,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FYoungsterText, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FGentlemanText, -1

TrainerHouse1FReceptionistText:
	text "¡Te damos la"
	line "bienvenida a la"
	cont "Casa Entrenadores!"

	para "Es el sitio más"
	line "animado de Ciudad"
	cont "Verde."

	para "Solo abrimos para"
	line "los entrenadores."

	para "Abajo podrás"
	line "luchar contra los"
	cont "mejores."
	done

TrainerHouse1FCooltrainerMText:
	text "Ciudad Verde es la"
	line "más cercana a la"
	cont "Meseta Añil."

	para "¡Se le conoce como"
	line "la puerta a la"
	cont "Meseta Añil!"

	para "Hicieron esto por"
	line "los muchos que van"
	cont "a la Liga #mon."
	done

TrainerHouse1FCooltrainerFText:
	text "Abajo se celebran"
	line "combates de"
	cont "práctica."

	para "Me gustaría ver a"
	line "un entrenador de"
	cont "Johto en acción."
	done

TrainerHouse1FYoungsterText:
	text "No se puede ser"
	line "Campeón si no"
	cont "viajas por todos"
	cont "lados a luchar."

	para "El Campeón de"
	line "Pueblo Paleta"
	cont "viajó por todo"
	cont "Kanto."
	done

TrainerHouse1FGentlemanText:
	text "Uf… Me tomo un"
	line "descanso de las"
	cont "luchas #mon."
	done

TrainerHouseSign1Text:
	text "Los combates de"
	line "práctica se hacen"
	cont "en la Sala de"
	cont "abajo."

	para "¡Se invita a los"
	line "expertos a entrar!"
	done

TrainerHouseSign2Text:
	text "No hay reglas en"
	line "los combates de"
	cont "práctica."

	para "¡Como en el campo,"
	line "todo vale!"
	done

TrainerHouseIllegibleText:
	text "…¿Qué es esto?"
	line "¿Un memorándum"
	cont "estratégico?"

	para "Su letra parece"
	line "la huella de un"
	cont "Onix…"

	para "Es totalmente"
	line "ilegible…"
	done
