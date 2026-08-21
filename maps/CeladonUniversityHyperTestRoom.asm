CeladonUniversityHyperTestRoom_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_2F, 4
	warp_event  3, 11, CELADON_UNIVERSITY_2F, 4

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CeladonUniversityHyperTestRoomMagikarpSign
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityHyperTestRoomBookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityHyperTestRoomBookshelf2Text
	bg_event  7,  4, BGEVENT_RIGHT, CeladonUniversityHyperTestRoomComputer
	bg_event  7,  6, BGEVENT_RIGHT, CeladonUniversityHyperTestRoomComputer

	def_object_events
	object_event  4,  2, SPRITE_WESTWOOD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityHyperTestRoomWestwoodScript, -1
	object_event  6,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomScientistText, -1
	object_event  1,  6, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomTwin1Text, -1
	object_event  1,  8, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityHyperTestRoomTwin2Text, -1

CeladonUniversityHyperTestRoomWestwoodScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_DRAGON_RAGE_MAGIKARP
	iftrue_jumpopenedtext .TestOverText
	checkevent EVENT_PASSED_CELADON_HYPER_TEST
	iftruefwd .GiveMagikarp
	writetext .GreetingText
	waitbutton
	checkevent EVENT_LISTENED_TO_WESTWOOD_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_WESTWOOD_INTRO
.HeardIntro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	checkflag ENGINE_TOOK_HYPER_TEST
	iftrue_jumpopenedtext .AlreadyTookText
	setflag ENGINE_TOOK_HYPER_TEST
	writetext .BeginText
	waitbutton

	writetext .Question1IntroText
	waitbutton
	closetext
	reanchormap
	trainerpic SILHOUETTE
	waitbutton
	closepokepic
	opentext
	writetext .Question1QuestionText
	loadmenu .Question1MenuData
	verticalmenu
	closewindow
	ifnotequal $2, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question2IntroText
	waitbutton
	closetext
	cry SLOWKING
	waitsfx
	opentext
	writetext .Question2QuestionText
	loadmenu .Question2MenuData
	verticalmenu
	closewindow
	ifnotequal $3, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question3IntroText
	waitbutton
	writetext .Question3QuestionText
	loadmenu .Question3MenuData
	verticalmenu
	closewindow
	ifnotequal $4, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question4IntroText
	waitbutton
	writetext .Question4QuestionText
	loadmenu .Question4MenuData
	verticalmenu
	closewindow
	ifnotequal $1, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question5IntroText
	waitbutton
	writetext .Question5QuestionText
	loadmenu .Question5MenuData
	verticalmenu
	closewindow
	ifnotequal $3, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	writetext .Question6IntroText
	waitbutton
	writetext .Question6QuestionText
	loadmenu .Question6MenuData
	verticalmenu
	closewindow
	ifnotequal $4, .WrongAnswer
	waitsfx
	playsound SFX_ELEVATOR_END
	writetext .CorrectText
	promptbutton

	setevent EVENT_PASSED_CELADON_HYPER_TEST
.GiveMagikarp:
	writetext .CongratulationsText
	waitbutton

	givepoke MAGIKARP, MAGIKARP_MASK1_FORM, 10, EVIOLITE, ULTRA_BALL, DRAGON_RAGE
	iffalse_jumpopenedtext .PartyAndBoxFullText
	setevent EVENT_GOT_DRAGON_RAGE_MAGIKARP
	jumpopenedtext .TestOverText

.WrongAnswer:
	waitsfx
	playsound SFX_WRONG
	jumpopenedtext .WrongAnswerText

.GreetingText:
	text "¿Prof. Westwood?"
	line "Ese soy yo."
	done

.IntroText:
	text "¡Un investigador"
	line "extraordinario!"

	para "Mis hallazgos no"
	line "tienen igual."

	para "Sin duda ganaré"
	line "una condecoración"
	cont "dentro de poco…"
	done

.QuestionText:
	text "Ejem. ¿Qué"
	line "decías?"

	para "¿Vienes a hacer el"
	line "Test Extremo de la"
	cont "Univ. de Azulona?"
	done

.BeginText:
	text "¡Excelente!"

	para "El Test Extremo"
	line "tiene 6 preguntas,"
	cont "¡probamos tus"
	cont "sentidos bajo"
	cont "presión!"

	para "Si apruebas,"
	line "¡tendrás un premio"
	cont "digno de esta"
	cont "universidad!"
	done

.CorrectText:
	text "¡Correcto!"
	done

.Question1IntroText:
	text "Pregunta 1:"
	line "¡Mira de cerca!"
	done

.Question1QuestionText:
	text "¿De qué #mon es"
	line "esta silueta?"
	done

.Question2IntroText:
	text "Pregunta 2:"
	line "¡Escucha bien!"
	done

