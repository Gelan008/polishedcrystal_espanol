Route10South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  3, ROCK_TUNNEL_1F, 2

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_JUMPTEXT, Route10SignText
	bg_event 16,  3, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_10_HIDDEN_MAX_ETHER

	def_object_events
	object_event 17,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerJim, -1
	object_event  4,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanmRobert, -1
	object_event  8, 12, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHexManiacAmy, -1
	tmhmball_event  9,  7, TM_VOLT_SWITCH, EVENT_ROUTE_10_TM_VOLT_SWITCH

GenericTrainerHikerJim:
	generictrainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText

	text "¡La alergia al"
	line "polen me hace es-"
	cont "tornudar! ¡Aaa-chís!"
	done

GenericTrainerPokefanmRobert:
	generictrainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText

	text "Mira lo que le has"
	line "hecho a mi #mon…"

	para "No me olvidaré"
	line "de esto…"
	done

GenericTrainerHexManiacAmy:
	generictrainer HEX_MANIAC, AMY, EVENT_BEAT_HEX_MANIAC_AMY, HexManiacAmySeenText, HexManiacAmyBeatenText

	text "Una Bruja halla"
	line "la paz entre los"
	cont "espíritus…"
	done

HikerJimSeenText:
	text "¡Jajajaja!"
	done

HikerJimBeatenText:
	text "¡Jajaja-achís!"
	done

PokefanmRobertSeenText:
	text "¿Te gustan los"
	line "#mon, verdad?"

	para "¡A mí también!"
	done

PokefanmRobertBeatenText:
	text "Tengo que admitir"
	line "que he perdido."
	done

HexManiacAmySeenText:
	text "Pueblo Lavanda…"

	para "Donde descansan"
	line "los espíritus de"
	cont "los #mon…"
	done

HexManiacAmyBeatenText:
	text "Tus #mon desbor-"
	line "dan vitalidad…"
	done

Route10SignText:
	text "Ruta 10"

	para "Ciudad Celeste -"
	line "Pueblo Lavanda"
	done
