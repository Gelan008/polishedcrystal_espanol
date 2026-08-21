QuietCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 19, 33, ROUTE_47, 5
	warp_event  5, 25, QUIET_CAVE_B1F, 1
	warp_event 27, 23, QUIET_CAVE_B1F, 2
	warp_event 21,  9, QUIET_CAVE_B1F, 3
	warp_event  3, 17, QUIET_CAVE_B1F, 4
	warp_event 31, 13, QUIET_CAVE_B1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  8, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHexManiacAshley, -1
	object_event 13, 17, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermHenri, -1
	object_event 23, 25, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerGrady, -1
	object_event 29,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerScientistCarl, -1
	itemball_event 10, 23, NUGGET, 1, EVENT_QUIET_CAVE_1F_NUGGET
	itemball_event 26,  4, TWISTEDSPOON, 1, EVENT_QUIET_CAVE_1F_TWISTEDSPOON
	itemball_event 14,  2, DUSK_STONE, 1, EVENT_QUIET_CAVE_1F_DUSK_STONE
	itemball_event  3,  3, DUSK_BALL, 1, EVENT_QUIET_CAVE_1F_DUSK_BALL

GenericTrainerHexManiacAshley:
	generictrainer HEX_MANIAC, ASHLEY, EVENT_BEAT_HEX_MANIAC_ASHLEY, HexManiacAshleySeenText, HexManiacAshleyBeatenText

	text "I see things that"
	line "others can't see…"
	done

GenericTrainerCooltrainermHenri:
	generictrainer COOLTRAINERM, HENRI, EVENT_BEAT_COOLTRAINERM_HENRI, CooltrainermHenriSeenText, CooltrainermHenriBeatenText

	text "Having a diverse"
	line "team to support"

	para "each others' weak-"
	line "nesses is key."
	done

GenericTrainerHikerGrady:
	generictrainer HIKER, GRADY, EVENT_BEAT_HIKER_GRADY, HikerGradySeenText, HikerGradyBeatenText

	text "You could hear a"
	line "pin drop in this"
	cont "place!"
	done

GenericTrainerScientistCarl:
	generictrainer SCIENTIST, CARL, EVENT_BEAT_SCIENTIST_CARL, ScientistCarlSeenText, ScientistCarlBeatenText

	text "It's interesting"
	line "that such a quiet"
	cont "environment can"

	para "exist right near"
	line "rushing water."
	done

HexManiacAshleySeenText:
	text "¡Los espíritus me"
	line "han mostrado tu"
	cont "derrota!"
	done

HexManiacAshleyBeatenText:
	text "¡No! Los espíritus"
	line "¡nunca fallan!"
	cont "¡Jamás!"
	done

CooltrainermHenriSeenText:
	text "¿Podrás con mi"
	line "equipo tan bien"
	cont "equilibrado?"
	done

CooltrainermHenriBeatenText: ; text > text
	text "I guess you can!"
	done

HikerGradySeenText:
	text "¡Te he oído mucho"
	line "antes de verte!"
	done

HikerGradyBeatenText:
	text "¡Aaaah!"
	done

ScientistCarlSeenText:
	text "Investigo la"
	line "acústica de esta"
	cont "red de cuevas."
	done

ScientistCarlBeatenText:
	text "¡Mis estudios no"
	line "sirven de nada en"
	cont "el combate!"
	done

