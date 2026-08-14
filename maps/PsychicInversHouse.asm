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
	text "Vaya. No me espe-"
	line "raba visitas por"
	cont "aquí. Hum…"

	para "¿Echamos un com-"
	line "bate un tanto pe-"
	cont "culiar?"

	para "¡Yo lo llamo Com-"
	line "bate Inverso!"

	para "¿Qué me dices?"
	line "¿Te apetece probar"
	cont "un Combate"
	cont "Inverso?"
	done

PsychicInverNoText:
	text "Ah, ya veo… Qué"
	line "lástima."

	para "Si cambias de opi-"
	line "nión, vuelve por"
	cont "aquí."
	done

PsychicInverYesText:
	text "Los movimientos"
	line "supereficaces no"

	para "serán muy eficaces"
	line "y viceversa."
	done

PsychicInverBeatenText:
	text "Este combate me"
	line "ha agotado incluso"

	para "más que a mis"
	line "#mon…"
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
	text "Entiendes los Com-"
	line "bates Inversos bas-"
	cont "tante bien."
	done

InverseBattle7_9PointRewardText:
	text "¡Entiendes los Com-"
	line "bates Inversos a"
	cont "la perfección!"
	done

InverseBattle10PointRewardText:
	text "Dominas los Comba-"
	line "tes Inversos."

	para "No tengo nada que"
	line "hacer contra ti."
	done

PsychicInverZeroRewardText:
	text "Aun así, te daré"
	line "un detalle, ¡así"

	para "que vuelve a in-"
	line "tentarlo!"
	done

PsychicInverRewardText:
	text "¡Tengo un detalle"
	line "para un rival como"
	cont "tú!"

	para "¡Toma! ¡Quédatelo!"
	done

PsychicInverTomorrowText:
	text "Este extraño poder"
	line "que invierte la"

	para "efectividad de ti-"
	line "pos…"

	para "No puedo usarlo"
	line "muy a menudo."

	para "Vuelve mañana, por"
	line "favor."
	done

PsychicInversHouseHexManiacText:
	text "¡Mi hermano tiene"
	line "un misterioso"
	cont "poder!"

	para "¡Puede invertir la"
	line "efectividad de los"

	para "tipos! ¡Es una pa-"
	line "sada!"

	para "¡Lo supereficaz y"
	line "lo poco eficaz se"
	cont "intercambian!"
	done