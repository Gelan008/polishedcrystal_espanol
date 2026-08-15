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
	object_event 17, 21, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWKING, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, WarmBeachSlowkingScript, -1
	object_event 11, 20, SPRITE_PICNICKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachLassScript, -1
	object_event  6, 23, SPRITE_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachLadyText, -1

GenericTrainerSightseermGareth:
	generictrainer SIGHTSEERM, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText, .BeatenText

	text "Incluso fuera del"
	line "combate, estos ob-"

	para "jetos son grandes"
	line "recuerdos."
	done

.SeenText:
	text "¡Acabo de comprar"
	line "objetos muy útiles"

	para "en el mercadillo"
	line "al aire libre!"
	done

.BeatenText:
	text "Mis objetos no han"
	line "bastado…"
	done

GenericTrainerAromaLadyHolly:
	generictrainer AROMA_LADY, HOLLY, EVENT_BEAT_AROMA_LADY_HOLLY, .SeenText, .BeatenText

	text "El olfato es vital"
	line "para vivir en ple-"
	cont "na naturaleza."
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
	text "¡Hay un #mon por"
	line "aquí que habla!"

	para "¡No me lo creería"
	line "si no lo hubiera"

	para "visto con mis pro-"
	line "pios ojos!"
	done

WarmBeachCooltrainerfText:
	text "Me han elegido do-"
	line "ncella del festi-"
	cont "val este año,"

	para "así que tengo que"
	line "tocar la melodía"
	cont "del Elegido."

	para "Estoy de los ner-"
	line "vios, así que vine"
	cont "aquí a practicar."
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

	text "¡Una Campana Alivio"
	line "solo para ti!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "No tienes sufi-"
	line "ciente dinero…"
	done

.Text1:
	text "Recojo conchas de"
	line "la playa y hago"

	para "Campan. Alivio con"
	line "ellas."

	para "Dicen que su soni-"
	line "do es curativo."

	para "Cuestan ¥4000 cada"
	line "una. ¿Quieres una?"
	done

.Text3:
	text "Hoy solo he podido"
	line "hacer una Campana"
	cont "Alivio…"
	done

.Text4:
	text "¡No pasa nada!"
	done

.Text6:
	text "No tienes sufi-"
	line "ciente espacio…"
	done

WarmBeachLadyText:
	text "Esas islas que se"
	line "ven a lo lejos"

	para "se conocen como"
	line "los templos del"

	para "Fuego, el Hielo"
	line "y el Rayo."

	para "Eso dice este fo-"
	line "lleto, pero ¿para"

	para "qué servirán?"
	done

WarmBeachShackSignText:
	text "Cabaña de la Playa"
	done

WarmBeachShrineText:
	text "Es un santuario"
	line "dedicado al Guardi-"
	cont "án de los Mares."
	done
