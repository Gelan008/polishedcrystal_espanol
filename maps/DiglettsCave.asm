DiglettsCave_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 37, 15, VERMILION_CITY, 10
	warp_event 39, 13, DIGLETTS_CAVE, 5
	warp_event 37,  5, ROUTE_2_NORTH, 4
	warp_event 39,  3, DIGLETTS_CAVE, 6
	warp_event 37, 31, DIGLETTS_CAVE, 2
	warp_event  5,  5, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_ITEM + MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE
	bg_event 34, 33, BGEVENT_ITEM + MAX_REPEL, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REPEL

	def_object_events
	object_event 11, 15, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DiglettsCaveFossilManiacScript, -1
	object_event  5, 13, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerGerard, -1
	object_event 25, 31, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerHikerDent, -1
	object_event 16, 21, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltInigo, -1
	object_event  9, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerSmith, -1
	object_event 37, 13, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, DiglettsCavePokefanMText, -1
	object_event 20, 27, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, DiglettsCaveCooltrainerfText, -1
	itemball_event 13, 28, RARE_BONE, 1, EVENT_DIGLETTS_CAVE_RARE_BONE

DiglettsCaveFossilManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetFossilManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "¡Oye, gracias!"

	para "Apuesto a que"
	line "puedo vender esto"
	cont "por mucho más de"
	cont "lo que te acabo"
	cont "de dar. ¡Ja!"

	para "¡Así son los"
	line "negocios!"
	done

.GreetingText:
	text "Oye, escucha esto."
	line "¡Tengo un trato"
	cont "muy bueno para ti!"

	para "¿Sabes cómo"
	line "aparecen Fósiles"
	cont "#mon en las"
	cont "rocas?"

	para "Si encuentras uno,"
	line "tráemelo a mí."

	para "Haré que valga la"
	line "pena."
	done

.OfferText:
	text "¡Oye, genial! Deja"
	line "que lo vea."

	para "Te daré"
	line "¥"
	text_decimal hMoneyTemp, 3, 7
	text " por"
	cont "eso. ¿Qué dices?"
	done

.WrongItemText:
	text "No, esto no sirve."
	line "No vale la pena."
	done

.NoItemText:
	text "…No, nada guay"
	line "en tu Mochila."

	para "Oh, bueno. ¡Tal"
	line "vez la próxima!"
	done

GenericTrainerHikerGerard:
	generictrainer HIKER, GERARD, EVENT_BEAT_HIKER_GERARD, .SeenText, .BeatenText

	text "Este lugar me pone"
	line "muy nervioso."

	para "¿Y si me ataca un"
	line "Diglett de la"
	cont "nada?"
	done

.SeenText:
	text "¡Aah! ¡Creo que"
	line "esa roca acaba de"
	cont "moverse!"
	done

.BeatenText:
	text "Debió de ser"
	line "imaginación mía."
	done

GenericTrainerHikerDent:
	generictrainer HIKER, DENT, EVENT_BEAT_HIKER_DENT, .SeenText, .BeatenText

	text "Encajaré perfec-"
	line "tamente con los"
	cont "tíos cachas del"
	cont "Gimnasio Plateada."
	cont "¡Jo, jo, jo!"
	done

.SeenText:
	text "Me dirijo a Ciudad"
	line "Plateada."

	para "¡Su Gimnasio de"
	line "tipo Roca es per-"
	cont "fecto para un tío"
	cont "cachas como yo!"
	done

.BeatenText:
	text "¡Jo, jo, jo!"
	line "¡Alguien más"
	cont "cachas que yo!"
	done

GenericTrainerBlackbeltInigo:
	generictrainer BLACKBELT_T, INIGO, EVENT_BEAT_BLACKBELT_INIGO, .SeenText, .BeatenText

	text "Hacer ruido no te"
	line "hará mejor lucha-"
	cont "dor, pero puede"

	para "intimidar a tus"
	line "enemigos."
	done

.SeenText:
	text "¡Prepárate para el"
	line "combate!"
	cont "¡HUU-JAA!"
	done

.BeatenText:
	text "¡JIIYAAAH!"
	done

GenericTrainerEngineerSmith:
	generictrainer ENGINEER, SMITH, EVENT_BEAT_ENGINEER_SMITH, .SeenText, .BeatenText

	text "Esos Diglett son"
	line "ingenieros natos."
	done

.SeenText:
	text "¿Cómo han creado"
	line "los Diglett un"
	cont "túnel tan largo?"
	done

.BeatenText:
	text "¡Increíble!"
	done

DiglettsCaveCooltrainerfText:
	text "¡Mira a todos es-"
	line "tos Diglett monos!"

	para "¡Juro que he visto"
	line "a uno con la nariz"
	cont "azul!"
	done

DiglettsCavePokefanMText:
	text "¡Un grupo de Dig-"
	line "lett salió del"

	para "suelo! Eso fue"
	line "impactante."

	para "He oído que los"
	line "Diglett de Isla"
	cont "Canela son"
	cont "diferentes."
	done
