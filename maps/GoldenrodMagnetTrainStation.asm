GoldenrodMagnetTrainStation_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 17, GOLDENROD_CITY, 5
	warp_event  9, 17, GOLDENROD_CITY, 5
	warp_event  6,  5, SAFFRON_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, 0, Script_ArriveFromSaffron

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMagnetTrainStationGentlemanText, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	object_event  6, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationCooltrainerfScript, -1

	object_const_def
	const GOLDENRODMAGNETTRAINSTATION_OFFICER

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .MagnetTrainToSaffron
	jumpopenedtext GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse_jumpopenedtext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	checkkeyitem PASS
	iffalse_jumpopenedtext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval $0
	special Special_MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applyonemovement PLAYER, turn_head_down
	wait 36
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement
	showtext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	turnobject PLAYER, DOWN
	end

GoldenrodMagnetTrainStationCooltrainerfScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .PowerRestored
	jumptextfaceplayer GoldenrodMagnetTrainStationCooltrainerfText1

.PowerRestored
	jumptextfaceplayer GoldenrodMagnetTrainStationCooltrainerfText2

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step_up
	step_up
	step_right
	turn_head_left
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step_left
	step_down
	step_down
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end

GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText:
	text "The train hasn't"
	line "come in…"

	para "I know! I'll carry"
	line "the passengers on"
	cont "my back!"

	para "That won't work."
	done

GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	text "Saldremos pronto"
	line "hacia Azafrán."

	para "¿Vas a subir"
	line "a bordo?"
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	text "¿Me dejas ver el"
	line "Pase, por favor?"

	para "Vale. Por aquí,"
	line "por favor."
	done

GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText:
	text "Perdona, no tienes"
	line "el Pase."
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "¡Esperamos volver"
	line "a verte pronto!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	text "Hemos llegado a"
	line "Trigal."

	para "Esperamos volver"
	line "a verte."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "Soy el Presidente."

	para "Mi sueño era crear"
	line "un tren más veloz"
	cont "que cualquier"
	cont "#mon."

	para "Realmente hace"
	line "que Johto y Kanto"
	cont "estén más cerca."
	done

GoldenrodMagnetTrainStationCooltrainerfText1:
	text "The Magnet Train"
	line "is like, zoooom,"
	cont "byun! Shuuu!"

	para "At least when"
	line "it's running…"
	done

GoldenrodMagnetTrainStationCooltrainerfText2:
	text "The Magnet Train"
	line "is like, zoooom,"
	cont "byun! Shuuu!"

	para "It's so cool!"
	done
