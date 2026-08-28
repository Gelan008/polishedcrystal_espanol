Route17South_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17SouthAlwaysOnBikeCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 11, 69, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ETHER
	bg_event 10, 121, BGEVENT_ITEM + MAX_ELIXIR, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ELIXIR
	bg_event  9, 62, BGEVENT_JUMPTEXT, Route17SouthNotice1Text
	bg_event  9, 69, BGEVENT_JUMPTEXT, Route17SouthTrainerTips1Text
	bg_event  9, 92, BGEVENT_JUMPTEXT, Route17SouthTrainerTips2Text
	bg_event  9, 99, BGEVENT_JUMPTEXT, Route17SouthNotice2Text

	def_object_events
	object_event 12,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerDale, -1
	object_event  4, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerReilly, -1
	object_event 18, 22, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerJacob, -1
	object_event  2, 35, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerDan, -1
	object_event  3, 54, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerGlenn, -1
	object_event 11, 63, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerJoel, -1
	object_event 13, 70, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBikerAiden, -1
	object_event  3, 84, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerTeddy, -1
	object_event  6, 126, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 27, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRoughneckBrian, -1
	object_event  6, 40, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckTheron, -1
	object_event  4, 89, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckMarkey, -1

Route17SouthAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

GenericTrainerBikerReilly:
	generictrainer BIKER, REILLY, EVENT_BEAT_BIKER_REILLY, BikerReillySeenText, BikerReillyBeatenText

	text "¡No te crezcas,"
	line "mocoso de"
	cont "Johto!"
	done

BikerReillySeenText:
	text "¡Eh! Vienes de"
	line "Johto, ¿a que sí?"
	done

BikerReillyBeatenText:
	text "¡Uau, cómo pegas!"
	done

GenericTrainerBikerJoel:
	generictrainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText

	text "Parezco enrollado,"
	line "pero soy débil…"
	cont "¡Debo entrenar!"
	done

BikerJoelSeenText:
	text "¡Hala! ¡Qué Bici"
	line "tan chula llevas!"
	done

BikerJoelBeatenText:
	text "No solo tienes un"
	line "aspecto genial…"
	done

GenericTrainerBikerGlenn:
	generictrainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText

	text "Ir sin manos mola"
	line "un montón en el"
	cont "Camino de Bicis."
	done

BikerGlennSeenText:
	text "¡Oye! ¿Quieres un"
	line "combate fugaz?"
	done

BikerGlennBeatenText:
	text "¡Qué fugaz ha"
	line "sido!"
	done

GenericTrainerBikerDale:
	generictrainer BIKER, DALE, EVENT_BEAT_BIKER_DALE, BikerDaleSeenText, BikerDaleBeatenText

	text "¡Molas un montón!"
	line "¡No haces nada a"
	cont "medias!"
	done

BikerDaleSeenText:
	text "¡Tengo un buen"
	line "presentimiento!"
	done

BikerDaleBeatenText:
	text "Quizá me falló el"
	line "ojo…"
	done

GenericTrainerBikerJacob:
	generictrainer BIKER, JACOB, EVENT_BEAT_BIKER_JACOB, BikerJacobSeenText, BikerJacobBeatenText

	text "¿Mi moto? ¡Hablaba"
	line "de mi Bicicleta!"
	done

BikerJacobSeenText:
	text "¡Trucar mi moto me"
	line "cuesta una pasta!"

	para "¡Necesito un buen"
	line "empleo ya!"
	done

BikerJacobBeatenText:
	text "¡Maldita sea! ¡He"
	line "fracasado!"
	done

GenericTrainerBikerAiden:
	generictrainer BIKER, AIDEN, EVENT_BEAT_BIKER_AIDEN, BikerAidenSeenText, BikerAidenBeatenText

	text "¡Brum, brrruuum!"
	line "¡Ratatatatata…!"

	para "¡Mi imitación de"
	line "motor ha ganado"
	cont "en realismo!"
	done

BikerAidenSeenText:
	text "¡Brum, brum!"
	line "¿Qué tal mi"
	cont "imitación de motor?"
	done

BikerAidenBeatenText:
	text "Uf… Uf…"
	line "¡Me falta el aire!"
	done

GenericTrainerBikerDan:
	generictrainer BIKER, DAN, EVENT_BEAT_BIKER_DAN, BikerDanSeenText, BikerDanBeatenText

	text "Esta triste melodía"
	line "va mucho conmigo…"
	done

BikerDanSeenText:
	text "¡Tururú tururú!"
	line "Mi bocina suena"
	cont "genial, ¿verdad?"
	done

BikerDanBeatenText:
	text "Turuuuruuuu…"
	done

GenericTrainerBikerTeddy:
	generictrainer BIKER, TEDDY, EVENT_BEAT_BIKER_TEDDY, BikerTeddySeenText, BikerTeddyBeatenText

	text "¡Me gusta como"
	line "luchas!"

	para "¡Seré tu fan"
	line "número uno!"
	done

BikerTeddySeenText:
	text "¡Oye, qué Bici más"
	line "chula llevas!"
	done

BikerTeddyBeatenText:
	text "Buen combate."
	done

GenericTrainerRoughneckBrian:
	generictrainer ROUGHNECK, BRIAN, EVENT_BEAT_ROUGHNECK_BRIAN, RoughneckBrianSeenText, RoughneckBrianBeatenText

	text "¡Hasta luego!"
	line "¡Vuelve cuando"
	cont "quieras!"
	done

RoughneckBrianSeenText:
	text "¡Oye! ¿Quién te ha"
	line "dejado ir por"
	cont "aquí?"
	done

RoughneckBrianBeatenText:
	text "¡Vaya castañazo!"
	done

GenericTrainerRoughneckTheron:
	generictrainer ROUGHNECK, THERON, EVENT_BEAT_ROUGHNECK_THERON, RoughneckTheronSeenText, RoughneckTheronBeatenText

	text "¿Quieres unirte a"
	line "mi banda?"
	done

RoughneckTheronSeenText:
	text "¡Te espabilaré!"
	line "¡Vente conmigo!"
	done

RoughneckTheronBeatenText:
	text "¡He perdido!"
	done

GenericTrainerRoughneckMarkey:
	generictrainer ROUGHNECK, MARKEY, EVENT_BEAT_ROUGHNECK_MARKEY, RoughneckMarkeySeenText, RoughneckMarkeyBeatenText

	text "¡Ese gran grito ha"
	line "sido genial!"
	done

RoughneckMarkeySeenText:
	text "¡Eh, eh! ¡Que"
	line "estás en medio!"

	para "¡EN MEDIO!"
	done

RoughneckMarkeyBeatenText:
	text "¡Bien, gracias!"
	done

Route17SouthNotice1Text:
	text "Es un aviso."

	para "¡Atención a los"
	line "objetos tirados!"
	done

Route17SouthTrainerTips1Text:
	text "Pistas Entrenador"

	para "Cada #mon es"
	line "único."

	para "Dos #mon de la"
	line "misma especie y"
	cont "nivel crecen de"
	cont "forma distinta."
	done

Route17SouthTrainerTips2Text:
	text "Pistas Entrenador"

	para "Abre el menú con"
	line "Start para frenar"
	cont "en las cuestas."
	done

Route17SouthNotice2Text:
	text "Es un aviso."

	para "¡No te rindas y"
	line "tira # Balls!"
	done
