Route18East_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  6, ROUTE_18_GATE, 3
	warp_event  0,  7, ROUTE_18_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, Route18SignText

	def_object_events
	object_event  7, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBoris, -1
	object_event 11,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBob, -1

GenericTrainerBird_keeperBoris:
	generictrainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, Bird_keeperBorisSeenText, Bird_keeperBorisBeatenText

	text "Siendo tan fuerte,"
	line "debe de ser diver-"
	cont "tido combatir."
	done

GenericTrainerBird_keeperBob:
	generictrainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, Bird_keeperBobSeenText, Bird_keeperBobBeatenText

	text "Si no tienes una"
	line "Bicicleta, no te"
	cont "dejan pasar por"
	cont "este atajo."
	done

Bird_keeperBorisSeenText:
	text "Si estás buscando"
	line "#mon, debes"
	cont "mirar en la hierba"
	done

Bird_keeperBorisBeatenText:
	text "¡Aaaay!"
	done

Bird_keeperBobSeenText:
	text "El Camino de Bicis"
	line "es un buen atajo"
	cont "para ir a Azulona."
	done

Bird_keeperBobBeatenText:
	text "… ¡Uf!"
	done

Route18SignText:
	text "Ruta 18"

	para "Ciudad Azulona -"
	line "Ciudad Fucsia"
	done