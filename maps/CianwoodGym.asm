CianwoodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CianwoodGymBouldersCallback
	callback MAPCALLBACK_CMDQUEUE, CianwoodGymSetUpStoneTable

	def_warp_events
	warp_event 12, 17, CIANWOOD_CITY, 2
	warp_event 13, 17, CIANWOOD_CITY, 2
	warp_event 12,  4, CIANWOOD_GYM, 1 ; for stonetable
	warp_event 13,  4, CIANWOOD_GYM, 2 ; for stonetable

	def_coord_events

	def_bg_events
	bg_event 11, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event 14, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event 12, 11, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 12, 11, SPRITE_BIG_HO_OH, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptext, CianwoodGymChuckTrainingText, EVENT_BOULDERS_IN_CIANWOOD_GYM
	object_event 13, 11, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymChucksBoulderText, -1
	strengthboulder_event  9,  4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	strengthboulder_event 16,  4, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	object_event 12,  4, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymBoulderText, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	object_event 13,  4, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CianwoodGymBoulderText, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	object_event  5, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltYoshi, -1
	object_event 21, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltLao, -1
	object_event  9,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltNob, -1
	object_event 20,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltLung, -1
	object_event 15, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodGymBlackBeltText, -1

	object_const_def
	const CIANWOODGYM_CHUCK1
	const CIANWOODGYM_CHUCK2
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4
	const CIANWOODGYM_BOULDER5

CianwoodGymBouldersCallback:
	checkevent EVENT_BOULDERS_IN_CIANWOOD_GYM
	iftruefwd .WaterfallBlocked
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	endcallback

.WaterfallBlocked:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	changeblock 12,  4, $83
	changeblock 12,  6, $7d
	changeblock 12,  8, $7d
	changeblock 12, 10, $8f
	endcallback

CianwoodGymSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 3, CIANWOODGYM_BOULDER2, .Boulder2
	stonetable 4, CIANWOODGYM_BOULDER3, .Boulder3
	db -1

.Boulder2:
	appear CIANWOODGYM_BOULDER4
	disappear CIANWOODGYM_BOULDER2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalsefwd .Done
	sjumpfwd .BlockWaterfall

.Boulder3:
	appear CIANWOODGYM_BOULDER5
	disappear CIANWOODGYM_BOULDER3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd .BlockWaterfall
.Done:
	end

.BlockWaterfall:
	appear CIANWOODGYM_CHUCK1
	disappear CIANWOODGYM_CHUCK2
	applyonemovement PLAYER, step_end
	reanchormap
	pause 10
	playsound SFX_STRENGTH
	changeblock 12,  4, $98
	refreshmap
	pause 7
	changeblock 12,  4, $83
	changeblock 12,  6, $94
	refreshmap
	pause 7
	changeblock 12,  6, $95
	refreshmap
	pause 7
	changeblock 12,  6, $96
	refreshmap
	pause 7
	changeblock 12,  6, $97
	refreshmap
	pause 7
	changeblock 12,  6, $7d
	changeblock 12,  8, $94
	refreshmap
	pause 7
	changeblock 12,  8, $95
	refreshmap
	pause 7
	changeblock 12,  8, $96
	refreshmap
	pause 7
	changeblock 12,  8, $97
	refreshmap
	pause 7
	changeblock 12,  8, $7d
	changeblock 12, 10, $8f
	refreshmap
	jumpthistext

	text "¡Las rocas"
	line "bloquearon la"
	cont "cascada!"
	done

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftruefwd .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK1, RIGHT
	showtext ChuckIntroText2
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	showtextfaceplayer ChuckIntroText3
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	givebadge STORMBADGE, JOHTO_REGION
	specialphonecall SPECIALCALL_YELLOWFOREST
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue_jumpopenedtext ChuckAfterText
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegivetmhm TM_DYNAMICPUNCH
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	jumpthisopenedtext

	text "Es Puño Dinámico."

	para "No siempre da en"
	line "el blanco, ¡pero"
	cont "siempre confunde!"
	done

GenericTrainerBlackbeltYoshi:
	generictrainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText

	text "¡Parece que tú"
	line "también tienes un"
	cont "fuerte vínculo con"
	cont "tus #mon!"
	done

