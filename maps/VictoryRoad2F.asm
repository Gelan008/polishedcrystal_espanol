VictoryRoad2F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_VICTORYROAD2F_RIVAL_BATTLE
	scene_const SCENE_VICTORYROAD2F_NOOP

	def_callbacks

	def_warp_events
	warp_event 25,  9, ROUTE_23_NORTH, 2
	warp_event  3, 11, VICTORY_ROAD_1F, 2
	warp_event  3,  4, VICTORY_ROAD_3F, 1
	warp_event 15,  7, VICTORY_ROAD_3F, 2
	warp_event 19,  9, VICTORY_ROAD_3F, 3

	def_coord_events
	coord_event 25,  9, SCENE_VICTORYROAD2F_RIVAL_BATTLE, VictoryRoadRivalLeft

	def_bg_events
	bg_event  5,  5, BGEVENT_ITEM + MAX_POTION, EVENT_VICTORY_ROAD_2F_HIDDEN_MAX_POTION

	def_object_events
	object_event 20,  9, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event 11, 11, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerVeteranfJoanne, -1
	object_event  5,  3, SPRITE_VETERAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerVeteranfJonet, -1
	tmhmball_event  8,  4, TM_EARTHQUAKE, EVENT_VICTORY_ROAD_2F_TM_EARTHQUAKE
	itemball_event 20,  5, FULL_RESTORE, 1, EVENT_VICTORY_ROAD_2F_FULL_RESTORE
	itemball_event  9, 14, HP_UP, 1, EVENT_VICTORY_ROAD_2F_HP_UP

	object_const_def
	const VICTORYROAD2F_RIVAL

VictoryRoadRivalLeft:
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	special Special_FadeOutMusic
	pause 15
	appear VICTORYROAD2F_RIVAL
	applymovement VICTORYROAD2F_RIVAL, VictoryRoadRivalBattleApproachMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext VictoryRoadRivalBeforeText
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_15
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_13
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_RIVAL
	loadtrainer RIVAL1, RIVAL1_14
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext VictoryRoadRivalAfterText
	applymovement VICTORYROAD2F_RIVAL, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD2F_RIVAL
	setscene SCENE_VICTORYROAD2F_NOOP
	playmapmusic
	end

GenericTrainerVeteranfJoanne:
	generictrainer VETERANF, JOANNE, EVENT_BEAT_VETERANF_JOANNE, VeteranfJoanneSeenText, VeteranfJoanneBeatenText

	text "¡Te has ganado el"
	line "derecho a estar en"
	cont "la Calle Victoria!"
	done

GenericTrainerVeteranfJonet:
	generictrainer VETERANF, JONET, EVENT_BEAT_VETERANF_JONET, VeteranfJonetSeenText, VeteranfJonetBeatenText

	text "¿Habrá atrapado"
	line "ya alguien a"
	cont "Moltres?"
	done

VictoryRoadRivalBattleApproachMovement1:
	step_right
	step_right
	step_right
	step_right
	step_end

VictoryRoadRivalBattleExitMovement1:
	step_left
	step_left
	step_left
	step_left
	step_end

VictoryRoadRivalBeforeText:
	text "¡Un momento!"

	para "…¿Vas a desafiar"
	line "a la Liga #mon?"

	para "…No me hagas reír."

	para "Eres mucho más dé-"
	line "bil que yo."

	para "Ya no soy el de"
	line "antes."

	para "Ahora llevo conmi-"
	line "go a los mejores"

	para "y más fuertes"
	line "#mon. ¡Soy in-"
	cont "vencible!"

	para "¡<PLAYER>!"
	line "¡Te desafío!"
	done

VictoryRoadRivalDefeatText:
	text "…No pude ganar…"

	para "Lo he dado todo…"

	para "Lo que tú tienes"
	line "y a mí me falta…"

	para "Empiezo a enten-"
	line "der lo que me dijo"

	para "aquel maestro de"
	line "dragones…"
	done

VictoryRoadRivalAfterText:
	text "…No me rendiré"
	line "hasta ser el mejor"
	cont "entrenador…"

	para "Averiguaré por qué"
	line "no puedo ganar y"

	para "me haré mucho más"
	line "fuerte…"

	para "Cuando lo haga, te"
	line "desafiaré."

	para "Y te aplastaré con"
	line "todo mi poder."

	para "…¡Humph! Sigue"
	line "así hasta entonces."
	done

VictoryRoadRivalVictoryText:
	text "…¡Humph!"

	para "Al fin y al cabo,"
	line "nada supera al"
	cont "poder."

	para "No necesito nada"
	line "más."
	done

VeteranfJoanneSeenText:
	text "¡La Calle Victoria"
	line "es la prueba final"
	cont "para entrenadores!"
	done

VeteranfJoanneBeatenText:
	text "¡Ayayay!"
	done

VeteranfJonetSeenText:
	text "Se supone que aquí"
	line "anida un Moltres."

	para "¡Pienso atraparlo!"
	done

VeteranfJonetBeatenText:
	text "¡Habría ganado si"
	line "tuviera un #mon"
	cont "legendario…!"
	done
