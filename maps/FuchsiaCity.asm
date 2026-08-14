FuchsiaCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlyPoint

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event  6, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, FUCHSIA_BILL_SPEECH_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE, 3
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 33, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 33, ROUTE_19_FUCHSIA_GATE, 2
	warp_event 15, 27, FUCHSIA_SAFARI_BALL_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 19, BGEVENT_JUMPTEXT, FuchsiaCitySignText
	bg_event  7, 27, BGEVENT_JUMPTEXT, FuchsiaGymSignText
	bg_event 21, 15, BGEVENT_JUMPTEXT, SafariZoneOfficeSignText
	bg_event 27, 29, BGEVENT_JUMPTEXT, WardensHomeSignText
	bg_event 17,  5, BGEVENT_JUMPTEXT, SafariZoneClosedSignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, NoLitteringSignText
	bg_event  7,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 13,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 27,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 33,  7, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 31, 13, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event  9, 15, BGEVENT_JUMPTEXT, SafariZoneExhibitSignText
	bg_event 11, 35, BGEVENT_JUMPTEXT, FuchsiaCityCarefulSwimmingSignText
	bg_event 22, 13, BGEVENT_JUMPTEXT, SafariZoneOfficeClosedSignText
	bg_event 31, 27, BGEVENT_JUMPTEXT, HouseForSaleSignText
	bg_event 26, 12, BGEVENT_ITEM + NUGGET, EVENT_FUCHSIA_CITY_HIDDEN_NUGGET

	def_object_events
	object_event 19, 17, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityYoungsterText, -1
	object_event 10,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanMText, -1
	object_event 16, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityTeacherText, -1
	object_event 28,  8, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanFText, -1
	cuttree_event 16, 19, EVENT_FUCHSIA_CITY_CUT_TREE
	fruittree_event 14, 17, FRUITTREE_FUCHSIA_CITY, LIECHI_BERRY, PAL_NPC_RED

FuchsiaCityFlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

FuchsiaCityYoungsterText:
	text "Uno del Alto Mando"
	line "solía ser el Líder"

	para "del Gimnasio de"
	line "Fucsia."
	done

FuchsiaCityPokefanMText:
	text "La hija de Koga le"
	line "sucedió como Líder"

	para "de Gimnasio cuan-"
	line "do se unió al Alto"
	cont "Mando."
	done

FuchsiaCityTeacherText:
	text "El Juego Safari se"
	line "ha cancelado…"

	para "Al menos la Zona"
	line "Safari sigue"
	cont "abierta."

	para "Necesitarás un"
	line "#mon fuerte"

	para "para explorarla,"
	line "sin embargo."
	done

FuchsiaCityPokefanFText:
	text "Cuando el Guarda"
	line "de la Zona Safari"
	cont "se fue,"

	para "no había nadie pa-"
	line "ra mantener el zoo"
	cont "de la ciudad."

	para "Así que los #-"
	line "mon fueron libera-"
	cont "dos a la natura-"
	cont "leza."
	done

FuchsiaCitySignText:
	text "Ciudad Fucsia"

	para "¡Contemplad!"
	line "¡Es Rosa Pasión!"
	done

FuchsiaGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Fucsia: Sachiko"

	para "La Maestra Ninja"
	line "Venenosa"
	done

SafariZoneOfficeSignText:
	text "Hay un aviso"
	line "aquí…"

	para "La Oficina de la"
	line "Zona Safari está"
	cont "cerrada hasta"
	cont "nuevo aviso."
	done

SafariZoneOfficeClosedSignText:
	text "Está cerrado…"
	done

WardensHomeSignText:
	text "Casa del Guarda de"
	line "la Zona Safari"
	done

SafariZoneClosedSignText:
	text "El Guarda está de"
	line "viaje."

	para "Por lo tanto, el"
	line "Juego Safari está"
	cont "cancelado."
	done

NoLitteringSignText:
	text "No tirar basura."

	para "Por favor, llévate"
	line "tus desperdicios"
	cont "contigo."
	done

SafariZoneExhibitSignText:
	text "El cartel ha sido"
	line "arrancado…"
	done

HouseForSaleSignText:
	text "¿Qué es esto?"

	para "Casa en Venta…"
	line "Aquí no vive na-"
	cont "die."
	done

FuchsiaCityCarefulSwimmingSignText:
	text "Por favor, ten"
	line "cuidado si nadas a"
	cont "las Islas Espuma."

	para "Policía Fucsia"
	done
