CeruleanGym_MapScriptHeader:
	def_scene_scripts
	scene_script CeruleanGymTrigger0
	scene_script CeruleanGymTrigger1

	def_callbacks

	def_warp_events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  3,  8, BGEVENT_IFNOTSET, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	def_object_events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfViola, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  0,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  9,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorEddie, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  3, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuyScript, EVENT_TRAINERS_IN_CERULEAN_GYM

	object_const_def
	const CERULEANGYM_ROCKET

CeruleanGymTrigger1:
	sdefer CeruleanGymGruntRunsOutScript
CeruleanGymTrigger0:
	end

CeruleanGymGruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	showtext CeruleanGymGruntIntroText
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	showtext CeruleanGymGruntBigMistakeText
	applyonemovement CERULEANGYM_ROCKET, big_step_down
	showtext CeruleanGymGruntByeText
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	setscene $0
	setmapscene POWER_PLANT, $0
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftruefwd .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_VIOLA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SAILOR_PARKER
	setevent EVENT_BEAT_SAILOR_EDDIE
	opentext
	givebadge CASCADEBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM63_WATER_PULSE
	iftrue_jumpopenedtext MistyFightDoneText
	writetext MistyGiveTMText
	promptbutton
	verbosegivetmhm TM_WATER_PULSE
	setevent EVENT_GOT_TM63_WATER_PULSE
	jumpopenedtext MistyOutroText

GenericTrainerSwimmerfDiana:
	generictrainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText

	text "I'll be swimming"
	line "quietly."
	done

GenericTrainerSwimmerfViola:
	generictrainer SWIMMERF, VIOLA, EVENT_BEAT_SWIMMERF_VIOLA, SwimmerfViolaSeenText, SwimmerfViolaBeatenText

	text "Swimming is good"
	line "for both beauty"
	cont "and health!"

	para "Just look at"
	line "Misty, you'll see."
	done

GenericTrainerSwimmerfBriana:
	generictrainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText

	text "Don't be too smug"
	line "about beating me."

	para "Misty will destroy"
	line "you if you get"
	cont "complacent."
	done

GenericTrainerSailorParker:
	generictrainer SAILOR, PARKER, EVENT_BEAT_SAILOR_PARKER, SailorParkerSeenText, SailorParkerBeatenText

	text "Misty has gotten"
	line "much better in the"
	cont "past few years."

	para "Don't let your"
	line "guard down, or"
	cont "you'll be crushed!"
	done

GenericTrainerSailorEddie:
	generictrainer SAILOR, EDDIE, EVENT_BEAT_SAILOR_EDDIE, SailorEddieSeenText, SailorEddieBeatenText

	text "Hey, let's go for"
	line "a swim!"

	para "Sailors have to"
	line "be able to swim!"
	done

CeruleanGymGuyScript:
	checkevent EVENT_BEAT_MISTY
	iftrue_jumptextfaceplayer CeruleanGymGuyWinText
	jumptextfaceplayer CeruleanGymGuyText

CeruleanGymHiddenMachinePart:
	dw EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	checkevent EVENT_LEARNED_ABOUT_MACHINE_PART
	iffalse_jumptext CeruleanGymSomethingUnderwaterText
	givekeyitem MACHINE_PART
	opentext
	writetext CeruleanGymFoundMachinePartText
	special ShowKeyItemIcon
	playsound SFX_ITEM
	waitsfx
	keyitemnotify
	closetext
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	end

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalsefwd CeruleanGymStatue
	jumptext CeruleanGymNote1

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalsefwd CeruleanGymStatue
	jumptext CeruleanGymNote2

CeruleanGymStatue:
	gettrainername MISTY, 1, STRING_BUFFER_4
	checkflag ENGINE_CASCADEBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

CeruleanGymGruntRunsDownMovement:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

CeruleanGymGruntRunsOutMovement:
	run_step_right
	run_step_down
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step_up
	remove_sliding
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_down
	step_down
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step_up
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "¡Uy! ¡Yo sentirlo"
	line "mucho! Tú no"
	cont "herido, ¿vale?"

	para "Yo estar muy"
	line "ocupado. No tener"
	cont "tiempo de hablar."
	cont "No ser bueno si"
	cont "alguien verme."
	done

