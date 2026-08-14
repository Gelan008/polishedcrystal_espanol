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
	text "Hay muchos objetos"
	line "tirados que no"
	cont "están a la vista."

	para "Usa el Buscaobje-"
	line "tos para compro-"
	cont "bar si hay"

	para "un objeto en el"
	line "suelo cerca de"
	cont "ti."

	para "No te enseña el"
	line "sitio exacto,"

	para "así que tendrás"
	line "que mirar tú mis-"
	cont "mo."

	para "Ah, sí, he oído"
	line "que hay objetos en"

	para "la Torre Quemada"
	line "de Iris."
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

	text "Ciudad Iris tam-"
	line "bién fue hogar de"
	cont "tres #mon que"

	para "corrían alrededor"
	line "de la ciudad."

	para "Se decía que na-"
	line "cieron del"

	para "agua, del rayo"
	line "y del fuego."

	para "Pero no podían"
	line "contener su poder"
	cont "excesivo."

	para "Así que dicen que"
	line "los tres corrieron"

	para "como el viento"
	line "hacia la pradera."
	done

EcruteakItemfinderAdventureText:
	text "Ah, ¿estás en una"
	line "aventura con tus"
	cont "#mon?"

	para "Bueno, ¿qué es una"
	line "aventura sin bus-"
	cont "car tesoros?"

	para "¿Tengo razón, o"
	line "tengo razón?"
	done

EcruteakItemfinderTrueSpiritText:
	text "¡Bien! Entiendes"
	line "el verdadero"

	para "espíritu de la"
	line "aventura."

	para "¡Me gusta! Llévate"
	line "esto contigo."
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
	text "En Iris, había dos"
	line "torres."

	para "Cada torre era el"
	line "nido de un podero-"
	cont "so #mon vola-"
	cont "dor."

	para "Pero una de las"
	line "torres ardió hasta"
	cont "los cimientos."

	para "Desde entonces, no"
	line "se ha visto a los"
	cont "dos #mon…"

	para "¿Seguir leyendo?"
	done
