Route34IlexForestGate_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE34ILEXFORESTGATE_TEACHER_BLOCKS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .IsForestRestless

	def_warp_events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	def_coord_events
	coord_event  4,  7, SCENE_ROUTE34ILEXFORESTGATE_TEACHER_BLOCKS, Route34IlexForestGateCelebiEvent

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  5,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
	pokemon_event  9,  4, HERACROSS, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, Route34IlexForestGateHeracrossText, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  3,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route34IlexForestGateLassText, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS

	object_const_def
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_TEACHER2

.IsForestRestless:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalsefwd .Normal
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	endcallback

.Normal:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	endcallback

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalsefwd .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, Route34IlexForestGateTeacherBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, DOWN
	showtext Route34IlexForestGateTeacher_ForestIsRestless
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, Route34IlexForestGateTeacherReturnsMovement
.skip:
	end

Route34IlexForestGateTeacherScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue_jumptextfaceplayer Route34IlexForestGateTeacher_ForestIsRestless
	checkevent EVENT_GOT_TM54_FALSE_SWIPE
	iftrue_jumptextfaceplayer Route34IlexForestGateTeacher_GotSweetScent
	faceplayer
	opentext
	writetext Route34IlexForestGateTeacherText
	promptbutton
	verbosegivetmhm TM_FALSE_SWIPE
	setevent EVENT_GOT_TM54_FALSE_SWIPE
	jumpthisopenedtext

Route34IlexForestGateTeacher_GotSweetScent:
	text "Es Falsootazo."

	para "No debilitará a"
	line "los #mon salva-"
	cont "jes,"

	para "así que será más"
	line "fácil atraparlos."
	done

Route34IlexForestGateTeacherBlocksPlayerMovement:
	step_up
	step_up
	step_end

Route34IlexForestGateTeacherReturnsMovement:
	step_down
	step_right
	step_end

Route34IlexForestGateTeacherText:
	text "¡Hola! ¿Estás com-"
	line "pletando una"
	cont "#dex?"

	para "Debe de ser difícil"
	line "atrapar a tantos"
	cont "#mon."

	para "¡Toma, quédate con"
	line "esta MT!"
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Pasa algo raro en"
	line "el Encinar…"

	para "Será mejor que no"
	line "te acerques ahora."
	done

Route34IlexForestGateHeracrossText:
	text "Heracross: ¡Cross!"
	done

Route34IlexForestGateLassText:
	text "¿Viste el santua-"
	line "rio en honor al"
	cont "protector?"

	para "Vigila el bosque a"
	line "través del tiempo."

	para "Creo que debe de"
	line "ser un #mon de"
	cont "tipo Planta."
	done