Route32Coast_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 55, UNION_CAVE_B1F_SOUTH, 4
	warp_event 17, 49, ROUTE_32_COAST_HOUSE, 1
	warp_event  8, 42, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 15, 27, BGEVENT_JUMPTEXT, Route32CoastTrainerTipsText
	bg_event  5, 57, BGEVENT_JUMPTEXT, Route32CoastUnionCaveSignText
	bg_event 17, 32, BGEVENT_ITEM + LEVEL_BALL, EVENT_ROUTE_32_COAST_HIDDEN_LEVEL_BALL
	bg_event  5, 43, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_32_COAST_HIDDEN_HYPER_POTION
	bg_event 14,  6, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_32_COAST_HIDDEN_ELIXIR
	bg_event  8, 41, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32_COAST
	bg_event  9, 41, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32_COAST

	def_object_events
	object_event  9,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermMichel, -1
	object_event 18, 65, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermLucas, -1
	object_event 20,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfAlison, -1
	object_event 23, 15, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfStephanie, -1
	object_event 17, 21, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBird_keeperPowell, -1
	object_event 14, 60, SPRITE_COSPLAYER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCosplayerChloe, -1
	object_event 24, 60, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherKiley, -1
	object_event  6, 20, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperCraig, -1
	object_event 11, 43, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassLayla, -1
	object_event 25, 33, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleFoxandrae1, -1
	object_event 25, 34, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleFoxandrae2, -1
	object_event  6, 59, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32CoastLassText, -1
	fruittree_event 21, 49, FRUITTREE_ROUTE_32_COAST, ASPEAR_BERRY, PAL_NPC_BROWN
	itemball_event  5, 16, WHITE_HERB, 1, EVENT_ROUTE_32_COAST_WHITE_HERB
	object_event 21, 61, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, SOFT_SAND, 1, EVENT_ROUTE_32_COAST_SOFT_SAND

GenericTrainerSwimmermMichel:
	generictrainer SWIMMERM, MICHEL, EVENT_BEAT_SWIMMERM_MICHEL, .SeenText, .BeatenText

	text "Lección aprendida:"
	line "hay que calentar"
	cont "antes de nadar."
	done

.SeenText:
	text "¡Te estaba"
	line "esperando!"

	para "¡Luchemos!"
	line "¡Ahora mismo!"
	done

.BeatenText:
	text "¡Ay, ay, ay!"
	line "¡Me ha dado un"
	cont "calambre!"
	done

TrainerSwimmermLucas:
	trainer SWIMMERM, LUCAS, EVENT_BEAT_SWIMMERM_LUCAS, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "El arcoíris que"
	line "forma la luz solar"

	para "aparece en el lado"
	line "opuesto al sol."

	para "Curioso, ¿verdad?"
	done

.SeenText:
	text "La luz se refleja"
	line "y se refracta en"

	para "las gotas de agua"
	line "creando un arco-"
	cont "íris."
	done

.BeatenText:
	text "¡Este combate ha"
	line "estado lleno de"
	cont "color!"
	done

GenericTrainerSwimmerfAlison:
	generictrainer SWIMMERF, ALISON, EVENT_BEAT_SWIMMERF_ALISON, .SeenText, .BeatenText

	text "Inspira…"
	line "Expira…"

	para "¿A que resulta"
	line "reconfortante?"
	done

.SeenText:
	text "Antes de luchar,"
	line "debes respirar"
	cont "hondo."
	done

.BeatenText:
	text "Glup… He tragado"
	line "agua de mar…"
	done

GenericTrainerSwimmerfStephanie:
	generictrainer SWIMMERF, STEPHANIE, EVENT_BEAT_SWIMMERF_STEPHANIE, .SeenText, .BeatenText

	text "El sonido viaja"
	line "más rápido por el"
	cont "agua que por aire."

	para "Mola, ¿a que sí?"
	done

.SeenText:
	text "¿Has oído eso?"
	done

.BeatenText:
	text "¡Uuuuh!"
	done

TrainerBird_keeperPowell:
	trainer BIRD_KEEPER, POWELL, EVENT_BEAT_BIRD_KEEPER_POWELL, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_BIRD_KEEPER

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Mi #mon puede"
	line "usar Vuelo aunque"

	para "esté debilitado,"
	line "así que podré vol-"
	cont "ver a casa."

	para "Práctico, ¿eh?"
	done

