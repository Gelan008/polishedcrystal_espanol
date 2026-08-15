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
	text "¡Eh, tú! Vienes de"
	line "Johto, ¿a que sí?"
	done

BikerReillyBeatenText:
	text "¡Uau, cómo pegas!"
	done

GenericTrainerBikerJoel:
	generictrainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText

	text "Parezco enrollado,"
	line "pero soy débil."

	para "La verdad es que"
	line "no molo nada."

	para "Tengo que entre-"
	line "nar más duro…"
	done

BikerJoelSeenText:
	text "¡Hala! ¡Qué Bici-"
	line "cleta más chula!"
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
	line "combate a toda"
	cont "velocidad?"
	done

BikerGlennBeatenText:
	text "¡Ay va! ¡Tienes"
	line "una aceleración"
	cont "increíble!"
	done

GenericTrainerBikerDale:
	generictrainer BIKER, DALE, EVENT_BEAT_BIKER_DALE, BikerDaleSeenText, BikerDaleBeatenText

	text "¡Molas un montón!"
	line "¡No haces nada a"
	cont "medias!"
	done

BikerDaleSeenText:
	text "¡Vas a perder!"
	line "¡Tengo una cora-"
	cont "zonada!"
	done

BikerDaleBeatenText:
	text "Quizá me haya fa-"
	line "llado el ojo…"
	done

GenericTrainerBikerJacob:
	generictrainer BIKER, JACOB, EVENT_BEAT_BIKER_JACOB, BikerJacobSeenText, BikerJacobBeatenText

	text "¿Mi moto? ¡Hablaba"
	line "de mi Bicicleta!"
	done

BikerJacobSeenText:
	text "¡Trucar mi moto me"
	line "cuesta una pasta!"

	para "¡Necesito un tra-"
	line "bajo ya!"
	done

BikerJacobBeatenText:
	text "¡Maldita sea! ¡He"
	line "fracasado!"
	done

GenericTrainerBikerAiden:
	generictrainer BIKER, AIDEN, EVENT_BEAT_BIKER_AIDEN, BikerAidenSeenText, BikerAidenBeatenText

	text "¡Brum, brrruuum!"
	line "¡Ratatatatata…!"

	para "¡Toma, mi imita-"
	line "ción de motor ha"
	cont "evolucionado!"
	done

BikerAidenSeenText:
	text "¡Brum, brum!"
	line "¡Brrr, brrr, brrr!"

	para "¿Qué te parece mi"
	line "imitación del mo-"
	cont "tor?"
	done

BikerAidenBeatenText:
	text "Uf… Uf…"
	line "¡Me falta el aire!"
	done

GenericTrainerBikerDan:
	generictrainer BIKER, DAN, EVENT_BEAT_BIKER_DAN, BikerDanSeenText, BikerDanBeatenText

	text "Me encanta esta"
	line "triste melodía."

	para "De verdad que va"
	line "mucho conmigo…"
	done

BikerDanSeenText:
	text "¡Tururú tururú"
	line "turu-tururú!"

	para "Mi bocina suena"
	line "genial, ¿a que sí?"
	done

BikerDanBeatenText:
	text "Turuuuruuuu…"
	done

GenericTrainerBikerTeddy:
	generictrainer BIKER, TEDDY, EVENT_BEAT_BIKER_TEDDY, BikerTeddySeenText, BikerTeddyBeatenText

	text "¡Me gusta tu forma"
	line "de combatir!"

	para "¡Cuenta conmigo"
	line "como fan tuyo!"
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
	line "dicho que puedes"
	cont "ir por aquí?"
	done

RoughneckBrianBeatenText:
	text "¡Vaya castañazo!"
	done

GenericTrainerRoughneckTheron:
	generictrainer ROUGHNECK, THERON, EVENT_BEAT_ROUGHNECK_THERON, RoughneckTheronSeenText, RoughneckTheronBeatenText

	text "¿Quieres unirte a"
	line "mi banda?"

	para "¿Por qué no lo"
	line "pruebas?"
	done

RoughneckTheronSeenText:
	text "¡Te espabilaré!"
	line "¡Vente conmigo!"
	done

RoughneckTheronBeatenText:
	text "He perdido."
	line "¡He perdido!"
	done

GenericTrainerRoughneckMarkey:
	generictrainer ROUGHNECK, MARKEY, EVENT_BEAT_ROUGHNECK_MARKEY, RoughneckMarkeySeenText, RoughneckMarkeyBeatenText

	text "¡Genial!"

	para "¡Ese grito de gue-"
	line "rra ha sido total!"
	done

RoughneckMarkeySeenText:
	text "¡Eh, eh, eh! ¡Que"
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
	text "Pistas Entren."

	para "Cada #mon es"
	line "único."

	para "Dos #mon de"
	line "la misma especie"
	cont "y nivel pueden"

	para "crecer y actuar"
	line "de forma distinta."
	done

Route17SouthTrainerTips2Text:
	text "Pistas Entren."

	para "Abre el menú con"
	line "Start para frenar"
	cont "en las cuestas."
	done

Route17SouthNotice2Text:
	text "Es un aviso."

	para "¡No tires la to-"
	line "alla, tira #"
	cont "Balls!"
	done
