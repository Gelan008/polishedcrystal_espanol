BellchimeTrail_MapScriptHeader:
	def_scene_scripts
	scene_script BellchimeTrailStepDownScene, SCENE_BELLCHIMETRAIL_STEP_DOWN
	scene_const SCENE_BELLCHIMETRAIL_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SetupValerieMorningWalkCallback

	def_warp_events
	warp_event  4,  4, WISE_TRIOS_ROOM, 1
	warp_event  4,  5, WISE_TRIOS_ROOM, 2
	warp_event 21,  9, TIN_TOWER_1F, 1 ; hole
	warp_event 12,  4, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 21,  9, SCENE_BELLCHIMETRAIL_NOOP, BellchimeTrailPanUpTrigger

	def_bg_events
	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText
	bg_event 12,  3, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_BELLCHIME_TRAIL
	bg_event 13,  3, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_BELLCHIME_TRAIL

	def_object_events
	object_event 16,  6, SPRITE_VALERIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimeTrailValerieScript, EVENT_VALERIE_BELLCHIME_TRAIL

	object_const_def
	const BELLCHIMETRAIL_VALERIE

BellchimeTrailStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_XCOORD
	ifnotequal 21, .Done
	readvar VAR_YCOORD
	ifnotequal 9, .Done
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_BELLCHIMETRAIL_NOOP
	end

SetupValerieMorningWalkCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalsefwd .Disappear
	checkevent EVENT_BEAT_VALERIE
	iffalsefwd .Appear
	checkflag ENGINE_VALERIE_MORNING_WALK
	iftruefwd .Disappear
	checktime 1 << MORN
	iffalsefwd .Disappear
.Appear:
	appear BELLCHIMETRAIL_VALERIE
	endcallback

.Disappear:
	disappear BELLCHIMETRAIL_VALERIE
	endcallback

BellchimeTrailPanUpTrigger:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, .PanUpMovement
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_BELLCHIMETRAIL_STEP_DOWN
	warpfacing UP, TIN_TOWER_1F, 7, 15
	end

.PanUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

TinTowerSignText:
	text "Torre Campana"

	para "Se dice que aquí"
	line "anida un #mon"
	cont "legendario."
	done

BellchimeTrailValerieScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_VALERIE
	iftruefwd .Rematch
	checkevent EVENT_LISTENED_TO_VALERIE
	iftruefwd .Listened
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_VALERIE
.Listened:
	writetext .BattleText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .AcceptedText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BELLCHIMETRAIL_VALERIE
	loadtrainer VALERIE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_VALERIE
	opentext
	writetext .RewardText
	promptbutton
	verbosegivetmhm TM_DAZZLINGLEAM
	setevent EVENT_GOT_TM49_DAZZLINGLEAM_FROM_VALERIE
	writetext .FarewellText
.Depart
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal RIGHT, .SkipGoAround
	applymovement BELLCHIMETRAIL_VALERIE, .ValerieGoesAroundMovement
.SkipGoAround
	applymovement BELLCHIMETRAIL_VALERIE, .ValerieDepartsMovement
	disappear BELLCHIMETRAIL_VALERIE
	clearevent EVENT_VALERIE_ECRUTEAK_CITY
	setflag ENGINE_VALERIE_MORNING_WALK
	end

.Rematch:
	writetext .RematchText
	waitbutton
	closetext
	winlosstext .RematchBeatenText, 0
	setlasttalked BELLCHIMETRAIL_VALERIE
	readvar VAR_BADGES
	ifequalfwd 16, .Battle3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Battle2
	loadtrainer VALERIE, 1
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle2:
	loadtrainer VALERIE, 2
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle3:
	loadtrainer VALERIE, 3
	startbattle
	reloadmapafterbattle
	; fallthrough

.AfterRematch:
	opentext
	writetext .RematchFarewellText
	sjump .Depart

.IntroText:
	text "Vaya, si es el"
	line "entrenador que se"
	cont "enfrentó a Suicune."

	para "Soy Valeria."
	line "Vengo a este"

	para "sendero para"
	line "cautivarme con su"
	cont "belleza."

	para "Hoy tuve la suerte"
	line "suficiente para"

	para "presenciar tu com-"
	line "bate contra una"
	cont "leyenda..."

	para "Me encantaría"
	line "luchar contra"

	para "alguien que llamó"
	line "la atención de un"
	cont "#mon legendario."
	done

.BattleText:
	text "Valeria: Entreno"
	line "el escurridizo"
	cont "tipo Hada."

	para "Parecen frágiles y"
	line "delicados, pero"
	cont "son fuertes."

	para "¿Lucharás"
	line "conmigo?"
	done

.RefusedText:
	text "Valeria: Qué pena..."
	done

.AcceptedText:
	text "Valeria: Espero"
	line "que nuestro com-"

	para "bate te resulte"
	line "entretenido."
	done

.BeatenText:
	text "Espero que mañana"
	line "brille el sol..."

	para "Esa sería razón"
	line "suficiente para"
	cont "sonreír."
	done

.RewardText:
	text "Valeria: Sí... fue"
	line "un buen combate."

	para "Te recompensaré"
	line "por esta gran"
	cont "victoria."

	para "Por favor, tómalo"
	line "como un regalo"
	cont "personal mío."
	done

.FarewellText:
	text "Valeria: ¿Oh? Va-"
	line "ya, qué sensación"
	cont "más curiosa..."

	para "No consigo"
	line "recordar qué movi-"

	para "miento contiene"
	line "esa MT."

	para "Espero que me"
	line "perdones."

	para "Ese fue de verdad"
	line "un combate"
	cont "cautivador."

	para "Puede que me ha-"
	line "yas cautivado."

	para "Hasta que volvamos"
	line "a vernos, adiós."
	done

.RematchText:
	text "Valeria: Oh, si no"
	line "es mi joven"
	cont "entrenador..."

	para "Es un placer"
	line "volver a verte"
	cont "de esta manera."

	para "Entonces supongo"
	line "que te has"

	para "ganado el derecho"
	line "a combatir."

	para "Las escurridizas"
	line "Hadas pueden pa-"

	para "recer frágiles"
	line "como la brisa y"

	para "delicadas como una"
	line "flor, pero son"
	cont "fuertes."
	done

.RematchBeatenText:
	text "Espero que en-"
	line "cuentres cosas"

	para "por las que son-"
	line "reír mañana..."
	done

.RematchFarewellText:
	text "Ese fue de verdad"
	line "un combate"
	cont "cautivador."

	para "Puede que me ha-"
	line "yas cautivado."

	para "Hasta que volvamos"
	line "a vernos, adiós."
	done

.ValerieGoesAroundMovement:
	step_down
	step_left
	step_end

.ValerieDepartsMovement:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_left
	step_left
	step_end