GenericTrainerBlackbeltLao:
	generictrainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText

	text "Los #mon de"
	line "lucha tienen miedo"
	cont "a los psíquicos…"
	done

GenericTrainerBlackbeltNob:
	generictrainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText

	text "¡He perdido!"
	line "¡No tengo"
	cont "palabras!"
	done

GenericTrainerBlackbeltLung:
	generictrainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText

	text "Mis #mon han"
	line "perdido… Mi… mi"
	cont "orgullo está por"
	cont "los suelos…"
	done

CianwoodGymStatue:
	gettrainername CHUCK, 1, STRING_BUFFER_4
	checkflag ENGINE_STORMBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 12, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

CianwoodGymMovement_ChuckChucksBoulder:
	fix_facing
	set_sliding
	run_step_left
	run_step_up
	fast_jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end

ChuckIntroText1:
	text "¡WARRGH!"

	para "El agua caía de"
	line "lleno sobre mi"
	cont "cabeza…"

	para "¿Por qué cortaste"
	line "la cascada?"

	para "¡Has arruinado mi"
	line "entrenamiento!"

	para "¡Te advierto que"
	line "soy muy duro!"

	para "¡Mis #mon"
	line "rompen rocas y"
	cont "quiebran huesos!"

	para "¡Mira esto!"
	done

ChuckIntroText2:
	text "Aníbal: ¡Urggh!"
	line "…"

	para "¡Oooarrgh!"
	done

ChuckIntroText3:
	text "¡Ahí lo tienes!"
	line "¿Te asusta?"

	para "¿Qué? ¿Que no"
	line "tiene que ver con"
	cont "los #mon?"
	cont "¡Es verdad!"

	para "¡Venga, a luchar!"
	done

ChuckLossText:
	text "¿Qué? ¿Eh?"
	line "¿He perdido?"

	para "¡Qué te parece!"
	line "¡Eres digno de la"
	cont "Medalla Tormenta!"
	done

ChuckExplainBadgeText:
	text "La Medalla"
	line "Tormenta permite"
	cont "a tus #mon"
	cont "usar Vuelo para"
	cont "volar a cualquier"
	cont "sitio visitado."

	para "¡Toma, llévate"
	line "esto también!"
	done

ChuckAfterText:
	text "¡WAJAJA! ¡Me ha"
	line "encantado luchar"
	cont "contigo!"

	para "¡Pero una derrota"
	line "es una derrota!"

	para "¡A partir de hoy"
	line "entrenaré las 24"
	cont "horas del día!"
	done

BlackbeltYoshiSeenText:
	text "Mis #mon y yo"
	line "estamos unidos"
	cont "por la amistad."

	para "¡Nuestro vínculo"
	line "nunca se romperá!"
	done

BlackbeltYoshiBeatenText:
	text "¡Esto no es real!"
	done

BlackbeltLaoSeenText:
	text "¡Los luchadores"
	line "no tememos a nada!"
	done

BlackbeltLaoBeatenText:
	text "¡Qué sorpresa!"
	done

BlackbeltNobSeenText:
	text "Las palabras no"
	line "sirven. ¡Deja que"
	cont "tus puños hablen!"
	done

BlackbeltNobBeatenText: ; text > text
	text "…"
	done

BlackbeltLungSeenText:
	text "¡Mis fieros puños"
	line "destrozarán a"
	cont "tus #mon!"
	done

BlackbeltLungBeatenText:
	text "¡Me destrozaron!"
	done

CianwoodGymBlackBeltText:
	text "El guía del"
	line "Gimnasio está"
	cont "demasiado asustado"
	cont "de nosotros para"
	cont "asomarse por aquí."

	para "¡Qué cobarde!"
	done

CianwoodGymChuckTrainingText:
	text "Está totalmente"
	line "concentrado en su"
	cont "entrenamiento y no"
	cont "te hace caso."
	done

CianwoodGymBoulderText:
	text "La roca está"
	line "bloqueando la"
	cont "cascada."
	done

CianwoodGymChucksBoulderText:
	text "La roca pesa"
	line "demasiado para"
	cont "poder moverla."
	done
