Route13_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 13, BGEVENT_JUMPTEXT, Route13TrainerTips1Text
	bg_event 53,  5, BGEVENT_JUMPTEXT, Route13TrainerTips2Text
	bg_event 51, 11, BGEVENT_JUMPTEXT, Route13SignText
	bg_event 17, 13, BGEVENT_JUMPTEXT, Route13DirectionsSignText
	bg_event 36, 13, BGEVENT_ITEM + CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM
	bg_event  5, 15, BGEVENT_ITEM + OVAL_STONE, EVENT_ROUTE_13_HIDDEN_OVAL_STONE

	def_object_events
	object_event  5,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperClark, -1
	object_event 16,  6, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPicnickerGinger, -1
	object_event 60, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBird_keeperPerry, -1
	object_event 64,  1, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBret, -1
	object_event 34,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperTanner, -1
	object_event 65,  9, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerPiper, -1
	object_event 52,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleTimandsue1, -1
	object_event 53,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleTimandsue2, -1
	object_event 38,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanmAlex, -1
	object_event 21, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route13GrampsScript, -1
	cuttree_event 54,  4, EVENT_ROUTE_13_CUT_TREE

Route13GrampsScript:
	special CheckIfTrendyPhraseIsLucky
	iftruefwd .lucky
	jumpthistextfaceplayer

	text "Hoy no logro ver"
	line "la Isla Suerte…"

	para "¡Pero sé de sobra"
	line "que ha aparecido"
	cont "otras veces!"
	done

.lucky
	jumpthistextfaceplayer

	text "¡Hoy sí puedo ver"
	line "la Isla Suerte!"
	cont "¡Vaya espectáculo!"
	done

GenericTrainerCamperClark:
	generictrainer CAMPER, CLARK, EVENT_BEAT_CAMPER_CLARK, .SeenText, .BeatenText

	text "Da igual qué cla-"
	line "se de preparativos"
	cont "hayas hecho."

	para "Si pierdes, has"
	line "perdido."
	done

.SeenText:
	text "¡A por agua! ¡Que"
	line "no se apague la"
	cont "fogata!"

	para "¡Cuidado con los"
	line "#mon salvajes!"

	para "¡Adelante,"
	line "campistas!"
	done

.BeatenText:
	text "Pfffff…"
	done

GenericTrainerPicnickerGinger:
	generictrainer PICNICKER, GINGER, EVENT_BEAT_PICNICKER_GINGER, .SeenText, .BeatenText

	text "¡Te puedes"
	line "comunicar con los"
	cont "#mon silbando"
	cont "en vez de con"
	cont "palabras!"
	done

.SeenText:
	text "¿Por qué me entran"
	line "siempre ganas de"
	cont "silbar al aire"
	cont "libre?"
	done

.BeatenText:
	text "¡Fiuuuu!"
	done

GenericTrainerBird_keeperPerry:
	generictrainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText

	text "Tus #mon están"
	line "asombrosamente"
	cont "bien entrenados."
	done

Bird_keeperPerrySeenText:
	text "La agilidad es la"
	line "clave de los"
	cont "#mon pájaro."
	done

Bird_keeperPerryBeatenText:
	text "Me has ganado con"
	line "tu velocidad…"
	done

GenericTrainerBird_keeperBret:
	generictrainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText

	text "Si los cepillas,"
	line "los #mon se"
	cont "ponen contentos."
	done

Bird_keeperBretSeenText:
	text "Mira a mis"
	line "#mon."

	para "Fíjate bien en"
	line "sus colores y en"
	cont "su plumaje."
	done

Bird_keeperBretBeatenText:
	text "¡Rayos! ¡No ha"
	line "sido suficiente!"
	done

GenericTrainerCamperTanner:
	generictrainer CAMPER, TANNER, EVENT_BEAT_CAMPER_TANNER, .SeenText, .BeatenText

	text "Pensaba que sería"
	line "fácil dejarte"
	cont "fuera de combate…"
	done

