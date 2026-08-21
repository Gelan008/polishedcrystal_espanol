CianwoodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	strengthboulder_event  5, 1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBlackbeltLung, -1
	object_event  7, 15, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodGymBlackBeltText, -1
	strengthboulder_event  3, 7
	strengthboulder_event  4, 7
	strengthboulder_event  5, 7

	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BOULDER1

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftruefwd .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
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
	jumpopenedtext ChuckExplainTMText

GenericTrainerBlackbeltYoshi:
	generictrainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText

	text "You seem to have a"
	line "strong bond with"
	cont "your #mon too!"
	done

GenericTrainerBlackbeltLao:
	generictrainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText

	text "Fighting #mon"
	line "are afraid of psy-"
	cont "chics…"
	done

GenericTrainerBlackbeltNob:
	generictrainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText

	text "I lost!"
	line "I'm speechless!"
	done

GenericTrainerBlackbeltLung:
	generictrainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText

	text "My #mon lost…"
	line "My… my pride is"
	cont "shattered…"
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
	set_sliding
	run_step_left
	run_step_up
	fast_jump_step_right
	remove_sliding
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

ChuckExplainTMText:
	text "That is Dynamic-"
	line "Punch."

	para "It doesn't always"
	line "hit, but when it"

	para "does, it causes"
	line "confusion!"
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
