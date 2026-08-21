VermilionCity_MapScriptHeader:
	def_scene_scripts
	scene_script LawrenceIntroScript, SCENE_VERMILIONCITY_LAWRENCE_INTRO
	scene_const SCENE_VERMILIONCITY_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionCitySetupLawrenceCallback
	callback MAPCALLBACK_TILES, VermilionCitySetupBattleFactoryCallback
	callback MAPCALLBACK_CMDQUEUE, VermilionCitySetUpPaletteSwap

	def_warp_events
	warp_event  5,  3, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  3, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event  8, 19, VERMILION_GYM, 1
	warp_event 18, 31, VERMILION_PORT, 1
	warp_event 19, 31, VERMILION_PORT, 3
	warp_event 38, 13, DIGLETTS_CAVE, 1
	warp_event 28, 31, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 29, 31, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 13,  3, VERMILION_POLLUTION_SPEECH_HOUSE, 1
	warp_event 19,  3, VERMILION_S_S_ANNE_SPEECH_HOUSE, 1
	warp_event 28,  7, BATTLE_FACTORY_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_JUMPTEXT, VermilionCitySignText
	bg_event  9, 19, BGEVENT_JUMPTEXT, VermilionGymSignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, PokemonFanClubSignText
	bg_event 35, 13, BGEVENT_JUMPTEXT, VermilionCityDiglettsCaveSignText
	bg_event 27, 15, BGEVENT_JUMPTEXT, VermilionCityPortSignText
	bg_event 27, 24, BGEVENT_JUMPTEXT, VermilionCityPierSignText
	bg_event 23,  7, BGEVENT_JUMPTEXT, VermilionCityBattleFactorySignText
	bg_event 10, 23, BGEVENT_JUMPTEXT, VermilionCityAdvancedTipsSignText
	bg_event 12, 19, BGEVENT_ITEM + FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL
	bg_event 32,  4, BGEVENT_ITEM + MAX_ETHER, EVENT_VERMILION_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 37, 14, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 18, 27, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_VERMILION_CITY
	object_event 18, 10, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityTeacherText, -1
	object_event 20,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachokeOwnerScript, -1
	pokemon_event 21,  7, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GRAY, VermilionMachokeText, -1
	object_event 16, 16, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySuperNerdText, -1
	object_event 31, 10, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerd2Script, -1
	object_event 11,  6, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySailorText, -1
	object_event 19, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 28,  8, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerFText, EVENT_RESTORED_POWER_TO_KANTO
	cuttree_event 13, 19, EVENT_VERMILION_CITY_CUT_TREE
	object_event 30,  1, SPRITE_PEARL, SPRITEMOVEDATA_ARCH_TREE_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 26,  1, SPRITE_PEARL, SPRITEMOVEDATA_ARCH_TREE_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_GREEN, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 27, 32, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_COPY_BG_WATER, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event 30, 32, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_COPY_BG_WATER, OBJECTTYPE_COMMAND, end, NULL, -1

	object_const_def
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_LAWRENCE

VermilionCitySetupLawrenceCallback:
	checkscene
	iftruefwd .done
	readvar VAR_XCOORD
	ifequalfwd 18, .done
	disappear VERMILIONCITY_LAWRENCE
	moveobject VERMILIONCITY_LAWRENCE, 19, 27
	appear VERMILIONCITY_LAWRENCE
.done
	endcallback

VermilionCitySetupBattleFactoryCallback:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .done
	changeblock 28, 6, $f7
.done
	endcallback

VermilionCitySetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 21, 36, 27, 39, PAL_BG_ROOF, VermilionCityRoofPalettes, SeagallopFerryRoofPalettes
	db -1 ; end

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

	text "Snorlax está"
	line "roncando plácido…"
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

	text "En Kanto están los"
	line "entrenadores más"
	cont "expertos."

	para "Los Líderes de"
	line "Gimnasio son muy"
	cont "fuertes."

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

	text "Pronto habrás"
	line "vencido en todos"
	cont "los Gimnasios."

	para "¡Avísame cuando"
	line "tengas las ocho"
	cont "Medallas!"
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

	text "¡Mis #mon"
	line "allanaron el"
	cont "terreno"

	para "para construir ese"
	line "edificio tan"
	cont "grande!"

	para "Es una pena que la"
	line "gente no pueda"
	cont "entrar aún…"
	done

