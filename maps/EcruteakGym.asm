EcruteakGym_MapScriptHeader:
	def_scene_scripts
	scene_script EcruteakGymTrigger0

	def_callbacks

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  2, 13, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1

	object_const_def
	const ECRUTEAKGYM_GRAMPS

EcruteakGymTrigger0:
	sdefer EcruteakGymClosed
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftruefwd .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	givebadge FOGBADGE, JOHTO_REGION
	setmapscene ECRUTEAK_HOUSE, $1
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue_jumpopenedtext MortyFightDoneText
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegivetmhm TM_SHADOW_BALL
	setevent EVENT_GOT_TM30_SHADOW_BALL
	jumpopenedtext MortyText_ShadowBallSpeech

EcruteakGymClosed:
	applyonemovement PLAYER, step_up
	applyonemovement ECRUTEAKGYM_GRAMPS, slow_step_down
	showtext EcruteakGymClosedText
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

GenericTrainerSageJeffrey:
	generictrainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText

	text "Where did #mon"
	line "come from?"
	done

GenericTrainerSagePing:
	generictrainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText

	text "We use only Ghost-"
	line "type #mon."

	para "No Normal-type"
	line "attack can harm"
	cont "them!"
	done

GenericTrainerMediumMartha:
	generictrainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText

	text "The one who wants"
	line "to win most--will!"
	done

GenericTrainerMediumGrace:
	generictrainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText

	text "Fine. I shall tell"
	line "you the secret of"

	para "the invisible"
	line "floor."

	para "The path is right"
	line "before our eyes!"
	done

EcruteakGymGuyScript:
	checkevent EVENT_BEAT_MORTY
	iftrue_jumptextfaceplayer EcruteakGymGuyWinText
	jumptextfaceplayer EcruteakGymGuyText

EcruteakGymStatue:
	gettrainername MORTY, 1, STRING_BUFFER_4
	checkflag ENGINE_FOGBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 11, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

MortyIntroText:
	text "Me alegro de que"
	line "hayas venido."

	para "Aquí en Iris los"
	line "#mon han sido"
	cont "muy venerados."

	para "Dicen que un"
	line "#mon del iris"
	cont "descenderá ante"
	cont "un entrenador"
	cont "muy poderoso."

	para "Creí esa leyenda"
	line "y he entrenado en"
	cont "secreto aquí toda"
	cont "mi vida."

	para "Ahora puedo ver lo"
	line "que otros no ven."

	para "¡Solo un poco más"
	line "y podré ver el"
	cont "futuro donde me"
	cont "encuentro con él!"

	para "¡Tú me ayudarás a"
	line "alcanzarlo!"
	done

MortyWinLossText:
	text "Aún no soy lo"
	line "bastante bueno…"

	para "De acuerdo. Esta"
	line "Medalla es tuya."
	done

MortyText_FogBadgeSpeech:
	text "Con la Medalla"
	line "Niebla, los"
	cont "#mon hasta <LV>50"
	cont "te obedecerán."

	para "Además, podrás"
	line "usar Surf fuera"
	cont "de combate."

	para "Toma, quiero que"
	line "tengas esto."
	done

MortyText_ShadowBallSpeech:
	text "It's Shadow Ball."
	line "It causes damage"

	para "and may reduce"
	line "Special Defense."

	para "Use it if it"
	line "appeals to you."
	done

MortyFightDoneText:
	text "Ya veo…"

	para "Tu viaje te ha"
	line "llevado a lugares"
	cont "muy lejanos."

	para "Has presenciado"
	line "mucho más que yo."

	para "Te envidio por"
	line "eso…"
	done

SageJeffreySeenText:
	text "Pasé primavera,"
	line "verano, otoño e"
	cont "invierno con mis"
	cont "#mon."

	para "Llevamos juntos"
	line "mucho tiempo."
	done

SageJeffreyBeatenText:
	text "He vivido triunfos"
	line "y derrotas."
	done

SagePingSeenText:
	text "¿Puedes infligir"
	line "algún daño a"
	cont "nuestros #mon?"
	done

SagePingBeatenText:
	text "¡Ah! ¡Bien hecho!"
	done

MediumMarthaSeenText:
	text "¡Yo ganaré!"
	done

MediumMarthaBeatenText:
	text "¡Y-yo perdí!"
	done

MediumGraceSeenText:
	text "¿Atrapado por"
	line "nuestro suelo"
	cont "invisible?"

	para "¡Derrótame si"
	line "quieres una pista!"
	done

MediumGraceBeatenText:
	text "¿Q-qué?"
	done

EcruteakGymGuyText:
	text "The trainers here"
	line "have secret mo-"
	cont "tives."

	para "If you win, they"
	line "may tell you some"

	para "deep secrets about"
	line "Ecruteak."
	done

EcruteakGymGuyWinText:
	text "¡Uff, <PLAYER>!"
	line "¡Estuviste genial!"

	para "¡Yo temblaba de"
	line "miedo en una"
	cont "esquina!"
	done

EcruteakGymClosedText:
	text "Morti, el Líder"
	line "del Gimnasio,"
	cont "está ausente."

	para "Lo siento, pero"
	line "tendrás que"
	cont "irte."

	para "Jo, jo, jo, jo."
	done
