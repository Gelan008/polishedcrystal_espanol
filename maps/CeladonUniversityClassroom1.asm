CeladonUniversityClassroom1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 11, CELADON_UNIVERSITY_1F, 6
	warp_event  3, 11, CELADON_UNIVERSITY_1F, 6

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  4,  0, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1BlackboardText
	bg_event  6,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1Bookshelf1Text
	bg_event  7,  1, BGEVENT_JUMPTEXT, CeladonUniversityClassroom1Bookshelf2Text

	def_object_events
	object_event  0,  6, SPRITE_IMAKUNI, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityClassroom1ImakuniScript, -1
	object_event  1,  2, SPRITE_ANDY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1AndyText, -1
	object_event  5,  2, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityClassroom1Dragon_tamerText, -1
	object_event  2,  5, SPRITE_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1LadyText, -1
	object_event  5,  5, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist1Text, -1
	object_event  4,  7, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist2Text, -1
	object_event  3,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityClassroom1Artist3Text, -1

	object_const_def
	const CELADONUNIVERSITYCLASSROOM1_IMAKUNI

CeladonUniversityClassroom1ImakuniScript:
	readvar VAR_FACING
	ifequalfwd UP, .Up
	ifequalfwd DOWN, .Down
	ifequalfwd LEFT, .Left
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, RIGHT
	sjumpfwd .Continue

.Up:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, UP
	sjumpfwd .Continue

.Down:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, DOWN
	sjumpfwd .Continue

.Left:
	turnobject CELADONUNIVERSITYCLASSROOM1_IMAKUNI, LEFT
.Continue:
	checkevent EVENT_BEAT_IMAKUNI
	iftruefwd .Beaten
	opentext
	writetext .Text1
	yesorno
	iffalse_jumpopenedtext .Text2
	writetext .Text3
	waitbutton
	closetext
	winlosstext .Text4, 0
	setlasttalked CELADONUNIVERSITYCLASSROOM1_IMAKUNI
	loadtrainer IMAKUNI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_IMAKUNI
.Beaten
	checkevent EVENT_GOT_PERSIM_BERRY_FROM_IMAKUNI
	iftrue_jumptext .Text6
	opentext
	writetext .Text5
	promptbutton
	verbosegiveitem PERSIM_BERRY
	iffalse_endtext
	setevent EVENT_GOT_PERSIM_BERRY_FROM_IMAKUNI
	jumpthisopenedtext

.Text6:
	text "En el combate y la"
	line "danza, ritmo y"
	cont "alma son la clave."

	para "Oye, ¡eso suena"
	line "bastante guay!"

	para "¡Tal vez me vuelva"
	line "un poeta!"
	done

.Text1:
	text "¿Eh? ¿Q… Quién"
	line "eres tú?"

	para "¿Quién? ¿Yo? ¿No"
	line "sabes quién soy?"

	para "¡Soy la estrella"
	line "musical, Imakuni!"

	para "Yo cantaré el"
	line "#Rap…"
	cont "¡Tú solo baila!"

	para "♪ Y que #mon,"
	line "eres tú… ♪"

	para "¡Yeah! ¡Mueve esos"
	line "pies!"

	para "¿Qué? ¿#mon?"

	para "¿Quieres luchar"
	line "contra mí?"
	done

.Text2:
	text "¡Vamos, no seas"
	line "cruel!"

	para "¡Vas a hacer que"
	line "llore!"
	done

.Text3:
	text "Vale, pero si gano"
	line "yo, ¡tú bailas!"
	done

.Text4:
	text "Incluso si perdí,"
	line "¿es tan malo?"
	done

.Text5:
	text "¡Oye! ¡Eres muy"
	line "bueno!"

	para "Te daré una Baya,"
	line "¡no digas a nadie"
	cont "que perdí, ¿vale?"
	done

CeladonUniversityClassroom1AndyText:
	text "¡Hola a todos! Soy"
	line "el Prof. Andy,"
	cont "y enseño arte."

	para "Recuerda: dibuja"
	line "lo que ves, no lo"
	cont "que crees ver."

	para "Supera cualquier"
	line "prejuicio visual."
	done

CeladonUniversityClassroom1Dragon_tamerText:
	text "Llevo aguantando"
	line "esta pose durante"
	cont "un buen rato."
	done

CeladonUniversityClassroom1LadyText:
	text "Hay gente muy"
	line "única en la clase"
	cont "de arte, ¡pero ese"
	cont "del traje negro es"
	cont "muy sospechoso!"
	done

CeladonUniversityClassroom1Artist1Text:
	text "Cuesta dibujar"
	line "los pliegues de"
	cont "esa capa."
	done

CeladonUniversityClassroom1Artist2Text:
	text "¡Aachís!"

	para "Uf. Tras la clase"
	line "de arreglos"
	cont "florales, ¡no paro"
	cont "de estornudar!"

	para "Debo de ser"
	line "alérgico…"
	done

CeladonUniversityClassroom1Artist3Text:
	text "Trabajo de día,"
	line "así que tomo"
	cont "clases de noche."
	done

CeladonUniversityClassroom1BlackboardText:
	text "Hay una lección de"
	line "perspectiva de dos"
	cont "y tres puntos."
	done

CeladonUniversityClassroom1Bookshelf1Text:
	text "Es un libro sobre"
	line "Smeargle, el"
	cont "artista #mon."

	para "Está lleno de"
	line "hermosos dibujos."
	done

CeladonUniversityClassroom1Bookshelf2Text:
	text "Es un folleto de"
	line "las bellas artes"
	cont "del Museo de"
	cont "Calagua."
	done
