DragonShrine_MapScriptHeader:
	def_scene_scripts
	scene_script DragonShrineTakeTestScene, SCENE_DRAGONSHRINE_TAKE_TEST
	scene_const SCENE_DRAGONSHRINE_NOOP

	def_callbacks

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DragonShrineElder2Text, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DragonShrineElder3Text, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_CLAIR

DragonShrineTakeTestScene:
	sdefer DragonShrineTestScript
	end

DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applyonemovement DRAGONSHRINE_ELDER1, slow_step_down
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .RightAnswer
	ifequalfwd $2, .WrongAnswer
	ifequalfwd $3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .RightAnswer
	ifequalfwd $2, .RightAnswer
	ifequalfwd $3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .WrongAnswer
	ifequalfwd $2, .RightAnswer
	ifequalfwd $3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .RightAnswer
	ifequalfwd $2, .WrongAnswer
	ifequalfwd $3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .WrongAnswer
	ifequalfwd $2, .WrongAnswer
	ifequalfwd $3, .RightAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftruefwd .PassedTheTest
	writetext DragonShrineRightAnswerText
	promptbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	showtext DragonShrineWrongAnswerText1
	turnobject DRAGONSHRINE_ELDER1, DOWN
	showtext DragonShrineWrongAnswerText2
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	showtext DragonShrineClairYouPassedText
	special Special_FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	showtext DragonShrineClairThatCantBeText
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	showtext DragonShrineClairYoureLyingText
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	showtext DragonShrineMustIInformLanceText
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	showtext DragonShrineIUnderstandText
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	givebadge RISINGBADGE, JOHTO_REGION
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_DRAGONSHRINE_NOOP
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	showtext DragonShrineElderScoldsClairText
	showtext DragonShrineSpeechlessText
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer DragonShrineComeAgainText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue_jumptextfaceplayer DragonShrineSymbolicDragonText
	checkevent EVENT_GOT_DRATINI
	iffalsefwd .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue_jumptextfaceplayer DragonShrineSilverIsInTrainingText
	jumpthistextfaceplayer

	text "Parece que Débora"
	line "ha aprendido una"

	para "valiosa lección de"
	line "ti."

	para "Te lo agradezco"
	line "como su abuelo que"
	cont "soy."
	done

.GiveDratini:
	faceplayer
	opentext
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	iftruefwd .NoExtremeSpeed
	givepoke DRATINI, PLAIN_FORM, 15, SITRUS_BERRY, ULTRA_BALL, EXTREMESPEED
	sjumpfwd .FinishElderScript
.NoExtremeSpeed
	givepoke DRATINI, PLAIN_FORM, 15, SITRUS_BERRY, ULTRA_BALL
.FinishElderScript
	iffalse_jumpopenedtext DragonShrinePartyAndBoxFullText
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	jumpopenedtext DragonShrineSymbolicDragonText

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 8, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Aliado@"
	db "Subordinado@"
	db "Amigo@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 9, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Estrategia@"
	db "Entrenamiento@"
	db "Trampas@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 5, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Débil@"
	db "Fuerte@"
	db "Cualquiera@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 8, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Amor@"
	db "Violencia@"
	db "Conocimiento@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 11, 4, 19, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Fuertes@"
	db "Débiles@"
	db "Ambos@"

DragonShrinePlayerWalkInMovement:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step_left
	slow_step_left
	slow_step_left
	turn_head_down
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step_right
	slow_step_right
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step_right
	turn_head_down
	step_end

DragonShrineClairWalkInMovement:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	run_step_left
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step_left
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step_right
	slow_step_right
	step_end

DragonShrineClairWalkOutMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

DragonShrineElderGreetingText:
	text "Hm... Me alegro de"
	line "verte aquí."

	para "No hace falta"
	line "que expliques"
	cont "a qué vienes."

	para "Te envió Débora,"
	line "¿verdad?"

	para "Esa chica es un"
	line "caso..."

	para "Lo siento, pero"
	line "tengo que ponerte"
	cont "a prueba."

	para "No te preocupes,"
	line "solo tienes que"
	cont "contestar algunas"
	cont "preguntas."

	para "¿Listo?"
	done

DragonShrineQuestion1Text:
	text "¿Qué son los #"
	line "mon para ti?"
	done

DragonShrineQuestion2Text:
	text "¿Qué te ayuda"
	line "a ganar combates?"
	done

DragonShrineQuestion3Text:
	text "¿Contra qué tipo"
	line "de entrenador pre-"
	cont "fieres combatir?"
	done

