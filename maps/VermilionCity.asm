VermilionCity_MapScriptHeader:
	def_scene_scripts
	scene_script LawrenceIntroScript, SCENE_VERMILIONCITY_LAWRENCE_INTRO
	scene_const SCENE_VERMILIONCITY_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionCitySetupLawrenceCallback
	callback MAPCALLBACK_TILES, VermilionCitySetupBattleFactoryCallback

	def_warp_events
	warp_event  5,  5, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 17, POKEMON_FAN_CLUB, 1
	warp_event 13, 17, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 17, VERMILION_MART, 2
	warp_event 21, 21, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event  8, 23, VERMILION_GYM, 1
	warp_event 18, 35, VERMILION_PORT, 1
	warp_event 19, 35, VERMILION_PORT, 3
	warp_event 36, 17, DIGLETTS_CAVE, 1
	warp_event 28, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 29, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 13,  5, VERMILION_POLLUTION_SPEECH_HOUSE, 1
	warp_event 19,  5, VERMILION_S_S_ANNE_SPEECH_HOUSE, 1
	warp_event 28,  9, BATTLE_FACTORY_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  9, BGEVENT_JUMPTEXT, VermilionCitySignText
	bg_event  9, 23, BGEVENT_JUMPTEXT, VermilionGymSignText
	bg_event  5, 17, BGEVENT_JUMPTEXT, PokemonFanClubSignText
	bg_event 33, 17, BGEVENT_JUMPTEXT, VermilionCityDiglettsCaveSignText
	bg_event 27, 19, BGEVENT_JUMPTEXT, VermilionCityPortSignText
	bg_event 23,  9, BGEVENT_JUMPTEXT, VermilionCityBattleFactorySignText
	bg_event 10, 27, BGEVENT_JUMPTEXT, VermilionCityAdvancedTipsSignText
	bg_event 12, 23, BGEVENT_ITEM + FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL
	bg_event 32,  6, BGEVENT_ITEM + MAX_ETHER, EVENT_VERMILION_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 35, 18, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 18, 31, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_VERMILION_CITY
	object_event 18, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityTeacherText, -1
	object_event 20,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachokeOwnerScript, -1
	pokemon_event 21,  9, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, VermilionMachokeText, -1
	object_event 16, 20, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySuperNerdText, -1
	object_event 31, 12, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerd2Script, -1
	object_event 11,  8, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySailorText, -1
	object_event 19, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 28, 10, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerFText, EVENT_RESTORED_POWER_TO_KANTO
	cuttree_event 13, 23, EVENT_VERMILION_CITY_CUT_TREE

	object_const_def
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_LAWRENCE

VermilionCitySetupLawrenceCallback:
	checkscene
	iftruefwd .done
	readvar VAR_XCOORD
	ifequalfwd 18, .done
	disappear VERMILIONCITY_LAWRENCE
	moveobject VERMILIONCITY_LAWRENCE, 19, 31
	appear VERMILIONCITY_LAWRENCE
.done
	endcallback

VermilionCitySetupBattleFactoryCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .done
	changeblock 28,  8, $f3
.done
	endcallback

LawrenceIntroScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	showtext LawrenceOverheardText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceApproachMovementData
	playsound SFX_TACKLE
	applymovement VERMILIONCITY_LAWRENCE, LawrenceBumpMovementData
	showemote EMOTE_SHOCK, VERMILIONCITY_LAWRENCE, 15
	pause 15
	readvar VAR_XCOORD
	ifequalfwd 18, .left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundRightMovementData
	turnobject PLAYER, LEFT
	sjumpfwd .continue

.left
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAroundLeftMovementData
	turnobject PLAYER, RIGHT
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext LawrenceIntroText
	applymovement VERMILIONCITY_LAWRENCE, LawrenceWalkAwayMovementData
	disappear VERMILIONCITY_LAWRENCE
	setscene SCENE_VERMILIONCITY_NOOP
	setevent EVENT_TELEPORT_GUY
	setflag ENGINE_FLYPOINT_VERMILION
	special RestartMapMusic
	end

LawrenceWalkAwayMovementData:
	step_down
	step_down
LawrenceApproachMovementData:
	step_down
	step_down
	step_down
	step_end

LawrenceBumpMovementData:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_sleep_8
	step_sleep_8
	step_end

LawrenceWalkAroundLeftMovementData:
	step_right
	step_down
	step_down
	turn_head_left
	step_end

LawrenceWalkAroundRightMovementData:
	step_left
	step_down
	step_down
	turn_head_right
	step_end

VermilionSnorlax:
	opentext
	special SpecialSnorlaxAwake
	iftruefwd .Awake
	jumpthisopenedtext

	text "Snorlax está ron-"
	line "-cando relajado…"
	done

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 60
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	checkevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	iftrue_jumptextfaceplayer VermilionCityBadgeGuyBattleEdgeText
	readvar VAR_BADGES
	ifequalfwd 16, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	jumpthistextfaceplayer

	text "En Kanto se reúnen"
	line "los entrenadores"
	cont "más expertos."

	para "Los Líderes de"
	line "Gimnasio son espe-"
	cont "cialmente fuertes."

	para "No serán fáciles"
	line "de vencer."
	done

.SomeBadges:
	jumpthistextfaceplayer

	text "¿Has empezado a"
	line "conseguir Medallas"
	cont "de Gimnasio de"
	cont "Kanto?"

	para "¿No crees que los"
	line "entrenadores de"
	cont "aquí son duros?"
	done

