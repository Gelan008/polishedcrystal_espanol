Route29_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE29_NOOP
	scene_const SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29Tuscany

	def_warp_events
	warp_event 27,  1, ROUTE_29_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 51,  7, BGEVENT_JUMPTEXT, Route29Sign1Text
	bg_event  3,  5, BGEVENT_JUMPTEXT, Route29Sign2Text
	bg_event 23,  4, BGEVENT_JUMPTEXT, Route29AdvancedTipsSignText

	def_object_events
	object_event 50, 12, SPRITE_LYRA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_29
	object_event 29, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 27, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29YoungsterText, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29TeacherText, -1
	cuttree_event 30,  9, EVENT_ROUTE_29_CUT_TREE_1
	cuttree_event 21, 11, EVENT_ROUTE_29_CUT_TREE_2
	fruittree_event 12,  2, FRUITTREE_ROUTE_29, ORAN_BERRY, PAL_NPC_BLUE
	object_event 25,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route29FisherText, -1
	object_event 13,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	itemball_event 48,  2, POTION, 1, EVENT_ROUTE_29_POTION

	object_const_def
	const ROUTE29_LYRA
	const ROUTE29_TUSCANY

Route29Tuscany:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalsefwd .TuscanyDisappears
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .TuscanyAppears
.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.TuscanyAppears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE29_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE29_LYRA, 15
	special Special_FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	pause 15
	applymovement ROUTE29_LYRA, LyraMovementData1a
	turnobject PLAYER, LEFT
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalsefwd Route29RefusedTutorial
	closetext
	follow ROUTE29_LYRA, PLAYER
	applymovement ROUTE29_LYRA, LyraMovementData1b
	sjumpfwd Route29TutorialScript

Route29Tutorial2:
	turnobject ROUTE29_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE29_LYRA, 15
	special Special_FadeOutMusic
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	pause 15
	applymovement ROUTE29_LYRA, LyraMovementData2a
	turnobject PLAYER, LEFT
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalsefwd Route29RefusedTutorial
	closetext
	follow ROUTE29_LYRA, PLAYER
	applymovement ROUTE29_LYRA, LyraMovementData2b
Route29TutorialScript:
	stopfollow
	loadwildmon PIDGEY, 5
	catchtutorial BATTLETYPE_TUTORIAL
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	turnobject ROUTE29_LYRA, UP
	opentext
	writetext CatchingTutorialDebriefText
Route29FinishTutorial:
	promptbutton
	verbosegiveitem POKE_BALL, 5
	writetext CatchingTutorialGoodbyeText
	waitbutton
	closetext
	applymovement ROUTE29_LYRA, LyraMovementData3
	disappear ROUTE29_LYRA
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	playmusic MUSIC_ROUTE_29
	end

Route29RefusedTutorial:
	setevent EVENT_NEVER_LEARNED_TO_CATCH_POKEMON
	writetext CatchingTutorialRefusedText
	sjump Route29FinishTutorial

Route29CooltrainerMScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer Text_WaitingForMorning
	jumpthistextfaceplayer

	text "Espero un #mon"
	line "que solo sale"
	cont "por la tarde o"
	cont "por la noche."
	done

TuscanyScript:
	checkevent EVENT_GOT_SILK_SCARF_FROM_TUSCANY
	iftrue_jumptextfaceplayer TuscanyTuesdayText
	faceplayer
	opentext
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftruefwd .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem SILK_SCARF
	iffalse_endtext
	setevent EVENT_GOT_SILK_SCARF_FROM_TUSCANY
	jumpthisopenedtext

	text "Marta: ¿Verdad"
	line "que es de lo más"
	cont "elegante?"

	para "Mejora ataques de"
	line "tipo Normal."

	para "Seguro que te"
	line "será muy útil."
	done

TuscanyNotTuesdayScript:
	jumpthisopenedtext

	text "Marta: Hoy no es"
	line "martes. Qué mala"
	cont "suerte…"
	done

LyraMovementData1a:
	step_up
LyraMovementData2a:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_end

LyraMovementData1b:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

LyraMovementData2b:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_end

LyraMovementData3:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

CatchingTutorialIntroText:
	text "Lira: ¡<PLAYER>!"

	para "¡Puedes atrapar"
	line "#mon salvajes"
	cont "con las # Ball!"

	para "¡Sígueme y te"
	line "enseño cómo!"
	done

CatchingTutorialDebriefText:
	text "Lira: ¿Ves? ¡Es"
	line "así de fácil!"

	para "Si los debilitas"
	line "antes, será más"
	cont "fácil atraparlos."

	para "Toma, quédate con"
	line "esto. ¡Suerte!"
	done

CatchingTutorialRefusedText:
	text "Vaya… Quería"
	line "presumir de cómo"
	cont "atrapo #mon…"

	para "En fin, quédate"
	line "con esto."
	cont "¡Mucha suerte!"
	done

CatchingTutorialGoodbyeText:
	text "Lira: ¡Nos vemos!"
	done

Route29YoungsterText:
	text "Ey. ¿Cómo van tus"
	line "#mon?"

	para "Si están débiles"
	line "para combatir, no"
	cont "vayas a la hierba."
	done

Route29TeacherText:
	text "¿Ves el desnivel?"
	line "Da algo de miedo"
	cont "saltar por ahí."

	para "Pero puedes volver"
	line "a Primavera sin"
	cont "pisar la hierba."
	done

Route29FisherText:
	text "Iba a descansar,"
	line "así que guardé mi"
	cont "partida."
	done


Text_WaitingForMorning:
	text "Estoy esperando un"
	line "#mon que solo"
	cont "aparecen por la"
	cont "mañana."
	done

MeetTuscanyText:
	text "Marta: Si no me"
	line "equivoco, ¿es la"
	cont "primera vez que"
	cont "nos vemos?"

	para "Permíteme que me"
	line "presente."

	para "Soy Marta, la del"
	line "martes."
	done

TuscanyGivesGiftText:
	text "Para darme a"
	line "conocer, acepta"
	cont "este Pañuelo Seda."
	done


TuscanyTuesdayText:
	text "Marta: ¿Conoces a"
	line "Lune, mi hermana"
	cont "mayor?"

	para "¿O a mi hermano"
	line "pequeño, Merlín?"

	para "Soy la segunda de"
	line "siete hermanos."
	done


Route29Sign1Text:
	text "Ruta 29"

	para "Pueblo Primavera -"
	line "Ciudad Cerezo"
	done

Route29Sign2Text:
	text "Ruta 29"

	para "Ciudad Cerezo -"
	line "Pueblo Primavera"
	done

Route29AdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡Pulsa Abajo+B en"
	line "la pantalla del"
	cont "título para"
	cont "cambiar la hora!"

	para "¡Pulsa Izq.+B para"
	line "reiniciar todas"
	cont "las opciones!"
	done