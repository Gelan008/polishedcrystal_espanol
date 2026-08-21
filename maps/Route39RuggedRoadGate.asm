Route39RuggedRoadGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, RUGGED_ROAD_SOUTH, 1
	warp_event  5,  0, RUGGED_ROAD_SOUTH, 2
	warp_event  4,  7, ROUTE_39, 3
	warp_event  5,  7, ROUTE_39, 3

	def_coord_events
	coord_event  2,  4, 0, Route39RuggedRoadGateGoGogglesCheck
	coord_event  3,  4, 0, Route39RuggedRoadGateGoGogglesCheck
	coord_event  4,  4, 0, Route39RuggedRoadGateGoGogglesCheck
	coord_event  5,  4, 0, Route39RuggedRoadGateStepLeftOneTrigger
	coord_event  6,  4, 0, Route39RuggedRoadGateStepLeftTwoTrigger
	coord_event  7,  4, 0, Route39RuggedRoadGateStepLeftThreeTrigger

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39RuggedRoadGateOfficerText, -1
	object_event  7,  5, SPRITE_BEACH_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39RuggedRoadGateSwimmerScript, -1

	object_const_def
	const ROUTE39RUGGEDROADGATE_OFFICER

Route39RuggedRoadGateSwimmerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_RARE_CANDY_FROM_RUGGED_ROAD_GATE
	iftrue_jumpopenedtext .LovelyDay
	writetext .BadDay
	checkkeyitem GO_GOGGLES
	iffalse_endtext
	writetext .FoundGoggles
	verbosegiveitem RARE_CANDY
	iffalse_jumpopenedtext .NoRoom
	setevent EVENT_GOT_RARE_CANDY_FROM_RUGGED_ROAD_GATE
	jumpopenedtext .ThanksAgain

.LovelyDay:
	text "¡Qué buen día hace"
	line "hoy, ¿verdad?"

	para "He oído que las"
	line "vistas desde la"
	cont "cima son geniales!"
	done

.BadDay:
	text "¡Arg! El guardia"
	line "del barco me echó"

	para "del puerto cuando"
	line "nadé cerca de él."

	para "¡Y encima perdí"
	line "mis Gafas"
	cont "Aislantes…!"

	para "¡Vaya, hoy no es"
	line "mi día!"
	prompt

.FoundGoggles:
	text "¡Oh, pero si las"
	line "has encontrado!"

	para "Aunque ya me he"
	line "comprado otras…"

	para "¡Toma esto en"
	line "agradecimiento!"
	prompt

.NoRoom:
	text "¡Vaya! Parece que"
	line "llevas la Mochila"
	cont "bastante llena…"
	done

.ThanksAgain:
	text "Keep the goggles."
	line "Thanks again!"
	done

Route39RuggedRoadGateStepLeftThreeTrigger:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
	applymovement PLAYER, Route39RuggedRoadGateStepLeftThreeMovementData
	sjumpfwd Route39RuggedRoadGateCannotPassScript

Route39RuggedRoadGateStepLeftTwoTrigger:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
	applymovement PLAYER, Route39RuggedRoadGateStepLeftTwoMovementData
	sjumpfwd Route39RuggedRoadGateCannotPassScript

Route39RuggedRoadGateStepLeftOneTrigger:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
	applyonemovement PLAYER, step_left
	sjumpfwd Route39RuggedRoadGateCannotPassScript

Route39RuggedRoadGateGoGogglesCheck:
	checkkeyitem GO_GOGGLES
	iftrue DoNothingScript
Route39RuggedRoadGateCannotPassScript:
	showemote EMOTE_SHOCK, ROUTE39RUGGEDROADGATE_OFFICER, 15
	turnobject PLAYER, LEFT
	showtext Route39RuggedRoadGateOfficerCannotPassText
	applymovement PLAYER, Route39RuggedRoadGateCannotPassMovement
	end

Route39RuggedRoadGateStepLeftThreeMovementData:
	step_left
Route39RuggedRoadGateStepLeftTwoMovementData:
	step_left
	step_left
	step_end

Route39RuggedRoadGateCannotPassMovement:
	step_down
	turn_head_up
	step_end

Route39RuggedRoadGateOfficerCannotPassText:
	text "¡Alto! ¿Adónde"
	line "crees que vas?"

	para "¡La ruta hacia"
	line "Cumbre Nevada es"
	cont "muy dura!"

	para "No puedo dejarte"
	line "pasar sin llevar"
	cont "Gafas Aislantes."
	done

Route39RuggedRoadGateOfficerText:
	text "¡El camino a"
	line "Cumbre Nevada"
	cont "es peligroso!"

	para "Por eso abrieron"
	line "allí un gran"
	cont "Centro #mon."
	done
