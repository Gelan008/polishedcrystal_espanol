RadioTower4F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, RadioTower4FProductionSignText
	bg_event 15,  0, BGEVENT_JUMPTEXT, RadioTower4FStudio2SignText

	def_object_events
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower4FFisherText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_MARY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	pokemon_event 12,  7, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, RadioTowerMeowthText, -1
	object_event 14,  1, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerProton1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerRocketScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

	object_const_def
	const RADIOTOWER4F_ROCKET

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	iftrue_jumpopenedtext RadioTower4FDJMaryText_After
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .ClearedRockets
	jumpthisopenedtext

	text "Rosa: ¿Por qué?"
	line "¿Por qué tengo que"
	cont "pasar por esto?"

	para "¡Meowth, ayúdame!"
	done

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem FAIRYFEATHER
	iffalse_endtext
	setevent EVENT_GOT_FAIRYFEATHER_FROM_MARY
	jumpthisopenedtext

	text "Rosa: ¡Le viene"
	line "genial a los"
	cont "#mon con"
	cont "ataques de tipo"
	cont "Hada!"
	done

GenericTrainerGruntM10:
	generictrainer GRUNTM, 10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText

	text "¡No me lo puedo"
	line "creer! ¡Me han"
	cont "vencido!"
	done

GenericTrainerProton1:
	generictrainer PROTON, PROTON1, EVENT_BEAT_PROTON_1, Proton1SeenText, Proton1BeatenText

	text "Te ganaste mi"
	line "respeto, toma un"
	cont "consejo."

	para "Aún no es tarde."
	line "Todavía puedes"
	cont "darte la vuelta."
	done

GenericTrainerGruntF4:
	generictrainer GRUNTF, 4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText

	text "¡Adoro lo hermosa"
	line "que soy!"

	para "¿A quién le"
	line "importan los"
	cont "#mon?"
	done

GenericTrainerRocketScientistRich:
	generictrainer ROCKET_SCIENTIST, RICH, EVENT_BEAT_ROCKET_SCIENTIST_RICH, RocketScientistRichSeenText, RocketScientistRichBeatenText

	text "¿De verdad crees"
	line "que pararás al"
	cont "Team Rocket?"
	done

RadioTower4FFisherText:
	text "Oí la radio cuando"
	line "fui a las ruinas."

	para "Había una emisión"
	line "muy extraña."
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "Rosa: ¡Oh! ¡Eres"
	line "mi salvación!"

	para "¡Toma esto en"
	line "agradecimiento!"
	done

RadioTower4FDJMaryText_After:
	text "Rosa: ¡Sintoniza"
	line "La Hora Oak,"
	cont "por favor!"
	done

RadioTowerMeowthText:
	text "Meowth: Meowth…"
	done

GruntM10SeenText:
	text "¿Planeas rescatar"
	line "al Director?"

	para "¡Es imposible!"
	line "¡Pienso vencerte!"
	done

GruntM10BeatenText:
	text "¡No! ¡Increíble!"
	done

Proton1SeenText:
	text "¡Alto! ¡Soy la"
	line "fortaleza del"
	cont "Team Rocket!"

	para "¡No darás ni un"
	line "solo paso más!"
	done

Proton1BeatenText:
	text "¡La fortaleza se"
	line "ha derrumbado!"
	done

GruntF4SeenText:
	text "¿Que si me parecen"
	line "monos los #mon?"

	para "¡Solo pensaré que"
	line "lo son cuando"
	cont "ganen a los tuyos!"
	done

GruntF4BeatenText:
	text "¡Oh, no! ¡Son unos"
	line "inútiles!"
	done

RocketScientistRichSeenText:
	text "Excelente."

	para "Esta Torre Radio"
	line "cumplirá nuestro"
	cont "gran plan."
	done

RocketScientistRichBeatenText:
	text "Hum…"

	para "Todo gran plan"
	line "tiene tropiezos."
	done

RadioTower4FProductionSignText:
	text "3P Producción"
	done

RadioTower4FStudio2SignText:
	text "3P Estudio 2"
	done
