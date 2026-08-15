VermilionSSAnneSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 14
	warp_event  3,  7, VERMILION_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionSSAnneSpeechHouseGrampsText, -1
	object_event  5,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionSSAnneSpeechHouseBeautyText, -1

VermilionSSAnneSpeechHouseGrampsText:
	text "Una vez al año, un"
	line "crucero llamado"

	para "el S.S. Anne solía"
	line "atracar aquí, en"
	cont "Carmín."

	para "Hasta que un año"
	line "sucedió una gran"
	cont "tragedia."

	para "Algo salió mal"
	line "y el barco se hun-"

	para "dió en el océano"
	line "para no ser visto"
	cont "nunca más."
	done

VermilionSSAnneSpeechHouseBeautyText:
	text "He visto una ma-"
	line "queta del S.S. Anne"

	para "en un Museo Oceá-"
	line "nico muy lejano."
	done
