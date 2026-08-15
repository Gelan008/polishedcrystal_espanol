UnionCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  3, UNION_CAVE_B1F_NORTH, 3
	warp_event  3, 45, UNION_CAVE_B1F_SOUTH, 1
	warp_event 17, 43, ROUTE_33, 1
	warp_event 17, 15, ROUTE_32, 4

	def_coord_events

	def_bg_events
	bg_event  7, 19, BGEVENT_ITEM + GREAT_BALL, EVENT_UNION_CAVE_1F_HIDDEN_GREAT_BALL
	bg_event  2, 33, BGEVENT_ITEM + BIG_PEARL, EVENT_UNION_CAVE_1F_HIDDEN_BIG_PEARL
	bg_event  8, 33, BGEVENT_ITEM + PARALYZEHEAL, EVENT_UNION_CAVE_1F_HIDDEN_PARALYZEHEAL

	def_object_events
	object_event  3, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerDaniel, -1
	object_event  7, 37, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacLarry, -1
	object_event 11, 20, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerRussell, -1
	object_event 15, 39, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherRay, -1
	object_event 11, 32, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFirebreatherBill, -1
	object_event  5,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRuin_maniacJones, -1
	itemball_event 15, 33, GREAT_BALL, 1, EVENT_UNION_CAVE_1F_GREAT_BALL
	itemball_event  2,  8, X_ATTACK, 1, EVENT_UNION_CAVE_1F_X_ATTACK
	itemball_event  3, 28, POTION, 1, EVENT_UNION_CAVE_1F_POTION
	itemball_event 12, 45, AWAKENING, 1, EVENT_UNION_CAVE_1F_AWAKENING

GenericTrainerPokemaniacLarry:
	generictrainer POKEMANIAC, POKEMANIAC_LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText

	text "Los viernes se oye"
	line "el rugido de un"

	para "#mon en lo más"
	line "profundo de la"
	cont "cueva."
	done

GenericTrainerHikerRussell:
	generictrainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText

	text "¡Está bien!"
	line "He decidido que no"

	para "me iré hasta que"
	line "mis #mon sean"
	cont "más fuertes."
	done

GenericTrainerHikerDaniel:
	generictrainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText

	text "Me engañaron para"
	line "que comprara una"
	cont "Cola Slowpoke."

	para "Me da lástima el"
	line "pobre #mon."
	done

GenericTrainerFirebreatherBill:
	generictrainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText

	text "Los fines de sema-"
	line "na se oyen extra-"

	para "ños rugidos en el"
	line "fondo de la cueva."
	done

GenericTrainerFirebreatherRay:
	generictrainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText

	text "El fuego de mis"
	line "#mon ilumina"
	cont "esta cueva."
	done

GenericTrainerRuin_maniacJones:
	generictrainer RUIN_MANIAC, JONES, EVENT_BEAT_RUIN_MANIAC_JONES, Ruin_maniacJonesSeenText, Ruin_maniacJonesBeatenText

	text "Las Ruinas ocultan"
	line "algo… ¡Lo sé!"
	done

HikerRussellSeenText:
	text "¿Vas hacia Pueblo"
	line "Azalea?"

	para "¡Comprobemos con"
	line "mis #mon si va-"
	cont "les para luchar!"
	done

HikerRussellBeatenText:
	text "¡Oh, oh, oh!"
	done

PokemaniacLarrySeenText:
	text "Recorro el mundo"
	line "en busca de más"
	cont "#mon."

	para "¿Tú también buscas"
	line "#mon?"

	para "¡Pues eres mi ri-"
	line "val como coleccio-"
	cont "nista!"
	done

PokemaniacLarryBeatenText:
	text "Ugh. Mis pobres"
	line "#mon…"
	done

HikerDanielSeenText:
	text "¡Vaya! ¡Menuda"
	line "sorpresa!"

	para "¡No esperaba ver a"
	line "nadie por aquí!"
	done

HikerDanielBeatenText:
	text "¡Hala! ¡Me has da-"
	line "do una paliza!"
	done

FirebreatherBillSeenText:
	text "El Supersónico de"
	line "Zubat confunde a"
	cont "mis #mon."

	para "¡Y eso me fasti-"
	line "dia un montón!"
	done

FirebreatherBillBeatenText:
	text "¡Me he apagado!"
	done

FirebreatherRaySeenText:
	text "Con luz, una cueva"
	line "no da miedo."

	para "Si eres fuerte, un"
	line "#mon tampoco da"
	cont "miedo."
	done

FirebreatherRayBeatenText:
	text "¡Destello!"
	done

Ruin_maniacJonesSeenText:
	text "¿Has explorado las"
	line "Ruinas Alfa?"
	done

Ruin_maniacJonesBeatenText:
	text "¡Gahahah!"
	done
