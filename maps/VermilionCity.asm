VermilionCity_MapScriptHeader:
	def_scene_scripts
	scene_script LawrenceIntroScript

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
	warp_event 10, 23, VERMILION_GYM, 1
	warp_event 18, 35, VERMILION_PORT, 1
	warp_event 19, 35, VERMILION_PORT, 3
	warp_event 36, 17, DIGLETTS_CAVE, 1
	warp_event 28, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 29, 35, SEAGALLOP_FERRY_VERMILION_GATE, 1
	warp_event 13,  5, VERMILION_POLLUTION_SPEECH_HOUSE, 1
	warp_event 19,  5, VERMILION_S_S_ANNE_SPEECH_HOUSE, 1
	warp_event 29,  9, BATTLE_FACTORY_1F, 1
	warp_event 30,  9, BATTLE_FACTORY_1F, 2

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, VermilionCitySignText
	bg_event  5, 23, BGEVENT_JUMPTEXT, VermilionGymSignText
	bg_event  5, 17, BGEVENT_JUMPTEXT, PokemonFanClubSignText
	bg_event 33, 17, BGEVENT_JUMPTEXT, VermilionCityDiglettsCaveSignText
	bg_event 27, 19, BGEVENT_JUMPTEXT, VermilionCityPortSignText
	bg_event 23, 13, BGEVENT_JUMPTEXT, VermilionCityBattleFactorySignText
	bg_event 11, 27, BGEVENT_JUMPTEXT, VermilionCityAdvancedTipsSignText
	bg_event 12, 23, BGEVENT_ITEM + FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

	def_object_events
	object_event 35, 18, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 18, 31, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_VERMILION_CITY
	object_event 18, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityTeacherText, -1
	object_event 23, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachokeOwnerScript, -1
	pokemon_event 24, 10, MACHOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_GRAY, VermilionMachokeText, -1
	object_event 16, 20, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySuperNerdText, -1
	object_event 32, 12, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerd2Script, -1
	object_event 11,  9, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCitySailorText, -1
	object_event 31, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 29, 10, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerFText, EVENT_RESTORED_POWER_TO_KANTO
	object_event 30, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VermilionCityOfficerText, EVENT_RESTORED_POWER_TO_KANTO
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
	changeblock 28,  8, $ce
	changeblock 30,  8, $ff
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
	setscene $1
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
	jumpopenedtext VermilionCitySnorlaxSleepingText

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
	jumptextfaceplayer VermilionCityBadgeGuyTrainerText

.SomeBadges:
	jumptextfaceplayer VermilionCityBadgeGuySomeBadgesText

.MostBadges:
	jumptextfaceplayer VermilionCityBadgeGuyMostBadgesText

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

	text "My #mon"
	line "prepared the land"

	para "to construct that"
	line "huge building!"

	para "It's quite a shame"
	line "that the public"
	cont "can't enter yet…"
	done

VermilionCitySuperNerd2Script:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer VermilionCitySuperNerd2Text
	jumpthistextfaceplayer

	text "The Battle Factory"
	line "is brand-new!"

	para "But it draws a"
	line "huge amount of"
	cont "power…"

	para "With the Power"
	line "Plant offline,"
	cont "it's useless!"
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

VermilionCityOfficerText:
	text "Sorry, the Battle"
	line "Factory is closed"

	para "until the Power"
	line "Plant is up and"
	cont "running again."
	done

VermilionCitySailorText:
	text "¡Nada se compara"
	line "a la buena brisa"
	cont "marina!"
	done

VermilionCitySnorlaxSleepingText:
	text "Snorlax is snoring"
	line "peacefully…"
	done

VermilionCityRadioNearSnorlaxText:
	text "Suena el #gear"
	line "cerca de Snorlax…"

	para "…"

	para "¡Snorlax se ha"
	line "despertado!"
	done

VermilionCityBadgeGuyTrainerText:
	text "Skilled trainers"
	line "gather in Kanto."

	para "Gym Leaders are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "You've started to"
	line "collect Kanto Gym"
	cont "Badges?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "I guess you'll be"
	line "finished with your"

	para "conquest of Kanto"
	line "Gyms soon."

	para "Let me know if"
	line "you get all eight"
	cont "Badges."
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
