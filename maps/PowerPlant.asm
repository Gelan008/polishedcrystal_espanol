PowerPlant_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_POWERPLANT_NOOP
	scene_const SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks
	callback MAPCALLBACK_TILES, PowerPlantTurbinesCallback

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

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

PowerPlantTurbinesCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalsefwd .Done
	changeblock 12, 6, $12
	changeblock 14, 6, $47
	changeblock 12, 12, $16
	changeblock 12, 14, $16
.Done:
	endcallback

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
	setscene SCENE_POWERPLANT_NOOP
	end

PowerPlantOfficerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer1HaveToBeefUpSecurityText
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue_jumptextfaceplayer PowerPlantOfficer1CouldIAskForYourCooperationText
	jumpthistextfaceplayer

	text "Un ladrón entró a"
	line "robar a la Central"
	cont "de Energía…"

	para "¿A dónde va a ir a"
	line "parar este mundo?"
	done

PowerPlantGymGuide1Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide1GeneratorUpAndRunningText
	jumpthistextfaceplayer

	text "Alguien se ha lle-"
	line "vado una pieza"

	para "esencial para el"
	line "generador."

	para "¡Sin ella, el nue-"
	line "vo generador no"
	cont "sirve de nada!"
	done

PowerPlantGymGuide2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide2GeneratorIsRunningAgainText
	jumpthistextfaceplayer

	text "Esta Central de"
	line "Energía estuvo"
	cont "abandonada."

	para "La pusimos en mar-"
	line "cha de nuevo para"

	para "darle energía al"
	line "Magnetotren."
	done

PowerPlantOfficer2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantOfficer2ManagerHasBeenCheerfulText
	jumpthistextfaceplayer

	text "El Director de la"
	line "Central de Energía"
	cont "está más adelante."

	para "Pero como averia-"
	line "ron el generador,"

	para "está muy triste y"
	line "a la vez furioso…"
	done

PowerPlantGymGuide4Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	jumpthistextfaceplayer

	text "El Magnetotren"
	line "consume mucha"
	cont "electricidad."

	para "No se moverá si el"
	line "nuevo generador no"
	cont "funciona."
	done

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
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	waitbutton
	closetext
	takekeyitem MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setmapscene ROUTE_10_NORTH, SCENE_ROUTE10NORTH_LAWRENCE
	clearevent EVENT_LAWRENCE_ROUTE_10
	playsound SFX_SLOT_MACHINE_START
	special FadeOutPalettes
	special LoadMapPalettes
	pause 10
	special FadeInPalettes_EnableDynNoApply
	changeblock 12, 6, $12
	changeblock 14, 6, $47
	changeblock 12, 12, $16
	changeblock 12, 14, $16
	refreshmap
	pause 30
	opentext
	writetext PowerPlantManagerYouDeserveARewardText
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
	jumpthisopenedtext

	text "Como tú quieras."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡Lo siento, pero"
	line "no puedo enseñar"

	para "Electrocañón sin"
	line "esa Hoja!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ya"
	line "sabe usar"
	cont "Electrocañón!"

	para "¡Jajajaja!"
	done

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


PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Me acaban de avi-"
	line "sar de Celeste."

	para "Parece que hay un"
	line "tipo sospechoso"

	para "merodeando por"
	line "allí."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "¿Podrías prestar-"
	line "nos tu ayuda?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Tendremos que re-"
	line "forzar la seguri-"
	cont "dad."
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "El generador ya"
	line "funciona. Genera"

	para "electricidad de"
	line "sobra."
	done

PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "¡El generador fun-"
	line "ciona de nuevo!"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Desde que arregla-"
	line "ron el generador,"

	para "el Director está"
	line "muy alegre."
	done

PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "¡Genial! Por fin"
	line "podemos poner en"

	para "marcha otra vez el"
	line "Magnetotren."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "Director: ¡Es-estoy"
	line "que trino!"

	para "¿Quién se atreve a"
	line "romper mi genera-"
	cont "dor?"

	para "¡Le dediqué mu-"
	line "chísimo tiempo!"

	para "¡Si lo pillo, le"
	line "daré a probar mi"

	para "propio Electro-"
	line "cañón!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "Director: ¡No le"
	line "perdonaré!"

	para "¡El culpable ya"
	line "puede llorar y pe-"
	cont "dir disculpas,"

	para "que le daré una"
	line "buena tunda!"

	para "¡Jajajaja!"
	done

PowerPlantManagerThatsThePartText:
	text "Director: ¡Ah! ¡Sí!"

	para "¡Es la pieza que"
	line "le faltaba a mi"
	cont "amado generador!"

	para "¿La encontraste tú?"
	line "¡Jaja! ¡Gracias!"

	para "¡Vamos a poner en"
	line "marcha mi genera-"
	cont "dor!"
	done

PowerPlantManagerYouDeserveARewardText:
	text "¡Te mereces una"
	line "recompensa!"
	done

Text_PowerPlantTutorZapCannon:
	text "Director: ¡Puedo"
	line "enseñar a tu"

	para "#mon a usar mi"
	line "Electrocañón!"

	para "No es lo que se di-"
	line "ce muy preciso,"

	para "¡pero pega con mu-"
	line "cha fuerza!"

	para "Solo necesitaré"
	line "una Hoja Plata."
	done

Text_PowerPlantTutorQuestion:
	text "¿Quieres que le"
	line "enseñe a tu #mon"
	cont "Electrocañón?"
	done

PowerPlantForestText:
	text "Magneton actúa de"
	line "forma extraña en"
	cont "el Túnel Roca."

	para "¿Tendrán algo que"
	line "ver las turbinas"

	para "de la Central de"
	line "Energía?"
	done
