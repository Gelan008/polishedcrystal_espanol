BlackthornDragonSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 2
	warp_event  3,  7, BLACKTHORN_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonSpeechHouseGrannyText, -1
	pokemon_event  5,  5, DRATINI, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, BlackthornDragonSpeechHouseDratiniText, -1

BlackthornDragonSpeechHouseGrannyText:
	text "Un clan de entre-"
	line "nadores que puede"

	para "mandar en dra-"
	line "gones libremente"
	cont "vive en Endrino."

	para "Por ello, hay"
	line "muchas leyendas"

	para "sobre dragones en"
	line "este pueblo."
	done

BlackthornDragonSpeechHouseDratiniText:
	text "Dratini: ¡Draa!"
	done
