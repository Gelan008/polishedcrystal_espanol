DimCave5F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, DimCave5FSetUpStoneTable

	def_warp_events
	warp_event 13, 31, ROUTE_10_NORTH, 5
	warp_event  2, 16, DIM_CAVE_4F, 1
	warp_event 27, 29, DIM_CAVE_4F, 2
	warp_event 28, 25, DIM_CAVE_4F, 3

	def_coord_events

	def_bg_events
	bg_event 12, 28, BGEVENT_ITEM + X_SP_ATK, EVENT_DIM_CAVE_5F_HIDDEN_X_SP_ATK

	def_object_events
	strengthboulder_event 25,  5, EVENT_BOULDER_IN_DIM_CAVE_5F
	object_event 13,  4, SPRITE_RILEY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, DimCave5FRileyScript, EVENT_DIM_CAVE_RILEY
	object_event 24, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSuper_nerdFoote, -1
	object_event 13, 25, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerHoward, -1
	object_event 21, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSuper_nerdDave, -1
	itemball_event 13, 13, RARE_CANDY, 1, EVENT_DIM_CAVE_5F_RARE_CANDY
	itemball_event  9, 27, DUSK_STONE, 1, EVENT_DIM_CAVE_5F_DUSK_STONE
	itemball_event 31, 14, HYPER_POTION, 1, EVENT_DIM_CAVE_5F_HYPER_POTION

	object_const_def
	const DIMCAVE5F_BOULDER
	const DIMCAVE5F_RILEY

DimCave5FSetUpStoneTable:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 4, DIMCAVE5F_BOULDER, .Boulder
	db -1 ; end

.Boulder:
	disappear DIMCAVE5F_BOULDER
	clearevent EVENT_BOULDER_FELL_IN_DIM_CAVE_4F
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	jumpthistext

	text "The boulder fell"
	line "through."
	done

DimCave5FRileyScript:
	faceplayer
	checkevent EVENT_BEAT_RILEY
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked DIMCAVE5F_RILEY
	loadtrainer RILEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RILEY
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_BRACER
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear DIMCAVE5F_RILEY
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_RILEY
	end

.ChallengeText:
	text "…¿Y tú eres?"

	para "Vale, eres"
	line "<PLAYER>."

	para "Soy Quinoa. Sí,"
	line "soy entrenador."

	para "Tengo una mina"
	line "como esta, así que"
	cont "es un buen sitio"
	cont "para entrenar."

	para "¿Te apetece un"
	line "combate conmigo?"
	done

.YesText:
	text "¡Haremos todo lo"
	line "posible por ganar"
	cont "a tus #mon!"
	done

.NoText:
	text "De acuerdo."
	line "Seguiremos con el"
	cont "entrenamiento."
	done

.BeatenText:
	text "At times we bat-"
	line "tle, and sometimes"
	cont "we team up."

	para "It's great how"
	line "trainers can"
	cont "interact."
	done

.ItemText:
	text "Conoce a tu rival."

	para "Si conoces a los"
	line "#mon y ataques"
	cont "de tu oponente,"

	para "tus opciones de"
	line "ganar aumentan."

	para "Pero mejorar tu"
	line "propio equipo es"
	cont "igual de vital."

	para "¡Esto te ayudará"
	line "a lograrlo!"
	done

.GoodbyeText:
	text "Ha sido un placer"
	line "luchar contra ti."

	para "Pondré a prueba mi"
	line "fuerza en la"
	cont "Torre Batalla."

	para "¡Espero que nos"
	line "volvamos a ver!"

	para "¡Ten cuidado al"
	line "salir de la cueva!"
	done

GenericTrainerSuper_nerdFoote:
	generictrainer SUPER_NERD, FOOTE, EVENT_BEAT_SUPER_NERD_FOOTE, .SeenText, .BeatenText

	text "Save one life or"
	line "save five?"

	para "As a #mon"
	line "trainer, you may"

	para "have the power to"
	line "save all six!"
	done

.SeenText:
	text "I have a conundrum"
	line "for you!"

	para "Would you push one"
	line "#mon in front"

	para "of a mine cart to"
	line "save five?"
	done

.BeatenText:
	text "You answered"
	line "without words…"
	cont "How Zen!"
	done

GenericTrainerEngineerHoward:
	generictrainer ENGINEER, HOWARD, EVENT_BEAT_ENGINEER_HOWARD, .SeenText, .BeatenText

	text "Water flows south"
	line "from Cerulean Cape"

	para "and follows a"
	line "steady course to"
	cont "the Power Plant."
	done

.SeenText:
	text "This waterfall"
	line "provides energy"
	cont "throughout Kanto!"
	done

.BeatenText:
	text "No! A blackout…"
	done

GenericTrainerSuper_nerdDave:
	generictrainer SUPER_NERD, DAVE, EVENT_BEAT_SUPER_NERD_DAVE, .SeenText, .BeatenText

	text "You need a mining"
	line "pick to mine."

	para "But you can't get"
	line "them around here."
	done

.SeenText:
	text "¡He maximizado mi"
	line "talento de minero,"
	cont "joyero, fundidor"
	cont "y fabricante!"
	done

.BeatenText:
	text "Pero no las de"
	line "combate…"
	done

