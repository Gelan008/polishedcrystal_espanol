Route35NationalParkGate_MapScriptHeader:
	def_scene_scripts
	scene_script Route35NationalParkGateTrigger0
	scene_script Route35NationalParkGateTrigger1
	scene_script Route35NationalParkGateTrigger2

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route35NationalParkGate_CheckIfStillInContest
	callback MAPCALLBACK_OBJECTS, Route35NationalParkGate_CheckIfContestDay

	def_warp_events
	warp_event 15,  0, NATIONAL_PARK, 3
	warp_event 16,  0, NATIONAL_PARK, 4
	warp_event 15,  7, ROUTE_35, 3
	warp_event 16,  7, ROUTE_35, 3
	warp_event  0,  4, ROUTE_35_COAST_NORTH, 1
	warp_event  0,  5, ROUTE_35_COAST_NORTH, 2

	def_coord_events

	def_bg_events
	bg_event 17,  0, BGEVENT_JUMPTEXT, BugCatchingContestExplanationText

	def_object_events
	object_event 14,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event 18,  5, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route35NationalParkGateYoungsterText, EVENT_ROUTE_35_NATIONAL_PARK_GATE_BUG_MANIAC
	object_event 12,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	object_event  5,  2, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGatePokefanFScript, -1

	object_const_def
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_BUG_MANIAC
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGateTrigger2:
	sdefer Route35NationalParkGate_LeavingContestEarly
Route35NationalParkGateTrigger0:
Route35NationalParkGateTrigger1:
	end

Route35NationalParkGate_CheckIfStillInContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftruefwd Route35NationalParkGate_Yes
	setscene $0
	endcallback

Route35NationalParkGate_Yes:
	setscene $2
	endcallback

Route35NationalParkGate_CheckIfContestDay:
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, Route35NationalParkGate_IsContestDay
	ifequalfwd THURSDAY, Route35NationalParkGate_IsContestDay
	ifequalfwd SATURDAY, Route35NationalParkGate_IsContestDay
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkGate_Yes
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_BUG_MANIAC
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGate_IsContestDay:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_BUG_MANIAC
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	endcallback

Route35NationalParkGate_LeavingContestEarly:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval $1
	setquantity
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalsefwd Route35NationalParkGate_GoBackIn
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

Route35NationalParkGate_GoBackIn:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 12, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd MONDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequalfwd FRIDAY, Route35NationalParkGate_NoContestToday
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
	faceplayer
	opentext
	callstd daytotext
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalsefwd Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater $1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	callasm ShowParkBallIcon
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special Special_GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 12, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequalfwd LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applyonemovement PLAYER, step_up
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless 6, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	iffalse_jumpopenedtext Route35NationalParkGateOfficer1MakeRoomText
Route35NationalParkGate_LessThanFullParty: ; 6a27d
	special CheckFirstMonIsEgg
	iftrue_jumpopenedtext Route35NationalParkGateOfficer1EggAsFirstMonText
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalsefwd Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftruefwd Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	jumpopenedtext Route35NationalParkGateOfficer1TakePartInFutureText

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	jumpopenedtext Route35NationalParkGateOfficer1ChooseMonAndComeBackText

Route35NationalParkGate_FirstMonIsFainted:
	jumpopenedtext Route35NationalParkGateOfficer1FirstMonCantBattleText

Route35NationalParkGateOfficerScript:
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue_jumptextfaceplayer Route35NationalParkGateOfficer1ContestIsOverText
Route35NationalParkGate_NoContestToday:
	jumpthistextfaceplayer

	text "We hold Contests"
	line "regularly in the"

	para "park. You should"
	line "give it a shot."
	done

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step_down
	turn_head_left
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step_right
	step_up
	step_up
	step_end

Route35NationalParkGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_CHARM_INTRO
	iftruefwd Route35NationalParkGateTutorCharmScript
	writetext Route35NationalParkGatePokefanFText
	waitbutton
	setevent EVENT_LISTENED_TO_CHARM_INTRO
