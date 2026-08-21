LancesRoom_MapScriptHeader:
	def_scene_scripts
	scene_script LancesRoomEntranceTrigger

	def_callbacks
	callback MAPCALLBACK_TILES, LancesRoomDoorCallback

	def_warp_events
	warp_event  6, 23, KARENS_ROOM, 3
	warp_event  7, 23, KARENS_ROOM, 4
	warp_event  6,  1, HALL_OF_FAME, 1
	warp_event  7,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  6,  5, 1, ApproachLanceFromLeftTrigger
	coord_event  7,  5, 1, ApproachLanceFromRightTrigger

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceScript, -1
	object_event  6,  7, SPRITE_MARY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  6,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY

	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoomEntranceTrigger:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 22, $34
	refreshmap
	closetext
	setscene $1
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
	changeblock 6, 22, $34
.LanceEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalsefwd .LanceExitClosed
	changeblock 6, 0, $b
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
	changeblock 6, 0, $b
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
	line "esperando,"
	cont "¡<PLAYER>!"

	para "Sabía que con tu"
	line "gran talento"
	cont "llegarías a mí."

	para "Sobran ya las"
	line "palabras."

	para "¡Lucharemos para"
	line "ver quién es el"
	cont "más fuerte!"

	para "Como Campeón de la"
	line "Liga #mon…"

	para "¡Yo, Lance, el"
	line "maestro dragón,"
	cont "acepto tu reto!"
	done

.BeatenText:
	text "…Se acabó."

	para "Qué sensación más"
	line "extraña."

	para "No me duele haber"
	line "perdido. De hecho,"
	cont "¡estoy contento!"

	para "¡Feliz de ver el"
	line "nacimiento de un"
	cont "nuevo Campeón!"
	done

.AfterText:
	text "…Uf."

	para "Te has hecho muy"
	line "fuerte, <PLAYER>."

	para "Tus #mon han"
	line "respondido a tu"
	cont "noble corazón."

	para "Como entrenador,"
	line "seguirás creciendo"
	cont "junto a ellos."
	done

.SeenRematchText:
	text "Lance: No hace"
	line "falta hablar más."

	para "¡Lucharemos para"
	line "ver quién es el"
	cont "más fuerte!"

	para "¡Yo, Lance, el"
	line "maestro dragón,"
	cont "acepto tu reto!"
	done

.AfterRematchText:
	text "Tal y como lo"
	line "esperaba."

	para "Tú y tus #mon"
	line "hacéis un gran"
	cont "equipo."

	para "Como entrenador,"
	line "seguirás creciendo"
	cont "junto a ellos."
	done

.MaryText1:
	text "Rosa: ¡Oh, no!"
	line "¡Ya terminó!"

	para "Prof. Oak, si no"
	line "fuera tan lento…"
	done

.OakSpeechText:
	text "Prof. Oak: ¡Ah,"
	line "<PLAYER>!"

	para "¡Cuánto tiempo!"
	line "Te ves genial."

	para "¡Tu victoria en la"
	line "Liga es soberbia!"

	para "Tu dedicación y"
	line "cariño hacia los"
	cont "#mon lo han"
	cont "hecho posible."

	para "Y tus #mon han"
	line "estado sublimes."

	para "Confiaban en ti"
	line "y lo dieron todo."

	para "¡Felicidades,"
	line "<PLAYER>!"
	done

.OakRematchSpeechText:
	text "Prof. Oak: ¡Ah,"
	line "<PLAYER>!"

	para "¡Tu revancha en la"
	line "Liga fue genial!"

	para "Se nota que amas"
	line "y confías en tus"
	cont "#mon con locura"

	para "El poder de tu"
	line "equipo lo muestra."

	para "Creo que ya eres"
	line "capaz de afrontar"
	cont "un gran desafío."

	para "¡Ven a verme luego"
	line "al Laboratorio!"
	done

.MaryText2:
	text "Rosa: ¡Hagamos una"
	line "entrevista al gran"
	cont "Campeón!"
	done

.LanceLeavingText:
	text "Lance: Esto se"
	line "está poniendo un"
	cont "poco ruidoso…"

	para "<PLAYER>, ¿puedes"
	line "venir conmigo?"
	done

.MaryText3:
	text "Rosa: ¡Esperad!"
	line "¡Falta hacer la"
	cont "entrevista!"
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