CeruleanGymGruntBigMistakeText:
	text "¡Oh, no! ¡Tú ya me"
	line "visto! ¡Cometer"
	cont "gran error!"
	done

CeruleanGymGruntByeText:
	text "¡Eh, tú! Olvidar"
	line "verme, ¿vale?"

	para "Tú no ver, no oír,"
	line "no saber nada,"
	cont "¿vale? ¡Adiós,"
	cont "chico! ¡Nada!"

	para "¡Bye-bye go-go!"
	done

CeruleanGymNote1:
	text "Sorry, I'll be out"
	line "for a while."
	cont "Misty, Gym Leader"
	done

CeruleanGymNote2:
	text "Since Misty's out,"
	line "we'll be away too."
	cont "Gym Trainers"
	done

MistyIntroText:
	text "Misty: ¡Te estaba"
	line "esperando, plasta!"

	para "Tendrás muchas"
	line "Medallas de Johto,"
	cont "pero no deberías"
	cont "subestimarme."

	para "¡Mis #mon de"
	line "tipo Agua son muy"
	cont "duros!"
	done

MistyWinLossText:
	text "Misty: De verdad"
	line "eres bueno…"

	para "Admitiré que"
	line "tienes habilidad…"

	para "Toma. Es la"
	line "Medalla Cascada."
	done

MistyGiveTMText:
	text "Misty: ¡Toma otro"
	line "recuerdo de"
	cont "nuestro combate!"
	done

MistyOutroText:
	text "It contains the"
	line "move Water Pulse."

	para "It can sometimes"
	line "confuse your foe."
	done

MistyFightDoneText:
	text "Misty: ¿Hay tantos"
	line "entrenadores"
	cont "fuertes en Johto?"
	cont "Como tú, digo."

	para "Algún día viajaré"
	line "para combatir con"
	cont "gente experta."
	done

SwimmerfDianaSeenText:
	text "Perdón por haber"
	line "estado fuera."
	cont "¡Vamos allá!"
	done

SwimmerfDianaBeatenText:
	text "¡Me rindo! ¡Tú"
	line "ganas!"
	done

SwimmerfViolaSeenText:
	text "¡Nadar no solo es"
	line "velocidad!"

	para "¡También es pura"
	line "belleza y gracia!"
	done

SwimmerfViolaBeatenText:
	text "He perdido con"
	line "mucha elegancia…"
	done

SwimmerfBrianaSeenText:
	text "No dejes que mi"
	line "elegante nado te"
	cont "ponga nervioso."
	done

SwimmerfBrianaBeatenText:
	text "Huy, me venciste"
	line "tan fácil…"
	done

SailorParkerSeenText:
	text "¡Muy bien! ¡Ven"
	line "a por mí!"
	done

SailorParkerBeatenText:
	text "No puede ser…"
	done

SailorEddieSeenText:
	text "¡Me he relajado"
	line "en la piscina y"
	cont "estoy a tope!"
	done

SailorEddieBeatenText:
	text "No se puede ganar"
	line "solo con fuerza."
	done

CeruleanGymGuyText:
	text "Yo! Champ in"
	line "making!"

	para "Since Misty was"
	line "away, I went out"

	para "for some fun too."
	line "He-he-he."
	done

CeruleanGymGuyWinText:
	text "¡Hoo! Me has"
	line "demostrado lo"
	cont "fuerte que eres."

	para "Como siempre, ¡ha"
	line "sido un combate"
	para "increíble!"
	done

CeruleanGymFoundMachinePartText:
	text "¡<PLAYER> halló"
	line "la PiezaMaquina!"
	done

CeruleanGymSomethingUnderwaterText:
	text "Hay algo bajo el"
	line "agua…"

	para "¿Hablaba de esto"
	line "el Soldado Rocket?"

	para "¿Adónde habrá"
	line "escapado?"
	done
