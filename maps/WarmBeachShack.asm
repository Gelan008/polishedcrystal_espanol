WarmBeachShack_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, WARM_BEACH, 1
	warp_event  3,  7, WARM_BEACH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WarmBeachShackEndureFisherScript, -1
	object_event  3,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WarmBeachShackBodySlamFisherScript, -1

WarmBeachShackBodySlamFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BODY_SLAM_INTRO
	iftruefwd WarmBeachShackTutorBodySlamScript
	writetext WarmBeachShackBodySlamFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_BODY_SLAM_INTRO
WarmBeachShackTutorBodySlamScript:
	writetext Text_WarmBeachShackBodySlamTutorBodySlamQuestion
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval BODY_SLAM
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_WarmBeachShackTutorsRefused

.NoSilverLeaf
	waitbutton
	jumpopenedtext Text_WarmBeachShackTutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_WarmBeachShackBodySlamTutorTaught

WarmBeachShackBodySlamFisherText:
	text "¿Listo?"
	line "¡Boing!"

	para "¡Hacemos combate"
	line "de sumo para ver"
	cont "quién se raja!"

	para "¡Yo uso Golpe"
	line "Cuerpo y él usa"
	cont "Aguante!"
	done

Text_WarmBeachShackBodySlamTutorBodySlamQuestion:
	text "¿Le enseño a un"
	line "#mon Golpe"
	cont "Cuerpo a cambio"
	cont "de una Hoja Plata?"
	done

Text_WarmBeachShackBodySlamTutorTaught:
	text "Come again!"
	line "Boioing!"
	done

WarmBeachShackEndureFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ENDURE_INTRO
	iftruefwd WarmBeachShackTutorEndureScript
	writetext WarmBeachShackEndureFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_ENDURE_INTRO
WarmBeachShackTutorEndureScript:
	writetext Text_WarmBeachShackEndureTutorEndureQuestion
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval ENDURE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_WarmBeachShackTutorsRefused

.NoSilverLeaf
	waitbutton
	jumpopenedtext Text_WarmBeachShackTutorsNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_WarmBeachShackEndureTutorTaught

WarmBeachShackEndureFisherText:
	text "¿Listo?"
	line "¡Uuuf!"

	para "¡Hacemos combate"
	line "de sumo para ver"
	cont "quién se rinde!"

	para "¡Él usa Golpe"
	line "Cuerpo y yo uso"
	cont "Aguante!"
	done

Text_WarmBeachShackEndureTutorEndureQuestion:
	text "¿Le enseño Aguante"
	line "a tu #mon a"
	cont "cambio de una"
	cont "Hoja Plata?"
	done

Text_WarmBeachShackEndureTutorTaught:
	text "Come again!"
	line "Nnnh!"
	done

Text_WarmBeachShackTutorsNoSilverLeaf:
	text "¿Eh? ¡No tienes"
	line "ninguna!"
	done

Text_WarmBeachShackTutorsRefused:
	text "Pues nada."
	done
