MountMortar1FInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 47, MOUNT_MORTAR_1F_OUTSIDE, 5
	warp_event 29, 47, MOUNT_MORTAR_1F_OUTSIDE, 6
	warp_event  5, 39, MOUNT_MORTAR_1F_OUTSIDE, 8
	warp_event 33, 41, MOUNT_MORTAR_1F_OUTSIDE, 9
	warp_event  3, 19, MOUNT_MORTAR_B1F, 1
	warp_event  9,  9, MOUNT_MORTAR_2F_INSIDE, 2

	def_coord_events

	def_bg_events
	bg_event 30, 11, BGEVENT_ITEM + MAX_REPEL, EVENT_MOUNT_MORTAR_1F_INSIDE_HIDDEN_MAX_REPEL

	def_object_events
	strengthboulder_event 21, 43
	itemball_event 35, 38, SMOOTH_ROCK, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_SMOOTH_ROCK
	itemball_event 16, 10, MAX_REVIVE, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_REVIVE
	itemball_event 10, 27, HYPER_POTION, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_HYPER_POTION
	itemball_event 22, 20, MAX_POTION, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_MAX_POTION
	itemball_event 35, 19, NUGGET, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_NUGGET
	object_event 33, 43, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacMiller, -1
	object_event 24, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdMarkus, -1
	itemball_event  8, 16, IRON, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_IRON
	itemball_event 17, 17, ULTRA_BALL, 1, EVENT_MOUNT_MORTAR_1F_INSIDE_ULTRA_BALL

GenericTrainerPokemaniacMiller:
	generictrainer POKEMANIAC, MILLER, EVENT_BEAT_POKEMANIAC_MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText

	text "Hace un tiempo,"
	line "un karateka me"
	cont "retó a luchar."

	para "¡Era muy fuerte y"
	line "me dio una paliza!"

	para "Se adentró más en"
	line "la cueva para su"
	cont "entrenamiento."
	cont "¿Cómo le irá?"
	done

GenericTrainerSupernerdMarkus:
	generictrainer SUPER_NERD, MARKUS, EVENT_BEAT_SUPER_NERD_MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText

	text "Vine a explorar el"
	line "Monte Mortero,"
	cont "pero me separé de"
	cont "mi compañero…"

	para "¿Viste a alguien"
	line "con un Seadra que"
	cont "sabe Cascada?"
	done

PokemaniacMillerSeenText:
	text "¡No voy a perder"
	line "esta vez!"
	done

PokemaniacMillerBeatenText:
	text "¿He perdido contra"
	line "un niñato…?"
	done

SupernerdMarkusSeenText:
	text "¡Eh, Hugh!"
	done

SupernerdMarkusBeatenText:
	text "Te confundí con"
	line "otra persona…"
	done
