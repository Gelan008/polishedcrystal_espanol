MountMoon1F_MapScriptHeader:
	def_scene_scripts
	scene_script MountMoon1FRivalBattleScene, SCENE_MOUNTMOON1F_RIVAL_BATTLE
	scene_const SCENE_MOUNTMOON1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 11, 23, ROUTE_3, 1
	warp_event 22, 12, MOUNT_MOON_B1F, 1
	warp_event 11,  9, MOUNT_MOON_B1F, 2
	warp_event  4,  4, MOUNT_MOON_B1F, 3

	def_coord_events

	def_bg_events
	bg_event  2, 17, BGEVENT_ITEM + RARE_CANDY, EVENT_MOUNT_MOON_1F_HIDDEN_RARE_CANDY
	bg_event 12, 16, BGEVENT_ITEM + FULL_RESTORE, EVENT_MOUNT_MOON_1F_HIDDEN_FULL_RESTORE

	def_object_events
	object_event 10, 19, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event  4, 18, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBugManiacKenta, -1
	object_event 11, 14, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassMiriam, -1
	object_event 20, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSuperNerdJovan, -1
	object_event 27, 14, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBugManiacRobby, -1
	object_event 20,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassIris, -1
	object_event  5,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerMarcos, -1
	itemball_event  3,  2, REVIVE, 1, EVENT_MOUNT_MOON_1F_REVIVE
	itemball_event  2, 20, X_ACCURACY, 1, EVENT_MOUNT_MOON_1F_X_ACCURACY
	itemball_event 16, 22, CALCIUM, 1, EVENT_MOUNT_MOON_1F_CALCIUM

	object_const_def
	const MOUNTMOON1F_RIVAL

MountMoon1FRivalBattleScene:
	sdefer .RivalBattle
	end

.RivalBattle:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementBefore
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext MountMoonRivalTextBefore
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishBattle

.Totodile:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .FinishBattle

.Chikorita:
	winlosstext MountMoonRivalTextWin, MountMoonRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.FinishBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext MountMoonRivalTextAfter
	applymovement PLAYER, MountMoon1FPlayerMovement
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementAfter
	disappear MOUNTMOON1F_RIVAL
	playsound SFX_EXIT_BUILDING
	waitsfx
	setscene SCENE_MOUNTMOON1F_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

GenericTrainerBugManiacKenta:
	generictrainer BUG_MANIAC, KENTA, EVENT_BEAT_BUG_MANIAC_KENTA, BugManiacKentaSeenText, BugManiacKentaBeatenText

	text "El Team Rocket"
	line "solía rondar por"
	cont "aquí."

	para "¿Tendrá algo que"
	line "ver con ellos ese"
	cont "chico pelirrojo?"
	done

GenericTrainerLassMiriam:
	generictrainer LASS, MIRIAM, EVENT_BEAT_LASS_MIRIAM, LassMiriamSeenText, LassMiriamBeatenText

	text "El Mt. Moon es"
	line "grande, pero te"
	cont "acostumbrarás."
	done

GenericTrainerSuperNerdJovan:
	generictrainer SUPER_NERD, JOVAN, EVENT_BEAT_SUPER_NERD_JOVAN, SuperNerdJovanSeenText, SuperNerdJovanBeatenText

	text "Aún no he hallado"
	line "a #mon fuertes."

	para "¿Dónde podrán"
	line "estar?"
	done

GenericTrainerBugManiacRobby:
	generictrainer BUG_MANIAC, ROBBY, EVENT_BEAT_BUG_MANIAC_ROBBY, BugManiacRobbySeenText, BugManiacRobbyBeatenText

	text "Antes solo cazaba"
	line "#mon bicho por"
	cont "afición, pero hoy"
	cont "son mi orgullo."
	done

GenericTrainerLassIris:
	generictrainer LASS, IRIS, EVENT_BEAT_LASS_IRIS, LassIrisSeenText, LassIrisBeatenText

	text "Vengo a diario a"
	line "atrapar algún"
	cont "Clefairy, pero"
	cont "no vi ni uno…"
	done

GenericTrainerHikerMarcos:
	generictrainer HIKER, MARCOS, EVENT_BEAT_HIKER_MARCOS, HikerMarcosSeenText, HikerMarcosBeatenText

	text "Hace mucho tiempo,"
	line "un crío como tú me"
	cont "derrotó."
	done

MountMoon1FRivalMovementBefore:
	step_down
	step_down
	step_down
	step_down
	turn_head_right
	step_end

MountMoon1FPlayerMovement:
	slow_step_up
	turn_head_down
	step_end

MountMoon1FRivalMovementAfter:
	step_right
	turn_head_down
	step_end

MountMoonRivalTextBefore:
	text "…… …… ……"

	para "Cuánto tiempo,"
	line "<PLAYER>."

	para "…Desde que perdí"
	line "contra ti, he"
	cont "pensado qué nos"
	cont "faltaba a mis"
	cont "#mon y a mí…"

	para "Y ya hemos dado"
	line "con la respuesta."

	para "¡<PLAYER>, ahora"
	line "lo verás!"
	done

MountMoonRivalTextWin:
	text "…… …… ……"

	para "Creí haber hecho a"
	line "mis #mon los"
	cont "mejores…"

	para "…Pero aun así no"
	line "ha bastado…"
	done

MountMoonRivalTextAfter:
	text "…… …… ……"

	para "…Has ganado de"
	line "forma justa."

	para "Lo admito. Pero"
	line "esto no acaba"
	cont "aquí."

	para "Tras entrenar más"
	line "en la Guarida"
	cont "Dragón…"

	para "¡Seré el mejor"
	line "entrenador #mon"
	cont "de la historia!"
	cont "Porque ellos están"
	cont "conmigo."

	para "…Escucha, <PLAYER>."

	para "Uno de estos días"
	line "te venceré para"
	cont "demostrar lo bueno"
	cont "que soy."
	done

MountMoonRivalTextLoss:
	text "…… …… ……"

	para "He saldado mi"
	line "deuda contigo."

	para "Con mis #mon,"
	line "venceré al Campeón"

	para "y seré el mejor"
	line "entrenador del"
	cont "mundo."
	done

BugManiacKentaSeenText:
	text "He visto a un"
	line "chico pelirrojo"
	cont "entrenando aquí."

	para "¿Has luchado"
	line "contra él?"
	done

BugManiacKentaBeatenText:
	text "¡Me has pillado!"
	done

LassMiriamSeenText:
	text "De pequeña,"
	line "siempre me perdía"
	cont "por este lugar."
	done

LassMiriamBeatenText:
	text "¡Oh! ¡He perdido!"
	done

SuperNerdJovanSeenText:
	text "¡Qué! ¡No me des"
	line "esos sustos!"
	done

SuperNerdJovanBeatenText:
	text "¡Mis #mon no"
	line "dan la talla!"
	done

BugManiacRobbySeenText:
	text "Debes cruzar esta"
	line "cueva para llegar"
	cont "a Ciudad Celeste."
	done

BugManiacRobbyBeatenText:
	text "He perdido…"
	done

LassIrisSeenText:
	text "¿Has visto algún"
	line "Clefairy?"

	para "¡Son tan monos!"
	done

LassIrisBeatenText:
	text "Ha sido visto y"
	line "no visto…"
	done

HikerMarcosSeenText:
	text "Los críos no"
	line "deberían andar por"
	cont "aquí a oscuras."
	done

HikerMarcosBeatenText:
	text "¡Uau! ¡Qué fuerte"
	line "eres!"
	done
