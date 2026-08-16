ShamoutiCoast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 22, 15, FIRE_ISLAND, 1
	warp_event 54, 11, ICE_ISLAND, 1
	warp_event 84, 13, LIGHTNING_ISLAND, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  9, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerArtistRin, -1
	object_event 12,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMarina, -1
	object_event 34,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherDallas, -1
	object_event 39, 13, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSightseerfPilar, -1
	object_event 66,  4, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseersCyandvi1, -1
	object_event 67,  4, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseersCyandvi2, -1
	object_event 71, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermAshe, -1
	object_event  6, -3, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  6, 11, STAR_PIECE, 1, EVENT_SHAMOUTI_COAST_STAR_PIECE

GenericTrainerArtistRin:
	generictrainer ARTIST, RIN, EVENT_BEAT_ARTIST_RIN, .SeenText, .BeatenText

	text "Se siente un poder"
	line "extraño que emana"
	cont "de las islas."

	para "Quiero plasmarlo"
	line "en mi cuadro."
	done

.SeenText:
	text "¡Estoy pintando"
	line "las tres islas!"

	para "¡Por favor, no me"
	line "tapes las vistas!"
	done

.BeatenText:
	text "No puedo pintar y"
	line "combatir a la vez."
	done

TrainerSwimmerfMarina:
	trainer SWIMMERF, MARINA, EVENT_BEAT_SWIMMERF_MARINA, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Si me quedase en"
	line "una isla desierta,"
	cont "me llevaría…"

	para "¡a mis #mon,"
	line "por supuesto!"
	done

.SeenText:
	text "Si te quedases en"
	line "una isla desierta,"

	para "¿qué tres cosas te"
	line "llevarías?"
	done

.BeatenText:
	text "¡Me he quedado a"
	line "la deriva!"
	done

GenericTrainerFisherDallas:
	generictrainer FISHER, DALLAS, EVENT_BEAT_FISHER_DALLAS, .SeenText, .BeatenText

	text "Da igual dónde"
	line "pesque, no paro de"

	para "sacar Chapas"
	line "Plateadas."

	para "¡Me saca de"
	line "quicio!"
	done

.SeenText:
	text "¡Aj! ¡Otro más no!"
	done

.BeatenText:
	text "¿Eh? Ah, tú no…"
	line "Tú estás bien."
	done

GenericTrainerSightseerfPilar:
	generictrainer SIGHTSEERF, PILAR, EVENT_BEAT_SIGHTSEERF_PILAR, .SeenText, .BeatenText

	text "¡Qué fuertes son"
	line "tus #mon!"

	para "Debes de haber"
	line "viajado un montón"

	para "para tener tanta"
	line "experiencia."
	done

.SeenText:
	text "¡Hola! He venido"
	line "hasta aquí desde"
	cont "muy lejos."

	para "¿Qué tal si"
	line "combatimos?"
	done

.BeatenText:
	text "Pensé que duraría"
	line "más…"
	done

GenericTrainerSightseersCyandvi1:
	generictrainer SIGHTSEERS, CYANDVI1, EVENT_BEAT_SIGHTSEERS_CY_AND_VI, .SeenText, .BeatenText

; text > text
	text "Cy: TODO"
	done

.SeenText: ; text > text
	text "Cy: TODO"
	done

.BeatenText: ; text > text
	text "Cy: TODO"
	done

GenericTrainerSightseersCyandvi2:
	generictrainer SIGHTSEERS, CYANDVI2, EVENT_BEAT_SIGHTSEERS_CY_AND_VI, .SeenText, .BeatenText

; text > text
	text "Vi: TODO"
	done

.SeenText: ; text > text
	text "Vi: TODO"
	done

.BeatenText: ; text > text
	text "Vi: TODO"
	done

TrainerSwimmermAshe:
	trainer SWIMMERM, ASHE, EVENT_BEAT_SWIMMERM_ASHE, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Hace nada no sabía"
	line "nadar en absoluto."

	para "¡Ahora nado tanto"
	line "que casi ni me"

	para "acuerdo de lo que"
	line "hacía antes! ¡Ja!"
	done

.SeenText:
	text "¿Nadar? ¿Yo?"
	line "Sí, ¡me flipa!"
	done

.BeatenText:
	text "Siento que me voy"
	line "a pique…"
	done
