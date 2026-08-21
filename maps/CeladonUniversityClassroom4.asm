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
	text "¡Hola! Soy Raymond"
	line "Llámame Ray."

	para "¡Soy uno de los"
	line "cuatro mejores de"
	cont "la Universidad!"

	para "¡Nos llaman los"
	line "Cuatro de Azulona!"

	para "¿Quieres ver de"
	line "qué somos capaces?"

	para "¡Luchemos! Salvo"
	line "que tengas miedo."
	done

.IntroText2:
	text "¡Hola! Soy Raymond"
	line "Llámame Ray."

	para "¡Soy de los"
	line "Cuatro de Azulona!"

	para "¿Nos desafías a"
	line "los cuatro?"

	para "¡Luchemos! Salvo"
	line "que tengas miedo."
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
	line "¡Soy de los"
	cont "Cuatro de Azulona!"

	para "He perdido, pero"
	line "mis colegas me"
	cont "vengarán."

	para "¡Ve a buscarlos"
	line "tú mismo!"
	done

.AfterText2:
	text "¿Venciste a los"
	line "Cuatro de Azulona?"

	para "¡No me lo creo!"

	para "…Vale. Te has"
	line "ganado esto."
	done

.FinalText:
	text "Si has vencido a"
	line "los Cuatro de"
	cont "Azulona,"

	para "puedes soportar"
	line "cualquier carga."
	done

CeladonUniversityClassroom4CandelaText:
	text "¡Soy Candela!"
	line "¡Enseño Combates"
	cont "#mon!"

	para "Investigo formas"
	line "de potenciar el"
	cont "poder natural de"
	cont "los #mon."
	done

CeladonUniversityClassroom4TeacherText:
	text "¿Candela? Solo da"
	line "clases por el día."
	done

CeladonUniversityClassroom4Bug_catcherText:
	text "La profesora dijo"
	line "que mis #mon"
	cont "podrían competir"
	cont "al máximo nivel."

	para "¡Tienen un gran"
	line "potencial!"
	done

CeladonUniversityClassroom4FisherText:
	text "¡La profesora dijo"
	line "que mis #mon"
	cont "son una maravilla!"

	para "¡Son realmente"
	line "impresionantes!"
	done

CeladonUniversityClassroom4LadyText:
	text "La profesora dijo"
	line "que mi #mon la"
	cont "ha sorprendido."

	para "¡Puede lograr lo"
	line "que se proponga!"
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
	text "We're learning"
	line "about #mon"
	cont "abilities."

	para "Some species can"
	line "have more than one"
	cont "ability."

	para "Use this to switch"
	line "between them!"
	done

.Text2:
	text "There are some"
	line "rare “hidden"
	cont "abilities” that"

	para "an Ability Cap"
	line "can't change."

	para "But! If a #-"
	line "mon holding an"

	para "Ability Cap has"
	line "an Egg, its baby"

	para "might have a"
	line "hidden ability!"
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

	para "…¿Oh?"
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
