Route34Coast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermFrank, -1
	object_event 10, 21, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermNadar, -1
	object_event  7, 61, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermConrad, -1
	object_event  8, 43, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfCaroline, -1
	object_event  8,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNatalia, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherFrancis, -1
	object_event  7, 32, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperTony, -1
	object_event  3, 37, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, PEARL_STRING, 1, EVENT_ROUTE_34_COAST_PEARL_STRING

GenericTrainerSwimmermFrank:
	generictrainer SWIMMERM, FRANK, EVENT_BEAT_SWIMMERM_FRANK, .SeenText, .BeatenText

	text "¡Mar, arena, sol"
	line "y #mon!"

	para "¿Qué más puede"
	line "pedir un hombre?"
	done

.SeenText:
	text "Estoy de viaje con"
	line "mi mujer, pero"
	cont "¡vamos a luchar!"
	done

.BeatenText:
	text "¡Me da igual! ¡Son"
	line "mis vacaciones!"
	done

TrainerSwimmermNadar:
	trainer SWIMMERM, NADAR, EVENT_BEAT_SWIMMERM_NADAR, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¿Nadar un rato o"
	line "entrenar a mis"
	cont "#mon?"

	para "Menudo dilema."
	done

.SeenText:
	text "¡Nadar es lo mío!"

	para "¡Y los combates"
	line "#mon también!"
	done

.BeatenText:
	text "¿He perdido en mi"
	line "propio terreno?"
	done

GenericTrainerSwimmermConrad:
	generictrainer SWIMMERM, CONRAD, EVENT_BEAT_SWIMMERM_CONRAD, .SeenText, .BeatenText

	text "Las olas reflejan"
	line "los rayos UV."

	para "Ponte crema solar"
	line "siempre."
	done

.SeenText:
	text "Crema y gafas a"
	line "punto… ¡A por las"
	cont "olas!"
	done

.BeatenText:
	text "¡Uf! Esta vez la"
	line "ola me dio a mí."
	done

GenericTrainerSwimmerfCaroline:
	generictrainer SWIMMERF, CAROLINE, EVENT_BEAT_SWIMMERF_CAROLINE, .SeenText, .BeatenText

	text "Nos alojamos en"
	line "Trigal, pero esta"
	cont "Ruta es ideal para"
	cont "una excursión."
	done

.SeenText:
	text "Mi marido y yo"
	line "estamos aquí de"
	cont "vacaciones."
	done

.BeatenText:
	text "¡Oh! Qué lástima."
	done

GenericTrainerSwimmerfNatalia:
	generictrainer SWIMMERF, NATALIA, EVENT_BEAT_SWIMMERF_NATALIA, .SeenText, .BeatenText

	text "Creo que elegí mal"
	line "este bikini."

	para "Este color no me"
	line "sienta nada bien."
	done

.SeenText:
	text "Me he comprado un"
	line "bikini nuevo."

	para "¡Es lo último!"
	done

.BeatenText:
	text "¡Bah!"
	done

GenericTrainerFisherFrancis:
	generictrainer FISHER, FRANCIS, EVENT_BEAT_FISHER_FRANCIS, .SeenText, .BeatenText

	text "Me da igual ganar"
	line "o perder."

	para "Solo quiero estar"
	line "a gusto y pescar."
	done

.SeenText:
	text "Me gusta pescar"
	line "#mon en lugares"
	cont "exóticos."
	done

.BeatenText:
	text "¡Oh! ¡Menudo buen"
	line "golpe!"
	done

GenericTrainerBird_keeperTony:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_TONY, EVENT_BEAT_BIRD_KEEPER_TONY, .SeenText, .BeatenText

	text "Todo el mundo sabe"
	line "que el pájaro es"
	cont "la clave."
	done

.SeenText:
	text "¿Has oído hablar"
	line "sobre el pájaro?"
	done

.BeatenText:
	text "¿No sabes nada"
	line "sobre el pájaro?"
	done