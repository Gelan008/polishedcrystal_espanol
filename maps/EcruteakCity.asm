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
	warp_event  5, 16, VALERIES_HOUSE, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 20, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 21, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 29, 27, ECRUTEAK_CHERISH_BALL_HOUSE, 1
	warp_event 13, 16, ECRUTEAK_DESTINY_KNOT_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 15, 21, BGEVENT_JUMPTEXT, EcruteakCitySign
	bg_event  7, 27, BGEVENT_JUMPTEXT, EcruteakGymSign
	bg_event 21, 21, BGEVENT_JUMPTEXT, EcruteakDanceTheaterSign
	bg_event  7,  9, BGEVENT_JUMPTEXT, BurnedTowerSign
	bg_event 15, 11, BGEVENT_JUMPTEXT, EcruteakShrineSign
	bg_event 21, 11, BGEVENT_JUMPTEXT, EcruteakBarrierStationSign
	bg_event  9, 15, BGEVENT_JUMPTEXT, EcruteakCityAdvancedTips
	bg_event 25, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	bg_event 33, 16, BGEVENT_ITEM + RARE_CANDY, EVENT_ECRUTEAK_CITY_HIDDEN_RARE_CANDY
	bg_event  1, 19, BGEVENT_ITEM + ULTRA_BALL, EVENT_ECRUTEAK_CITY_HIDDEN_ULTRA_BALL
	bg_event  6,  6, BGEVENT_ITEM + ETHER, EVENT_ECRUTEAK_CITY_HIDDEN_ETHER

	def_object_events
	object_event 20, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps1Text, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps2Text, -1
	object_event 20, 26, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityLass1Text, -1
	object_event  8, 10, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 11, 16, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityYoungsterText, -1
	object_event  3, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityGramps3Text, EVENT_ECRUTEAK_CITY_GRAMPS
	object_event 11, 11, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCityHexManiacText, -1
	object_event 11, 11, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakCitySightseerMText, -1
	pokemon_event 12, 11, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_BROWN, EcruteakCitySmeargleText, -1
	object_event 16,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 19,  9, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1

EcruteakCityFlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	endcallback

EcruteakCityLass2Script:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue_jumptextfaceplayer EcruteakCityLass2Text_ReleasedBeasts
	jumpthistextfaceplayer

	text "La torre que solía"
	line "estar aquí…"

	para "Mi abuela me dijo"
	line "que solía ser"
	cont "mucho más alta."
	done

EcruteakCityFisherScript:
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer EcruteakCityFisherText_JasmineReturned
	jumpthistextfaceplayer

	text "He oído un rumor"
	line "sobre el Faro de"
	cont "Olivo."

	para "El #mon que"
	line "sirve de faro se"

	para "ha puesto enfer-"
	line "mo. Parece que"
	cont "están en apuros."
	done

EcruteakCityGramps1Text:
	text "Ciudad Iris solía"
	line "tener dos torres:"

	para "una al este y otra"
	line "al oeste."
	done

EcruteakCityGramps2Text:
	text "Ah, joven."
	line "¿Has aprendido"

	para "a bailar como las"
	line "Chicas Kimono?"

	para "He oído que si vas"
	line "al Teatro de Danza"

	para "un viejo raro te"
	line "dará algo bonito."
	done

EcruteakCityLass1Text:
	text "Voy a que bendi-"
	line "gan a mis #mon"

	para "en el santuario."
	line "¿Te apetece venir?"
	done

EcruteakCityHexManiacText:
	text "Los espíritus de"
	line "#mon rondan"
	cont "este lugar…"
	done

EcruteakCitySightseerMText:
	text "Ciudad Iris tiene"
	line "una historia in-"
	cont "creíble."

	para "Smeargle y yo vi-"
	line "ajamos hasta aquí"
	cont "para dibujarla."
	done

EcruteakCitySmeargleText:
	text "Smeargle: ¡Smeer!"
	done


EcruteakCityLass2Text_ReleasedBeasts:
	text "Tres grandes #"
	line "mon salieron co-"
	cont "rriendo en direc-"
	cont "ciones distintas."
	cont "¿Qué eran?"
	done


EcruteakCityFisherText_JasmineReturned:
	text "El #mon del Fa-"
	line "ro de Olivo ha"
	cont "sido curado."

	para "Los barcos pueden"
	line "volver a salir a"
	cont "navegar por la"
	cont "noche con seguri-"
	cont "dad."
	done

EcruteakCityYoungsterText:
	text "He oído que hay #"
	line "mon alborotando en"

	para "el Lago de la Fu-"
	line "ria. Me gustaría"
	cont "verlo."
	done

EcruteakCityGramps3Text:
	text "En el pasado"
	line "distante…"

	para "Esta torre ardió"
	line "en un incendio."
	cont "Tres #mon sin"

	para "nombre perecieron"
	line "en él."

	para "Un #mon con co-"
	line "lores del arcoíris"
	cont "descendió"

	para "del cielo y los"
	line "resucitó…"

	para "Es una leyenda que"
	line "se ha transmitido"

	para "por los Líderes de"
	line "Gimnasio de Iris."

	para "¿Yo?"

	para "Fui entrenador ha-"
	line "ce mucho tiempo."
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
	text "¡Pistas Entren.!"

	para "Algunos #mon que"
	line "encuentres pueden"

	para "tener una rara ha-"
	line "bilidad, ¡también"

	para "conocida como"
	line "Habilidad Oculta!"

	para "Un #mon salido"
	line "del huevo también"

	para "tiene una pequeña"
	line "probabilidad de"
	cont "tener una."
	done

EcruteakDanceTheaterSign:
	text "Teatro de Danza de"
	line "Ciudad Iris"
	done

BurnedTowerSign:
	text "Torre Quemada"

	para "Fue destruida en"
	line "un misterioso in-"
	cont "cendio."

	para "Por favor, mantén-"
	line "te alejado. No es"
	cont "segura."
	done

EcruteakShrineSign:
	text "Santuario de Iris"

	para "“La vida es la"
	line "llama de una lám-"
	cont "para frente al"
	cont "viento”"
	done

EcruteakBarrierStationSign:
	text "Estación Barrera a"
	line "la Torre Campana"

	para "Prohibido el paso"
	line "a los indignos"
	done