.SeenText:
	text "Como no sé nadar,"
	line "vine volando sobre"
	cont "mi #mon."
	done

.BeatenText:
	text "¡Oh, no! ¡Mi"
	line "#mon!"
	done

GenericTrainerCosplayerChloe:
	generictrainer COSPLAYER, CHLOE, EVENT_BEAT_COSPLAYER_CHLOE, .SeenText, .BeatenText

	text "Cuando voy vesti-"
	line "da así, todo el"

	para "mundo dice que soy"
	line "la más mona vaya"
	cont "donde vaya."
	done

.SeenText:
	text "¿Te gusta mi cos-"
	line "tume? ¡Es muy efi-"
	cont "caz!"
	done

.BeatenText:
	text "Vaya, parece que"
	line "no fue muy eficaz…"
	done

GenericTrainerFisherKiley:
	generictrainer FISHER, KILEY, EVENT_BEAT_FISHER_KILEY, .SeenText, .BeatenText

	text "Necesitas una bue-"
	line "na Caña si quieres"

	para "pescar buenos"
	line "#mon."
	done

.SeenText:
	text "Hoy estoy en"
	line "racha. ¿Luchamos,"
	cont "renacuajo?"
	done

.BeatenText:
	text "Uf. Esta vez no he"
	line "tenido suerte."
	done

GenericTrainerCamperCraig:
	generictrainer CAMPER, CRAIG, EVENT_BEAT_CAMPER_CRAIG, .SeenText, .BeatenText

	text "La aventura espera"
	line "tras tu tienda."

	para "¡Sal ahí fuera y"
	line "disfruta a tope!"
	done

.SeenText:
	text "¡Nada supera la"
	line "vida al aire"
	cont "libre!"
	done

.BeatenText:
	text "Soy un Campista"
	line "feliz."
	done

GenericTrainerLassLayla:
	generictrainer LASS, LAYLA, EVENT_BEAT_LASS_LAYLA, .SeenText, .BeatenText

	text "Si pides un deseo"
	line "y se lo cuentas a"
	cont "alguien, ¡no se"
	cont "cumplirá!"
	done

.SeenText:
	text "Si pudieras pedir"
	line "un deseo, ¿cuál"
	cont "sería?"
	done

.BeatenText:
	text "¡Pero no me digas"
	line "tu deseo!"
	done

GenericTrainerCoupleFoxandrae1:
	generictrainer COUPLE, FOXANDRAE1, EVENT_BEAT_COUPLE_FOX_AND_RAE, .SeenText, .BeatenText

	text "Fox: No bastó con"
	line "estar tan bien"
	cont "compenetrados."
	done

.SeenText:
	text "Fox: ¡Vamos, Rae,"
	line "a luchar!"
	done

.BeatenText:
	text "Fox: Nos has ven-"
	line "cido a Rae y a mí…"
	done

GenericTrainerCoupleFoxandrae2:
	generictrainer COUPLE, FOXANDRAE2, EVENT_BEAT_COUPLE_FOX_AND_RAE, .SeenText, .BeatenText

	text "Rae: Hemos perdi-"
	line "do, pero seguimos"
	cont "siendo una Pareja"
	cont "feliz."
	done

.SeenText:
	text "Rae: Oye, Fox,"
	line "¿y si libramos un"
	cont "combate?"
	done

.BeatenText:
	text "Rae: ¿Cómo nos has"
	line "ganado a Fox y"
	cont "a mí?"
	done

Route32CoastLassText:
	text "Buf, buf…"

	para "Por fin he cruzado"
	line "esa cueva."

	para "Era mucho más"
	line "grande de lo que"
	cont "me esperaba."

	para "Me cansé de explo-"
	line "rarla entera y me"
	cont "salí."
	done

Route32CoastTrainerTipsText:
	text "Pistas Entrenad."

	para "¡Un #mon con la"
	line "habilidad Recogida"

	para "puede llevar un"
	line "objeto tras un"
	cont "combate!"
	done

Route32CoastUnionCaveSignText:
	text "Cueva Unión"
	line "Más adelante"
	done
