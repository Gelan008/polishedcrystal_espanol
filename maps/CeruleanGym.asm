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

	text "Contiene"
	line "Hidropulso."

	para "A veces puede"
	line "confundir al"
	cont "rival."
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

	text "Misty ha mejorado"
	line "mucho en estos"
	cont "últimos años."

	para "¡No te descuides o"
	line "serás aplastado!"
	done

GenericTrainerSailorEddie:
	generictrainer SAILOR, EDDIE, EVENT_BEAT_SAILOR_EDDIE, SailorEddieSeenText, SailorEddieBeatenText

	text "¡Oye, vamos a"
	line "nadar!"

	para "¡Los marineros han"
	line "de saber nadar!"
	done

CeruleanGymGuyScript:
	checkevent EVENT_BEAT_MISTY
	iftrue_jumptextfaceplayer CeruleanGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Campeón en"
	line "ciernes!"

	para "Como Misty no"
	line "estaba, salí a"
	cont "divertirme!"
	cont "Je, je, je."
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

	text "Si Misty no está,"
	line "nosotros tampoco."
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
