TeamRocketBaseB3F_MapScriptHeader:
	def_scene_scripts
	scene_script TeamRocketBaseB3FLanceGetsPasswordScene, SCENE_TEAMROCKETBASEB3F_LANCE_GETS_PASSWORD
	scene_const SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_const SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_const SCENE_TEAMROCKETBASEB3F_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, TeamRocketBaseB3FCheckGiovanniDoor

	def_warp_events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	def_coord_events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	def_bg_events
	bg_event 10,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, BossDoor
	bg_event 10,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 11,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 12,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event 13,  1, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  4, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  5, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  6, 13, BGEVENT_JUMPSTD, teamrocketoath
	bg_event  7, 13, BGEVENT_JUMPSTD, teamrocketoath

	def_object_events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_PETREL
	object_event  7,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MURKROW, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerRocketScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRocketScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TeamRocketBaseB3FRocketText, EVENT_TEAM_ROCKET_BASE_POPULATION
	itemball_event  1, 12, PROTEIN, 1, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	itemball_event  3, 12, X_SP_DEF, 1, EVENT_TEAM_ROCKET_BASE_B3F_X_SP_DEF
	itemball_event 28,  9, FULL_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	itemball_event 17,  2, ICE_HEAL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	itemball_event 14, 10, ULTRA_BALL, 1, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL

	object_const_def
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_PETREL
	const TEAMROCKETBASEB3F_MURKROW
	const TEAMROCKETBASEB3F_RIVAL

TeamRocketBaseB3FLanceGetsPasswordScene:
	sdefer LanceGetPasswordScript
	end

TeamRocketBaseB3FCheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftruefwd .OpenSesame
	endcallback

.OpenSesame:
	changeblock 10, 8, $0d
	endcallback

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MURKROW, RIGHT
	pause 20
	applyonemovement TEAMROCKETBASEB3F_LANCE, step_right
	showtext LanceGetPasswordText
	applymovement TEAMROCKETBASEB3F_LANCE, RocketBaseLanceLeavesMovement
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	appear TEAMROCKETBASEB3F_RIVAL
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext RocketBaseRivalText
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_RIVAL, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_RIVAL
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

RocketBaseBossLeft:
	applymovement PLAYER, RocketBasePlayerApproachesBossLeftMovement
	sjumpfwd RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, RocketBasePlayerApproachesBossRightMovement
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_PETREL, 15
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_PETREL, DOWN
	showtext ExecutiveM4BeforeText
	applyonemovement TEAMROCKETBASEB3F_PETREL, step_down
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_PETREL
	loadtrainer PETREL, PETREL2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PETREL_2
	showtext ExecutiveM4AfterText
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossHitsTableMovement
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_PETREL, RocketBaseBossLeavesMovement
	disappear TEAMROCKETBASEB3F_PETREL
	setscene SCENE_TEAMROCKETBASEB3F_NOOP
	end

RocketBaseMurkrow:
	showtext RocketBaseMurkrowText
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, 5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	showtext GruntF5AfterBattleText
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, 28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	showtext GruntM28AfterBattleText
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

GenericTrainerRocketScientistRoss:
	generictrainer ROCKET_SCIENTIST, ROSS, EVENT_BEAT_ROCKET_SCIENTIST_ROSS, RocketScientistRossSeenText, RocketScientistRossBeatenText

	text "Una señal de radio"
	line "que vuelve locos a"
	cont "los #mon…"

	para "Mi experimento ha"
	line "sido un gran"
	cont "éxito."

	para "Mi ascenso está"
	line "asegurado. ¡Esta"
	cont "derrota no cuenta!"
	done

GenericTrainerRocketScientistMitch:
	generictrainer ROCKET_SCIENTIST, MITCH, EVENT_BEAT_ROCKET_SCIENTIST_MITCH, RocketScientistMitchSeenText, RocketScientistMitchBeatenText

	text "Si aumentamos la"
	line "potencia para"
	cont "emitir a todo el"
	cont "país…"

	para "¡La sola idea ya"
	line "me emociona!"
	done

BossDoor:
	dw EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalsefwd .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalsefwd .NeedsPassword
	sjumpfwd .OpenSesame

.NeedsPassword:
	jumpthisopenedtext

	text "La puerta está"
	line "cerrada…"

	para "Se necesitan dos"
	line "contraseñas para"
	cont "abrirla."
	done

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $0d
	refreshmap
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

RocketBaseLanceLeavesMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

RocketBasePlayerApproachesBossLeftMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBasePlayerApproachesBossRightMovement:
	step_up
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_up
	step_end

