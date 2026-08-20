PsychicInversHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_16_WEST, 1
	warp_event  3,  7, ROUTE_16_WEST, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  2, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PsychicInverScript, -1
	object_event  6,  3, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PsychicInversHouseHexManiacText, -1

	object_const_def
	const PSYCHICINVERSHOUSE_INVER

PsychicInverScript:
	checkflag ENGINE_FOUGHT_PSYCHIC_INVER
	iftrue_jumptextfaceplayer PsychicInverTomorrowText
	faceplayer
	opentext
	writetext PsychicInverGreetingText
	yesorno
	iffalse_jumpopenedtext PsychicInverNoText
	writetext PsychicInverYesText
	waitbutton
	closetext
	setflag ENGINE_FOUGHT_PSYCHIC_INVER
	winlosstext PsychicInverBeatenText, 0
	setlasttalked PSYCHICINVERSHOUSE_INVER
	special PickPsychicInverParty
	loadtrainer INVER, 1
	loadvar VAR_BATTLETYPE, BATTLETYPE_INVERSE
	startbattle
	reloadmapafterbattle
	opentext
	readmem wInverseBattleScore
	ifequalfwd 0, .Score0
	ifgreater 127, .Score0 ; negative
	ifless 4, .Score1_3
	ifless 7, .Score4_6
	ifless 10, .Score7_9
	writetext InverseBattle10PointRewardText
	setval RARE_CANDY
.Reward
	waitbutton
	writetext PsychicInverRewardText
.GiveReward
	promptbutton
	verbosegiveitem ITEM_FROM_MEM
	endtext

.Score0
	writetext InverseBattle0PointRewardText
	waitbutton
	writetext PsychicInverZeroRewardText
	setval ORAN_BERRY
	sjump .GiveReward

.Score1_3
	writetext InverseBattle1_3PointRewardText
	setval SITRUS_BERRY
	sjump .Reward

.Score4_6
	writetext InverseBattle4_6PointRewardText
	random MARANGABERRY - LUM_BERRY + 1 ; excludes early common berries
	addval LUM_BERRY
	sjump .Reward

.Score7_9
	writetext InverseBattle7_9PointRewardText
	random NUM_STONES
	addval FIRST_STONE
	sjump .Reward

PsychicInverGreetingText:
	text "Vaya. No esperaba"
	line "visitas. Hum…"

	para "¿Echamos un duelo"
	line "un tanto curioso?"

	para "¡Yo lo llamo"
	line "Combate Inverso!"

	para "¿Qué me dices?"
	line "¿Te apetece probar"
	cont "un combate así?"
	done

PsychicInverNoText:
	text "Ah, ya veo… Qué"
	line "lástima."

	para "Si lo piensas"
	line "mejor, vuelve por"
	cont "aquí."
	done

PsychicInverYesText:
	text "Lo supereficaz no"
	line "será muy eficaz,"
	cont "¡y viceversa!"
	done

PsychicInverBeatenText:
	text "Este combate me"
	line "ha agotado más"
	cont "que a mis #mon…"
	done

InverseBattle0PointRewardText:
	text "No sé si entiendes"
	line "los Combates"
	cont "Inversos…"
	done

InverseBattle1_3PointRewardText:
	text "Entiendes los"
	line "Combates"
	cont "Inversos…"
	done

InverseBattle4_6PointRewardText:
	text "Entiendes bien"
	line "los Combates"
	cont "Inversos."
	done

InverseBattle7_9PointRewardText:
	text "¡Comprendes los"
	line "Combates Inversos"
	cont "a la perfección!"
	done

InverseBattle10PointRewardText:
	text "Dominas bien los"
	line "Combates Inversos."

	para "No tengo nada que"
	line "hacer contra ti."
	done

PsychicInverZeroRewardText:
	text "Aun así, toma un"
	line "detalle. ¡Vuelve a"
	cont "intentarlo!"
	done

PsychicInverRewardText:
	text "¡Tengo un detalle"
	line "para un rival como"
	cont "tú!"

	para "¡Toma! ¡Quédatelo!"
	done

PsychicInverTomorrowText:
	text "Este poder que"
	line "invierte tipos no"
	cont "puedo usarlo muy a"
	cont "menudo."

	para "Vuelve mañana, por"
	line "favor."
	done

PsychicInversHouseHexManiacText:
	text "¡Mi hermano tiene"
	line "un misterioso"
	cont "poder!"

	para "¡Invierte las"
	line "fuerzas de tipos!"
	cont "¡Es increíble!"

	para "¡Lo supereficaz y"
	line "lo poco eficaz se"
	cont "intercambian!"
	done