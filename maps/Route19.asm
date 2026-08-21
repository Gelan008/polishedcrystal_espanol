Route19_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route19ClearSmashRocks
	callback MAPCALLBACK_TILES, Route19ClearRocks

	def_warp_events
	warp_event  7,  1, ROUTE_19_FUCHSIA_GATE, 3
	warp_event  5, 13, ROUTE_19_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_JUMPTEXT, Route19SignText
	bg_event 11, -1, BGEVENT_JUMPTEXT, CarefulSwimmingSignText
	bg_event  5,  3, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_19_HIDDEN_REVIVE
	bg_event  3, 11, BGEVENT_ITEM + MAX_REVIVE, EVENT_ROUTE_19_HIDDEN_MAX_REVIVE
	bg_event  5, 15, BGEVENT_ITEM + PEARL, EVENT_ROUTE_19_HIDDEN_PEARL
	bg_event 13, 13, BGEVENT_ITEM + BIG_PEARL, EVENT_ROUTE_19_HIDDEN_BIG_PEARL

	def_object_events
	smashrock_event 11,  4, EVENT_ROUTE_19_ROCK
	smashrock_event  6, 3
	smashrock_event  4, 11
	smashrock_event 12, 13
	smashrock_event 13, 14
	object_event  8, 33, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfDawn, -1
	object_event  9, 33, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermTucker, -1
	object_event 11, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermJerome, -1
	object_event 13, 42, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermHarold, -1
	object_event 12, 50, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCosplayerBrooke, -1
	object_event  9,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route19Fisher1Script, -1
	object_event 11,  3, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19Fisher2Script, -1
	tmhmball_event 13, 51, TM_SCALD, EVENT_ROUTE_19_TM_SCALD

	object_const_def
	const ROUTE19_ROCK1

Route19ClearSmashRocks:
	disappear ROUTE19_ROCK1
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalsefwd .Done
	appear ROUTE19_ROCK1
.Done:
	endcallback

Route19ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftruefwd .Done
	changeblock 6, 4, $7a
	changeblock 8, 4, $7a
	changeblock 10, 4, $7a
	changeblock 6, 6, $7a
	changeblock 12, 6, $7a
	changeblock 8, 8, $7a
.Done:
	endcallback

GenericTrainerSwimmerfDawn:
	generictrainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText

	text "Se nada fácil"
	line "entre Fucsia e"
	cont "Islas Espuma…"

	para "¡Vaya hombretón"
	line "es mi novio!"
	cont "¡Es un quejica!"
	done

GenericTrainerSwimmermTucker:
	generictrainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText

	text "Le pedí a mi novia"
	line "ir nadando hasta"
	cont "Fucsia… Uf… Uf…"
	done

GenericTrainerSwimmermJerome:
	generictrainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText

	text "Nadar no se me da"
	line "muy bien, pero me"
	cont "encanta el mar."
	done

GenericTrainerSwimmermHarold:
	generictrainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText

	text "De noche, el mar"
	line "se vuelve negro."

	para "Da la sensación de"
	line "que te va a tragar"
	cont "por completo."
	done

GenericTrainerCosplayerBrooke:
	generictrainer COSPLAYER, BROOKE, EVENT_BEAT_COSPLAYER_BROOKE, CosplayerBrookeSeenText, CosplayerBrookeBeatenText

	text "Hice este disfraz"
	line "para una fiesta,"

	para "¡y me gusta tanto"
	line "que lo llevo a"
	cont "todas partes!"
	done

Route19Fisher1Script:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalse_jumptextfaceplayer Route19Fisher1Text
	jumpthistextfaceplayer

	text "Estoy empapado en"
	line "sudor. ¡Toca darse"
	cont "un baño!"
	done

Route19Fisher2Script:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iffalse_jumptextfaceplayer Route19EngineerText1
	jumpthistextfaceplayer

	text "Las obras por fin"
	line "han terminado."

	para "Ahora podré volver"
	line "a pescar."
	done

SwimmerfDawnSeenText:
	text "¡No soporto a los"
	line "hombres quejicas!"
	done

SwimmerfDawnBeatenText:
	text "Seguro que nadando"
	line "te ganaba…"
	done

SwimmermTuckerSeenText:
	text "Uf, uf… Ya solo…"
	line "un poco más para"
	cont "llegar… a…"
	cont "Fucsia…"
	done

SwimmermTuckerBeatenText:
	text "¡Que me ahogo!"
	done

SwimmermJeromeSeenText:
	text "¿Nadar? Se me da"
	line "fatal."

	para "Solo estoy aquí"
	line "chapoteando en la"
	cont "orilla."
	done

SwimmermJeromeBeatenText:
	text "Pensaba que podía"
	line "ganar."
	done

SwimmermHaroldSeenText:
	text "¿Has nadado alguna"
	line "vez en el mar de"
	cont "noche?"
	done

SwimmermHaroldBeatenText: ; text > text
	text "Glub…"
	done

CosplayerBrookeSeenText:
	text "¡Disfrazarse es"
	line "súper divertido!"
	done

CosplayerBrookeBeatenText:
	text "¡Más te vale no"
	line "haberme roto el"
	cont "disfraz!"
	done

Route19Fisher1Text:
	text "Perdón. Esta ruta"
	line "está cortada por"
	cont "obras."

	para "Si quieres llegar"
	line "a Isla Canela, ve"
	cont "por el sur de"
	cont "Pueblo Paleta."
	done

Route19EngineerText1:
	text "A saber cuánto nos"
	line "llevará mover esta"
	cont "roca gigante…"
	done

Route19SignText:
	text "Ruta 19"

	para "Ciudad Fucsia -"
	line "Islas Espuma"
	done

CarefulSwimmingSignText:
	text "Mucha precaución"
	line "si vas a nado a"
	cont "Islas Espuma."

	para "Policía de Fucsia"
	done
