ViridianCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlyPoint

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
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
	bg_event 27,  7, BGEVENT_JUMPTEXT, ViridianGymSignText
	bg_event 19,  1, BGEVENT_JUMPTEXT, ViridianCityTrainerTips1Text
	bg_event 21, 29, BGEVENT_JUMPTEXT, ViridianCityTrainerTips2Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, TrainerHouseSignText

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 32,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_BLUE_IN_CINNABAR
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, EVENT_VIRIDIAN_GYM_BLUE
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
	jumpopenedtext ViridianCityCoffeeGrampsBelievedText

ViridianCityGrampsNearGym:
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue_jumptextfaceplayer ViridianCityGrampsNearGymBlueReturnedText
	jumptextfaceplayer ViridianCityGrampsNearGymText

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
	jumpopenedtext Text_ViridianCityTutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_ViridianCityTutorTaught

ViridianCityCoffeeGrampsQuestionText:
	text "¡Eh! Me he tomado"
	line "un café doble y"
	cont "¡estoy a tope!"

	para "¡Tengo que hablar"
	line "con alguien, así"
	cont "que te ha tocado!"

	para "Aunque no lo creas"
	line "era todo un hacha"
	cont "atrapando #mon."

	para "¿Me crees?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Good, good. Yes, I"
	line "was something out"

	para "of the ordinary,"
	line "let me tell you!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "¿Qué? ¡Mocoso"
	line "insolente!"

	para "¡Si fuera más"
	line "joven, te iba a"
	cont "enseñar un par de"
	cont "cosas! ¡Humph!"
	done

ViridianCityGrampsNearGymText:
	text "This Gym didn't"
	line "have a Leader"
	cont "until recently."

	para "A young man from"
	line "Pallet became the"

	para "Leader, but he's"
	line "often away."
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

Text_ViridianCityTutorNoSilverLeaf:
	text "You don't have any"
	line "Silver Leaves…"
	done

Text_ViridianCityTutorQuestion:
	text "¿Quieres que le"
	line "enseñe Come Sueños"
	cont "a tu #mon?"
	done

Text_ViridianCityTutorRefused: ; text > text
	text "OK…"
	done

Text_ViridianCityTutorTaught:
	text "Now your #mon"
	line "knows how to use"
	cont "Dream Eater…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "Dicen que hay"
	line "muchos objetos por"
	cont "el suelo del"
	cont "Bosque Verde."
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
	line "para ampliar tu"
	cont "colección!"

	para "¡Tener más #mon"
	line "te facilitará los"
	cont "combates!"
	done

ViridianCityTrainerTips2Text:
	text "Pistas Entrenador"

	para "¡El mundo es muy"
	line "grande!"

	para "No te limites a"
	line "correr o volar,"
	cont "¡explora bien!"

	para "¡Descubrirás cosas"
	line "muy emocionantes!"
	done

TrainerHouseSignText:
	text "Casa del"
	line ""

	para "El club donde se"
	line "baten los mejores"
	cont "entrenadores."
	done
