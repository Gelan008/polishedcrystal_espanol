FarawayIsland_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_FARAWAYISLAND_NOOP
	scene_script FarawayIslandArrivalScene, SCENE_FARAWAYISLAND_ARRIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FarawayIslandVisited
	callback MAPCALLBACK_OBJECTS, FarawayIslandSetupLawrence

	def_warp_events
	warp_event 22,  8, FARAWAY_JUNGLE, 1
	warp_event 23,  8, FARAWAY_JUNGLE, 2

	def_coord_events

	def_bg_events
	bg_event  4, 34, BGEVENT_JUMPTEXT, FarawayIslandSignText

	def_object_events
	object_event 12, 42, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandSailorScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event  3, 37, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FarawayIslandLawrenceScript, EVENT_LAWRENCE_FARAWAY_ISLAND

	object_const_def
	const FARAWAYISLAND_SAILOR
	const FARAWAYISLAND_LAWRENCE

FarawayIslandVisited:
	setevent EVENT_VISITED_FARAWAY_ISLAND
	endcallback

FarawayIslandSetupLawrence:
	disappear FARAWAYISLAND_LAWRENCE
	checkevent EVENT_BEAT_LAWRENCE
	iffalsefwd .Done
	checkevent EVENT_BEAT_LAWRENCE_AGAIN
	iftruefwd .Done
	appear FARAWAYISLAND_LAWRENCE
.Done
	endcallback

FarawayIslandArrivalScene:
	sdefer .Script
	end

.Script:
	applymovement FARAWAYISLAND_SAILOR, FarawayIslandSailorArrive1MovementData
	applymovement PLAYER, FarawayIslandPlayerArriveMovementData
	showtext SeagallopFerryFarawayIslandRefusedText
	applymovement FARAWAYISLAND_SAILOR, FarawayIslandSailorArrive2MovementData
	setscene SCENE_FARAWAYISLAND_NOOP
	end

FarawayIslandSailorScript:
	faceplayer
	opentext
	writetext SeagallopFerryFarawayToVermilionQuestionText
	yesorno
	iffalsefwd .RefuseFerry
	writetext SeagallopFerryFarawayToVermilionText
	waitbutton
	closetext
	turnobject FARAWAYISLAND_SAILOR, DOWN
	pause 10
	applyonemovement FARAWAYISLAND_SAILOR, turn_head_down
	playsound SFX_EXIT_BUILDING
	disappear FARAWAYISLAND_SAILOR
	waitsfx
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear FARAWAYISLAND_SAILOR
	setmapscene SEAGALLOP_FERRY_VERMILION_GATE, SCENE_SEAGALLOPFERRYVERMILIONGATE_LEAVE
	warp SEAGALLOP_FERRY_VERMILION_GATE, 6, 5
	end

.RefuseFerry
	jumpopenedtext SeagallopFerryFarawayIslandRefusedText

FarawayIslandLawrenceScript:
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	faceplayer
	opentext
	writetext FarawayIslandLawrenceText1
	yesorno
	iffalsefwd .no_battle
	writetext FarawayIslandLawrenceYesText
	waitbutton
	closetext
	winlosstext FarawayIslandLawrenceBeatenText, 0
	setlasttalked FARAWAYISLAND_LAWRENCE
	loadtrainer LAWRENCE, 2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	faceplayer
	special DeleteSavedMusic
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext FarawayIslandLawrenceText2
	pause 15
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear FARAWAYISLAND_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_BEAT_LAWRENCE_AGAIN
	setevent EVENT_LAWRENCE_FARAWAY_ISLAND
	playmapmusic
	end

.no_battle:
	writetext FarawayIslandLawrenceNoText
	waitbutton
	closetext
	turnobject FARAWAYISLAND_LAWRENCE, DOWN
	playmapmusic
	end

FarawayIslandPlayerArriveMovementData:
	step_up
	step_up
	turn_head_down
	step_end

FarawayIslandSailorArrive1MovementData:
	step_up
	step_left
	turn_head_right
	step_end

FarawayIslandSailorArrive2MovementData:
	step_right
	step_down
	turn_head_up
	step_end

SeagallopFerryFarawayToVermilionQuestionText:
	text "¿Listo para volver"
	line "a Ciudad Carmín?"
	done

SeagallopFerryFarawayToVermilionText:
	text "¡De acuerdo!"

	para "¡Todos a bordo del"
	line "Surcamar Veloce!"
	done

SeagallopFerryFarawayIslandRefusedText:
	text "Estaré esperando"
	line "justo aquí."
	done

FarawayIslandLawrenceText1:
	text "Lawrence: Es un"
	line "placer, aunque muy"
	cont "inesperado."

	para "He venido a"
	line "recordar cómo"
	cont "empezó mi"
	cont "colección…"

	para "Con un grabado de"
	line "Mew hallado en"
	cont "esta misma isla."

	para "Pensaba en nuestro"
	line "último combate."

	para "Quiero entender el"
	line "vínculo con tu"
	cont "colección."

	para "¿Lucharás contra"
	line "mí otra vez?"
	done

FarawayIslandLawrenceYesText:
	text "¡Excelente!"
	done

FarawayIslandLawrenceNoText:
	text "…Muy bien."
	done

FarawayIslandLawrenceBeatenText:
	text "Me has derrotado"
	line "una vez más…"
	done

FarawayIslandLawrenceText2:
	text "Lawrence: …Ya."
	line "Aún me queda un"
	cont "largo camino para"
	cont "mejorar mi"
	cont "colección."

	para "Adiós."
	done

FarawayIslandSignText:
	text "La escritura casi"
	line "se ha borrado…"

	para "…bre, día 6"

	para "Si algún humano…"
	line "pisa de nuevo este"
	cont "lugar… que sea de"
	cont "corazón noble…"

	para "…con esa ilu…,"
	line "me march…"

	para "…ji"
	done
