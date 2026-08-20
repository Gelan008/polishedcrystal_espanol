ManiasHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, radio2
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftruefwd .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftruefwd .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckie
	yesorno
	iffalsefwd .refusetotakeshuckie
	givepoke SHUCKLE, MALE | PLAIN_FORM, 25, BERRY_JUICE, NET_BALL, POISON_JAB, ShuckieName, ShuckieOTName, KIRK_SHUCKIE_ID
	iffalse_jumpopenedtext ManiaText_PartyAndBoxFull
	writetext ManiaText_TakeCareOfShuckie
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckie
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .shuckieinparty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext ManiaText_ShuckieSentToPC
	promptbutton
.shuckieinparty
	closetext
	setevent EVENT_GOT_SHUCKIE
	setflag ENGINE_GOT_SHUCKIE_TODAY
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalsefwd .returnshuckie
	jumpopenedtext ManiaText_TakeCareOfShuckie

.refusetotakeshuckie
	jumpthisopenedtext

	text "Oh, no… ¿Qué"
	line "haré si regresa?"
	done

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalsefwd .refused
	special ReturnShuckie
	ifequalfwd $0, .wrong
	ifequalfwd $1, .refused
	ifequalfwd $3, .superhappy
	ifequalfwd $4, .default_postevent
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	jumpthisopenedtext

	text "Oye, no llevas a"
	line "mi #mon contigo"
	done

.superhappy
	writetext ManiaText_ShuckieLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	jumpthisopenedtext

	text "Oh, no… Es lo"
	line "mismo que si me"
	cont "robaran."
	done

.nothingleft
	jumpthisopenedtext

	text "Si me llevo mi"
	line "#mon de vuelta,"

	para "¿qué vas a usar"
	line "para combatir?"
	done

.default_postevent
	jumpthisopenedtext

	text "Para un #mon,"
	line "la felicidad es"
	cont "estar con alguien"
	cont "que lo cuide."
	done

ShuckieName:
	rawchar "Shuckie@"

ShuckieOTName:
	rawchar "Kirk@"

ManiaText_AskLookAfterShuckie:
	text "¡Estoy en shock!"

	para "Entró un chico de"
	line "tu edad, de mirada"
	cont "dura y pelo largo."

	para "¡Me asustó tanto"
	line "que le di a mi"
	cont "querido #mon!"

	para "Me queda otro,"
	line "¿y si vuelve?"

	para "Pareces fuerte."
	line "¿Cuidarías de mi"
	cont "#mon un tiempo?"
	done

ManiaText_TakeCareOfShuckie:
	text "¡Oh, gracias!"

	para "¡Cuídalo muy bien,"
	line "por favor!"
	done

ManiaText_GotShuckie:
	text "<PLAYER> recibió"
	line "un #mon."
	done

ManiaText_ShuckieSentToPC:
	text "El #mon fue"
	line "enviado a "
	text_ram wStringBuffer1
	text "."
	done

ManiaText_PartyAndBoxFull:
	text "Tu equipo #mon"
	line "y la Caja están"
	cont "llenos."
	done


ManiaText_CanIHaveMyMonBack:
	text "¡Hola! ¿Cómo está"
	line "mi #mon?"

	para "Creo que ya estoy"
	line "a salvo. ¿Me lo"
	cont "devuelves?"
	done

ManiaText_ThankYou:
	text "¡Gracias!"
	done


ManiaText_ShuckieLikesYou:
	text "¡A mi #mon le"
	line "has caído bien!"

	para "De acuerdo, te lo"
	line "puedes quedar."

	para "¡Prométeme que lo"
	line "cuidarás bien!"
	done