Route35NationalParkGateTutorCharmScript:
	writetext Text_Route35NationalParkGateTutorCharm
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Route35NationalParkGateTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval CHARM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Aw, I guess your"
	line "#mon are cute"
	cont "enough,"

	para "but they still"
	line "could be cuter!"
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "Sorry, but I can't"
	line "teach the move"

	para "unless you have a"
	line "a Silver Leaf."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Your #mon is"
	line "cuter already!"
	done

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Hoy es "
	text_ram wStringBuffer3
	text "."
	line "Eso significa que"

	para "hoy hay Concurso"
	line "de la Caza del"
	cont "Bicho."

	para "Las reglas son"
	line "muy sencillas."

	para "Con uno de tus"
	line "#mon, atrapa"

	para "un #mon bicho"
	line "para el concurso."

	para "¿Te gustaría"
	line "participar?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Aquí tienes las"
	line "Parque Balls para"
	cont "el Concurso."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "¡<PLAYER> recibió"
	line "{d:BUG_CONTEST_BALLS} Parque Balls!"
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "Gana la persona"
	line "que atrape al"

	para "#mon bicho más"
	line "fuerte de todos."

	para "Tienes {d:BUG_CONTEST_MINUTES}"
	line "minutos."

	para "Si te quedas sin"
	line "Parque Balls,"
	cont "habrás terminado."

	para "Podrás quedarte"
	line "con el último"
	cont "#mon atrapado."

	para "¡Sal y atrapa al"
	line "#mon bicho más"

	para "fuerte que puedas"
	line "encontrar!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "¡Vaya…!"

	para "Tienes más de un"
	line "#mon."

	para "Tendrás que usar a"
	line ""
	text_ram wStringBuffer3
	text ", el"

	para "primer #mon de"
	line "tu equipo."

	para "¿Te parece bien?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Bien, cuidaremos"
	line "de tus otros #"
	cont "mientras estés"
	cont "compitiendo."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "Los #mon de"
	line "<PLAYER> quedan"
	cont "a cargo del"
	cont "Ayudante."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Elige el #mon"
	line "que vas a usar en"

	para "el Concurso y"
	line "vuelve a verme."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "Entendido."
	line "¡Esperamos verte"
	cont "en el futuro!"
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "¡Vaya…!"
	line "El primer #mon"
	cont "de tu equipo no"
	cont "puede luchar."

	para "Cámbialo por el"
	line "#mon que vayas"
	cont "usar y regresa."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "¡Vaya…!"
	line "Tanto tu equipo"
	cont "como tu Caja del"
	cont "PC están llenos."

	para "No tienes sitio"
	line "para el # que"
	cont "vayas a capturar."

	para "Haz sitio en tu"
	line "equipo o Caja PC"
	cont "y vuelve a verme."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "¡Vaya…!"
	line "Llevas un Huevo en"
	cont "primer lugar de"
	cont "tu equipo."

	para "Cámbialo por el"
	line "# que vayas a"
	cont "usar y regresa."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Aún te queda"
	text_plural
	text " "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line "minuto"
	text_plural
	text "."

	para "¿Quieres terminar"
	line "ya?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "Bien. Espera en la"
	line "Puerta Norte a que"

	para "se anuncien los"
	line "ganadores."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "Vale. Vuelve fuera"
	line "y sigue jugando en"
	cont "el Concurso."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "El Concurso de hoy"
	line "ha acabado."

	para "¡Esperamos que"
	line "vengas a la"
	cont "próxima ocasión!"
	done

Route35NationalParkGateYoungsterText:
	text "¿Cuándo será el"
	line "próximo Concurso"
	cont "de la Caza del"
	cont "Bicho?"
	done

BugCatchingContestExplanationText:
	text "El Concurso de la"
	line "Caza del Bicho se"
	cont "celebra martes,"
	cont "jueves y sábados."

	para "Te darán un premio"
	line "por participar,"
	cont "y te quedarás con"
	cont "el #mon."
	done

Route35NationalParkGatePokefanFText:
	text "Muchos #mon"
	line "vienen al Parque"
	cont "Nacional con"
	cont "sus entrenadores,"

	para "¡y todos son súper"
	line "monos!"

	para "¡Sí, los #mon"
	line "bicho también!"
	done

Text_Route35NationalParkGateTutorCharm:
	text "Puedo hacer a tu"
	line "#mon más mono"
	cont "con Encanto."

	para "¡A los rivales"
	line "les costará mucho"
	cont "atacarle luego!"
	done

Text_Route35NationalParkGateTutorQuestion:
	text "Solo pido una"
	line "Hoja Plata,"

	para "¿puedo enseñarle"
	line "Encanto? ¿Porfis?"
	done
