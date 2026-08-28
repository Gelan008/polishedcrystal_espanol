Route11_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 45,  8, ROUTE_11_GATE, 1
	warp_event 45,  9, ROUTE_11_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_JUMPTEXT, Route11SignText
	bg_event 44,  5, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

	def_object_events
	object_event 32, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterOwen, -1
	object_event 30,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterJason, -1
	object_event 21,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterAlfie, -1
	object_event 40,  7, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicHerman, -1
	object_event 12,  6, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicFidel, -1
	object_event 24, 14, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicUri, -1
	object_event 38,  1, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerBernie, -1
	object_event 38, 14, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerCamden, -1
	object_event  9,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGuitaristmRoger, -1
	object_event 10, 16, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfRitsuko, -1
	fruittree_event 44,  2, FRUITTREE_ROUTE_11, GANLON_BERRY, PAL_NPC_PURPLE
	tmhmball_event 44, 13, TM_VENOSHOCK, EVENT_ROUTE_11_TM_VENOSHOCK

GenericTrainerYoungsterOwen:
	generictrainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText

	text "Luché limpio y"
	line "con honor."
	done

YoungsterOwenSeenText:
	text "¡Luchemos limpio"
	line "con los #mon!"
	done

YoungsterOwenBeatenText:
	text "¿Cómo ha podido"
	line "pasar?"
	done

GenericTrainerYoungsterJason:
	generictrainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText

	text "Atraparé más #mon"
	line "en la hierba."
	done

YoungsterJasonSeenText:
	text "Ir en pantalones"
	line "cortos por la"
	cont "hierba pica y hace"
	cont "cosquillas."
	done
	
YoungsterJasonBeatenText:
	text "¡Me machacaron!"
	done

GenericTrainerYoungsterAlfie:
	generictrainer YOUNGSTER, ALFIE, EVENT_BEAT_YOUNGSTER_ALFIE, .SeenText, .BeatenText

	text "Todo es más"
	line "divertido si es"
	cont "una competición."
	done

.SeenText:
	text "Tres, dos, uno…"
	line "¡YA!"
	done

.BeatenText:
	text "Juego, set y"
	line "partido."
	done

GenericTrainerPsychicHerman:
	generictrainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText

	text "… Perdí por tener"
	line "los ojos cerrados."
	done

PsychicHermanSeenText: ; text > text
PsychicHermanBeatenText:
	text "…"
	done

GenericTrainerPsychicFidel:
	generictrainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText

	text "Tienes poder pues"
	line "crees en tus"
	cont "#mon."
	done

PsychicFidelSeenText:
	text "Puedo ver todo lo"
	line "relativo a ti…"
	done

PsychicFidelBeatenText:
	text "No pude prever tu"
	line "gran poder…"
	done

GenericTrainerPsychicUri:
	generictrainer PSYCHIC_T, URI, EVENT_BEAT_PSYCHIC_URI, .SeenText, .BeatenText

	text "El Prof. Oak no me"
	line "da una #dex."
	cont "¿Por qué será?"
	done

.SeenText:
	text "Un buen día, un"
	line "niño con poderes"
	cont "psíquicos despertó"

	para "en su cama siendo"
	line "un Kadabra."
	done

.BeatenText:
	text "¿Leyenda urbana?"
	line "¿Qué es eso?"
	done

GenericTrainerEngineerBernie:
	generictrainer ENGINEER, BERNIE, EVENT_BEAT_ENGINEER_BERNIE, .SeenText, .BeatenText

	text "¡Pasa la voz para"
	line "ahorrar energía!"
	done

.SeenText:
	text "¡Cuidado! ¡Estoy"
	line "instalando cables!"
	done

.BeatenText:
	text "¡Electrizante!"
	done

GenericTrainerEngineerCamden:
	generictrainer ENGINEER, CAMDEN, EVENT_BEAT_ENGINEER_CAMDEN, .SeenText, .BeatenText

	text "Construir puentes"
	line "y crear un equipo"
	cont "requiere destreza."
	done

.SeenText:
	text "¡Hice Ingeniería"
	line "en Azulona!"
	done

.BeatenText:
	text "¡Cortocircuito!"
	done

GenericTrainerGuitaristmRoger:
	generictrainer GUITARISTM, ROGER, EVENT_BEAT_GUITARISTM_ROGER, .SeenText, .BeatenText

	text "¡No te rindas sin"
	line "pelear!"
	done

.SeenText:
	text "Dos extraños van"
	line "por la calle y por"
	cont "azar cruzan sus"
	cont "miradas…"
	done

.BeatenText:
	text "¡Sigue brillando,"
	line "loco diamante!"
	done

GenericTrainerGuitaristfRitsuko:
	generictrainer GUITARISTF, RITSUKO, EVENT_BEAT_GUITARISTF_RITSUKO, .SeenText, .BeatenText

	text "♪ Rock'n, rock'n'"
	line "roll radio… ♪"
	done

.SeenText:
	text "¡Hey, ho, let's"
	line "go!"
	done

.BeatenText:
	text "No hay éxito para"
	line "mí…"
	done

Route11SignText:
	text "Ruta 11"
	done
