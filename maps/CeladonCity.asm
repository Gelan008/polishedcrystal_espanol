CeladonCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeladonCityFlyPoint

	def_warp_events
	warp_event  8,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 20,  9, CELADON_MANSION_1F, 1
	warp_event 20,  3, CELADON_MANSION_1F, 3
	warp_event 21,  3, CELADON_MANSION_1F, 3
	warp_event 33,  9, CELADON_POKECENTER_1F, 1
	warp_event 22, 19, CELADON_GAME_CORNER, 1
	warp_event 27, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 12, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1
	warp_event 29, 29, CELADON_CHIEF_HOUSE, 1
	warp_event 35, 29, CELADON_HOTEL_1F, 1
	warp_event 13,  9, CELADON_HOME_DECOR_STORE_1F, 1
	warp_event  4, 29, CELADON_UNIVERSITY_1F, 1
	warp_event 29,  9, EUSINES_HOUSE, 1
	warp_event 33, 19, CELADON_OLD_MAN_SPEECH_HOUSE, 1
	warp_event 37, 19, CELADON_DEVELOPMENT_SPEECH_HOUSE, 1
	warp_event  9,  9, CELADON_DEPT_STORE_1F, 2
	warp_event 23, 19, CELADON_GAME_CORNER, 2
	warp_event  5, 29, CELADON_UNIVERSITY_1F, 2

	def_coord_events

	def_bg_events
	bg_event 11, 18, BGEVENT_JUMPTEXT, CeladonCitySignText
	bg_event 13, 29, BGEVENT_JUMPTEXT, CeladonGymSignText
	bg_event  3, 31, BGEVENT_JUMPTEXT, CeladonUniversitySignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, CeladonCityDeptStoreSignText
	bg_event 14,  9, BGEVENT_JUMPTEXT, CeladonCityHomeDecorStoreSignText
	bg_event 17,  9, BGEVENT_JUMPTEXT, CeladonCityMansionSignText
	bg_event 21, 21, BGEVENT_JUMPTEXT, CeladonCityGameCornerSignText
	bg_event 27, 21, BGEVENT_JUMPTEXT, CeladonCityPrizeExchangeSignText
	bg_event 23, 29, BGEVENT_JUMPTEXT, CeladonCityCafeSignText
	bg_event 33, 29, BGEVENT_JUMPTEXT, CeladonCityHotelSignText
	bg_event 33, 21, BGEVENT_JUMPTEXT, CeladonCityTrainerTips1Text
	bg_event 21, 15, BGEVENT_JUMPTEXT, CeladonCityTrainerTips2Text
	bg_event 41, 21, BGEVENT_ITEM + PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

	def_object_events
	object_event  4, 15, SPRITE_RICH_BOY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityScript, -1
	object_event 30, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityFisherText, -1
	pokemon_event 31, 11, POLIWRATH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, CeladonCityPoliwrathText, -1
	object_event 24, 24, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityTeacher1Text, -1
	object_event 17, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityGramps1Text, -1
	object_event 10, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityGramps2Text, -1
	object_event 22, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityYoungster1Text, -1
	object_event 27, 32, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityYoungster2Text, -1
	object_event 12, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityTeacher2Text, -1
	object_event 10, 22, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityLassText_PCC, -1
	object_event 45, 10, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_7_SNORLAX
	object_event 35, 23, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonCityLassText, -1
	itemball_event 39,  7, MAX_ETHER, 1, EVENT_CELADON_CITY_MAX_ETHER
	cuttree_event 32, 34, EVENT_CELADON_CITY_CUT_TREE

CeladonCityFlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	endcallback

CeladonCityScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SWAGGER_INTRO
	iftruefwd CeladonCityTutorSwaggerScript
	writetext CeladonCityRichBoyText
	waitbutton
	setevent EVENT_LISTENED_TO_SWAGGER_INTRO
CeladonCityTutorSwaggerScript:
	writetext Text_CeladonCityTutorSwagger
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CeladonCityTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SWAGGER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "¡Adiós entonces!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "…¿No tienes la"
	line "Hoja Plata?"
	cont "Qué pena."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Contempla! ¡Tu"
	line "#mon aprendió"
	cont "Contoneo!"
	done

CeladonCityRichBoyText:
	text "¿No es maravilloso"
	line "mi traje?"

	para "¡Hago girar"
	line "cabezas cuando me"
	cont "contoneo por la"
	cont "calle!"

	para "¡La gente me ama!"

	para "Hoy estoy de humor"
	line "generoso."
	done

Text_CeladonCityTutorSwagger:
	text "Enseñaré a tu"
	line "#mon a hacer"
	cont "Contoneo como yo"
	cont "por solo una Hoja"
	cont "Plata."
	done