RocketBaseBossHitsTableMovement:
	run_step_right
	run_step_right
	step_end

RocketBaseBossLeavesMovement:
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	slow_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	step_end

RocketBaseRivalEnterMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end

RocketBaseRivalLeaveMovement:
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "Lance: Hacen falta"
	line "dos contraseñas"
	cont "para el despacho"
	cont "del jefe."

	para "Solo unos pocos"
	line "Rocket las saben."

	para "Aquel de ahí me lo"
	line "dicho con mucha"
	cont "amabilidad."

	para "¡<PLAYER>, vamos a"
	line "por las claves!"
	done

TeamRocketBaseB3FRocketText:
	text "Urrggh… ¡El de la"
	line "capa es demasiado"
	cont "fuerte…"
	done

RocketBaseRivalText:
	text "…"

	para "¿No te dije que"
	line "iba a destruir al"
	cont "Team Rocket?"

	para "…Dime, ¿quién era"
	line "ese de la capa con"
	cont "#mon dragón?"

	para "Mis #mon no"
	line "pudieron hacer"
	cont "nada contra él."

	para "No me importa"
	line "haber perdido."

	para "Le ganaré con"
	line "#mon más"
	cont "fuertes."

	para "Lo que me fastidia"
	line "es lo que me ha"
	cont "dicho…"

	para "Dice que no quiero"
	line "ni confío bastante"
	cont "en mis #mon."

	para "¡Me da rabia haber"
	line "perdido ante un"
	cont "blandengue!"

	para "…¡Bah! ¡No tengo"
	line "tiempo que perder"
	cont "con gente como tú!"
	done

ExecutiveM4BeforeText:
	text "¿Qué? ¿Quién eres?"
	line "¡Este despacho es"
	cont "de nuestro líder"
	cont "Giovanni!"

	para "Desde que disolvió"
	line "el Team Rocket"
	cont "hace tres años,"
	cont "ha estado fuera."

	para "¡Pero sabemos que"
	line "volverá a tomar el"
	cont "mando algún día!"

	para "Por eso montamos"
	line "guardia aquí."

	para "¡No permitiré que"
	line "nadie altere este"
	cont "lugar!"
	done

ExecutiveM4BeatenText:
	text "No… No he podido"
	line "hacer nada…"

	para "Giovanni, por"
	line "favor, perdóname…"
	done

ExecutiveM4AfterText:
	text "No puedo dejar que"
	line "esto me afecte."

	para "Tengo que avisar a"
	line "los demás…"
	done

RocketBaseMurkrowText:
	text "Murkrow: La clave"
	line "es…"

	para "¡Viva Giovanni!"
	done

GruntF5SeenText:
	text "¿Que si sé la"
	line "contraseña?"

	para "Tal vez."

	para "¡Pero un enclenque"
	line "no la conseguirá!"
	done

GruntF5BeatenText:
	text "Vale, ya está."
	line "Te la diré."
	done

GruntF5AfterBattleText:
	text "La contraseña del"
	line "despacho del jefe"

	para "es Cola Slowpoke."

	para "Pero no sirve de"
	line "nada si no tienes"
	cont "las dos."
	done

GruntM28SeenText:
	text "¡Ji, ji, ji!"

	para "¿Me desafías a un"
	line "combate?"

	para "¡Ja! Estás loco,"
	line "¡pero con agallas!"

	para "¡Eso me gusta!"

	para "¡Si me ganas, te"
	line "diré una clave del"
	cont "despacho del jefe!"
	done

GruntM28BeatenText:
	text "¡Ji, ji, ji!"
	line "¡Eres bueno!"
	done

GruntM28AfterBattleText:
	text "¡Ji, ji, ji!"

	para "La contraseña para"
	line "el despacho…"

	para "Mmm…, creo que es"
	line "Cola Raticate."
	done

RocketScientistRossSeenText:
	text "Estuve en Silph,"
	line "pero ahora dirijo"
	cont "el proyecto del"
	cont "Team Rocket."

	para "Un entrometido"
	line "como tú merece un"
	cont "buen castigo."
	done

RocketScientistRossBeatenText:
	text "Un mero error me"
	line "ha costado caro…"
	done

RocketScientistMitchSeenText:
	text "Me da igual que"
	line "los #mon sufran"
	cont "por culpa del"
	cont "experimento."
	done

RocketScientistMitchBeatenText:
	text "Lo mío es pensar,"
	line "no combatir."
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "La puerta está"
	line "cerrada…"

	para "<PLAYER> introdujo"
	line "las dos claves."

	para "¡La puerta se ha"
	line "abierto!"
	done
