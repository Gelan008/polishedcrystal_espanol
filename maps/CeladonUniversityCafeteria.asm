CeladonUniversityCafeteria_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, CELADON_UNIVERSITY_2F, 2
	warp_event 14,  7, CELADON_UNIVERSITY_2F, 2

	def_coord_events

	def_bg_events
	bg_event 10,  0, BGEVENT_JUMPTEXT, CeladonUniversityCafeteriaSignText

	def_object_events
	object_event 11,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaCoreyScript, -1
	object_event  4,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaCooltrainerfText, -1
	object_event  7,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaBeautyText, -1
	object_event  2,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaYoungster1Text, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonUniversityCafeteriaLadyText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaYoungster2Script, -1
	object_event  0,  3, SPRITE_BAKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityCafeteriaBakerScript, -1

	object_const_def
	const CELADONUNIVERSITYCAFETERIA_COREY

CeladonUniversityCafeteriaCoreyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_COREY
	iftruefwd .Beaten
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
	setlasttalked CELADONUNIVERSITYCAFETERIA_COREY
	loadtrainer COOLTRAINERM, COOLTRAINERM_COREY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_COREY
	opentext
.Beaten
	setevent EVENT_INTRODUCED_CELADON_FOUR
	checkevent EVENT_BEAT_COOLTRAINERM_RAYMOND
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERM_FERGUS
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_BEAT_COOLTRAINERF_NEESHA
	iffalse_jumpopenedtext .AfterText1
	checkevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	iftrue_jumpopenedtext .FinalText
	writetext .AfterText2
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse_jumpopenedtext CeladonUni_NoRoomText
	setevent EVENT_GOT_CHOICE_BAND_FROM_CELADON_FOUR
	jumpthisopenedtext

.FinalText:
	text "Serías un alumno"
	line "estrella si te"
	cont "unieras aquí."

	para "Pero tienes otras"
	line "metas, ¿verdad?"
	done

.IntroText1:
	text "¡Soy Corey! Uno de"
	line "los cuatro mejores"
	cont "de la Universidad."

	para "¡Nos llaman los"
	line "Cuatro de Azulona!"

	para "¡Déjame mostrarte"
	line "cómo ganamos ese"
	cont "título con un"
	cont "combate rápido!"

	done

.IntroText2:
	text "¡Soy Corey! Uno de"
	line "los cuatro mejores"
	cont "de la Universidad."

	para "¿Nos desafías a"
	line "los cuatro?"

	para "Claro, ya"
	line "terminé de comer."

	para "¿Estás a punto"
	line "para el combate?"
	done

.NoBattleText:
	text "Sí, podemos ser"
	line "intimidantes."
	done

.SeenText:
	text "¡Ganar esto será"
	line "pan comido!"
	done

.BeatenText:
	text "Te he subestimado…"
	done

.AfterText1:
	text "¡Qué entrenador"
	line "tan fuerte eres!"

	para "Pero solo soy uno"
	line "de los Cuatro de"
	cont "Azulona."

	para "¡Busca al resto"
	line "para poner a"
	cont "prueba tu fuerza!"
	done

.AfterText2:
	text "¿Venciste a los"
	line "Cuatro de Azulona?"

	para "¡Felicidades!"

	para "¡Toma esto como un"
	line "recuerdo!"
	done

CeladonUni_NoRoomText:
	text "No puedes llevarlo"
	done

CeladonUniversityCafeteriaCooltrainerfText:
	text "¡Aquí hacen los"
	line "mejores filetes de"
	cont "hamburguesa al"
	cont "estilo Canela de"
	cont "todo Kanto!"

	para "¡Es como estar"
	line "en casa!"
	done

CeladonUniversityCafeteriaBeautyText:
	text "¡El cocinero por"
	line "fin hizo otra"
	cont "tanda de Barritas"
	cont "Plus!"

	para "Puede que vuelva a"
	line "por más."
	done

CeladonUniversityCafeteriaYoungster1Text:
	text "Pedí que trajeran"
	line "Porcehelados a la"
	cont "cafetería."

	para "Me recuerdan a mi"
	line "hogar, ¡y están"
	cont "buenísimos!"
	done

CeladonUniversityCafeteriaLadyText:
	text "Estoy a dieta."
	line "Hoy tomaré una"
	cont "ensalada de"
	cont "Sem. Sumerno."
	done

CeladonUniversityCafeteriaYoungster2Script:
	checkevent EVENT_GOT_LEMONADE_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem LEMONADE
	iffalse_jumpopenedtext CeladonUni_NoRoomText
	setevent EVENT_GOT_LEMONADE_IN_UNIVERSITY
	jumpopenedtext .Text2

.Text1:
	text "The vending ma-"
	line "chine gave me an"
	cont "extra drink!"

	para "Let me share it"
	line "with you."
	done

.Text2:
	text "I love a cold"
	line "Lemonade after a"
	cont "tough battle."
	done

CeladonUniversityCafeteriaBakerScript:
	faceplayer
	opentext
	checkflag ENGINE_BOUGHT_LEFTOVERS
	iftrue_jumpopenedtext .Text3
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text4
	checkmoney YOUR_MONEY, 4000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem LEFTOVERS
	iffalse_jumpopenedtext .Text6
	setflag ENGINE_BOUGHT_LEFTOVERS
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	jumpthisopenedtext

.Text2:
	text "¡Aquí tienes,"
	line "cielo! ¡Disfruta!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "You don't have"
	line "enough money…"
	done

.Text1:
	text "¿Qué pasa, cielo?"

	para "Perdona, ya hemos"
	line "dejado de servir"
	cont "la cena."

	para "Hay algunos Restos"
	line "pero costarán"
	cont "4000¥. ¿Quieres"
	cont "algunos?"
	done

.Text3:
	text "No quedan más"
	line "Restos hoy."
	done

.Text4:
	text "¡Que tengas un"
	line "buen día!"
	done

.Text6:
	text "No puedes llevar"
	line "más, cielo."
	done

CeladonUniversityCafeteriaSignText:
	text "Por favor limpia"
	line "cuando termines"
	cont "de comer."
	done
