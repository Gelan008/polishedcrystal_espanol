Route3_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route3FlyPoint

	def_warp_events
	warp_event 68,  1, MOUNT_MOON_1F, 1
	warp_event 61,  3, ROUTE_3_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 63, 15, BGEVENT_JUMPTEXT, Route3MtMoonSquareSignText
	bg_event 11, 17, BGEVENT_ITEM + MOON_STONE, EVENT_ROUTE_3_HIDDEN_MOON_STONE
	bg_event  8, 15, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event  8, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event  9, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 12, 15, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 14, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText
	bg_event 15, 17, BGEVENT_JUMPTEXT, Route3MeteoriteText

	def_object_events
	object_event 12,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterRegis, -1
	object_event 17,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterJimmy, -1
	object_event 25,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterWarren, -1
	object_event 30, 12, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherOtis, -1
	object_event 60, 10, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherBurt, -1
	object_event 44,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBlackbeltManford, -1
	object_event 52, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltAnder, -1
	object_event 38,  6, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerBruce, -1
	object_event 61, 19, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerHikerDwight, -1
	object_event 14, 12, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoZacandjen1, -1
	object_event 15, 12, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoZacandjen2, -1
	itemball_event 36, 14, BIG_ROOT, 1, EVENT_ROUTE_3_BIG_ROOT

Route3FlyPoint:
	setflag ENGINE_FLYPOINT_MT_MOON
	endcallback

GenericTrainerYoungsterRegis:
	generictrainer YOUNGSTER, REGIS, EVENT_BEAT_YOUNGSTER_REGIS, .SeenText, .BeatenText

	text "¡Parece que nece-"
	line "sito entrenar más!"
	done

.SeenText:
	text "¿Joven? ¡Cielo"
	line "santo, qué falta"
	cont "de respeto!"

	para "¡Llámame el Chico"
	line "Pantalones Cortos!"
	done

.BeatenText:
	text "Más bien…"
	line "Chico Fracaso…"
	done

GenericTrainerYoungsterJimmy:
	generictrainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, .SeenText, .BeatenText

	text "Llevo pantalones"
	line "cortos todo el año."

	para "Ese es mi estilo."
	done

.SeenText:
	text "¡Puedo correr como"
	line "el viento!"
	done

.BeatenText:
	text "¡Por los aires!"
	done

GenericTrainerYoungsterWarren:
	generictrainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, .SeenText, .BeatenText

	text "Parecías fuerte."

	para "Me daba miedo en-"
	line "frentarme a ti…"
	done

.SeenText:
	text "Ummm… No sé qué"
	line "debería hacer…"
	done

.BeatenText:
	text "Sabía que iba a"
	line "perder…"
	done

GenericTrainerFirebreatherOtis:
	generictrainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, .SeenText, .BeatenText

	text "Cuando llueve,"
	line "cuesta un montón"
	cont "prender fuego…"
	done

.SeenText:
	text "¡Ah! Hace un tiem-"
	line "po tan bueno como"
	cont "siempre."
	done

.BeatenText:
	text "Hace sol, pero es-"
	line "toy empapado…"
	done

GenericTrainerFirebreatherBurt:
	generictrainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, .SeenText, .BeatenText

	text "El mejor tragafue-"
	line "gos de Kanto, ¡ese"
	cont "mismo soy yo!"

	para "Pero no el mejor"
	line "entrenador…"
	done

.SeenText:
	text "¡Acérquense y ve-"
	line "an el espectáculo!"
	done

.BeatenText:
	text "¡Uf! ¡Cómo quema!"
	done

GenericTrainerBlackbeltManford:
	generictrainer BLACKBELT_T, MANFORD, EVENT_BEAT_BLACKBELT_MANFORD, .SeenText, .BeatenText

	text "¡Debes de haberte"
	line "formado con un"
	cont "gran maestro!"
	done

.SeenText:
	text "¡Para un momento y"
	line "dame la oportuni-"
	cont "dad de vencerte!"
	done

.BeatenText:
	text "Me venciste en mi"
	line "propio terreno…"
	done

GenericTrainerBlackbeltAnder:
	generictrainer BLACKBELT_T, ANDER, EVENT_BEAT_BLACKBELT_ANDER, .SeenText, .BeatenText

	text "¿Has venido desde"
	line "Johto?"

	para "¡Debes de ser al-"
	line "guien muy tenaz!"
	done

.SeenText:
	text "¡Espera un poco!"
	line "¡Ven a luchar!"
	done

.BeatenText:
	text "Lo lograste…"
	done

GenericTrainerHikerBruce:
	generictrainer HIKER, BRUCE, EVENT_BEAT_HIKER_BRUCE, .SeenText, .BeatenText

	text "Bueno, ¡supongo"
	line "que toca cargar"
	cont "la Mochila otra"
	cont "vez!"
	done

.SeenText:
	text "¡La Mochila se me"
	line "clava en los hom-"
	cont "bros!"

	para "¡Descansaré con un"
	line "buen combate!"
	done

.BeatenText:
	text "Bah."
	done

GenericTrainerHikerDwight:
	generictrainer HIKER, DWIGHT, EVENT_BEAT_HIKER_DWIGHT, .SeenText, .BeatenText

	text "Saludar a alguien"
	line "a quien no cono-"
	cont "ces…"

	para "¡Es lo mejor de la"
	line "montaña!"
	done

.SeenText:
	text "¡Paz!"

	para "Cuando te encuen-"
	line "tras a un descono-"
	cont "cido en un camino"

	para "de montaña, buscas"
	line "paz, ¿verdad?"
	done

.BeatenText:
	text "¡Paz! Aunque haya"
	line "perdido…"
	done

GenericTrainerAceDuoZacandjen1:
	generictrainer ACE_DUO, ZACANDJEN1, EVENT_BEAT_ACE_DUO_ZAC_AND_JEN, .SeenText, .BeatenText

	text "Zac: Tu futuro"
	line "parece prometedor."
	done

.SeenText:
	text "Zac: ¿De verdad"
	line "quieres luchar"
	cont "contra nosotros?"

	para "Tienes valor para"
	line "ser tan joven."
	done

.BeatenText:
	text "Zac: No ibas de"
	line "farol…"
	done

GenericTrainerAceDuoZacandjen2:
	generictrainer ACE_DUO, ZACANDJEN2, EVENT_BEAT_ACE_DUO_ZAC_AND_JEN, .SeenText, .BeatenText

	text "Jen: Tengo ganas"
	line "de ver qué clase"

	para "de entrenador"
	line "llegarás a ser."
	done

.SeenText:
	text "Jen: ¿Eh? ¿Quieres"
	line "retarnos? ¡Genial!"
	done

.BeatenText:
	text "Jen: Eres mucho"
	line "más fuerte de lo"
	cont "que pensaba."
	done

Route3MeteoriteText:
	text "¡Nunca había visto"
	line "una piedra así!"

	para "¿Podría ser…"
	line "un meteorito del"
	cont "espacio?"
	done

Route3MtMoonSquareSignText:
	text "Túnel del"
	line "Monte Moon"
	done
