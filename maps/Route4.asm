Route4_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, MOUNT_MOON_B1F, 8
	warp_event 19,  5, MOUNT_MOON_SQUARE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_JUMPTEXT, MtMoonSignText
	bg_event 17,  9, BGEVENT_JUMPTEXT, CableCarSignText
	bg_event 15,  4, BGEVENT_ITEM + ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

	def_object_events
	object_event 51,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerYoungsterOliver, -1
	object_event 38, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerLassJennifer, -1
	object_event 28,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperHank, -1
	object_event 12, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPicnickerHope, -1
	object_event 35,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPicnickerSharon, -1
	object_event 26, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4SuperNerd1Script, -1
	object_event 29, 13, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route4SuperNerd2Script, -1
	object_event 19,  7, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4EngineerScript, EVENT_MT_MOON_RIVAL
	object_event 17,  5, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	itemball_event 42,  5, HP_UP, 1, EVENT_ROUTE_4_HP_UP
	object_event 68,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_BLUE

GenericTrainerYoungsterOliver:
	generictrainer YOUNGSTER, OLIVER, EVENT_BEAT_YOUNGSTER_OLIVER, YoungsterOliverSeenText, YoungsterOliverBeatenText

	text "Dicen que hago"
	line "demasiadas pregun-"
	cont "tas, pero"

	para "eso hacen los ni-"
	line "ños, ¿no?"
	done

GenericTrainerLassJennifer:
	generictrainer LASS, JENNIFER, EVENT_BEAT_LASS_JENNIFER, LassJenniferSeenText, LassJenniferBeatenText

	text "Los #mon son"
	line "muy divertidos."
	cont "¿A que sí?"
	done

GenericTrainerBird_keeperHank:
	generictrainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, Bird_keeperHankSeenText, Bird_keeperHankBeatenText

	text "Si quieres entre-"
	line "nar a un #mon"
	cont "en concreto,"

	para "sácalo primero y"
	line "cámbialo luego."

	para "Así es como se"
	line "hace."
	done

GenericTrainerPicnickerHope:
	generictrainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText

	text "Oí que Clefairy"
	line "aparece en el"
	cont "Monte Moon."

	para "Pero ¿dónde po-"
	line "drán estar?"
	done

GenericTrainerPicnickerSharon:
	generictrainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText

	text "…… Iré a entrenar"
	line "un poco más…"
	done

Route4SuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_IRON_HEAD_INTRO
	iftruefwd Route4TutorIronHeadScript
	writetext Route4SuperNerd1Text
	waitbutton
	setevent EVENT_LISTENED_TO_IRON_HEAD_INTRO
Route4TutorIronHeadScript:
	writetext Text_Route4TutorIronHead
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route4Tutor1Question
	yesorno
	iffalsefwd .TutorRefused
	setval IRON_HEAD
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "¡Pero si es mejor"
	line "que Acua Cola!"
	done

.NoSilverLeaf
	jumpopenedtext Text_Route4TutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ha"
	line "aprendido a usar"
	cont "Cabeza de Hierro!"
	done

Route4SuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_AQUA_TAIL_INTRO
	iftruefwd Route4TutorAquaTailScript
	writetext Route4SuperNerd2Text
	waitbutton
	setevent EVENT_LISTENED_TO_AQUA_TAIL_INTRO
Route4TutorAquaTailScript:
	writetext Text_Route4TutorAquaTail
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route4Tutor2Question
	yesorno
	iffalsefwd .TutorRefused
	setval AQUA_TAIL
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "¡Pero si es mejor"
	line "que Cabezahierro!"
	done

.NoSilverLeaf
	jumpopenedtext Text_Route4TutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ha"
	line "aprendido a usar"
	cont "Acua Cola!"
	done

Route4EngineerScript:
	showtext Route4EngineerText1
	showtextfaceplayer Route4EngineerText2
	turnobject LAST_TALKED, UP
	end

YoungsterOliverSeenText:
	text "¡Hola! ¿Cómo te"
	line "llamas? ¿Adónde"
	cont "vas?"
	done

YoungsterOliverBeatenText:
	text "Solo estaba pre-"
	line "guntando…"
	done

LassJenniferSeenText:
	text "Lucho cada vez que"
	line "puedo, solo por"

	para "pasar tiempo con"
	line "mis #mon."
	done

LassJenniferBeatenText:
	text "¡Yuuuju!"
	done

Bird_keeperHankSeenText:
	text "Estoy entrenando"
	line "a mis #mon."
	cont "¿Luchas conmigo?"
	done

Bird_keeperHankBeatenText:
	text "¡Vaya! Esta vez me"
	line "ha tocado perder…"
	done

PicnickerHopeSeenText:
	text "Tengo el presenti-"
	line "miento de que pue-"
	cont "do ganar."

	para "¡A ver si tengo"
	line "razón!"
	done

PicnickerHopeBeatenText:
	text "Vaya, eres dema-"
	line "siado fuerte."
	done

PicnickerSharonSeenText: ; text > text
	text "Esto…"
	line "Yo…"
	done

PicnickerSharonBeatenText: ; text > text
	text "…"
	done

Route4SuperNerd1Text:
	text "¡Los #mon con"
	line "cabezas duras son"
	cont "los mejores!"

	para "¡Arcanine, Golem,"
	line "Snorlax!"

	para "¿A que sí?"
	done

Route4SuperNerd2Text:
	text "¡Los #mon con"
	line "colas largas son"
	cont "los mejores!"

	para "¡Slowbro, Golduck,"
	line "Feraligatr!"

	para "¿A que sí?"
	done

Text_Route4TutorIronHead:
	text "Si me das una Hoja"
	line "Plata, ¡le en-"

	para "señaré a tu #mon"
	line "Cabeza de Hierro!"
	done

Text_Route4TutorAquaTail:
	text "Si me das una Hoja"
	line "Plata, ¡le en-"

	para "señaré a tu #mon"
	line "Acua Cola!"
	done

Text_Route4TutorsNoSilverLeaf:
	text "Pero si no tienes"
	line "ninguna Hoja"
	cont "Plata."
	done

Text_Route4Tutor1Question:
	text "¿Le enseño Cabeza"
	line "de Hierro a tu"
	cont "#mon?"
	done

Text_Route4Tutor2Question:
	text "¿Le enseño Acua"
	line "Cola a tu #mon?"
	done

Route4EngineerText1:
	text "¡Apretad más esos"
	line "tornillos!"
	done

Route4EngineerText2:
	text "El teleférico no"
	line "funciona ahora."

	para "Hasta que no aca-"
	line "bemos de arreglar-"
	cont "lo, la Plaza del"

	para "Monte Moon estará"
	line "cerrada."
	done

MtMoonSignText:
	text "Túnel del"
	line "Monte Moon"
	done

CableCarSignText:
	text "Teleférico a la"
	line "Plaza Monte Moon"
	done
