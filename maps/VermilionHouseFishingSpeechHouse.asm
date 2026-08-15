VermilionHouseFishingSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, FishingDudesHousePhotoText

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FishingDudeText, -1

FishingDudeText:
	text "Soy el Gurú Pesca,"
	line "el mayor de los"
	cont "Hermanos Pesca."

	para "¿Has visto al Gurú"
	line "Pescador del Lago"
	cont "de la Furia?"

	para "Sueña con ver al"
	line "Magikarp más gran-"
	cont "de del mundo."

	para "Si no te importa,"
	line "¿podrías enseñarle"

	para "cualquier Magikarp"
	line "que captures?"

	para "Quién sabe, ¡igual"
	line "atrapas el Magi-"
	cont "karp de sus sue-"
	cont "ños!"
	done

FishingDudesHousePhotoText:
	text "Es una foto de"
	line "gente pescando…"

	para "Se lo están pa-"
	line "sando en grande…"
	done
