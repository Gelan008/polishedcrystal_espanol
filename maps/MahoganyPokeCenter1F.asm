MahoganyPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, MAHOGANY_TOWN, 4
	warp_event  6,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalPryceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FPokefanmText, -1
	object_event  1,  3, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FYoungsterText, -1
	object_event  2,  3, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, MahoganyPokeCenter1FCooltrainerfText, -1

PokemonJournalPryceScript:
	setflag ENGINE_READ_PRYCE_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje sobre"
	line "el Líder Fredo."

	para "El segundo nombre"
	line "de Fredo es Sauce."

	para "Su estilo de lu-"
	line "cha dicen que es"

	para "flexible como un"
	line "sauce en invier-"
	cont "no, lo que le"

	para "ha valido el"
	line "apodo “Entrenador"
	cont "del Invierno”."
	done

MahoganyPokeCenter1FPokefanmText:
	text "¿Cómo? ¿El Team"
	line "Rocket ha regre-"
	cont "sado?"

	para "Vi hombres de ne-"
	line "gro en el Lago"
	cont "de la Furia..."
	done

MahoganyPokeCenter1FYoungsterText:
	text "Evito que mis"
	line "#mon evolucio-"
	cont "nen muy pronto."

	para "Hago que apren-"
	line "dan ataques antes"
	cont "de dejar que"
	cont "evolucionen."
	done

MahoganyPokeCenter1FCooltrainerfText:
	text "Los #mon se ha-"
	line "cen fuertes si"

	para "evolucionan, pero"
	line "aprenden ataques"
	cont "más despacio."
	done
