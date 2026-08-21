EcruteakItemfinderHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1

EcruteakItemfinderGuy:
	checkevent EVENT_GOT_ITEMFINDER
	iftrue_jumptextfaceplayer ItemfinderExplanationText
	faceplayer
	opentext
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse_jumpopenedtext EcruteakItemfinderToEachHisOwnText
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegivekeyitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
	jumpthisopenedtext

ItemfinderExplanationText:
	text "Hay objetos en el"
	line "suelo que no se"
	cont "ven a simple vista"

	para "El Buscaobjetos"
	line "te avisa si hay un"
	cont "objeto cerca."

	para "No te da el punto"
	line "exacto, así que"
	cont "tendrás que buscar"
	cont "tú mismo."

	para "¡Dicen que hay"
	line "cosas ocultas en"
	cont "la Torre Quemada!"
	done

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iffalse_endtext
	writetext EcruteakTwoTowersText
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "Ecruteak was also"
	line "home to three"

	para "#mon that raced"
	line "around the town."

	para "They were said to"
	line "have been born of"

	para "water, lightning"
	line "and fire."

	para "But they could not"
	line "contain their"
	cont "excessive power."

	para "So they say the"
	line "three ran like the"

	para "wind off into the"
	line "grassland."
	done

EcruteakItemfinderAdventureText:
	text "Ah, ¿estás de"
	line "aventura con tus"
	cont "#mon?"

	para "¿Y qué sería de"
	line "una aventura sin"
	cont "buscar tesoros?"

	para "¿Tengo o no tengo"
	line "razón?"
	done

EcruteakItemfinderTrueSpiritText:
	text "¡Bien! Conoces el"
	line "auténtico espíritu"
	cont "de la aventura."

	para "¡Me gusta! ¡Toma"
	line "esto contigo!"
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… Para gustos"
	line "colores,"
	cont "supongo…"
	done

EcruteakHistoryBookText:
	text "Historia de Iris"

	para "¿Quieres leerla?"
	done

EcruteakTwoTowersText:
	text "En Iris había dos"
	line "torres."

	para "Cada una era hogar"
	line "de un gran #mon"
	cont "volador."

	para "Pero una de las"
	line "torres ardió hasta"
	cont "los cimientos."

	para "Desde entonces no"
	line "se les ha vuelto"
	cont "a ver…"

	para "¿Seguir leyendo?"
	done