.MostBadges:
	jumpthistextfaceplayer

	text "Supongo que pronto"
	line "completarás tu"

	para "conquista de los"
	line "Gimnasios de"
	cont "Kanto."

	para "Avísame si consi-"
	line "gues las ocho"
	cont "Medallas."
	done

.AllBadges:
	faceplayer
	opentext
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem BOTTLE_CAP
	iffalse_endtext
	setevent EVENT_GOT_BOTTLE_CAP_FROM_VERMILION_GUY
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitendtext

VermilionMachokeOwnerScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionMachokeOwnerText
	jumpthistextfaceplayer

	text "¡Mis #mon allana-"
	line "ron el terreno"

	para "para construir ese"
	line "edificio tan gran-"
	cont "de!"

	para "Es una pena que la"
	line "gente no pueda en-"
	cont "trar aún…"
	done

VermilionCitySuperNerd2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionCitySuperNerd2Text
	jumpthistextfaceplayer

	text "¡La Fábrica Batalla"
	line "es nuevecita!"

	para "Pero consume mu-"
	line "chísima energía…"

	para "¡Con la Central de"
	line "Energía parada, no"
	cont "sirve para nada!"
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Tener #mon de di-"
	line "ferentes tipos te"

	para "dará ventaja en el"
	line "combate."

	para "Seguro que las Me-"
	line "dallas de Gimnasio"
	cont "de Kanto te ayudan."
	done

LawrenceOverheardText:
	text "…Así que el #mon"
	line "legendario no es-"
	cont "taba en esa isla…"

	para "Debo seguir bus-"
	line "cando en otra par-"
	cont "te…"
	done

LawrenceIntroText:
	text "Lawrence: Perdón"
	line "por chocar contigo."

	para "Tengo prisa por"
	line "completar mi co-"
	cont "lección."

	para "Mi nombre es"
	line "Lawrence III."

	para "¿Y tú ostentas el"
	line "título de Campeón"
	cont "de la Liga?"

	para "…Vaya, las apa-"
	line "riencias engañan."

	para "Los #mon legenda-"
	line "rios siempre han"
	cont "sido mi pasión."

	para "Tomé el ferri"
	line "Gaviota hasta Isla"

	para "Shamouti, pero no"
	line "encontré al que"
	cont "buscaba."

	para "¡Vaya! ¿Has visto"
	line "a los #mon de las"
	cont "leyendas de Johto?"

	para "Entonces puede que"
	line "nos volvamos a ver"

	para "como colegas co-"
	line "leccionistas."

	para "Pero debo conti-"
	line "nuar mi camino."
	cont "¡Hasta la vista!"
	done

VermilionCityTeacherText:
	text "El Puerto Carmín"
	line "es la puerta ma-"
	cont "rítima de Kanto."

	para "Aquí atracan cru-"
	line "ceros de lujo de"
	cont "todo el mundo."
	done

VermilionMachokeOwnerText:
	text "¡Mis #mon allana-"
	line "ron el terreno"

	para "para construir ese"
	line "edificio tan gran-"
	cont "de!"

	para "Hace tres años era"
	line "un Machop, ¡pero"

	para "evolucionó por el"
	line "esfuerzo!"
	done

VermilionMachokeText:
	text "Machoke: ¡Guoh,"
	line "gogogoh!"
	done

VermilionCitySuperNerdText:
	text "En Kanto hay ocho"
	line "Gimnasios."

	para "Ese gran edificio"
	line "es el Gimnasio"
	cont "#mon de Carmín."
	done

VermilionCitySuperNerd2Text:
	text "La Fábrica Batalla"
	line "es nueva, ¡pero ya"

	para "llegan entrenado-"
	line "res de lejanas re-"

	para "giones para acep-"
	line "tar su desafío!"
	done

VermilionCityOfficerFText:
	text "Lo siento, la Fá-"
	line "brica Batalla está"

	para "cerrada hasta que"
	line "la Central de Ener-"

	para "gía vuelva a fun-"
	line "cionar."
	done

VermilionCitySailorText:
	text "¡Nada se compara"
	line "a la buena brisa"
	cont "marina!"
	done

VermilionCityRadioNearSnorlaxText:
	text "Se puso el #gear"
	line "cerca del Snorlax"
	cont "dormido…"

	para "…"

	para "¡Snorlax se ha"
	line "despertado!"
	done

VermilionCityBadgeGuyAllBadgesText:
	text "¡Enhorabuena!"

	para "Tienes todas las"
	line "Medallas de Gimna-"
	cont "sio de Kanto."

	para "Tengo una recom-"
	line "pensa por tu es-"
	cont "fuerzo."
	done

VermilionCitySignText:
	text "Ciudad Carmín"

	para "El puerto de los"
	line "bellos atardeceres"
	done

VermilionGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Carmín: Lt. Surge"

	para "El Rayo Americano"
	done

PokemonFanClubSignText:
	text "Club de Fans de"
	line "#mon"

	para "¡Todos los fans de"
	line "#mon son bienve-"
	cont "nidos!"
	done

VermilionCityDiglettsCaveSignText:
	text "Cueva Diglett"
	done

VermilionCityPortSignText:
	text "Entrada del"
	line "Puerto Carmín"
	done

VermilionCityAdvancedTipsSignText:
	text "¡Pistas Entren.!"

	para "¡En tu Ficha de"
	line "Entrenador caben"
	cont "dieciséis Meda-"
	cont "llas!"
	done

VermilionCityBattleFactorySignText:
	text "Fábrica Batalla"

	para "¡Gana todo con los"
	line "#mon de"
	cont "alquiler!"
	done