DragonShrineQuestion4Text:
	text "¿Qué es lo más"
	line "importante para"
	cont "criar #mon?"
	done

DragonShrineQuestion5Text:
	text "#mon fuertes."
	line "#mon débiles."

	para "¿Cuáles son más"
	line "importantes?"
	done

DragonShrinePassedTestText:
	text "Hm... Ya veo..."

	para "Te preocupas mucho"
	line "por los #mon."

	para "Muy loable."

	para "¡Esa convicción es"
	line "lo importante!"

	para "<PLAYER>, no pier-"
	line "das esa fe."

	para "Te ayudará"
	line "en la Liga"
	cont "#mon."
	done

DragonShrineMustIInformLanceText:
	text "¡Débora!"

	para "¡Este niño es im-"
	line "pecable, en habi-"
	cont "lidad y espíritu!"

	para "¡Admite la derrota"
	line "y entrégale la"
	cont "Medalla Dragón!"

	para "... ¿O tendré que"
	line "informar a Lance"
	cont "de esto?"
	done

DragonShrineElderScoldsClairText:
	text "Débora..."

	para "Reflexiona sobre"
	line "qué es lo que te"

	para "falta a ti y a"
	line "este niño le so-"
	cont "bra."
	done

DragonShrineComeAgainText:
	text "Vuelve a venir,"
	line "si lo deseas."
	done

DragonShrineTakeThisDratiniText:
	text "Hm... Me alegro de"
	line "verte aquí."

	para "Tu llegada es de"
	line "lo más afortunada."

	para "Tengo algo para"
	line "ti."

	para "Toma este Dratini"
	line "como prueba de que"

	para "he reconocido"
	line "tu valía."
	done

DragonShrinePartyAndBoxFullText:
	text "¿Hm? Tu equipo y"
	line "Caja están llenos."
	done

DragonShrineSymbolicDragonText:
	text "Los #mon Dragón"
	line "son el símbolo de"
	cont "nuestro clan."

	para "Has demostrado"
	line "que se te puede"

	para "confiar uno."
	done


DragonShrineSilverIsInTrainingText:
	text "Un chico de tu"
	line "edad está entre-"
	cont "nando aquí."

	para "Se parece mucho a"
	line "Débora cuando era"

	para "joven. Es un po-"
	line "co preocupante..."
	done

DragonShrineWrongAnswerText1:
	text "¿Eh? No lo he co-"
	line "gido del todo..."
	done

DragonShrineWrongAnswerText2:
	text "¿Qué habías"
	line "dicho?"
	done

DragonShrineRightAnswerText:
	text "Oh, lo entiendo..."
	done

DragonShrineElder2Text:
	text "Ha pasado mucho"
	line "tiempo desde que"

	para "un entrenador lo-"
	line "gra la rara apro-"
	cont "bación de nues-"
	cont "tro Maestro."

	para "De hecho, nadie"
	line "desde el Maestro"
	cont "Lance."
	done

DragonShrineElder3Text:
	text "¿Conoces al joven"
	line "Maestro Lance?"

	para "Se parece tanto a"
	line "nuestro Maestro en"
	cont "su juventud."

	para "Lo llevan en"
	line "la sangre."
	done

DragonShrineClairYouPassedText:
	text "¿Y cómo ha ido?"

	para "Supongo que no"
	line "tiene sentido"
	cont "preguntar."

	para "¿Has suspendido?"

	para "................"

	para "... ¿Qué? ¿Has"
	line "aprobado?"
	done

DragonShrineClairThatCantBeText:
	text "¡No puede ser!"
	done

DragonShrineClairYoureLyingText:
	text "¡Mientes!"

	para "¡Ni siquiera yo"
	line "he sido aprobada!"
	done

DragonShrineIUnderstandText:
	text "L-lo entiendo..."
	done

DragonShrineHereRisingBadgeText:
	text "Toma, esta es la"
	line "Medalla Dragón..."

	para "¡Date prisa!"
	line "¡Cógela!"
	done

DragonShrineRisingBadgeExplanationText:
	text "La Medalla Dragón"
	line "permitirá a tus"

	para "#mon usar el"
	line "movimiento para"
	cont "subir cascadas."

	para "Además, todos los"
	line "#mon te reco-"

	para "nocerán como en-"
	line "trenador y obe-"

	para "decerán tus"
	line "órdenes sin"
	cont "preguntar."
	done

DragonShrineSpeechlessText: ; text > text
	text "………………………………"
	done
