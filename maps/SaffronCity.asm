SaffronCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SaffronCityFlyPoint

	def_warp_events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  1, ROUTE_5_SAFFRON_CITY_GATE, 3
	warp_event  0, 18, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 19, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 35, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 35, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 18, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 19, ROUTE_8_SAFFRON_GATE, 2
	warp_event 32, 11, POKEMON_TRAINER_FAN_CLUB, 1
	warp_event  5, 29, SAFFRON_ORRE_SPEECH_HOUSE, 1
	warp_event 13, 29, SAFFRON_BOOK_SPEECH_HOUSE, 1
	warp_event 21, 29, SAFFRON_HITMONTOP_KID_HOUSE, 1
	warp_event 13, 11, SAFFRON_RICH_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_JUMPTEXT, SaffronCitySignText
	bg_event 33,  5, BGEVENT_JUMPTEXT, SaffronGymSignText
	bg_event 25,  5, BGEVENT_JUMPTEXT, FightingDojoSignText
	bg_event 15, 21, BGEVENT_JUMPTEXT, SilphCoSignText
	bg_event 25, 29, BGEVENT_JUMPTEXT, MrPsychicsHouseSignText
	bg_event 11,  5, BGEVENT_JUMPTEXT, SaffronCityMagnetTrainStationSignText
	bg_event 35, 11, BGEVENT_JUMPTEXT, PokemonTrainerFanClubSignText
	bg_event  5, 21, BGEVENT_JUMPTEXT, SaffronTrainerTips1Text
	bg_event 35, 21, BGEVENT_JUMPTEXT, SaffronTrainerTips2Text

	def_object_events
	object_event  7, 14, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 18, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityCooltrainerMText, -1
	object_event 20, 24, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityCooltrainerFText, -1
	object_event 35, 14, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityYoungster1Text, -1
	object_event 35, 23, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityYoungster2Text, -1
	object_event 14,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityLass2Text, -1
	object_event  3, 24, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 4, 0, (1 << MORN) | (1 << EVE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityBlackBelt1Text, -1
	object_event  4, 25, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, (1 << DAY) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityBlackBelt2Text, -1
	object_event 22,  8, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCitySuperNerdText, -1
	object_event 23, 22, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCityScientistText, -1
	object_event 11, 22, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 4, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronCitySilphEmployeeText, -1

SaffronCityFlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	endcallback

SaffronCityLass1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityLass1Text_ReturnedMachinePart
	jumptextfaceplayer SaffronCityLass1Text

SaffronCityPokefanMScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityPokefanMText_ReturnedMachinePart
	jumptextfaceplayer SaffronCityPokefanMText

SaffronCityFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronCityFisherText_ReturnedMachinePart
	jumptextfaceplayer SaffronCityFisherText

SaffronCityLass1Text:
	text "A little girl who"
	line "is an expert at"

	para "mimicking people"
	line "lives here."

	para "She even mimics"
	line "the people she's"

	para "conversing with."
	line "It's confusing."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "La Copiona parecía"
	line "muy triste."

	para "Dijo que había"
	line "perdido su Muñeco"
	cont "# favorito:"
	cont "un Clefairy."
	done

SaffronCityPokefanMText:
	text "You came out from"
	line "Johto?"

	para "You can zip back"
	line "home if the Magnet"
	cont "Train's running."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "¿Vienes de Johto?"

	para "Volverás en un"
	line "periquete con el"
	cont "Magnetotrén."
	done

SaffronCityCooltrainerMText:
	text "Fui al Gimnasio"
	line "con ganas de un"
	cont "buen combate…"

	para "¡Pero me metí sin"
	line "querer en el Dojo"
	cont "Kárate de al lado!"

	para "Vaya corte pasé…"
	done

SaffronCityCooltrainerFText:
	text "Es Silph S.A.,"
	line "famosa por sus"
	cont "productos #mon."

	para "Por eso el Team"
	line "Rocket quiso tomar"
	cont "el control en el"
	cont "pasado."
	done

SaffronCityFisherText:
	text "Chew… Chew…"

	para "I hear there's big"
	line "trouble brewing at"
	cont "the Power Plant."

	para "Chew… Chew…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Ñam… Ñam…"

	para "He oído que hubo"
	line "un grave problema"
	cont "en la Central"
	cont "de Energía."

	para "Ñam… Ñam…"
	line "¡Uff, estoy lleno!"
	done

SaffronCityYoungster1Text:
	text "Entrar en un"
	line "callejón me da"
	cont "bastante reparo."
	done

SaffronCityYoungster2Text:
	text "En Ciudad Verde"
	line "está la Casa del"

	para "Entrenador, donde"
	line "se reúnen muchos"
	cont "entrenadores."
	done

SaffronCityLass2Text:
	text "Hablaron de la"
	line "ciudad en un"
	cont "programa de radio."

	para "Da gusto oír los"
	line "elogios, pero da"
	cont "algo de vergüenza."
	done

SaffronCityBlackBelt1Text:
	text "Cada mañana, al"
	line "levantarme, doy"
	cont "dos vueltas a la"
	cont "ciudad."

	para "¡Es genial para"
	line "empezar el día!"
	done

SaffronCityBlackBelt2Text:
	text "Si yo fuese un"
	line "objeto, sería un"
	cont "Ataque X."

	para "¡Reboso energía, y"
	line "la X le da un aire"
	cont "muy chulo!"
	done

SaffronCitySuperNerdText:
	text "Hubo un tiempo en"
	line "el que los #mon"

	para "de tipo Psíquico"
	line "se consideraban"

	para "los más fuertes, y"
	line "los de tipo Bicho,"
	cont "los más débiles."

	para "¡Lo irónico es que"
	line "el tipo Bicho es"

	para "muy eficaz contra"
	line "el Psíquico!"
	done

SaffronCityScientistText:
	text "El Visor Silph"
	line "antiguo tenía"
	cont "fallos, así que"

	para "trabajamos en su"
	line "sucesor: ¡el Visor"
	cont "Silph 2!"
	done

SaffronCitySilphEmployeeText:
	text "El nombre Silph"
	line "viene de un ser"
	cont "mítico del aire."

	para "Qué tiene que ver"
	line "eso y la empresa,"
	cont "no tengo ni idea."
	done

SaffronCitySignText:
	text "Ciudad Azafrán"

	para "Tierra comercial"
	line "dorada y brillante"
	done

SaffronGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Azafrán"
	cont "Líder: Sabrina"

	para "¡La maestra de los"
	line "#mon Psíquicos!"
	done

FightingDojoSignText:
	text "¡Bienvenidos a"
	line "todos!"
	cont "Dojo Kárate"
	done

SilphCoSignText:
	text "Silph S.A."
	line "Edificio oficinas"
	done

MrPsychicsHouseSignText:
	text "Casa del"
	line "Sr. Psíquico"
	done

SaffronCityMagnetTrainStationSignText:
	text "Estación del"
	line "Magnetotrén de"
	cont "Ciudad Azafrán"
	done

PokemonTrainerFanClubSignText:
	text "Club de Fans de"
	line "Entrenadores #"

	para "Muchos dejaron"
	line "sus nombres aquí"
	cont "garabateados…"
	done

SaffronTrainerTips1Text:
	text "Pistas Entrenador"

	para "¡El nuevo Visor"
	line "Silph 2 permite"
	cont "identificar hasta"
	cont "al #mon oculto!"
	done

SaffronTrainerTips2Text:
	text "Pistas Entrenador"

	para "Usa Veloz Balls al"
	line "inicio y Turno"
	cont "Balls más tarde."

	para "Cuestan más que"
	line "las Poké Balls,"
	cont "pero son mucho más"
	cont "prácticas."
	done
