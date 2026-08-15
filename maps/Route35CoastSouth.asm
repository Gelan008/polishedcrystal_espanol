Route35CoastSouth_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 14, BGEVENT_ITEM + STAR_PIECE, EVENT_ROUTE_35_COAST_SOUTH_HIDDEN_STAR_PIECE

	def_object_events
	object_event 26,  7, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermWalter, -1
	object_event 24, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfLisa, -1
	object_event 13, 18, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfJill, -1
	object_event 35, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperBryan, -1
	object_event 39, 16, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrBeaandmay1, -1
	object_event 39, 17, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrBeaandmay2, -1
	object_event 16, 10, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSailorHarvey, -1
	object_event 38,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassRose, -1
	object_event 33,  6, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, BIG_PEARL, 1, EVENT_ROUTE_35_COAST_SOUTH_BIG_PEARL
	object_event  6, 15, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_ITEMBALL, PLAYEREVENT_KEYITEMBALL, GO_GOGGLES, EVENT_OLIVINE_PORT_GO_GOGGLES
	itemball_event 13, 31, STAR_PIECE, 1, EVENT_GOLDENROD_HARBOR_STAR_PIECE
	object_event 17, 31, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

GenericTrainerSwimmermWalter:
	generictrainer SWIMMERM, WALTER, EVENT_BEAT_SWIMMERM_WALTER, SwimmermWalterSeenText, SwimmermWalterBeatenText

	text "El sol se refleja"
	line "en el agua…"

	para "¡Y me he quemado"
	line "de todas formas!"
	done

GenericTrainerSwimmerfLisa:
	generictrainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText

	text "En el mar hay si-"
	line "tio para pescar y"
	cont "para luchar."
	done

GenericTrainerSwimmerfJill:
	generictrainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText

	text "Olvidaré mi derro-"
	line "ta con un buen"
	cont "baño."
	done

GenericTrainerBird_keeperBryan:
	generictrainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, Bird_keeperBryanSeenText, Bird_keeperBryanBeatenText

	text "Hay #mon que hu-"
	line "yen al instante."

	para "Prueba a atrapar-"
	line "los con la Rapid"
	cont "Ball de César."

	para "Cada vez que en-"
	line "cuentro un Bon-"
	cont "guri Blanco,"

	para "se lo llevo para"
	line "que me fabrique"
	cont "una Ball a medida."
	done

GenericTrainerSrandjrBeaandmay1:
	generictrainer SR_AND_JR, BEAANDMAY1, EVENT_BEAT_SR_AND_JR_BEA_AND_MAY, SrandjrBeaandmay1SeenText, SrandjrBeaandmay1BeatenText

	text "Bea: Le enseñaré a"
	line "May a hacerse más"
	cont "fuerte."
	done

GenericTrainerSrandjrBeaandmay2:
	generictrainer SR_AND_JR, BEAANDMAY2, EVENT_BEAT_SR_AND_JR_BEA_AND_MAY, SrandjrBeaandmay2SeenText, SrandjrBeaandmay2BeatenText

	text "May: Le pediré a"
	line "Bea que me enseñe"
	cont "a ser más fuerte."
	done

GenericTrainerSailorHarvey:
	generictrainer SAILOR, HARVEY, EVENT_BEAT_SAILOR_HARVEY, SailorHarveySeenText, SailorHarveyBeatenText

	text "En el mar, solo"
	line "puedes confiar en"
	cont "ti mismo."

	para "¡Orgulloso de mi"
	line "cuerpo serrano!"
	done

GenericTrainerLassRose:
	generictrainer LASS, ROSE, EVENT_BEAT_LASS_ROSE, LassRoseSeenText, LassRoseBeatenText

	text "¡Has herido a mis"
	line "#mon cosmopoli-"
	cont "tas!"

	para "¡Exijo que vayas a"
	line "curarlos a un Cen-"
	cont "tro #mon!"
	done

SwimmermWalterSeenText:
	text "Olvidé la crema,"
	line "así que me escondo"
	cont "bajo las rocas."
	done

SwimmermWalterBeatenText:
	text "¡Ay!"
	done

SwimmerfLisaSeenText:
	text "Los pescadores me"
	line "han gritado por"
	cont "molestarles…"
	done

SwimmerfLisaBeatenText:
	text "Solo quería un"
	line "combate…"
	done

SwimmerfJillSeenText:
	text "¿A que me queda"
	line "genial el bikini?"
	done

SwimmerfJillBeatenText:
	text "¡Mmm!"
	done

Bird_keeperBryanSeenText:
	text "¿Qué tipos de"
	line "Balls utilizas?"
	done

Bird_keeperBryanBeatenText:
	text "¡Uf! ¡No he sido"
	line "lo bastante veloz!"
	done

SrandjrBeaandmay1SeenText:
	text "Bea: Prefiero los"
	line "#mon fuertes a"
	cont "los adorables."

	para "¡Pero juntas tene-"
	line "mos #mon monos"
	cont "y fuertes!"
	done

SrandjrBeaandmay1BeatenText:
	text "Bea: ¡La fuerza y"
	line "la belleza no han"
	cont "bastado!"
	done

SrandjrBeaandmay2SeenText:
	text "May: Prefiero los"
	line "#mon monos a los"
	cont "#mon fuertes."

	para "¡Pero juntas tene-"
	line "mos #mon fuer-"
	cont "tes y adorables!"
	done

SrandjrBeaandmay2BeatenText:
	text "May: ¡Lo adorable"
	line "y lo fuerte no ha"
	cont "sido suficiente!"
	done

SailorHarveySeenText:
	text "¡Ja! ¡Tus #mon"
	line "parecen de peso"
	cont "pluma!"
	done

SailorHarveyBeatenText:
	text "¡Menuda fuerza!"
	line "¿Te gustaría sur-"

	para "car los mares con-"
	line "migo?"
	done

LassRoseSeenText:
	text "¡He atrapado a es-"
	line "tos #mon por to-"
	cont "do el mundo!"
	done

LassRoseBeatenText:
	text "¡No! ¡Si he viaja-"
	line "do por todo el"
	cont "mundo por ellos!"
	done
