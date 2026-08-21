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
	jumpopenedtext AcademyEarlTeachHowToRaiseWellText

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
	menu_coords 0, 0, 13, 8
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

	text "#mon Journal"

	para "Special Feature:"
	line "Ex-Leader Walker!"

	para "Falkner's father"
	line "Walker is rumored"

	para "to be wandering"
	line "around Johto as"
	cont "a vagabond."
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
	cont "entrenador!"

	para "¿Qué quieres"
	line "saber? ¿Ganador"
	cont "quieres ser?"
	done

AcademyEarlTeachHowToWinText:
	text "¡Bien! ¡Yo te"
	line "enseñaré!"

	para "En combate, el"
	line "#mon primero"
	cont "sale antes."

	para "¡Cambiar orden"
	line "de lista fácil el"
	cont "combate hace!"

	para "¿Más de mí oír"
	line "quieres?"
	done

AcademyEarlTeachMoreText:
	text "¿Así que quieres"
	line "saber cómo criar"
	cont "bien tus #mon?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Fine! Teach you,"
	line "I will!"

	para "If #mon come"
	line "out in battle even"

	para "briefly, some Exp."
	line "Points it gets."

	para "At top of list put"
	line "weak #mon."

	para "Switch in battle"
	line "quick!"

	para "This way, weak"
	line "#mon strong"
	cont "become!"
	done

AcademyEarlNoMoreToTeachText:
	text "¡Oh! ¡Alumno muy"
	line "listo eres! ¡Nada"
	cont "más enseño yo!"

	para "¡Bueno con #mon"
	line "tú debes ser!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Tomo notas de la"
	line "clase del"
	cont "profesor."

	para "Copiaré también"
	line "lo de la pizarra."
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

	para "Muchos otros"
	line "objetos pueden ser"
	cont "equipados…"

	para "Vaya lío tomar"
	line "apuntes…"
	done

AcademyBlackboardText:
	text "La pizarra explica"
	line "estados #mon en"
	cont "combate."
	done

AcademyPoisonText:
	text "Si es envenenado,"
	line "el #mon pierde"
	cont "PS poco a poco."

	para "El veneno sigue"
	line "tras el combate y"
	cont "quita PS al andar."

	para "Para curarlo, usa"
	line "un Antídoto."
	done

AcademyParalysisText:
	text "La parálisis baja"
	line "la Velocidad y"
	cont "puede impedir el"
	cont "movimiento."

	para "Persiste tras el"
	line "combate. Usa un"
	cont "Antiparaliz."
	done

AcademySleepText:
	text "Si está dormido,"
	line "tu #mon no"
	cont "puede atacar."

	para "No despertará al"
	line "acabar el combate."

	para "Despiértalo con"
	line "un Despertar."
	done

AcademyBurnText:
	text "Una quemadura"
	line "consume PS poco"
	cont "a poco y baja el"
	cont "Ataque."

	para "Persiste tras el"
	line "combate."

	para "Usa Antiquemar"
	line "para curarlo."
	done

AcademyFreezeText:
	text "Si tu #mon está"
	line "congelado, no"
	cont "puede hacer nada."

	para "Sigue congelado"
	line "tras el combate."

	para "Descóngelalo con"
	line "un Antihielo."
	done

AcademyNotebookText:
	text "Es el cuaderno"
	line "del chico…"

	para "Captura #mon"
	line "con # Balls."

	para "Puedes llevar"
	line "hasta seis en"
	cont "tu equipo."

	para "¿Seguir leyendo?"
	done

AcademyNotebookText1:
	text "Antes de lanzar"
	line "la # Ball, baja"
	cont "la salud al rival."

	para "Envenenado o"
	line "quemado es más"
	cont "fácil de atrapar."

	para "¿Seguir leyendo?"
	done

AcademyNotebookText2:
	text "Algunos ataques"
	line "causan confusión."

	para "La confusión puede"
	line "hacer que se dañe"
	cont "a sí mismo."

	para "Huir del combate"
	line "cura la confusión."

	para "¿Seguir leyendo?"
	done

AcademyNotebookText3:
	text "Quien captura y"
	line "usa #mon en"
	cont "combate es un"
	cont "entrenador #mon"

	para "Deben visitar"
	line "Gimnasios #mon"
	cont "y vencer a otros."

	para "La otra página…"
	line "¡está en blanco!"

	para "Chico: Jejeje…"

	para "No he escrito"
	line "nada más aún…"
	done
