CeruleanGym_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_CERULEANGYM_NOOP
	scene_script CeruleanGymGruntRunsOutScene, SCENE_CERULEANGYM_GRUNT_RUNS_OUT

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

CeruleanGymGruntRunsOutScene:
	sdefer .Script
	end

.Script:
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
	setscene SCENE_CERULEANGYM_NOOP
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOOP
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
	jumpthisopenedtext

	text "Contiene el movi-"
	line "miento Hidropulso."

	para "A veces puede con-"
	line "fundir al rival."
	done

GenericTrainerSwimmerfDiana:
	generictrainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText

	text "Estaré nadando en"
	line "silencio."
	done

GenericTrainerSwimmerfViola:
	generictrainer SWIMMERF, VIOLA, EVENT_BEAT_SWIMMERF_VIOLA, SwimmerfViolaSeenText, SwimmerfViolaBeatenText

	text "¡Nadar es bueno"
	line "para la belleza"
	cont "y la salud!"

	para "Mira a Misty, ya"
	line "lo verás."
	done

GenericTrainerSwimmerfBriana:
	generictrainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText

	text "No te confíes por"
	line "haberme ganado."

	para "Misty te destruirá"
	line "si te descuidas."
	done

GenericTrainerSailorParker:
	generictrainer SAILOR, PARKER, EVENT_BEAT_SAILOR_PARKER, SailorParkerSeenText, SailorParkerBeatenText

	text "Misty ha mejora-"
	line "do mucho estos"
	cont "últimos años."

	para "¡No bajes la"
	line "guardia o serás"
	cont "aplastado!"
	done

GenericTrainerSailorEddie:
	generictrainer SAILOR, EDDIE, EVENT_BEAT_SAILOR_EDDIE, SailorEddieSeenText, SailorEddieBeatenText

	text "¡Oye, vamos a"
	line "nadar!"

	para "¡Los marineros ti-"
	line "nen que saber na-"
	cont "dar!"
	done

CeruleanGymGuyScript:
	checkevent EVENT_BEAT_MISTY
	iftrue_jumptextfaceplayer CeruleanGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Campeón en"
	line "ciernes!"

	para "Como Misty no es-"
	line "taba, también sa-"

	para "lí a divertirme."
	line "Je, je, je."
	done

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
	jumpthistext

	text "Perdón, estaré"
	line "fuera un rato."
	cont "Misty, Líder Gim"
	done

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalsefwd CeruleanGymStatue
	jumpthistext

	text "Como Misty no es-"
	line "tá, nosotros tam-"
	cont "poco."
	cont "Entrenadores Gim."
	done

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
	line "mucho! Tú no he-"
	cont "rido, ¿vale?"

	para "Yo estar muy ocu-"
	line "pado. No tener"
	cont "tiempo de hablar."
	cont "No ser bueno pa-"
	cont "ra mí si alguien"
	cont "verme."
	done

CeruleanGymGruntBigMistakeText:
	text "¡Oh, no! ¡Tú ya me"
	line "visto! ¡Cometer"
	cont "gran error!"
	done

CeruleanGymGruntByeText:
	text "¡Eh, tú! Olvidar"
	line "verme, ¿vale?"

	para "Tú ver, oír, sa-"
	line "ber nada,"

	para "¿vale? ¡Chao,"
	line "chico! ¡Nada!"

	para "¡Bye-bye go-go!"
	done



MistyIntroText:
	text "Misty: ¡Te estaba"
	line "esperando, plas-"
	cont "ta!"

	para "Puedes tener mu-"
	line "chas Medallas de"

	para "Gimnasio de Johto,"
	line "pero no deberías"
	cont "subestimarme."

	para "¡Mis #mon de"
	line "tipo Agua son"
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
	text "Misty: Aquí tie-"
	line "nes otro recuer-"
	cont "do del combate."

	para "¡Tómalo!"
	done


MistyFightDoneText:
	text "Misty: ¿Hay mu-"
	line "chos entrenadores"
	cont "fuertes en Johto?"
	cont "Como tú, digo."

	para "Algún día viaja-"
	line "ré para poder"

	para "combatir con en-"
	line "trenadores ex-"
	cont "pertos."
	done

SwimmerfDianaSeenText:
	text "Siento haber es-"
	line "tado fuera. ¡Va-"
	cont "mos allá!"
	done

SwimmerfDianaBeatenText:
	text "¡Me rindo! ¡Tú"
	line "ganas!"
	done

SwimmerfViolaSeenText:
	text "¡La natación no es"
	line "solo velocidad!"

	para "¡También es bel-"
	line "leza y gracia!"
	done

SwimmerfViolaBeatenText:
	text "He perdido be-"
	line "llamente…"
	done

SwimmerfBrianaSeenText:
	text "No dejes que mi"
	line "elegante nado te"
	cont "ponga nervioso."
	done

SwimmerfBrianaBeatenText:
	text "Huy, te has de-"
	line "shecho de mí tan"
	cont "tranquilamente…"
	done

SailorParkerSeenText:
	text "¡Muy bien!"
	line "¡A por mí!"
	done

SailorParkerBeatenText:
	text "No puede ser…"
	done

SailorEddieSeenText:
	text "Me he estado re-"
	line "lajando en la"
	cont "piscina, ¡así que"
	cont "estoy a tope!"
	done

SailorEddieBeatenText:
	text "No se puede ganar"
	line "solo con fuerza."
	done


CeruleanGymGuyWinText:
	text "Hoo, me has demos-"
	line "trado lo duro que"
	cont "eres."

	para "Como siempre, ¡has"
	line "librado un com-"
	cont "bate alucinante!"
	done

CeruleanGymFoundMachinePartText:
	text "¡<PLAYER> encon-"
	line "tró Maquinaria!"
	done

CeruleanGymSomethingUnderwaterText:
	text "Hay algo bajo el"
	line "agua…"

	para "¿Puede que el Sol-"
	line "dado Rocket ha-"
	cont "ble?"

	para "¿Adónde habrá hui-"
	line "do?"
	done