VermilionCitySuperNerd2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionCitySuperNerd2Text
	jumpthistextfaceplayer

	text "¡La Fábrica es"
	line "nuevecita!"

	para "Pero consume gran"
	line "cantidad de luz…"

	para "¡Y con la Central"
	line "parada, no sirve"
	cont "para nada!"
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Tener #mon de"
	line "diversos tipos te"
	cont "dará ventaja en el"
	cont "combate."

	para "Las Medallas de"
	line "Kanto te serán de"
	cont "gran ayuda."
	done

LawrenceOverheardText:
	text "…Así que"
	line "el #mon"
	cont "legendario no"
	cont "estaba allí…"

	para "Debo seguir"
	line "buscando en otra"
	cont "parte…"
	done

LawrenceIntroText:
	text "Lawrence: Perdón"
	line "por el choque."

	para "Tengo prisa por"
	line "completar toda mi"
	cont "colección."

	para "Mi nombre es"
	line "Lawrence III."

	para "¿Y tú ostentas el"
	line "título de Campeón"
	cont "de la Liga?"

	para "…Vaya, qué engaño"
	line "de apariencias."

	para "Los #mon"
	line "legendarios son mi"
	cont "gran pasión."

	para "Fui en ferri hasta"
	line "Isla Shamouti, mas"
	cont "no hallé nada."

	para "¡Vaya! ¿Has visto"
	line "a los #mon de"
	cont "las leyendas?"

	para "Entonces nos"
	line "volveremos a ver"
	cont "como colegas."

	para "Debo seguir mi"
	line "camino. ¡Adiós!"
	done

VermilionCityTeacherText:
	text "El puerto de"
	line "Carmín es la vía"
	cont "marítima de Kanto."

	para "Aquí llegan los"
	line "cruceros de lujo"
	cont "de todo el mundo."
	done

VermilionMachokeOwnerText:
	text "¡Mis #mon"
	line "allanaron el suelo"
	cont "para ese edificio!"

	para "Era un Machop hace"
	line "tres años, pero"
	cont "ya evolucionó!"
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
	cont "vienen personas de"
	cont "sitios lejanos"
	cont "a combatir!"
	done

VermilionCityOfficerFText:
	text "La Fábrica Batalla"
	line "está cerrada hasta"
	cont "que la Central"
	cont "vuelva a operar."
	done

VermilionCitySailorText:
	text "¡Nada se compara"
	line "a la buena brisa"
	cont "marina!"
	done

VermilionCityRadioNearSnorlaxText:
	text "Suena el #gear"
	line "cerca de Snorlax…"

	para "…"

	para "¡Snorlax se ha"
	line "despertado!"
	done

VermilionCityBadgeGuyAllBadgesText:
	text "¡Enhorabuena!"

	para "Tienes todas las"
	line "Medallas de Kanto."

	para "Toma este premio"
	line "por tu esfuerzo."
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
	line "#mon son"
	cont "bienvenidos!"
	done

VermilionCityDiglettsCaveSignText:
	text "Cueva Diglett"
	done

VermilionCityPortSignText:
	text "Entrada del"
	line "Puerto Carmín"
	done

VermilionCityPierSignText:
	db "◀ S.S. Aqua<LINE>▼ Surcamar Veloce<DONE>" ; not compressible

VermilionCityAdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡En tu Ficha de"
	line "entrenador caben"
	cont "16 Medallas!"
	done

VermilionCityBattleFactorySignText:
	text "Fábrica Batalla"

	para "¡Gana todo con los"
	line "#mon de"
	cont "alquiler!"
	done
