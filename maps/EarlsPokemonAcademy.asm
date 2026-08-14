EarlsPokemonAcademy_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PokemonJournalWalkerScript
	bg_event  1,  1, BGEVENT_READ, PokemonJournalWalkerScript
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event  4,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
	object_event  2,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EarlsPokemonAcademyYoungster1Text, -1
	object_event  4,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EarlsPokemonAcademyYoungster2Text, -1
	object_event  3, 11, SPRITE_GAMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1

	object_const_def
	const EARLSPOKEMONACADEMY_EARL

AcademyEarl:
	givekeyitem TYPE_CHART ; failsafe in case Violet City Earl is gone already in a save
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalsefwd .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse_jumpopenedtext AcademyEarlNoMoreToTeachText
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse_jumpopenedtext AcademyEarlNoMoreToTeachText
	jumpthisopenedtext

	text "¡Bien! ¡Enseñar-"
	line "te, yo haré!"

	para "Si #mon salen"
	line "en combate aunque"

	para "sea un momento,"
	line "algo de Exp."
	cont "reciben."

	para "Al inicio de la"
	line "lista pon #mon"
	cont "débil."

	para "¡En combate cam-"
	line "biar rápido!"

	para "¡Así, #mon dé-"
	line "bil, fuerte se"
	cont "hace!"
	done

EarlsPokemonAcademyGameboyKid1Script:
	showtextfaceplayer EarlsPokemonAcademyGameboyKid1Text
	turnobject LAST_TALKED, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	showtextfaceplayer EarlsPokemonAcademyGameboyKid2Text
	turnobject LAST_TALKED, DOWN
	end

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .MenuHeader
	_2dmenu
	closewindow
	ifequalfwd $1, .Poison
	ifequalfwd $2, .Paralysis
	ifequalfwd $3, .Sleep
	ifequalfwd $4, .Burn
	ifequalfwd $5, .Freeze
	endtext

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 11, 8
	dw .Data
	db 1 ; default option

.Data:
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "Env@"
	db "Par@"
	db "Dor@"
	db "Que@"
	db "Con@"
	db "Salir@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText1
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText2
	yesorno
	iffalsefwd .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	endtext

PokemonJournalWalkerScript:
	setflag ENGINE_READ_WALKER_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje sobre"
	line "el ExLíder Wayne!"

	para "El padre de Pega-"
	line "so, Wayne, se ru-"

	para "morea que deam-"
	line "bula por Johto"
	cont "como vagabundo."
	done

AcademyEarlSpinMovement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

AcademyEarlIntroText:
	text "¡Earl, yo soy!"

	para "Maravillosos son"
	line "los #mon, ¡sí!"

	para "¡Enseñarte yo"
	line "haré a ser mejor"
	cont "Entrenador!"

	para "¿Qué saber quie-"
	line "res? ¿Ganador ser"
	cont "es lo que quieres?"
	done

AcademyEarlTeachHowToWinText:
	text "¡Bien! ¡Enseñar-"
	line "te, yo haré!"

	para "En combate, #-"
	line "mon primero de la"
	cont "lista sale antes."

	para "¡Cambiar el orden"
	line "de la lista, fá-"
	cont "cil el combate"
	cont "hace, quizás!"

	para "¿Más de mí oír"
	line "quieres?"
	done

AcademyEarlTeachMoreText:
	text "¿Así que quieres"
	line "saber cómo criar"
	cont "bien tus #mon?"
	done


AcademyEarlNoMoreToTeachText:
	text "¡Oh! ¡Listo alum-"
	line "no eres! ¡Nada"
	cont "más enseño yo!"

	para "¡Bueno con #mon"
	line "tú debes ser!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Estoy tomando no-"
	line "tas de la clase"
	cont "del profesor."

	para "Mejor copio tam-"
	line "bién lo de la"
	cont "pizarra."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "Cambié mi mejor"
	line "#mon al chico"
	cont "de al lado."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "¿Eh? ¡El #mon"
	line "que me dieron"
	cont "lleva algo!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #mon con una"
	line "Baya se cura solo"
	cont "en combate."

	para "Otros muchos ob-"
	line "jetos pueden ser"
	cont "equipados..."

	para "Vaya lío tomar"
	line "apuntes..."
	done

AcademyBlackboardText:
	text "La pizarra des-"
	line "cribe cambios de"

	para "estado #mon en"
	line "combate."
	done

AcademyPoisonText:
	text "Si envenenado, un"
	line "#mon pierde PS"
	cont "gradualmente."

	para "El veneno persis-"
	line "te tras el comba-"
	cont "te,"

	para "y se pierden PS"
	line "al caminar."

	para "Para curarlo, usa"
	line "un Antídoto."
	done

AcademyParalysisText:
	text "La parálisis re-"
	line "duce Velocidad y"
	cont "puede impedir"
	cont "moverse."

	para "Persiste tras el"
	line "combate. Usa una"
	cont "Antiparaliz."
	done

AcademySleepText:
	text "Si está dormido,"
	line "tu #mon no"
	cont "puede atacar."

	para "Un #mon dormi-"
	line "do no despierta"
	cont "tras el combate."

	para "Despiértalo con"
	line "un Despertar."
	done

AcademyBurnText:
	text "Una quemadura"
	line "consume PS poco"
	cont "a poco."

	para "También reduce el"
	line "poder de ataque."

	para "Persiste tras el"
	line "combate."

	para "Usa una Antique-"
	line "madura para"
	cont "curarlo."
	done

AcademyFreezeText:
	text "Si tu #mon es-"
	line "tá congelado, no"
	cont "puede hacer nada."

	para "Sigue congelado"
	line "tras el combate."

	para "Descóngelalo con"
	line "un Antihielo."
	done

AcademyNotebookText:
	text "Es el cuaderno"
	line "del chico..."

	para "Captura #mon"
	line "con # Balls."

	para "Puedes llevar"
	line "hasta seis en"
	cont "tu equipo."

	para "¿Seguir leyendo?"
	done

AcademyNotebookText1:
	text "Antes de lanzar"
	line "una # Ball, de-"
	cont "bilita al rival."

	para "Un #mon envene-"
	line "nado o quemado es"
	cont "más fácil de"
	cont "atrapar."

	para "¿Seguir leyendo?"
	done

AcademyNotebookText2:
	text "Algunos ataques"
	line "causan confusión."

	para "La confusión pue-"
	line "de hacer que un"
	cont "#mon se ataque"
	cont "a sí mismo."

	para "Salir del combate"
	line "elimina cualquier"
	cont "confusión."

	para "¿Seguir leyendo?"
	done

AcademyNotebookText3:
	text "La gente que cap-"
	line "tura y usa #mon"

	para "en combate son"
	line "Entrenadores"
	cont "#mon."

	para "Deben visitar"
	line "Gimnasios #mon"

	para "y derrotar a"
	line "otros Entrenado-"
	cont "res."

	para "La siguiente pá-"
	line "gina... ¡Blanca!"

	para "Chico: Je-je-je..."

	para "No he escrito"
	line "más aún..."
	done
