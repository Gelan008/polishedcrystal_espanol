Route35GoldenrodGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_BREEDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35GoldenrodGateFisherText, -1

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftruefwd .gothpup
	checkevent EVENT_GAVE_KENYA
	iftruefwd .questcomplete
	checkevent EVENT_GOT_KENYA
	iftruefwd .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalsefwd .refused
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, FEMALE | PLAIN_FORM, 10, NO_ITEM, NET_BALL, NO_MOVE, GiftSpearowName, GiftSpearowOTName, 01001
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	jumpopenedtext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText

.partyfull
	jumpopenedtext Route35GoldenrodGateRandyCantCarryAnotherMonText

.refused
	jumpopenedtext Route35GoldenrodGateRandyOhNeverMindThenText

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalsefwd .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	endtext

GiftSpearowMail:
	db   FLOWER_MAIL
	setcharmap no_ngrams
	db   "¡Cueva Oscura da"
	next "a otro camino!@@"
	setcharmap default

GiftSpearowName:
	rawchar "Kenya@"

GiftSpearowOTName:
	rawchar "Randy@"

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .aftersudowoodo
	jumpopenedtext Route35GoldenrodGatePokefanFText

.aftersudowoodo
	jumpopenedtext Route35GoldenrodGatePokefanFText_FoughtSudowoodo

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "¡Oye, chaval! ¿Me"
	line "haces un favor?"

	para "¿Puedes llevarle"
	line "este #mon con"
	cont "Carta a mi amigo?"

	para "Está en la"
	line "Ruta 31."
	done

Route35GoldenrodGateRandyThanksText:
	text "¿Sí? ¡Genial!"
	line "¡Gracias, chaval!"

	para "Mi amigo es un"
	line "gordinflón que se"
	cont "pasa el día"
	cont "durmiendo."

	para "¡Lo reconocerás al"
	line "instante!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> recibió"
	line "un #mon con"
	cont "Carta."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "You can read it,"
	line "but don't lose it!"
	cont "Route 31!"

	para "Oh, yeah. There"
	line "was a weird tree"
	cont "blocking the road."

	para "I wonder if it's"
	line "been cleared?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "You can't carry"
	line "another #mon…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Oh… Never mind,"
	line "then…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "¡Gracias! ¡Me has"
	line "hecho la entrega!"

	para "¡Toma esto por las"
	line "molestias!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Estaba durmiendo,"
	line "¿verdad? ¡Je, te"
	cont "lo dije!"
	done

Route35GoldenrodGatePokefanFText:
	text "A strange tree is"
	line "blocking the road."

	para "It wriggles around"
	line "if you talk to it."

	para "I heard it became"
	line "wild when someone"

	para "watered it with a"
	line "SquirtBottle."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "I like the #mon"
	line "Lullaby they play"
	cont "on the radio."
	done

Route35GoldenrodGateFisherText:
	text "¿Cuántas clases de"
	line "#mon habrá en"
	cont "el mundo?"

	para "Hace tres años, el"
	line "Prof. Oak dijo que"
	cont "había 150 tipos."
	done
