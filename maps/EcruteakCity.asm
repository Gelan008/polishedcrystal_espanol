EcruteakCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, EcruteakCityFlyPoint

	def_warp_events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 23, 11, ECRUTEAK_HOUSE, 1
	warp_event 17,  9, ECRUTEAK_SHRINE_OUTSIDE, 3
	warp_event 18,  9, ECRUTEAK_SHRINE_OUTSIDE, 4
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  5, 17, VALERIES_HOUSE, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 29, 27, ECRUTEAK_CHERISH_BALL_HOUSE, 1
	warp_event 13, 17, ECRUTEAK_DESTINY_KNOT_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_JUMPTEXT, EcruteakCitySign
	bg_event  8, 28, BGEVENT_JUMPTEXT, EcruteakGymSign
	bg_event 21, 21, BGEVENT_JUMPTEXT, EcruteakDanceTheaterSign
	bg_event  7,  9, BGEVENT_JUMPTEXT, BurnedTowerSign
	bg_event 15, 11, BGEVENT_JUMPTEXT, EcruteakShrineSign
	bg_event 21, 11, BGEVENT_JUMPTEXT, EcruteakBarrierStationSign
	bg_event 21, 26, BGEVENT_JUMPTEXT, EcruteakCityAdvancedTips
	bg_event 25, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	bg_event 33, 16, BGEVENT_ITEM + RARE_CANDY, EVENT_ECRUTEAK_CITY_HIDDEN_RARE_CANDY
	bg_event  1, 17, BGEVENT_ITEM + ULTRA_BALL, EVENT_ECRUTEAK_CITY_HIDDEN_ULTRA_BALL
	bg_event  6,  6, BGEVENT_ITEM + ETHER, EVENT_ECRUTEAK_CITY_HIDDEN_ETHER

	def_object_events
	object_event 20, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps1Text, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps2Text, -1
	object_event 19, 26, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityLass1Text, -1
	object_event  8, 10, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 11, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityYoungsterText, -1
	object_event  3, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps3Text, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 11, 11, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityHexManiacText, -1
	object_event 11, 11, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCitySightseerMText, -1
	pokemon_event 12, 11, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_NPC_BROWN, EcruteakCitySmeargleText, -1
	object_event 16,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 19,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1

EcruteakCityFlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityLass2Script:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue_jumptextfaceplayer EcruteakCityLass2Text_ReleasedBeasts
	jumptextfaceplayer EcruteakCityLass2Text

EcruteakCityFisherScript:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer EcruteakCityFisherText_JasmineReturned
	jumptextfaceplayer EcruteakCityFisherText

EcruteakCityGramps1Text:
	text "Ciudad Iris solía"
	line "tener dos torres:"

	para "una al este y otra"
	line "al oeste."
	done

EcruteakCityGramps2Text:
	text "Ah, joven. ¿Sabes"
	line "bailar como las"
	cont "Chicas Kimono?"

	para "Dicen que en el"
	line "Teatro de Danza un"
	cont "viejo raro te dará"
	cont "algo bonito."
	done

EcruteakCityLass1Text:
	text "Voy a bendecir a"
	line "mis #mon en el"
	cont "santuario."
	cont "¿Te vienes?"
	done

EcruteakCityHexManiacText:
	text "Los espíritus de"
	line "#mon rondan"
	cont "este lugar…"
	done

EcruteakCitySightseerMText:
	text "Ciudad Iris tiene"
	line "una gran historia."

	para "Smeargle y yo"
	line "hemos venido a"
	cont "dibujarla."
	done

EcruteakCitySmeargleText:
	text "Smeargle: ¡Smeer!"
	done

EcruteakCityLass2Text:
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "¡Tres grandes"
	line "#mon huyeron"
	cont "en varias"
	cont "direcciones!"

	para "¿Qué serían?"
	done

EcruteakCityFisherText:
	text "I heard a rumor"
	line "about Olivine"
	cont "Lighthouse."

	para "The #mon that"
	line "serves as the"

	para "beacon fell ill."
	line "Sounds like they"
	cont "are in trouble."
	done

EcruteakCityFisherText_JasmineReturned:
	text "El #mon del"
	line "Faro de Olivo ya"
	cont "está curado."

	para "Los barcos pueden"
	line "navegar de noche"
	cont "con seguridad."
	done

EcruteakCityYoungsterText:
	text "Dicen que hay"
	line "#mon enfadados"
	cont "en el Lago de la"
	cont "Furia."

	para "¡Me gustaría"
	line "verlos!"
	done

EcruteakCityGramps3Text:
	text "En el pasado"
	line "lejano…"

	para "Esta torre ardió"
	line "en un incendio y"
	cont "tres #mon sin"
	cont "nombre murieron."

	para "Un #mon con los"
	line "colores del iris"
	cont "bajó de los cielos"
	cont "y los resucitó…"

	para "Es una leyenda que"
	line "han transmitido"
	cont "los Líderes del"
	cont "Gimnasio de Iris."

	para "¿Yo? ¡Fui un gran"
	line "entrenador hace ya"
	cont "mucho tiempo!"
	cont "¡Jo, jo, jo!"
	done

EcruteakCitySign:
	text "Ciudad Iris"
	line "Ciudad histórica"

	para "Donde el pasado y"
	line "el presente"
	cont "se unen"
	done

EcruteakGymSign:
	text "Líder del Gimnasio"
	line "#mon de"
	cont "Ciudad Iris:"
	cont "Morti"

	para "El adivino místico"
	line "del futuro"
	done

EcruteakCityAdvancedTips:
	text "¡Consejo Avanzado!"

	para "Ciertos #mon"
	line "pueden tener una"
	cont "habilidad rara,"

	para "¡conocida como"
	line "Habilidad Oculta!"

	para "Los #mon de un"
	line "Huevo también"
	cont "pueden tenerla."
	done

EcruteakDanceTheaterSign:
	text "Teatro de Danza de"
	line "Ciudad Iris"
	done

BurnedTowerSign:
	text "Torre Quemada"

	para "Destruida en un"
	line "extraño incendio."

	para "Por favor, no te"
	line "acerques. No es"
	cont "un lugar seguro."
	done

EcruteakShrineSign:
	text "Santuario de Iris"

	para "“La vida es cual"
	line "llama de candil"
	cont "frente al viento”"
	done

EcruteakBarrierStationSign:
	text "Estación Barrera a"
	line "la Torre Hojalata"

	para "Prohibido el paso"
	line "a los indignos"
	done
