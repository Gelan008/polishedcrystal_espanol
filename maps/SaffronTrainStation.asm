SaffronTrainStation_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, 0, Script_ArriveFromGoldenrod

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 11, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuideScript, -1
	object_event  6, 11, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronMagnetTrainStationTeacherText, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronMagnetTrainStationLassText, EVENT_SAFFRON_TRAIN_STATION_POPULATION

	object_const_def
	const SAFFRONTRAINSTATION_OFFICER

SaffronMagnetTrainStationOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	faceplayer
	opentext
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse_jumpopenedtext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	checkkeyitem PASS
	iffalse_jumpopenedtext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval $1
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applyonemovement PLAYER, turn_head_down
	wait 36
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	showtext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	turnobject PLAYER, DOWN
	end

SaffronMagnetTrainStationGymGuideScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart
	jumptextfaceplayer SaffronMagnetTrainStationGymGuideText

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step_left
	step_down
	step_down
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Lo siento, pero el"
	line "Magnetotrén no"
	cont "funciona ahora."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "Saldremos pronto"
	line "hacia Trigal."

	para "¿Vas a subir"
	line "a bordo?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "¿Me dejas ver el"
	line "Pase, por favor?"

	para "Vale. Por aquí,"
	line "por favor."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Perdona, pero no"
	line "tienes el Pase."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "¡Esperamos volver"
	line "a verte pronto!"
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "Hemos llegado a"
	line "Ciudad Azafrán."

	para "Esperamos volver"
	line "a verte."
	done

SaffronMagnetTrainStationGymGuideText:
	text "The Magnet Train"
	line "is a super modern"

	para "rail liner that"
	line "uses electricity"

	para "and magnets to"
	line "attain incredible"
	cont "speed."

	para "However, if there"
	line "isn't any elec-"
	cont "tricity…"
	done

SaffronMagnetTrainStationGymGuideText_ReturnedMachinePart:
	text "¡Uf! ¿Cuántas"
	line "veces habré ido y"
	cont "vuelto entre"
	cont "Kanto y Johto?"
	done

SaffronMagnetTrainStationTeacherText:
	text "Antes de que se"
	line "construyera la"
	cont "estación, había"
	cont "aquí una casa."

	para "Allí vivía una"
	line "niña a la que"
	cont "llamaban Copiona."
	done

SaffronMagnetTrainStationLassText:
	text "Hola. ¿Tienes un"
	line "Pase? ¡Yo sí!"

	para "Todos los que usan"
	line "el Magnetotrén en"
	cont "Azafrán tienen"
	cont "su propio Pase."
	done
