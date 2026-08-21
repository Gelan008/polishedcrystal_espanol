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
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBikerDwayne, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 10, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBikerHarris, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
	object_event 10, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBikerZeke, EVENT_ROUTE_8_KANTO_POKEMON_FEDERATION
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
	object_event  6, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route8BikerZekeProtestText, EVENT_ROUTE_8_PROTESTORS

GenericTrainerBikerDwayne:
	generictrainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText

	text "The Kanto #mon"
	line "Federation will"
	cont "never fall!"
	done

GenericTrainerBikerHarris:
	generictrainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText

	text "Wiped out by some"
	line "punk from Johto…"
	done

GenericTrainerBikerZeke:
	generictrainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText

	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done

GenericTrainerSupernerdSam:
	generictrainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText

	text "The power of mag-"
	line "nets is awesome!"
	done

GenericTrainerSupernerdTom:
	generictrainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText

	text "Gym Badges are"
	line "proof of your"
	cont "skill at battles."
	done

GenericTrainerGentlemanMilton:
	generictrainer GENTLEMAN, MILTON, EVENT_BEAT_GENTLEMAN_MILTON, GentlemanMiltonSeenText, GentlemanMiltonBeatenText

	text "Stopping in the"
	line "road for a battle"
	cont "isn't rude."

	para "No matter what,"
	line "I am a gentleman"
	cont "first!"
	done

GenericTrainerCoupleMoeandlulu1:
	generictrainer COUPLE, MOEANDLULU1, EVENT_BEAT_COUPLE_MOE_AND_LULU, CoupleMoeandlulu1SeenText, CoupleMoeandlulu1BeatenText

	text "Moe: In short,"
	line "you're just too"
	cont "strong…"
	done

GenericTrainerCoupleMoeandlulu2:
	generictrainer COUPLE, MOEANDLULU2, EVENT_BEAT_COUPLE_MOE_AND_LULU, CoupleMoeandlulu2SeenText, CoupleMoeandlulu2BeatenText

	text "Lulu: It's not that"
	line "Moe's weak, it's"

	para "that you're too"
	line "strong!"
	done

GenericTrainerLassMeadow:
	generictrainer LASS, MEADOW, EVENT_BEAT_LASS_MEADOW, LassMeadowSeenText, LassMeadowBeatenText

	text "Oh well, I'm more"
	line "worried about"

	para "having fun than"
	line "being competitive."
	done

Route8BikerDwayneProtestText:
	text "¡Somos el grupo de"
	line "la Federación"
	cont "#mon de Kanto!"

	para "¡Estamos en plena"
	line "manifestación!"
	done

Route8BikerZekeProtestText:
	text "¡Somos la"
	line "Federación #mon"
	cont "de Kanto!"

	para "¡La pasma no nos"
	line "impedirá usar la"
	cont "Vía Subterránea!"
	done

BikerDwayneSeenText:
	text "¡Somos el grupo de"
	line "la Federación"
	cont "#mon de Kanto!"

	para "¡Te pasaremos por"
	line "encima en moto!"
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
	text "¡Somos la"
	line "Federación #mon"
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
	line "Medallas de"
	cont "Gimnasio."
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
	text "Demostró usted"
	line "mucha destreza."
	done

CoupleMoeandlulu1SeenText:
	text "Moe: ¿Me ves muy"
	line "débil? ¡No me"
	cont "hagas reír!"

	para "¡Junto a Lulu, mi"
	line "fuerza se eleva"
	cont "por cien!"
	done

CoupleMoeandlulu1BeatenText:
	text "Moe: ¡Buaaaah!…"
	done

CoupleMoeandlulu2SeenText:
	text "Lulu: ¡Moe y yo"
	line "hacemos muy buena"
	cont "pareja!"

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
	text "El cartel está"
	line "roto."

	para "No se puede leer"
	line "nada…"
	done