.Question2QuestionText:
	text "¿De qué #mon es"
	line "este grito?"
	done

.Question3IntroText:
	text "Pregunta 3:"
	done

.Question3QuestionText:
	text "¿Qué medicina"
	line "sabe amarga?"
	done

.Question4IntroText:
	text "Pregunta 4:"
	done

.Question4QuestionText:
	text "¿Qué #mon tiene"
	line "Piel Seca?"
	done

.Question5IntroText:
	text "Pregunta 5:"
	done

.Question5QuestionText:
	text "¿Qué Baya"
	line "huele azul?"
	done

.Question6IntroText:
	text "Pregunta 6:"
	line "¡Piensa con"
	cont "sabiduría!"
	done

.Question6QuestionText:
	text "¿Quién es el"
	line "profesor más"
	cont "premiado?"
	done

.CongratulationsText:
	text "¡Felicidades!"

	para "¡Has pasado el"
	line "Test Extremo con"
	cont "gran éxito!"

	para "Aquí tienes tu"
	line "premio:"

	para "¡Un Magikarp con"
	line "el movimiento"
	cont "Furia Dragón!"
	done

.TestOverText:
	text "Nuestros alumnos"
	line "tienen el tesón de"
	cont "un Magikarp que"
	cont "lucha por crecer."

	para "¡Y tú también!"
	done

.PartyAndBoxFullText:
	text "¡Oh no! Tu equipo"
	line "y Cajas están"
	cont "llenos…"
	done

.RefusedText:
	text "Bueno, si estás"
	line "seguro."
	done

.AlreadyTookText:
	text "¡Pero ya hiciste"
	line "el test hoy!"

	para "Podrás probar de"
	line "nuevo mañana."
	done

.WrongAnswerText:
	text "I'm sorry, that's"
	line "incorrect!"

	para "You may try and"
	line "retake the Hyper"
	cont "Test tomorrow."
	done

.Question1MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 11, 11
	dw .Question1MenuData2
	db 1 ; default option

.Question1MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Umbreon@"
	db "Glaceon@"
	db "Persian@"
	db "Girafarig@"

.Question2MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 10, 11
	dw .Question2MenuData2
	db 1 ; default option

.Question2MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Blissey@"
	db "Qwilfish@"
	db "Slowking@"
	db "Venomoth@"

.Question3MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 13, 11
	dw .Question3MenuData2
	db 1 ; default option

.Question3MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Elixir@"
	db "Calcio@"
	db "Antídoto@"
	db "Polvo Curac.@"

.Question4MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 12, 11
	dw .Question4MenuData2
	db 1 ; default option

.Question4MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Parasect@"
	db "Magmar@"
	db "Sandslash@"
	db "Victreebel@"

.Question5MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 13, 11
	dw .Question5MenuData2
	db 1 ; default option

.Question5MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Baya Zreza@"
	db "Baya Ziuela@"
	db "Baya Aranja@"
	db "Baya Meloc@"

.Question6MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 1, 15, 11
	dw .Question6MenuData2
	db 1 ; default option

.Question6MenuData2:
	db $81 ; flags
	db 4 ; items
	db "Prof.Oak@"
	db "Prof.Elm@"
	db "Prof.Willow@"
	db "Prof.Westwood@"

CeladonUniversityHyperTestRoomScientistText:
	text "El Test Extremo es"
	line "un gran rito de"
	cont "iniciación para"
	cont "los graduados de"
	cont "esta universidad."

	para "¡Pone a prueba"
	line "tus facultades!"
	done

CeladonUniversityHyperTestRoomTwin1Text:
	text "¡Pasaré el Test"
	line "Extremo antes que"
	cont "tú!"
	done

CeladonUniversityHyperTestRoomTwin2Text:
	text "¡No, yo pasaré el"
	line "Test Extremo antes"
	cont "que tú!"
	done

CeladonUniversityHyperTestRoomMagikarpSign:
	reanchormap
	pokepic MAGIKARP, MAGIKARP_MASK1_FORM
	cry MAGIKARP
	waitbutton
	closepokepic
	jumpthistext

	text "A Magikarp is"
	line "swimming around."
	done

CeladonUniversityHyperTestRoomBookshelf1Text:
	text "Este libro tiene"
	line "un marcapáginas."

	para "¡Alguien aún no ha"
	line "terminado con él!"
	done

CeladonUniversityHyperTestRoomBookshelf2Text:
	text "¡Es una copia de"
	line "Nintendo Acción!"

	para "La portada tiene"
	line "un gran Pikachu."
	done

CeladonUniversityHyperTestRoomComputer:
	jumpthistext

	text "Hay un archivo en"
	line "el escritorio"
	cont "llamado"
	cont "preguntas.txt."

	para "¡Mejor no hagas"
	line "trampas!"
	done
