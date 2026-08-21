SproutTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, SPROUT_TOWER_1F, 3
	warp_event  0,  6, SPROUT_TOWER_1F, 4
	warp_event 15,  3, SPROUT_TOWER_1F, 5
	warp_event  8, 14, SPROUT_TOWER_3F, 1

	def_coord_events

	def_bg_events
	bg_event 10, 15, BGEVENT_JUMPTEXT, SproutTower2FStatueText

	def_object_events
	object_event 10,  3, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSageNico, -1
	object_event  7, 14, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSageEdmond, -1
	itemball_event  1,  1, X_ACCURACY, 1, EVENT_SPROUT_TOWER2F_X_ACCURACY

GenericTrainerSageNico:
	generictrainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText

	text "The flexible pil-"
	line "lar protects the"

	para "tower, even from"
	line "earthquakes."
	done

GenericTrainerSageEdmond:
	generictrainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText

	text "I tried to copy"
	line "Bellsprout's"

	para "gentle movements"
	line "for battle…"

	para "But I didn't train"
	line "well enough."
	done

SageNicoSeenText:
	text "Por duro que sea"
	line "el combate, la"
	cont "torre resistirá."
	done

SageNicoBeatenText:
	text "Luché con ganas,"
	line "pero soy débil."
	done

SageEdmondSeenText:
	text "…Mécete cual hoja"
	line "con el viento…"
	done

SageEdmondBeatenText:
	text "¡Oh, qué débil"
	line "soy!"
	done

SproutTower2FStatueText:
	text "Una estatua de un"
	line "#mon…"

	para "Tiene un aspecto"
	line "muy distinguido."
	done
