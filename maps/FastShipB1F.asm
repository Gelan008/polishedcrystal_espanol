FastShipB1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_FASTSHIPB1F_SAILOR_BLOCKS
	scene_const SCENE_FASTSHIPB1F_NOOP

	def_callbacks

	def_warp_events
	warp_event  1,  9, FAST_SHIP_1F, 11
	warp_event 27, 11, FAST_SHIP_1F, 12

	def_coord_events
	coord_event 26,  5, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksLeft
	coord_event 27,  5, SCENE_FASTSHIPB1F_SAILOR_BLOCKS, FastShipB1FSailorBlocksRight

	def_bg_events

	def_object_events
	object_event 26,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 27,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  5,  9, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  2, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 22,  7, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 10, 11, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBakerSharyn, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 13,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 21,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 11,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 19,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 10,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 10,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND

	object_const_def
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftruefwd FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 26, 4
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftruefwd FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 27, 4
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer FastShipB1FOnDutySailorDirectionsText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftruefwd .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue_jumpopenedtext FastShipB1FOnDutySailorRefusedText
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	jumpthisopenedtext

	text "Oye, ¿podrías"
	line "buscar a mi"
	cont "compañero?"

	para "Debe de estar"
	line "haciendo el vago"
	cont "por ahí."

	para "Iría a por él,"
	line "pero ahora estoy"
	cont "de guardia."
	done

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalsefwd .NotFoundGirl
	waitendtext

.NotFoundGirl:
	promptbutton
	jumpthisopenedtext

	text "¿Una niña?"

	para "Puede que la haya"
	line "visto pasar por"
	cont "aquí."
	done

GenericTrainerSailorJeff:
	generictrainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText

	text "Supongo que no"
	line "ganaré si no me lo"
	cont "tomo en serio."
	done

GenericTrainerPicnickerDebra:
	generictrainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText

	text "Azafrán, Azulona…"
	line "¡Hay muchas"
	cont "ciudades en Kanto!"
	done

GenericTrainerJugglerFritz:
	generictrainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText

	text "Se acabaron los"
	line "barcos para mí."
	cont "La próxima vez iré"
	cont "en Magnetotrén."
	done

GenericTrainerBakerSharyn:
	generictrainer BAKER, SHARYN, EVENT_BEAT_BAKER_SHARYN, BakerSharynSeenText, BakerSharynBeatenText

	text "Puede que no sea"
	line "la mejor luchando,"

	para "pero a la gente le"
	line "gusta lo que"
	cont "horneo."
	done

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Vemos pasajeros"
	line "muy distintos al"
	cont "ir de C. Carmín"
	cont "a Ciudad Olivo."
	done

GenericTrainerFisherJonah:
	generictrainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText

	text "Planeo pescar en"
	line "el muelle de"
	cont "Ciudad Carmín."
	done

GenericTrainerBlackbeltWai:
	generictrainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText

	text "No pude encontrar"
	line "al Rey del Kárate"
	cont "en Johto."

	para "Se supone que"
	line "está entrenando en"
	cont "alguna cueva."
	done

GenericTrainerSailorKenneth:
	generictrainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText

	text "¡Ocho Medallas!"
	line "Eso demuestra que"
	cont "venciste a todos"
	cont "los Líderes."

	para "¡Con razón eres"
	line "tan fuerte!"
	done

GenericTrainerTeacherShirley:
	generictrainer TEACHER_F, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText

	text "Vamos de excursión"
	line "a las ruinas junto"
	cont "a Ciudad Malva."
	done

GenericTrainerSchoolboyNate:
	generictrainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText

	text "La radio capta"
	line "señales raras en"
	cont "las ruinas."
	done

GenericTrainerSchoolboyRicky:
	generictrainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText

	text "Leí en el diario"
	line "que hay 4 paneles"
	cont "de piedra allí."
	done

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	turn_head_down
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	turn_head_down
	step_end


FastShipB1FOnDutySailorRefusedText:
	text "Oh, vaya…"

	para "El Capitán se va a"
	line "poner furioso…"
	done

FastShipB1FOnDutySailorThanksText:
	text "¡Gracias! ¡Le he"
	line "echado una buena"
	cont "bronca para que"
	cont "no holgazanee!"
	done


FastShipB1FOnDutySailorDirectionsText:
	text "El comedor está"
	line "más adelante."

	para "Las escaleras al"
	line "fondo llevan al"
	cont "camarote del"
	cont "Capitán."
	done

SailorJeffSeenText:
	text "No hay nada como"
	line "luchar durante mi"
	cont "descanso."
	done

SailorJeffBeatenText:
	text "Gane o pierda, ¡se"
	line "acabó mi descanso!"
	done

PicnickerDebraSeenText:
	text "Me aburro mucho."
	line "¿Quieres luchar?"
	done

PicnickerDebraBeatenText:
	text "¡Oye! ¡Eres"
	line "demasiado fuerte!"
	done

JugglerFritzSeenText:
	text "Urrf…"
	line "¡Estoy mareado!"
	done

JugglerFritzBeatenText:
	text "No puedo moverme"
	line "más…"
	done

BakerSharynSeenText:
	text "Al igual que mi"
	line "pan, ¡hornearé a"
	cont "tus #mon!"
	done

BakerSharynBeatenText:
	text "Al menos mi pan"
	line "es ganador."
	done

SailorGarrettSeenText:
	text "¡Aquí es donde"
	line "trabajamos los"
	cont "marineros!"
	done

SailorGarrettBeatenText:
	text "He perdido en mi"
	line "propio terreno…"
	done

FisherJonahSeenText:
	text "Aunque estamos en"
	line "alta mar, ¡no"
	cont "puedo pescar!"

	para "¡Qué aburrimiento!"
	line "¡Luchemos!"
	done

FisherJonahBeatenText:
	text "Ya… Ya no me"
	line "aburro…"
	done

BlackbeltWaiSeenText:
	text "¡Entreno piernas"
	line "con el vaivén de"
	cont "este barco!"
	done

BlackbeltWaiBeatenText:
	text "¡Me han zarandeado"
	line "de lo lindo!"
	done

SailorKennethSeenText:
	text "¡Soy un marinero!"

	para "¡Y entreno #mon"
	line "para ser Campeón!"
	done

SailorKennethBeatenText:
	text "Me falta mucho"
	line "entrenamiento…"
	done

TeacherShirleySeenText:
	text "¡No pongas ni un"
	line "dedo encima a mis"
	cont "alumnos!"
	done

TeacherShirleyBeatenText:
	text "¡Aaaah!"
	done

SchoolboyNateSeenText:
	text "¿Conoces las"
	line "Ruinas Alfa?"
	done

SchoolboyNateBeatenText:
	text "¡Aaaarg!"
	done

SchoolboyRickySeenText:
	text "Hay unos raros"
	line "paneles de piedra"
	cont "en las Ruinas"
	cont "Alfa."
	done

SchoolboyRickyBeatenText:
	text "¡Me han vencido!"
	done
