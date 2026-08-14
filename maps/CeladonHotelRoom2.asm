CeladonHotelRoom2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_HOTEL_2F, 3
	warp_event  4,  5, CELADON_HOTEL_2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, MrHyperScript, -1

MrHyperScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MR_HYPER
	iftruefwd .IntroDone
	writetext .TextIntro
	waitbutton
	setevent EVENT_TALKED_TO_MR_HYPER
	; fallthrough
.IntroDone:
	writetext .TextAskTrain
	yesorno
	iffalse_jumpopenedtext .TextComeBackAnytime
.CheckBottleCaps:
	checkitem BOTTLE_CAP
	iffalse_jumpopenedtext .TextNoBottleCaps
	writetext .TextTrainWho
	waitbutton
	special Special_HyperTrain
	iffalse_jumpopenedtext .TextComeBackAnytime
	takeitem BOTTLE_CAP
	writetext .TextGotStronger
	waitbutton
	writetext .TextTrainSomeMore
	yesorno
	iftrue .CheckBottleCaps
	jumpthisopenedtext

.TextComeBackAnytime:
	text "¡Vuelve cuando"
	line "quieras! ¡Don"
	cont "Extremo siempre"
	cont "se emocionará al"
	cont "verte!"
	done

.TextIntro:
	text "¡Soy Don Extremo!"
	line "¿Quieres saber por"
	cont "qué?"

	para "¡Porque ayudo a"
	line "los #mon con mi"
	cont "Entren. Extremo!"

	para "¡Permite que un"
	line "#mon que haya"
	cont "maximizado su es-"
	cont "fuerzo se vuelva"
	cont "aún más fuerte!"

	para "Este entrenamien-"
	line "to les ayudará a"
	cont "subir sus stats."

	para "Si quieres que"
	line "entrene a tus"
	cont "#mon, tráeme al-"
	cont "gunas Chapas."
	done

.TextAskTrain:
	text "¿Qué me dices?"
	line "¿Quieres probar mi"
	cont "Entren. Extremo?"
	done

.TextNoBottleCaps:
	text "¿No tienes ninguna"
	line "Chapa?"

	para "Sé que los Pesca-"
	line "-dores las sacan"
	cont "a veces…"
	done

.TextTrainWho:
	text "¿Qué #mon de-"
	line "be entrenar?"
	done

.TextGotStronger:
	text "¡Listo! ¡Mi En-"
	line "tren. Extremo ha"
	cont "mejorado a"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.TextTrainSomeMore:
	text "¿Entrenar a otro"
	line "#mon?"
	done
