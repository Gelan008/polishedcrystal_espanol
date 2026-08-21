OlivineLighthouse5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_4F, 9
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_4F, 10
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_6F, 3

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_ITEM + HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

	def_object_events
	object_event  8, 11, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorErnest, -1
	object_event  8,  3, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperDenis, -1
	itemball_event 15, 12, RARE_CANDY, 1, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	itemball_event  6, 15, SUPER_REPEL, 1, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	tmhmball_event  2, 13, TM_ENERGY_BALL, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_ENERGY_BALL

GenericTrainerBird_keeperDenis:
	generictrainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, Bird_keeperDenisSeenText, Bird_keeperDenisBeatenText

	text "Mi #mon"
	line "aprendió Vuelo en"
	cont "el Bosque Amarillo"

	para "Como he perdido,"
	line "¡cruzaré el mar"
	cont "volando!"
	done

GenericTrainerSailorErnest:
	generictrainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText

	text "Un Líder no solo"
	line "debe ser fuerte,"
	cont "también debe tener"
	cont "compasión."
	done

SailorErnestSeenText:
	text "Quería luchar con"
	line "Yasmina, pero no"
	cont "está de humor."

	para "¿Qué te parece si"
	line "luchamos tú y yo?"
	done

SailorErnestBeatenText:
	text "¡Uf, uf! ¡Eres una"
	line "fiera!"
	done

Bird_keeperDenisSeenText:
	text "¡Qué alto estamos!"
	line "Mis #mon pájaro"
	cont "están en plena"
	cont "forma."
	done

Bird_keeperDenisBeatenText:
	text "¡Uy! Cayeron en"
	line "picado…"
	done
