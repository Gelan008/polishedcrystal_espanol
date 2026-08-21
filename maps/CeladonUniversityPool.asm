CeladonUniversityPool_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  9, CELADON_UNIVERSITY_2F, 6
	warp_event  7,  9, CELADON_UNIVERSITY_2F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityPoolFergusScript, -1
	object_event  9,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolLassText, -1
	object_event  4,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SWIM_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolSwimmer_girlText, -1
	object_event  3,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityPoolTeacherText, -1
	itemball_event 12,  8, WATER_STONE, 1, EVENT_CELADON_UNIVERSITY_POOL_WATER_STONE

	object_const_def
	const CELADONUNIVERSITYPOOL_FERGUS

CeladonUniversityPoolFergusScript:
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
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
	setlasttalked CELADONUNIVERSITYPOOL_FERGUS
	loadtrainer COOLTRAINERM, FERGUS
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_FERGUS
.Beaten
	opentext
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
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
	text "¡Me llamo Fergus!"
	line "¡Soy de los cuatro"
	cont "mejores de la"
	cont "Univ. de Azulona!"

	para "¡Nos llaman los"
	line "Cuatro de Azulona!"

	para "¡Te demostraré en"
	line "un combate cómo"
	cont "gané mi puesto!"
	done

.IntroText2:
	text "¡Me llamo Fergus!"
	line "¡Soy de los"
	cont "Cuatro de Azulona!"

	para "¿Vas a enfrentarte"
	line "a los cuatro?"

	para "Pues entonces,"
	line "¡a luchar!"
	done

.NoBattleText:
	text "¡Entonces no te"
	line "cruces en mi"
	cont "camino!"
	done

.SeenText:
	text "¡Te enseñaremos!"
	line "¡Vamos!"
	done

.BeatenText:
	text "¡No me lo creo!"
	done

.AfterText1:
	text "Entrené mucho a mi"
	line "equipo, pero me"
	cont "has ganado igual."

	para "Con tu nivel,"
	line "deberías buscar"
	cont "al resto de los"
	cont "Cuatro de Azulona."
	done

.AfterText2:
	text "¿Los Cuatro de"
	line "Azulona perdimos"
	cont "contra ti?"

	para "¡Eres realmente"
	line "fuerte!"

	para "¡Te has ganado"
	line "esta recompensa!"
	done

.FinalText:
	text "Los Cuatro de"
	line "Azulona destacamos"
	cont "aquí, pero tú"
	cont "marcas época en el"
	cont "mundo real."

	para "¡Sigue así!"
	done

CeladonUniversityPoolLassText:
	text "¡Ay!"

	para "Tengo un calambre"
	line "en la pierna…"
	done

CeladonUniversityPoolSwimmer_girlText:
	text "Pedí entrar a un"
	line "programa especial"
	cont "para estudiar en"
	cont "las Islas Espuma."

	para "Debo prepararme"
	line "para su fuerte"
	cont "corriente."
	done

CeladonUniversityPoolTeacherText:
	text "¡Vale, cinco"
	line "vueltas más!"
	done

