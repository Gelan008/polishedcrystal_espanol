EcruteakHouse_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
	scene_const SCENE_ECRUTEAKHOUSE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, EcruteakHouseInitializeSages

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_HOUSE, 4
	warp_event 17, 15, ECRUTEAK_HOUSE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	def_coord_events
	coord_event  4,  7, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS, EcruteakHouse_XYTrigger1
	coord_event  5,  7, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS, EcruteakHouse_XYTrigger2

	def_bg_events

	def_object_events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakTinTowerEntranceGrampsText, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE

	object_const_def
	const ECRUTEAKHOUSE_SAGE1
	const ECRUTEAKHOUSE_SAGE2

EcruteakHouseInitializeSages:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftruefwd .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .BlockTower
	endcallback

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	checkkeyitem CLEAR_BELL
	iftruefwd .NoClearBell
	setscene SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
.NoClearBell:
	endcallback

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	endcallback

EcruteakHouse_XYTrigger1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftruefwd EcruteakHouse_XYTrigger_DontMove
	applymovement ECRUTEAKHOUSE_SAGE2, EcruteakTinTowerEntranceSageBlocksLeftMovement
	moveobject ECRUTEAKHOUSE_SAGE1, 4, 6
	appear ECRUTEAKHOUSE_SAGE1
	pause 5
	callasm UpdateSprites
	disappear ECRUTEAKHOUSE_SAGE2
	end

EcruteakHouse_XYTrigger2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftruefwd EcruteakHouse_XYTrigger_DontMove
	applymovement ECRUTEAKHOUSE_SAGE1, EcruteakTinTowerEntranceSageBlocksRightMovement
	moveobject ECRUTEAKHOUSE_SAGE2, 5, 6
	appear ECRUTEAKHOUSE_SAGE2
	pause 5
	callasm UpdateSprites
	disappear ECRUTEAKHOUSE_SAGE1
	end

EcruteakHouse_XYTrigger_DontMove:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue_jumpopenedtext EcruteakTinTowerEntranceSageText_GotFogBadge
	jumpthisopenedtext

	text "La Torre Hojalata"
	line "está cerrada si no"

	para "tienes la Medalla"
	line "del Gimnasio de"
	cont "Ciudad Iris."

	para "Lo siento, pero"
	line "tendrás que irte."
	done

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue_jumpopenedtext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumpopenedtext EcruteakTinTowerEntranceSageText_HeardClearBell
	checkkeyitem CLEAR_BELL
	iftruefwd .RingClearBell
	jumpthisopenedtext

	text "Ha ocurrido un in-"
	line "cidente trascen-"
	cont "dental."

	para "Disculpa, pero de-"
	line "bo pedirte que te"
	cont "vayas."

	para "…Lo que calma"
	line "el alma…"

	para "El Trío Sabio dice"
	line "cosas que son muy"

	para "difíciles de en-"
	line "tender…"
	done

.RingClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_ECRUTEAKHOUSE_NOOP
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

EcruteakTinTowerEntranceWanderingSageScript:
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue_jumptextfaceplayer EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	jumpthistextfaceplayer

	text "La Torre Hojalata"
	line "de enfrente es una"

	para "torre de nueve pi-"
	line "sos de una belleza"
	cont "divina."

	para "Calma el alma de"
	line "todo aquel que la"
	cont "contempla."
	done

EcruteakTinTowerEntranceSageBlocksLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	turn_head_down
	step_end

EcruteakTinTowerEntranceSageBlocksRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	turn_head_down
	step_end


EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "La Torre Hojalata"
	line "está cerrada si no"

	para "tienes la Medalla"
	line "del Gimnasio de"
	cont "Ciudad Iris."

	para "¡Ah!"

	para "¡La Medalla"
	line "Iris! Por favor,"
	cont "pasa adelante."
	done


EcruteakTinTowerEntranceSageText_HearsClearBell:
	text "Ha ocurrido un in-"
	line "cidente trascen-"
	cont "dental."

	para "Disculpa, pero de-"
	line "bo pedirte que te"
	cont "vayas."

	para "……"

	para "¡Ah!"

	para "¡El sonido de esa"
	line "Campana Clara!"

	para "¡E-es sublime!"

	para "¡Nunca antes había"
	line "oído un sonido tan"
	cont "hermoso!"

	para "El repique de la"
	line "campana indica el"
	cont "alma de su porta-"
	cont "dor."

	para "Tú…"

	para "Es posible que pu-"
	line "edas atravesar la"
	cont "Torre Hojalata."

	para "Por favor, pasa"
	line "adelante."
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text "Por favor, pasa"
	line "adelante."
	done

EcruteakTinTowerEntranceSageText_HeardClearBell:
	text "El repique de la"
	line "campana indica el"
	cont "alma de su porta-"
	cont "dor."

	para "Tú…"

	para "Es posible que pu-"
	line "edas atravesar la"
	cont "Torre Hojalata."

	para "Por favor, pasa"
	line "adelante."
	done


EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "¡La Torre Hojalata"
	line "tembló! ¡Un #-"
	cont "mon"

	para "debe haber regre-"
	line "sado a la cima!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Dos torres…"
	line "Dos #mon…"

	para "Pero cuando una se"
	line "quemó, ambos #"
	cont "mon"

	para "se fueron volando,"
	line "para nunca volver."
	done
