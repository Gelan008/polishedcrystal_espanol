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
	object_event  1, 10, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FReceptionistText, -1
	object_event  8, 10, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerMText, -1
	object_event  6,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FCooltrainerFText, -1
	object_event  7,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FYoungsterText, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TrainerHouse1FGentlemanText, -1

TrainerHouse1FReceptionistText:
	text "Te damos la bien-"
	line "venida a la Casa"

	para "de Entrenadores,"
	line "el sitio más mo-"

	para "derno y animado"
	line "de Ciudad Verde."

	para "Solo abrimos a"
	line "los entrenadores."

	para "Abajo puedes com-"
	line "batir contra los"

	para "mejores entre los"
	line "mejores."
	done

TrainerHouse1FCooltrainerMText:
	text "Ciudad Verde es el"
	line "pueblo más cerca-"
	cont "no al Meseta Añil."

	para "¡Se le conoce co-"
	line "mo la puerta de"

	para "acceso a la Mese-"
	line "ta Añil!"

	para "Construyeron este"
	line "lugar porque por"

	para "aquí pasan muchos"
	line "entrenadores de"

	para "camino a la Liga"
	line "#mon."
    done

TrainerHouse1FCooltrainerFText:
	text "Aquí abajo se ce-"
	line "lebran combates"
	cont "de práctica."

	para "Me encantaría ver"
	line "cómo combate un"

	para "entrenador de"
	line "Johto."
    done

TrainerHouse1FYoungsterText:
	text "Supongo que no se"
	line "puede ser el Cam-"

	para "peón a menos que"
	line "viajes por todas"

	para "partes y luches"
	line "contra todo tipo"
	cont "de gente."

	para "El Campeón de"
	line "Pueblo Paleta via-"

	para "jó por todas las"
	line "ciudades de Kanto."
    done

TrainerHouse1FGentlemanText:
	text "Uf… Estoy descan-"
	line "sando de los com-"
	cont "bates #mon."
    done

TrainerHouseSign1Text:
	text "Los combates de"
	line "práctica se cele-"

	para "bran en la Sala"
	line "de Entrenamiento"
	cont "de abajo."

	para "Se invita a par-"
	line "ticipar a los ex-"
	cont "pertos."
    done

TrainerHouseSign2Text:
	text "No hay reglas ni"
	line "normas en los com-"

	para "bates de práctica."
	line "¡Como en el cam-"

	para "po, todo vale!"
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
