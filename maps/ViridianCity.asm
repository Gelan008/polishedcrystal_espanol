ViridianCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlyPoint

	def_warp_events
	warp_event 30,  7, VIRIDIAN_GYM, 1
	warp_event 21,  5, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1
	warp_event 20, 33, ROUTE_1_VIRIDIAN_GATE, 1
	warp_event 21, 33, ROUTE_1_VIRIDIAN_GATE, 2
	warp_event 21,  9, VIRIDIAN_SCHOOL_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_JUMPTEXT, ViridianCitySignText
	bg_event 31,  7, BGEVENT_JUMPTEXT, ViridianGymSignText
	bg_event 19,  1, BGEVENT_JUMPTEXT, ViridianCityTrainerTips1Text
	bg_event 21, 29, BGEVENT_JUMPTEXT, ViridianCityTrainerTips2Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, TrainerHouseSignText

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_BLUE_IN_CINNABAR
	object_event 33,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_VIRIDIAN_GYM_BLUE
	object_event  6, 23, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianCityYoungsterText, -1
	object_event 31, 23, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianCityYoungster2Text, -1
	cuttree_event 14,  4, EVENT_VIRIDIAN_CITY_CUT_TREE_1
	cuttree_event  8, 22, EVENT_VIRIDIAN_CITY_CUT_TREE_2

ViridianCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse_jumpopenedtext ViridianCityCoffeeGrampsDoubtedText
	jumpthisopenedtext

	text "Bien, bien. Sí,"
	line "yo era alguien"

	para "fuera de lo común,"
	line "¡te lo aseguro!"
	done

ViridianCityGrampsNearGym:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer ViridianCityGrampsNearGymBlueReturnedText
	jumpthistextfaceplayer

	text "Este Gimnasio no"
	line "tuvo Líder hasta"
	cont "hace poco."

	para "Un joven de Pueblo"
	line "Paleta se convir-"

	para "tió en Líder, pero"
	line "suele estar fuera."
	done

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DREAM_EATER_INTRO
	iftruefwd ViridianCityTutorDreamEaterScript
	writetext ViridianCityDreamEaterFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_DREAM_EATER_INTRO
ViridianCityTutorDreamEaterScript:
	writetext Text_ViridianCityTutorDreamEater
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_ViridianCityTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval DREAM_EATER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_ViridianCityTutorRefused

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes ninguna"
	line "Hoja Plata…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Ahora tu #mon"
	line "sabe cómo usar"
	cont "Come Sueños…"

	para "…Zzzzz…"
	done

ViridianCityCoffeeGrampsQuestionText:
	text "¡Eh, chaval! Me he"
	line "tomado un café"

	para "doble ¡y estoy a"
	line "tope de energía!"

	para "¡Tengo que hablar"
	line "con alguien, así"
	cont "que te ha tocado!"

	para "Puede que no lo"
	line "parezca ahora,"

	para "pero era un hacha"
	line "atrapando #mon."

	para "¿Me crees?"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "¿Qué? ¡Mocoso in-"
	line "solente!"

	para "¡Si fuera un poco"
	line "más joven, te iba"

	para "a enseñar un par"
	line "de cosas! ¡Humph!"
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "¿Vas a enfrentarte"
	line "al Líder?"

	para "Buena suerte."
	line "Te va a hacer"
	cont "falta."
	done

ViridianCityDreamEaterFisherText:
	text "¡Aaah! (bostezo)"

	para "Me habré quedado"
	line "dormido al sol."

	para "…Soñé que un"
	line "Drowzee se comía"
	cont "mi sueño. Y…"

	para "¡aprendí a comer"
	line "sueños…!"

	para "¡Huy, qué miedo da"
	line "esto! Pero ahora…"
	done

Text_ViridianCityTutorDreamEater:
	text "Puedo enseñarle a"
	line "tu #mon a comer"
	cont "sueños."

	para "Solo pido a cambio"
	line "una Hoja Plata."
	done

Text_ViridianCityTutorQuestion:
	text "¿Le enseño a tu"
	line "#mon el movi-"
	cont "miento Come"
	cont "Sueños?"
	done

Text_ViridianCityTutorRefused: ; text > text
	text "Vale…"
	done

ViridianCityYoungsterText:
	text "Dicen que hay mu-"
	line "chos objetos por"

	para "el suelo del Bos-"
	line "que Verde."
	done

ViridianCityYoungster2Text:
	text "El líder del Team"
	line "Rocket fue Líder"
	cont "de Gimnasio aquí,"

	para "pero un día, hace"
	line "ya tres años,"
	cont "desapareció."

	para "Aunque tampoco"
	line "solía estar mucho"
	cont "por el Gimnasio…"
	done

ViridianCitySignText:
	text "Ciudad Verde"

	para "El paraíso del"
	line "verdor eterno"
	done

ViridianGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Verde"
	cont "Líder: …"

	para "El resto del texto"
	line "es ilegible…"
	done

ViridianCityTrainerTips1Text:
	text "Pistas Entrenador"

	para "¡Atrapa #mon"
	line "y amplía tu colec-"
	cont "ción!"

	para "¡Cuantos más ten-"
	line "gas, más fácil te"
	cont "será luchar!"
	done

ViridianCityTrainerTips2Text:
	text "Pistas Entrenador"

	para "¡El mundo es muy"
	line "grande!"

	para "No te limites a"
	line "correr o usar Vue-"
	cont "lo: ¡mira a tu al-"
	cont "rededor!"

	para "¡Descubrirás cosas"
	line "nuevas y emocio-"
	cont "nantes!"
	done

TrainerHouseSignText:
	text "Casa del"
	line "Entrenador"

	para "El club de comba-"
	line "tes entre los me-"
	cont "jores entrenadores"
	done
