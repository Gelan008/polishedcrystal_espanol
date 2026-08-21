WarmBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15, 13, WARM_BEACH_SHACK, 1
	warp_event  8,  5, SHAMOUTI_TUNNEL, 2
	warp_event  3,  8, WARM_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 14, BGEVENT_JUMPTEXT, WarmBeachShackSignText
	bg_event 18, 20, BGEVENT_JUMPTEXT, WarmBeachShrineText
	bg_event 19, 20, BGEVENT_JUMPTEXT, WarmBeachShrineText
	bg_event  7, 20, BGEVENT_ITEM + PEARL, EVENT_WARM_BEACH_HIDDEN_PEARL

	def_object_events
	object_event 11,  8, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermGareth, -1
	object_event  4, 12, SPRITE_AROMA_LADY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAromaLadyHolly, -1
	object_event 11, 14, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainermText, -1
	object_event 22, 20, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachCooltrainerfText, -1
	object_event 17, 21, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWKING, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, WarmBeachSlowkingScript, -1
	object_event 11, 20, SPRITE_PICNICKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachLassScript, -1
	object_event  6, 23, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachLadyText, -1

GenericTrainerSightseermGareth:
	generictrainer SIGHTSEERM, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText, .BeatenText

	text "Even outside of"
	line "battle, these"

	para "items make memor-"
	line "able souvenirs."
	done

.SeenText:
	text "I just picked up"
	line "some useful items"

	para "from the outdoor"
	line "market!"
	done

.BeatenText:
	text "My items weren't"
	line "enough…"
	done

GenericTrainerAromaLadyHolly:
	generictrainer AROMA_LADY, HOLLY, EVENT_BEAT_AROMA_LADY_HOLLY, .SeenText, .BeatenText

	text "The sense of smell"
	line "is vital to living"
	cont "in nature."
	done

.SeenText:
	text "Estoy en armonía"
	line "con los aromas de"
	cont "la naturaleza."
	done

.BeatenText:
	text "La derrota tiene"
	line "su propio aroma…"
	done

WarmBeachCooltrainermText:
	text "¡Hay un #mon"
	line "por aquí que"
	cont "habla!"

	para "¡No lo creería de"
	line "no haberlo visto"
	cont "con mis ojos!"
	done

WarmBeachCooltrainerfText:
	text "Soy la doncella"
	line "del festival de"
	cont "este año,"

	para "así que tengo que"
	line "tocar la melodía"
	cont "del Elegido."

	para "Estoy nerviosa, y"
	line "vine hasta aquí a"
	cont "practicar."
	done

WarmBeachSlowkingScript:
	jumpthistext

	text "Me vendrían bien"
	line "unos pantalones…"
	done

WarmBeachLassScript:
	faceplayer
	opentext
	checkflag ENGINE_SEASHORE_SHELL_BELL
	iftrue_jumpopenedtext .Text3
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text4
	checkmoney YOUR_MONEY, 4000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SHELL_BELL
	iffalse_jumpopenedtext .Text6
	setflag ENGINE_SEASHORE_SHELL_BELL
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "One Shell Bell,"
	line "just for you!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "You don't have"
	line "enough money…"
	done

.Text1:
	text "Recojo conchas de"
	line "la playa y hago"
	cont "Campanas Concha."

	para "Dicen que curan"
	line "con su tintineo."

	para "Cuestan 4000¥ cada"
	line "una. ¿Quieres una?"
	done

.Text3:
	text "Hoy solo he podido"
	line "hacer una Campana"
	cont "Concha…"
	done

.Text4:
	text "¡No pasa nada!"
	done

.Text6:
	text "No te queda más"
	line "espacio libre…"
	done

WarmBeachLadyText:
	text "Esas islas que se"
	line "ven a lo lejos son"
	cont "los templos del"
	cont "Fuego, Hielo y"
	cont "el Rayo."

	para "Eso dice la guía,"
	line "pero ¿para qué"
	cont "servirán?"
	done

WarmBeachShackSignText:
	text "Cabaña de la Playa"
	done

WarmBeachShrineText:
	text "Es un santuario"
	line "dedicado al"
	cont "Guardián de los"
	cont "Mares."
	done
