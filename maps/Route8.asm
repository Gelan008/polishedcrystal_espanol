Route8_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 10, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4, 11, ROUTE_8_SAFFRON_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 11,  9, BGEVENT_JUMPTEXT, Route8UndergroundPathSignText
	bg_event 10,  7, BGEVENT_JUMPTEXT, Route8LockedDoorText

	def_object_events
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 10, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 10, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 17,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdSam, -1
	object_event 32,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdTom, -1
	object_event 43, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGentlemanMilton, -1
	object_event 23,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleMoeandlulu1, -1
	object_event 24,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleMoeandlulu2, -1
	object_event 29,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassMeadow, -1
	cuttree_event 21, 14, EVENT_ROUTE_8_CUT_TREE_1
	cuttree_event 32, 12, EVENT_ROUTE_8_CUT_TREE_2
	fruittree_event 45,  7, FRUITTREE_ROUTE_8, SALAC_BERRY, PAL_NPC_GREEN
	object_event  6,  9, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerDwayneProtestText, EVENT_ROUTE_8_PROTESTORS
	object_event  7, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerHarrisProtestText, EVENT_ROUTE_8_PROTESTORS
	object_event  6, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerZekeProtestText, EVENT_ROUTE_8_PROTESTORS

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script, TRAINERPAL_BIKER_DWAYNE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¡La Federación"
	line "#mon de Kanto"
	cont "jamás caerá!"
	done

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script, TRAINERPAL_BIKER_HARRIS

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Barrido por un"
	line "renacuajo que"
	cont "viene de Johto…"
	done

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script, TRAINERPAL_BIKER_ZEKE

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Intentaremos no"
	line "molestar a nadie"
	cont "a partir de hoy…"
	done

GenericTrainerSupernerdSam:
	generictrainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText

	text "¡El poder de los"
	line "imanes es genial!"
	done

GenericTrainerSupernerdTom:
	generictrainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText

	text "Las Medallas de"
	line "Gimnasio demues-"
	cont "tran tu destreza."
	done

GenericTrainerGentlemanMilton:
	generictrainer GENTLEMAN, MILTON, EVENT_BEAT_GENTLEMAN_MILTON, GentlemanMiltonSeenText, GentlemanMiltonBeatenText

	text "Pararse en mitad"
	line "del camino para"
	cont "luchar es de bien."

	para "Pase lo que pase,"
	line "¡ante todo soy un"
	cont "caballero!"
	done

GenericTrainerCoupleMoeandlulu1:
	generictrainer COUPLE, MOEANDLULU1, EVENT_BEAT_COUPLE_MOE_AND_LULU, CoupleMoeandlulu1SeenText, CoupleMoeandlulu1BeatenText

	text "Moe: En resumen,"
	line "eres demasiado"
	cont "fuerte…"
	done

GenericTrainerCoupleMoeandlulu2:
	generictrainer COUPLE, MOEANDLULU2, EVENT_BEAT_COUPLE_MOE_AND_LULU, CoupleMoeandlulu2SeenText, CoupleMoeandlulu2BeatenText

	text "Lulu: No es que"
	line "Moe sea débil,"

	para "¡es que tienes de-"
	line "masiada fuerza!"
	done

GenericTrainerLassMeadow:
	generictrainer LASS, MEADOW, EVENT_BEAT_LASS_MEADOW, LassMeadowSeenText, LassMeadowBeatenText

	text "Bueno, me importa"
	line "más divertirme que"
	cont "ser competitiva."
	done

Route8BikerDwayneProtestText:
	text "¡Somos el grupo de"
	line "la Federación"
	cont "#mon de Kanto!"

	para "¡Estamos de mani-"
	line "festación!"
	done

Route8BikerZekeProtestText:
	text "¡Somos la Federa-"
	line "ción #mon"
	cont "de Kanto!"

	para "¡La pasma no nos"
	line "impedirá usar la"

	para "Vía Subterránea!"
	done

BikerDwayneSeenText:
	text "¡Somos el grupo de"
	line "la Federación"
	cont "#mon de Kanto!"

	para "¡Te pasaremos por"
	line "encima con la moto!"
	done

BikerDwayneBeatenText:
	text "¡L-lo siento!"
	done

Route8BikerHarrisProtestText:
BikerHarrisSeenText:
	text "¡La pasma cerró la"
	line "Vía Subterránea!"

	para "¡Eso me saca de"
	line "mis casillas!"
	done

BikerHarrisBeatenText:
	text "¡P-perdóname!"
	done

BikerZekeSeenText:
	text "¡Somos la Federa-"
	line "ción #mon"
	cont "de Kanto!"
	cont "¡A tope!"
	done

BikerZekeBeatenText:
	text "¡Caray! ¡Perdón!"
	done

SupernerdSamSeenText:
	text "¿Cómo funciona"
	line "el Magnetotrén?"
	done

SupernerdSamBeatenText:
	text "Solo quería ver el"
	line "Magnetotrén…"
	done

SupernerdTomSeenText:
	text "Hum… Tienes muchas"
	line "Medallas de Gimna-"
	cont "sio."
	done

SupernerdTomBeatenText:
	text "Tal como creía…"
	line "¡Pisas fuerte!"
	done

GentlemanMiltonSeenText:
	text "¿Le apetecería"
	line "echar un rápido"
	cont "combate conmigo?"
	done

GentlemanMiltonBeatenText:
	text "Demostró usted mu-"
	line "cha destreza."
	done

CoupleMoeandlulu1SeenText:
	text "Moe: ¿Parezco dé-"
	line "bil? ¡No me hagas"
	cont "reír!"

	para "Con Lulu, ¡mi va-"
	line "lor se multiplica"
	cont "por cien!"
	done

CoupleMoeandlulu1BeatenText:
	text "Moe: ¡Buaaaah!…"
	done

CoupleMoeandlulu2SeenText:
	text "Lulu: ¡Moe y yo ha-"
	line "cemos buena pareja!"

	para "¡Prepárate bien!"
	done

CoupleMoeandlulu2BeatenText:
	text "Lulu: ¡Aaaah!"
	done

LassMeadowSeenText:
	text "¡Me encantan las"
	line "faldas! ¡Son monas"
	cont "y comodísimas!"
	done

LassMeadowBeatenText:
	text "¡Madre mía!"
	done

Route8LockedDoorText:
	text "Está cerrado…"
	done

Route8UndergroundPathSignText:
	text "El cartel está ro-"
	line "to."

	para "Es imposible leer-"
	line "lo…"
	done
