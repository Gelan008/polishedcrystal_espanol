SafariZoneWest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 22,  2, SAFARI_ZONE_NORTH, 8
	warp_event 23,  2, SAFARI_ZONE_NORTH, 9
	warp_event 28,  2, SAFARI_ZONE_NORTH, 3
	warp_event 29,  2, SAFARI_ZONE_NORTH, 4
	warp_event 31, 24, SAFARI_ZONE_HUB, 5
	warp_event 31, 25, SAFARI_ZONE_HUB, 6
	warp_event 13, 13, SAFARI_ZONE_WEST_REST_HOUSE_1, 1
	warp_event  5,  5, SAFARI_ZONE_WEST_REST_HOUSE_2, 1

	def_coord_events

	def_bg_events
	bg_event 26, 24, BGEVENT_JUMPTEXT, SafariZoneWestAreaSignText
	bg_event 14, 14, BGEVENT_JUMPTEXT, SafariZoneWestRestHouseSignText
	bg_event 28,  6, BGEVENT_JUMPTEXT, SafariZoneWestTrainerTips1SignText
	bg_event 19,  5, BGEVENT_JUMPTEXT, SafariZoneWestTrainerTips2SignText
	bg_event 13,  6, BGEVENT_ITEM + NUGGET, EVENT_SAFARI_ZONE_WEST_HIDDEN_NUGGET

	def_object_events
	object_event 22, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassDuplica, -1
	object_event 23, 12, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperAmos, -1
	object_event 12, 19, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTamerBrett, -1
	itemball_event 14,  9, MAX_REVIVE, 1, EVENT_SAFARI_ZONE_WEST_MAX_REVIVE

GenericTrainerLassDuplica:
	generictrainer LASS, DUPLICA, EVENT_BEAT_LASS_DUPLICA, LassDuplicaSeenText, LassDuplicaBeatenText

	text "¡Se me da genial"
	line "imitar a los demás!"

	para "¡Algún día seré"
	line "Entrenadora del"

	para "Gimnasio Fucsia e"
	line "imitaré a Sachiko!"
	done

GenericTrainerCamperAmos:
	generictrainer CAMPER, AMOS, EVENT_BEAT_CAMPER_AMOS, CamperAmosSeenText, CamperAmosBeatenText

	text "¡Buscaré #mon"
	line "nuevos por todas"
	cont "partes!"
	done

GenericTrainerTamerBrett:
	generictrainer TAMER, BRETT, EVENT_BEAT_TAMER_BRETT, TamerBrettSeenText, TamerBrettBeatenText

	text "Debes dar órdenes"
	line "a los #mon con"
	cont "seguridad."

	para "Ganar Medallas te"
	line "ayudará con eso."
	done

LassDuplicaSeenText:
	text "¡Para dominar a"
	line "Ditto, debes cono-"
	cont "cer a todo #mon!"
	done

LassDuplicaBeatenText:
	text "Aún me queda mucho"
	line "por aprender."
	done

CamperAmosSeenText:
	text "Muchos #mon vi-"
	line "ven en la Zona"
	cont "Safari."

	para "¡He venido a ha-"
	line "cerme con todos!"
	done

CamperAmosBeatenText:
	text "¡He perdido porque"
	line "tengo que entre-"
	cont "narlos!"
	done

TamerBrettSeenText:
	text "¿Sabes cómo lidiar"
	line "con los #mon"
	cont "agresivos?"
	done

TamerBrettBeatenText:
	text "¡Vaya si sabes!"
	done

SafariZoneWestAreaSignText:
	text "Zona Safari"
	line "Zona Oeste"
	done

SafariZoneWestRestHouseSignText:
	text "Casa de Reposo"
	done

SafariZoneWestTrainerTips1SignText:
	text "Pistas Entrenador"

	para "Los #mon de tipo"
	line "Fuego no se pueden"
	cont "quemar,"

	para "los de tipo Eléc-"
	line "trico no sufren"
	cont "parálisis"

	para "y los de tipo Hie-"
	line "lo no se congelan."
	done

SafariZoneWestTrainerTips2SignText:
	text "Pistas Entrenador"

	para "Bajo tormenta de"
	line "arena, los #mon"

	para "de tipo Roca mejo-"
	line "ran su Def. Esp."
	done