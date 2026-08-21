PowerPlant_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, 1, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PowerPlantForestText, -1

	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	showtext PowerPlantOfficer1CeruleanShadyCharacterText
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	showtext PowerPlantOfficer1CouldIAskForYourCooperationText
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene $0
	end

PowerPlantOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer1HaveToBeefUpSecurityText
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumptextfaceplayer PowerPlantOfficer1CouldIAskForYourCooperationText
	jumptextfaceplayer PowerPlantOfficer1AThiefBrokeInText

PowerPlantGymGuide1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide1GeneratorUpAndRunningText
	jumptextfaceplayer PowerPlantGymGuide1SomeoneStoleAPartText

PowerPlantGymGuide2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide2GeneratorIsRunningAgainText
	jumptextfaceplayer PowerPlantGymGuide2PowerPlantUpAndRunningText

PowerPlantOfficer2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer2ManagerHasBeenCheerfulText
	jumptextfaceplayer PowerPlantOfficer2ManagerHasBeenSadAndFuriousText

PowerPlantGymGuide4Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	jumptextfaceplayer PowerPlantGymGuide4MagnetTrainConsumesElectricityText

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd PowerPlantTutorZapCannonScript
	checkkeyitem MACHINE_PART
	iftruefwd .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumpopenedtext PowerPlantManagerIWontForgiveCulpritText
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	setmapscene CERULEAN_GYM, $1
	setscene $1
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takekeyitem MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setmapscene ROUTE_10_NORTH, $1
	clearevent EVENT_LAWRENCE_ROUTE_10
	writetext PowerPlantManagerTakeThisTMText
	waitbutton
PowerPlantTutorZapCannonScript:
	writetext Text_PowerPlantTutorZapCannon
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_PowerPlantTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval ZAP_CANNON
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_PowerPlantTutorRefused

.NoSilverLeaf
	jumpopenedtext Text_PowerPlantTutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_PowerPlantTutorTaught

PowerPlantOfficer1ApproachGymGuide2Movement:
	step_right
	step_right
	step_up
	step_up
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step_down
	step_down
	step_left
	step_left
	turn_head_down
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "A thief broke into"
	line "the Power Plant…"

	para "What is the world"
	line "coming to?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Me avisan desde"
	line "Ciudad Celeste."

	para "Dicen que hay un"
	line "sospechoso por"
	cont "la zona."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "¿Nos prestas tu"
	line "ayuda, por favor?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Habrá que mejorar"
	line "la seguridad."
	done

PowerPlantGymGuide1SomeoneStoleAPartText:
	text "Someone made off"
	line "with a part that's"

	para "essential for the"
	line "generator."

	para "Without it, the"
	line "new generator's"
	cont "useless!"
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "El generador ya"
	line "funciona. Genera"

	para "electricidad de"
	line "sobra."
	done

PowerPlantGymGuide2PowerPlantUpAndRunningText:
	text "This Power Plant"
	line "had been abandoned"
	cont "in the past."

	para "We got it back up"
	line "and running to"

	para "provide power to"
	line "the Magnet Train."
	done

PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "¡El generador va"
	line "de nuevo!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "The Power Plant's"
	line "Manager is up"
	cont "ahead."

	para "But since someone"
	line "wrecked the gener-"
	cont "ator, he's been"
	cont "both sad and"
	cont "furious…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Al arreglar el"
	line "generador, ¡el"
	cont "Director se puso"
	cont "muy alegre!"
	done

PowerPlantGymGuide4MagnetTrainConsumesElectricityText:
	text "The Magnet Train"
	line "consumes a lot of"
	cont "electricity."

	para "It can't move if"
	line "the new generator"
	cont "isn't operating."
	done

PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "¡Por fin podemos"
	line "poner en marcha el"
	cont "Magnetotrén!"
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "Director: ¡Estoy"
	line "que trino!"

	para "¿Quién se atrevió"
	line "a romper mi gran"
	cont "generador?"

	para "¡Le dediqué un"
	line "montón de tiempo!"

	para "¡Si lo pillo, va a"
	line "probar mi propio"
	cont "Electrocañón!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "Director: ¡No le"
	line "perdonaré jamás!"

	para "¡Por mucho que me"
	line "suplique, le daré"
	cont "una buena tunda!"

	para "¡Jajajaja!"
	done

PowerPlantManagerThatsThePartText:
	text "Director: ¡Ah!"
	line "¡Sí!"

	para "¡La pieza que le"
	line "faltaba a mi gran"
	cont "generador!"

	para "¿La hallaste tú?"
	line "¡Jaja! ¡Gracias!"

	para "¡A poner en marcha"
	line "el generador!"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Thanks!"
	line "You deserve a"
	cont "reward!"
	done

Text_PowerPlantTutorZapCannon:
	text "Director: ¡Puedo"
	line "enseñar a tu"
	cont "#mon a usar mi"
	cont "Electrocañón!"

	para "No es muy preciso,"
	line "¡pero pega con una"
	cont "fuerza tremenda!"

	para "¿Quieres que le"
	line "enseñe a tu"
	cont "#mon"
	cont "Electrocañón?"
	done

Text_PowerPlantTutorNoSilverLeaf:
	text "Sorry, but I can't"
	line "teach Zap Cannon"
	cont "without that Leaf!"
	done

Text_PowerPlantTutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "Zap Cannon?"
	done

Text_PowerPlantTutorRefused:
	text "Have it your way."
	done

Text_PowerPlantTutorTaught:
	text "Now your #mon"
	line "knows Zap Cannon!"

	para "Wahahah!"
	done

PowerPlantForestText:
	text "Magneton actúa de"
	line "forma extraña en"
	cont "el Túnel Roca."

	para "¿Tendrán que ver"
	line "las turbinas de la"
	cont "Central Eléctrica?"
	done
