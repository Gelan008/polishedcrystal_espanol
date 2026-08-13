CeladonUniversityClassroom4_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 9
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 9

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4BlackboardText
	bg_event  6,  1, BGEVENT_READ, CeladonUniversityClassroom4Bookshelf1
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom4Bookshelf2Text

	def_object_events
	object_event  5,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom4RaymondScript, -1
	object_event  2,  1, SPRITE_CANDELA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4CandelaText, -1
	object_event  2,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4TeacherText, -1
	object_event  2,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4Bug_catcherText, -1
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4FisherText, -1
	object_event  5,  7, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom4LadyText, -1
	object_event  4,  9, SPRITE_RICH_BOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom4Rich_boyScript, -1

	object_const_def
	const CELADONUNIVERSITYCLASSROOM4_RAYMOND

CeladonUniversityClassroom4RaymondScript:
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iftruefwd .Beaten
	opentext
	checkevent EVENT_INTRODUCED_CELADON_FOUR
	iftruefwd .IntroducedCeladonFour1
	writetext .IntroText1
	sjumpfwd .AfterIntro
.IntroducedCeladonFour1
	writetext .IntroText2
.AfterIntro
	yesorno
	iffalse_jumpopenedtext .NoBattleText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked CELADONUNIVERSITYCLASSROOM4_RAYMOND
	loadtrainer COOLTRAINERM, COOLTRAINERM_RAYMOND
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_RAYMOND
.Beaten
	opentext
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	iftrue_jumpopenedtext .FinalText
	writetext .AfterText2
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse_endtext
	setevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	jumpopenedtext .FinalText

.IntroText1:
	text "¡Hola! Soy Raymond."
	line "Llamáme Ray."

	para "Soy de los cuatro"
	line "mejores entrena-"
	cont "dores de la Uni-"
	cont "versidad."

	para "¡Se nos conoce co-"
	line "mo los Cuatro de"
	cont "Azulona!"

	para "¿Quieres ver nues-"
	line "tra habilidad?"

	para "¡Echemos un com-"
	line "bate! A menos que"
	cont "temas perder."
	done

.IntroText2:
	text "¡Hola! Soy Raymond."
	line "Llamáme Ray."

	para "¡Soy de los Cua-"
	line "tro de Azulona!"

	para "¿Nos estás desa-"
	line "fiando a los"
	cont "cuatro?"

	para "¡Echemos un com-"
	line "bate! A menos que"
	cont "temas perder."
	done

.NoBattleText:
	text "Sabía que tenías"
	line "miedo."
	done

.SeenText:
	text "¡Hagámoslo!"
	done

.BeatenText:
	text "¡Ohhhh nooooo!"
	done

.AfterText1:
	text "¿Cómo puede ser?"
	line "¡Soy de los Cua-"
	cont "tro de Azulona!"

	para "Puede que haya"
	line "perdido, pero mis"
	cont "colegas me ven-"
	cont "garán."

	para "¡Ve a buscarlos"
	line "tú mismo!"
	done

.AfterText2:
	text "¿Venciste a los"
	line "Cuatro de Azulona?"

	para "¡No me digas!"

	para "...Vale. Supongo"
	line "que te has gana-"
	cont "do esto."
	done

.FinalText:
	text "Si has vencido a"
	line "los Cuatro de"
	cont "Azulona,"

	para "puedes soportar"
	line "cualquier carga."
	done

CeladonUniversityClassroom4CandelaText:
	text "¡Hola! Soy Cande-"
	line "la. ¡Enseño los"
	cont "Combates #mon!"

	para "Estoy investigando"
	line "formas de mejorar"

	para "el poder natural"
	line "de los #mon"
	cont "para aumentar la"
	cont "fuerza."
	done

CeladonUniversityClassroom4TeacherText:
	text "¿Candela? Solo da"
	line "clases por el día."
	done

CeladonUniversityClassroom4Bug_catcherText:
	text "Mi maestro dijo"
	line "que mis #mon po-"
	cont "drían competir con"
	cont "los mejores."

	para "¡Su potencial es"
	line "el mejor que ha-"
	cont "bía visto nunca!"
	done

CeladonUniversityClassroom4FisherText:
	text "¡El profesor dijo"
	line "que mis #mon"
	cont "son una maravi-"
	cont "lla!"

	para "Son unos #mon"
	line "impresionantes."
	done

CeladonUniversityClassroom4LadyText:
	text "El profesor dijo"
	line "que mi #mon le"
	cont "ha sorprendido."

	para "¡Supongo que pue-"
	line "de lograr lo que"
	cont "sea!"
	done

CeladonUniversityClassroom4Rich_boyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ABILITY_CAP_IN_UNIVERSITY
	iftruefwd .GotItem
	writetext .Text1
	promptbutton
	verbosegiveitem ABILITY_CAP
	iffalse_endtext
	setevent EVENT_GOT_ABILITY_CAP_IN_UNIVERSITY
.GotItem:
	writetext .Text2
	waitendtext

.Text1:
	text "Estamos apren-"
	line "diendo sobre habi-"
	cont "lidades #mon."

	para "Algunas especies"
	line "tienen más de"
	cont "una habilidad."

	para "¡Usa esto para"
	line "cambiar entre"
	cont "ellas!"
	done

.Text2:
	text "Hay unas raras"
	line "“habilidades ocul-"
	cont "tas” que la"

	para "Cáps. Hab. no pue-"
	line "de cambiar."

	para "¡Pero! Si un #-"
	line "mon que lleva una"

	para "Cáps. Hab. tiene"
	line "un Huevo, su bebé"

	para "podría tener una"
	line "habilidad oculta."
	done

CeladonUniversityClassroom4BlackboardText:
	text "Ten en cuenta en"
	line "combate:"
	cont "- Tipos"
	cont "- Efectos mov."
	cont "- Cat. mov."
	cont "- Estados"
	cont "- Obj. eq."
	cont "- Estad. base"
	cont "- Puntos esfuerzo"
	cont "- Naturalezas"
	cont "- Habilidades"
	cont "- Clima"
	cont "- ¿Y más?"
	done

CeladonUniversityClassroom4Bookshelf1:
	checkevent EVENT_GOT_X_SP_ATK_IN_UNIVERSITY
	iftrue_jumptext .Text2
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem X_SP_ATK
	iffalse_endtext
	setevent EVENT_GOT_X_SP_ATK_IN_UNIVERSITY
	endtext

.Text1:
	text "¡La librería es un"
	line "desastre!"

	para "<PLAYER> arregló"
	line "los libros."

	para "...¿Oh?"
	done

.Text2:
	text "La librería está"
	line "ordenada."
	done

CeladonUniversityClassroom4Bookshelf2Text:
	text "Es un libro de"
	line "colorear #mon."

	para "¿Qué hace esto"
	line "aquí?"
	done
