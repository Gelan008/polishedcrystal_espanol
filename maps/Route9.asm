Route9_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 21,  7, BGEVENT_JUMPTEXT, Route9SignText
	bg_event 51, 15, BGEVENT_ITEM + ETHER, EVENT_ROUTE_9_HIDDEN_ETHER
	bg_event 42, 12, BGEVENT_ITEM + SOFT_SAND, EVENT_ROUTE_9_HIDDEN_SOFT_SAND
	bg_event 39,  3, BGEVENT_JUMPTEXT, Route9AdvancedTipsSignText

	def_object_events
	object_event 25, 11, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperDean, -1
	object_event 43,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerHeidi, -1
	object_event 15,  4, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerCamperSid, -1
	object_event 16, 15, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPicnickerEdna, -1
	object_event 34,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerTim, -1
	object_event 44, 15, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerSidney, -1
	itemball_event 26,  2, MAX_POTION, 1, EVENT_ROUTE_9_MAX_POTION
	tmhmball_event 45,  2, TM_FLASH_CANNON, EVENT_ROUTE_9_TM_FLASH_CANNON
	cuttree_event  4,  8, EVENT_ROUTE_9_CUT_TREE

GenericTrainerCamperDean:
	generictrainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText

	text "Mis #mon se"
	line "debilitaron. Iré a"
	cont "curarlos."
	done

GenericTrainerPicnickerHeidi:
	generictrainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText

	text "Horneamos dulces"
	line "para compartir."
	cont "¡Están riquísimos!"
	done

GenericTrainerCamperSid:
	generictrainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText

	text "Perdón, pensé que"
	line "tirabas basura."
	done

GenericTrainerPicnickerEdna:
	generictrainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText

	text "Cuidar el medio"
	line "ambiente es vital."
	done

GenericTrainerHikerTim:
	generictrainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText

	text "Los combates van"
	line "de concentrarse."
	done

GenericTrainerHikerSidney:
	generictrainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText

	text "La Central Energía"
	line "está cruzando el"
	cont "río."
	done

CamperDeanSeenText:
	text "¡Vine a explorar"
	line "el Túnel Roca!"
	done

CamperDeanBeatenText:
	text "¡Qué peligro!"
	done

PicnickerHeidiSeenText:
	text "Ir de pícnic es"
	line "muy divertido."
	done

PicnickerHeidiBeatenText:
	text "¡Ooooh!"
	done

CamperSidSeenText:
	text "¡Eh! ¡No tires"
	line "basura!"
	done

CamperSidBeatenText:
	text "Solo avisaba…"
	done

PicnickerEdnaSeenText:
	text "Nadie debería"
	line "tirar basura."
	done

PicnickerEdnaBeatenText:
	text "He perdido…"
	done

HikerTimSeenText:
	text "♪ Bajando por el"
	line "Monte Plateado la"
	cont "verás venir… ♪"

	para "El Monte Plateado"
	line "está en Johto,"
	cont "¿a que sí?"
	done

HikerTimBeatenText:
	text "Estaba ocupado"
	line "cantando…"
	done

HikerSidneySeenText:
	text "¡Te diré un secreto"
	line "si luchas conmigo!"
	done

HikerSidneyBeatenText:
	text "¡He perdido!"
	done

Route9SignText:
	text "Ruta 9"

	para "Ciudad Celeste -"
	line "Túnel Roca"
	done

Route9AdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "Toxisfera envenena"
	line "al #mon y la"
	cont "Llamasfera quema."

	para "¡Pero la habilidad"
	line "Agallas aprovecha"
	cont "eso para subir su"
	cont "Ataque!"
	done
