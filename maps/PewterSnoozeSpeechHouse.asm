PewterSnoozeSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PEWTER_CITY, 5
	warp_event  3,  7, PEWTER_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterSnoozeSpeechHouseGrampsText, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterSnoozeSpeechHouseGrannyText, -1

PewterSnoozeSpeechHouseGrampsText:
	text "Me gusta dormirme"
	line "con la radio pues-"
	cont "ta… …Zzzz…"
	done

PewterSnoozeSpeechHouseGrannyText:
	text "Brock es el mayor"
	line "de diez hermanos."

	para "¡No sé cómo se las"
	line "apañaron sus"
	cont "padres!"
	done