Text_CeladonCityTutorQuestion:
	text "¿Deseas que le"
	line "enseñe Contoneo a"
	cont "tu #mon?"
	done

CeladonCityFisherText:
	text "Este Poliwrath es"
	line "mi compañero."

	para "Solía ser Manso,"
	line "pero la dueña del"
	cont "edificio nos"
	cont "preparó té con"
	cont "una Hoja Menta"
	cont "que lo hizo más"
	cont "Alegre."
	done

CeladonCityPoliwrathText:
	text "Poliwrath: ¡Croac!"
	done

CeladonCityTeacher1Text:
	text "Volví a perder"
	line "en las"
	cont "tragaperras…"

	para "Nosotras las"
	line "chicas también"
	cont "jugamos ahora."

	para "Tú también"
	line "deberías echarles"
	cont "un vistazo."
	done

CeladonCityGramps1Text:
	text "Últimamente"
	line "aparecen muchos"
	cont "Grimer."

	para "¿Ves ese estanque"
	line "frente a la casa?"
	cont "¡Los Grimer viven"
	cont "allí ahora!"

	para "¿De dónde habrán"
	line "salido? Es un"
	cont "problema grave…"
	done

CeladonCityGramps2Text:
	text "¡Ji, ji! ¡Este"
	line "Gimnasio es"
	cont "genial!"

	para "¡Aquí solo"
	line "admiten chicas!"
	done

CeladonCityYoungster1Text:
	text "¿Quieres saber"
	line "un secreto?"

	para "La Mansión Azulona"
	line "tiene una puerta"
	cont "trasera."
	done

CeladonCityYoungster2Text:
	text "Ese restaurante"
	line "celebra hoy un"
	cont "concurso de"
	cont "tragones."

	para "Hay una chica de"
	line "Sinnoh compitiendo"
	cont "este año."

	para "Solo de verla"
	line "devorar comida me"
	cont "siento lleno…"
	done

CeladonCityTeacher2Text:
	text "El Centro"
	line "Comercial de"
	cont "Azulona tiene la"
	cont "mejor selección de"
	cont "artículos."

	para "Si no puedes"
	line "conseguirlo ahí,"
	cont "no lo hallarás en"
	cont "ningún sitio."

	para "Vaya… Parezco"
	line "una dependienta."
	done

CeladonCityLassText_PCC:
	text "¡Me encanta estar"
	line "rodeada de"
	cont "edificios altos!"

	para "¿Es verdad que el"
	line "Centro #mon de"
	cont "Trigal es mucho"
	cont "más grande?"

	para "¡Qué pasada!"
	line "Ojalá tuviéramos"
	cont "un sitio así en"
	cont "Kanto…"
	done

CeladonCityLassText:
	text "Ofrecen #mon"
	line "como premios en el"
	cont "Casino."

	para "Pobrecitos…"
	done

CeladonCitySignText:
	text "Ciudad Azulona"

	para "La Ciudad de los"
	line "Sueños Irisados"
	done

CeladonGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Azulona"
	cont "Líder: Erika"

	para "La princesa amante"
	line "de la naturaleza"
	done

CeladonUniversitySignText:
	text "Universidad"
	line "Azulona"

	para "“Crecimiento"
	line "mediante el"
	cont "estudio”"
	done

CeladonCityDeptStoreSignText:
	text "¡Encuentra lo que"
	line "necesitas en el"
	cont "C. C. Azulona!"
	done

CeladonCityHomeDecorStoreSignText:
	text "Ala de Decoración"
	line "del C.C. Azulona"
	done

CeladonCityMansionSignText:
	text "Mansión Azulona"
	done

CeladonCityGameCornerSignText:
	text "¡Diversión para"
	line "todos!"

	para "Casino de"
	line "Ciudad Azulona"
	done

CeladonCityPrizeExchangeSignText:
	text "¡Canjea monedas"
	line "por premios!"
	cont "Cambio de Premios"
	done

CeladonCityCafeSignText:
	text "Restaurante"
	line "Azulona"

	para "¡Hoy Concurso de"
	line "Tragones todo el"
	cont "día!"
	done

CeladonCityHotelSignText:
	text "Hotel Azulona"

	para "¡Relájate en"
	line "nuestra piscina!"
	done

CeladonCityTrainerTips1Text:
	text "Pistas Entrenador"

	para "Protección X"
	line "protege a tus"
	cont "#mon de los"
	cont "cambios de"
	cont "características."

	para "¡Consigue tus"
	line "objetos en el C.C."
	cont "de Azulona!"
	done

CeladonCityTrainerTips2Text:
	text "Pistas Entrenador"

	para "Eevee es un"
	line "#mon lleno de"
	cont "potencial."

	para "Prueba a llevarlo"
	line "a varios lugares,"
	cont "horas del día y"
	cont "Piedras Evolutivas"
	cont "para evolucionar."
	done
