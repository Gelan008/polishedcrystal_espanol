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
	text "Cada año venía a"
	line "Carmín un crucero"
	cont "llamado S.S. Anne."

	para "Hasta que un año"
	line "ocurrió una gran"
	cont "tragedia."

	para "Algo salió mal y"
	line "el barco se hundió"
	cont "en el océano para"
	cont "no volver jamás."
	done

VermilionSSAnneSpeechHouseBeautyText:
	text "Vi una maqueta del"
	line "S.S. Anne en un"
	cont "Museo Oceánico muy"
	cont "lejano."
	done
