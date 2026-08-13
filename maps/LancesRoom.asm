LancesRoom_MapScriptHeader:
	def_scene_scripts
	scene_script LancesRoomLockDoorScene, SCENE_LANCESROOM_LOCK_DOOR
	scene_const SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorCallback

	def_warp_events
	warp_event  6, 23, KARENS_ROOM, 3
	warp_event  7, 23, KARENS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  6,  5, SCENE_LANCESROOM_APPROACH_LANCE, ApproachLanceFromLeftTrigger
	coord_event  7,  5, SCENE_LANCESROOM_APPROACH_LANCE, ApproachLanceFromRightTrigger

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceScript, -1
	object_event  6,  7, SPRITE_MARY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  6,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY

	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 22, $26
	refreshmap
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

WalkIntoEliteFourRoomMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

LancesRoomDoorCallback:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalsefwd .LanceEntranceOpen
	changeblock 6, 22, $26
.LanceEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalsefwd .LanceExitClosed
	changeblock 6, 0, $13
.LanceExitClosed:
	endcallback

ApproachLanceFromLeftTrigger:
	special Special_FadeOutMusic
	applymovement PLAYER, ApproachLanceFromLeftMovement
	sjumpfwd LanceScript

ApproachLanceFromRightTrigger:
	special Special_FadeOutMusic
	applymovement PLAYER, ApproachLanceFromRightMovement
LanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	showtext .SeenRematchText
	winlosstext .BeatenText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	setevent EVENT_BEAT_CHAMPION_LANCE
	playsound SFX_ENTER_DOOR
	changeblock 6, 0, $13
	refreshmap
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, .RushInMovement
	showtext .MaryText1
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, .WalkInMovement
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, .StepAsideMovement
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	readvar VAR_BADGES
	ifnotequal 16, .DefaultOakSpeech
	checkevent EVENT_OPENED_MT_SILVER
	iffalsefwd .DefaultOakSpeech
	showtext .OakRematchSpeechText
	sjumpfwd .OakSpeechDone
.DefaultOakSpeech
	showtext .OakSpeechText
.OakSpeechDone
	applymovement LANCESROOM_MARY, .ApproachPlayerMovement
	turnobject PLAYER, LEFT
	showtext .MaryText2
	applymovement LANCESROOM_LANCE, .WalkTowardExitMovement
	turnobject PLAYER, UP
	showtext .LanceLeavingText
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applyonemovement LANCESROOM_LANCE, step_up
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applyonemovement PLAYER, step_up
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, .TryToFollowMovement
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext .MaryText3
	pause 30
	closetext
	applymovement LANCESROOM_MARY, .RunBackAndForthMovement
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

.SeenText:
	text "Lance: Te estaba"
	line "esperando."

	para "¡<PLAYER>!"

	para "Sabía que tú,"
	line "con tus dotes,"

	para "llegarías hasta"
	line "mí algún día."

	para "No hay necesidad"
	line "de hablar más."

	para "Lucharemos para"
	line "determinar quién"

	para "es el más fuerte"
	line "de los dos."

	para "Como el Entrena-"
	line "dor más fuerte"
	cont "y Campeón de la"

	para "Liga #mon..."

	para "Yo, Lance, el ma-"
	line "estro dragón,"
	cont "¡acepto tu reto!"
	done

.BeatenText:
	text "...Se acabó."

	para "Pero es una sen-"
	line "sación extraña."

	para "No me enfada ha-"
	line "ber perdido."
	cont "De hecho, estoy"
	cont "contento."

	para "¡Contento de"
	line "presenciar el as-"

	para "censo de un gran"
	line "y nuevo Campeón!"
	done

.AfterText:
	text "...Uf."

	para "Te has vuelto"
	line "realmente fuerte,"
	cont "<PLAYER>."

	para "Tus #mon han"
	line "respondido a tu"

	para "naturaleza fuerte"
	line "y honesta."

	para "Como Entrenador,"
	line "seguirás"

	para "haciéndote fuerte"
	line "con tus #mon."
	done

.SeenRematchText:
	text "Lance: No hay ne-"
	line "cesidad de ha-"
	cont "blar más."

	para "Lucharemos para"
	line "determinar quién"

	para "es el más fuerte"
	line "de los dos."

	para "Yo, Lance, el ma-"
	line "estro dragón,"
	cont "¡acepto tu reto!"
	done

.AfterRematchText:
	text "Tal y como lo"
	line "esperaba."

	para "Tú y tus #mon"
	line "hacéis un gran"
	cont "equipo."

	para "Como Entrenador,"
	line "seguirás"

	para "haciéndote fuerte"
	line "con tus #mon."
	done

.MaryText1:
	text "Rosa: ¡Oh, no!"
	line "¡Ya terminó!"

	para "Prof. Oak, si no"
	line "fuera tan lento..."
	done

.OakSpeechText:
	text "Prof. Oak: ¡Ah,"
	line "<PLAYER>!"

	para "Ha pasado un"
	line "tiempo."

	para "Desde luego, te"
	line "ves impresionante."

	para "¡Tu victoria en"
	line "la Liga es sen-"
	cont "cillamente genial!"

	para "Tu dedicación,"
	line "confianza y amor"

	para "por los #mon"
	line "lo hicieron posi-"
	cont "ble."

	para "Tus #mon tam-"
	line "bién estuvieron"
	cont "espectaculares."

	para "Como creían en ti"
	line "como Entrenador,"

	para "perseveraron."

	para "¡Felicidades,"
	line "<PLAYER>!"
	done

.OakRematchSpeechText:
	text "Prof. Oak: ¡Ah,"
	line "<PLAYER>!"

	para "¡Tu revancha con"
	line "la Liga fue"
	cont "fabulosa!"

	para "Me queda claro"
	line "que comprendes,"

	para "confías y amas a"
	line "los #mon pro-"
	cont "fundamente."

	para "Las grandiosas ha-"
	line "bilidades de tu"
	cont "equipo lo mues-"
	cont "tran."

	para "Creo que podrías"
	line "ser capaz de"

	para "enfrentarte a un"
	line "desafío peligroso."

	para "¡Ven a verme al"
	line "Laboratorio lue-"
	cont "go!"
	done

.MaryText2:
	text "Rosa: ¡Entrevis-"
	line "temos al flamante"
	cont "nuevo Campeón!"
	done

.LanceLeavingText:
	text "Lance: Esto se"
	line "está poniendo un"
	cont "poco ruidoso..."

	para "<PLAYER>, ¿puedes"
	line "venir conmigo?"
	done

.MaryText3:
	text "Rosa: ¡Oh, espe-"
	line "rad! ¡No hemos"
	cont "hecho la entre-"
	cont "vista!"
	done

.RushInMovement:
	run_step_up
	run_step_up
	run_step_up
	turn_head_down
	step_end

.WalkInMovement:
	step_up
	step_up
	step_end

.StepAsideMovement:
	step_left
	turn_head_right
	step_end

.ApproachPlayerMovement:
	run_step_up
	turn_head_right
	step_end

.WalkTowardExitMovement:
	step_up
	step_left
	turn_head_down
	step_end

.TryToFollowMovement:
	step_up
	step_right
	turn_head_up
	step_end

.RunBackAndForthMovement:
	run_step_right
	run_step_right
	run_step_left
	run_step_left
	run_step_left
	run_step_right
	run_step_right
	run_step_right
	run_step_left
	run_step_left
	turn_head_up
	step_end

ApproachLanceFromLeftMovement:
	step_up
	step_up
	turn_head_right
	step_end

ApproachLanceFromRightMovement:
	step_up
	step_left
	step_up
	turn_head_right
	step_end