.SeenText:
	text "¡Me da tiempo a un"
	line "combate rápido"
	cont "mientras preparo"
	cont "la comida!"
	done

.BeatenText:
	text "Vaya, qué hambre…"
	done

GenericTrainerPicnickerPiper:
	generictrainer PICNICKER, PIPER, EVENT_BEAT_PICNICKER_PIPER, .SeenText, .BeatenText

	text "Por cómo andabas,"
	line "pensé que podría"
	cont "ganarte."
	done

.SeenText:
	text "¿Qué tal si saca-"
	line "mos a tus #mon"

	para "y a los míos para"
	line "un combate?"
	done

.BeatenText:
	text "Vaya, qué mala"
	line "suerte…"
	done

GenericTrainerCoupleTimandsue1:
	generictrainer COUPLE, TIMANDSUE1, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText

	text "Tim: Si le has ga-"
	line "nado a ella, ¡de-"
	cont "bes de ser fuerte!"
	done

.SeenText:
	text "Tim: Te daré una"
	line "pequeña pista."

	para "¡Mi novia es más"
	line "fuerte que yo!"
	done

.BeatenText:
	text "Tim: ¡Eres quien"
	line "más fuerza tiene!"
	done

GenericTrainerCoupleTimandsue2:
	generictrainer COUPLE, TIMANDSUE2, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText

	text "Sue: Esa fuerza"
	line "que tienes…"
	cont "¡Ya caigo!"

	para "¿Estás enamo-"
	line "rado?"
	done

.SeenText:
	text "Sue: Las mujeres"
	line "que no se toman el"

	para "amor en serio pue-"
	line "den salir heridas."
	done

.BeatenText:
	text "Sue: Ja, ja…"
	done

GenericTrainerPokefanmAlex:
	generictrainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText

	text "¿Acaso no desea"
	line "todo el mundo lle-"
	cont "gar a ser rey?"
	done

PokefanmAlexSeenText:
	text "¡Inclínate ante mi"
	line "regio #mon!"
	done

PokefanmAlexBeatenText:
	text "¿Cómo… te atreves"
	line "a burlarte de la"
	cont "realeza?"
	done

GenericTrainerPokefanmJoshua:
	generictrainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText

	text "Se nota que tienes"
	line "muchos #mon,"

	para "pero Pikachu sigue"
	line "siendo el mejor."
	done

PokefanmJoshuaSeenText:
	text "¡Ji, ji, ji! ¿Te"
	line "gustaría luchar"
	cont "contra mi banda de"
	cont "Pikachu?"
	done

PokefanmJoshuaBeatenText:
	text "¡Pi-Pikachu!"
	done

GenericTrainerHikerKenny:
	generictrainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText

	text "Las formaciones"
	line "geológicas no pa-"
	cont "recen cambiar."

	para "Pero en realidad"
	line "cambian poco a"
	cont "poco."
	done

HikerKennySeenText:
	text "Debería ir al Tú-"
	line "nel Roca a por un"
	cont "Onix."
	done

HikerKennyBeatenText:
	text "He perdido…"
	done

Route13TrainerTips1Text:
	text "Pistas Entren."

	para "¡Mira! Justo ahí,"
	line "a la izquierda"
	cont "del poste."
	done

Route13TrainerTips2Text:
	text "Pistas Entren."

	para "Ciertos #mon"
	line "requieren objetos"
	cont "para evolucionar."

	para "¡Si tienes suerte,"
	line "un #mon salvaje"

	para "podría llevar su"
	line "objeto evolutivo!"
	done

Route13SignText:
	text "Ruta 13"

	para "Al norte:"
	line "Puente Silencio"
	done

Route13DirectionsSignText:
	text "Al norte:"
	line "Pueblo Lavanda"

	para "Al oeste:"
	line "Ciudad Fucsia"
	done
