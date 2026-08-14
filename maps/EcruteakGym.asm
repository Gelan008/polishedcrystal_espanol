EcruteakGym_MapScriptHeader:
	def_scene_scripts
	scene_script EcruteakGymForcedToLeaveScene, SCENE_ECRUTEAKGYM_FORCED_TO_LEAVE
	scene_const SCENE_ECRUTEAKGYM_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 21, ECRUTEAK_CITY, 10
	warp_event  5, 21, ECRUTEAK_CITY, 10
	warp_event  4, 18, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  6,  4, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  5,  7, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  3,  8, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  7,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  6, 10, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 11, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  6, 12, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  2, 13, ECRUTEAK_GYM, 3
	warp_event  2, 14, ECRUTEAK_GYM, 3
	warp_event  3, 14, ECRUTEAK_GYM, 3
	warp_event  4, 14, ECRUTEAK_GYM, 3
	warp_event  5, 14, ECRUTEAK_GYM, 3
	warp_event  7, 14, ECRUTEAK_GYM, 3
	warp_event  5, 15, ECRUTEAK_GYM, 3
	warp_event  7, 15, ECRUTEAK_GYM, 3
	warp_event  2, 16, ECRUTEAK_GYM, 3
	warp_event  3, 16, ECRUTEAK_GYM, 3
	warp_event  4, 16, ECRUTEAK_GYM, 3
	warp_event  5, 16, ECRUTEAK_GYM, 3
	warp_event  7, 16, ECRUTEAK_GYM, 3
	warp_event  2, 17, ECRUTEAK_GYM, 3
	warp_event  7, 17, ECRUTEAK_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  3, 19, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 19, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  4, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageJeffrey, -1
	object_event  3, 17, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumMartha, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerMediumGrace, -1
	object_event  7, 19, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1

	object_const_def
	const ECRUTEAKGYM_GRAMPS

EcruteakGymForcedToLeaveScene:
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
	setmapscene ECRUTEAK_HOUSE, SCENE_ECRUTEAKHOUSE_NOOP
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
	jumpthisopenedtext

	text "Es Bola Sombra."
	line "Causa daño y puede"

	para "reducir la Defensa"
	line "Especial."

	para "Úsala si te parece"
	line "atractiva."
	done

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

	text "¿De dónde vienen"
	line "los #mon?"
	done

GenericTrainerSagePing:
	generictrainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText

	text "Solo usamos #"
	line "mon tipo Fantasma."

	para "¡Ningún ataque ti-"
	line "po Normal puede"
	cont "dañarlos!"
	done

GenericTrainerMediumMartha:
	generictrainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText

	text "¡Quien más quiera"
	line "ganar, lo hará!"
	done

GenericTrainerMediumGrace:
	generictrainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText

	text "Bien. Te contaré"
	line "el secreto del"

	para "suelo invisible."

	para "¡El camino está"
	line "justo delante de"
	cont "nuestros ojos!"
	done

EcruteakGymGuyScript:
	checkevent EVENT_BEAT_MORTY
	iftrue_jumptextfaceplayer EcruteakGymGuyWinText
	jumpthistextfaceplayer

	text "Los entrenadores"
	line "de aquí tienen mo-"
	cont "tivos secretos."

	para "Si ganas, puede"
	line "que te cuenten a-"
	cont "lgún profundo se-"

	para "creto sobre Iris."
	done

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

	para "Aquí, en Iris, los"
	line "#mon han sido"
	cont "venerados."

	para "Se dice que un"
	line "#mon de colores"

	para "del arcoíris ba-"
	line "jará para apare-"
	cont "cerse"

	para "ante un entrenador"
	line "verdaderamente"
	cont "poderoso."

	para "Me creí esa"
	line "historia, así que"

	para "he entrenado en"
	line "secreto aquí to-"
	cont "da mi vida."

	para "Como resultado,"
	line "ahora puedo ver lo"
	cont "que otros no pue-"
	cont "den."

	para "Solo un poco"
	line "más..."

	para "Con un poco"
	line "más, podría ver"

	para "un futuro en el"
	line "que me encuentro"
	cont "con el #mon de"
	cont "colores del"
	cont "arcoíris."

	para "¡Tú me vas a ayu-"
	line "dar a alcanzar ese"
	cont "nivel!"
	done

MortyWinLossText:
	text "Aún no soy lo bas-"
	line "tante bueno..."

	para "De acuerdo. Esta"
	line "Medalla es tuya."
	done

MortyText_FogBadgeSpeech:
	text "Con la Medalla"
	line "Niebla, los"
	cont "#mon de"

	para "hasta <LV>50 te"
	line "obedecerán."

	para "Además, los"
	line "#mon que"
	cont "sepan Surf"

	para "podrán usarlo en"
	line "cualquier momento."

	para "Toma, también"
	line "quiero que"
	cont "tengas esto."
	done


MortyFightDoneText:
	text "Ya veo..."

	para "Tu viaje te ha"
	line "llevado a lugares"
	cont "muy lejanos."

	para "Y has sido testi-"
	line "go de mucho más"
	cont "que yo."

	para "Te envidio por"
	line "eso..."
	done

SageJeffreySeenText:
	text "Pasé la primavera"
	line "con mis #mon."

	para "Luego el verano,"
	line "otoño e in-"
	cont "vierno..."

	para "Y volvió la"
	line "primavera. Hemos"

	para "vivido juntos"
	line "mucho tiempo."
	done

SageJeffreyBeatenText:
	text "Victorias y de-"
	line "rrotas, experimen-"
	cont "té ambas."
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


EcruteakGymGuyWinText:
	text "Uff, <PLAYER>."
	line "¡Lo hiciste"
	cont "genial!"

	para "¡Yo estaba enco-"
	line "gido en la esqui-"
	cont "na por puro"
	cont "terror!"
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
