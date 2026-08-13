LavenderTownSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 3
	warp_event  3,  7, LAVENDER_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavenderSpeechHousePokefanFText, -1

LavenderSpeechHousePokefanFText:
	text "Lavanda es un pue-"
	line "blecito tranquilo"

	para "al pie de las mon-"
	line "tañas."

	para "Hay más movimien-"
	line "to desde que se"

	para "construyó la Torre"
	line "Radio."
	done
