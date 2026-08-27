GoldenrodCity_MapScriptHeader:
	def_scene_scripts
	scene_script GoldenrodCityStepDownScene, SCENE_GOLDENRODCITY_STEP_DOWN
	scene_const SCENE_GOLDENRODCITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodCityFlyPoint
	callback MAPCALLBACK_OBJECTS, GoldenrodCityMoveTutor
	callback MAPCALLBACK_CMDQUEUE, GoldenrodCitySetUpPaletteSwap

	def_warp_events
	warp_event 28,  7, GOLDENROD_GYM, 1
	warp_event 33, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 37, 15, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  9, 25, GOLDENROD_BILLS_HOUSE, 1
	warp_event 13, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 33,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 37,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 19,  7, GOLDENROD_NAME_RATER, 1
	warp_event 28, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 18, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  9, 15, RADIO_TOWER_1F, 1 ; hole
	warp_event 23,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event 13,  5, GOLDENROD_UNDERGROUND_ENTRANCES, 5
	warp_event 13, 29, GOLDENROD_UNDERGROUND_ENTRANCES, 2
	warp_event 18, 27, GOLDENROD_POKECOM_CENTER_1F, 2
	warp_event  4, 16, GOLDENROD_HARBOR_GATE, 3
	warp_event  4, 17, GOLDENROD_HARBOR_GATE, 4
	warp_event 30, 15, GOLDENROD_MUSEUM_1F, 1
	warp_event 37, 19, GOLDENROD_NET_BALL_HOUSE, 1
	warp_event 33, 23, GOLDENROD_BAND_HOUSE, 1
	warp_event 13, 21, GOLDENROD_HONEY_HOUSE, 1
	warp_event 39, 27, GOLDENROD_UNDERGROUND_ENTRANCES, 8
	warp_event 19, 21, GOLDENROD_GAME_CORNER, 2
	warp_event 29, 27, GOLDENROD_DEPT_STORE_1F, 2
	warp_event 31, 15, GOLDENROD_MUSEUM_1F, 2

	def_coord_events
	coord_event  9, 15, SCENE_GOLDENRODCITY_NOOP, GoldenrodCityPanUpScript

	def_bg_events
	bg_event 15, 14, BGEVENT_JUMPTEXT, GoldenrodCityStationSignText
	bg_event  7, 15, BGEVENT_JUMPTEXT, GoldenrodCityRadioTowerSignText
	bg_event 30, 27, BGEVENT_JUMPTEXT, GoldenrodDeptStoreSignText
	bg_event 29,  7, BGEVENT_JUMPTEXT, GoldenrodGymSignText
	bg_event 26, 18, BGEVENT_JUMPTEXT, GoldenrodCitySignText
	bg_event 32, 30, BGEVENT_JUMPTEXT, GoldenrodCityBikeShopSignText
	bg_event 20, 22, BGEVENT_JUMPTEXT, GoldenrodCityGameCornerSignText
	bg_event 17,  7, BGEVENT_JUMPTEXT, GoldenrodCityNameRaterSignText
	bg_event 12,  6, BGEVENT_JUMPTEXT, GoldenrodCityUndergroundSignText
	bg_event 14, 30, BGEVENT_JUMPTEXT, GoldenrodCityUndergroundSignText
	bg_event 40, 28, BGEVENT_JUMPTEXT, GoldenrodCityUndergroundSignText
	bg_event 20, 27, BGEVENT_JUMPTEXT, PokeComCenterSignText
	bg_event 35,  6, BGEVENT_JUMPTEXT, GoldenrodCityFlowerShopSignText
	bg_event 27, 15, BGEVENT_JUMPTEXT, GoldenrodMuseumSignText

	def_object_events
	object_event 16, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveTutor, EVENT_GOLDENROD_CITY_MOVE_TUTOR
	object_event 28,  8, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityGymLassText, EVENT_GOLDENROD_GYM_WHITNEY
	object_event 11, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityPokefanMText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 38, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityYoungster1Text, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 16, 16, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 25, 25, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 25, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityLassText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityGrampsText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  8, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 29, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityRocket1Text, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 29, 17, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityRocket4Text, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityRocket2Text, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 20, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityRocket3Text, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 33,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityRocket5Text, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 35, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodCityRocket6Text, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

	object_const_def
	const GOLDENRODCITY_POKEFAN_M2

GoldenrodCityFlyPoint:
	setflag ENGINE_FLYPOINT_GOLDENROD
	endcallback

GoldenrodCityMoveTutor:
; Move Tutor
	checkevent EVENT_BEAT_WHITNEY
	iffalsefwd .MoveTutorDisappear
	checkkeyitem COIN_CASE
	iffalsefwd .MoveTutorDisappear
	appear GOLDENRODCITY_POKEFAN_M2
	endcallback

.MoveTutorDisappear
	disappear GOLDENRODCITY_POKEFAN_M2
	endcallback

GoldenrodCitySetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 22, 39, 7, 19, PAL_BG_WATER, OverworldWaterPalettes, GoldenrodMuseumRoofPalettes
	; The unswapped NULL case will keep whichever palette was chosen by the previous case
	paletteswap 26, 41, 21, 33, PAL_BG_WATER, NULL, GoldenrodBikeShopRoofPalettes
	paletteswap 8, 27, 12, 28, PAL_BG_GREEN, OverworldGreenPalettes, GameCornerExteriorPalettes
	db -1 ; end

GoldenrodCityStepDownScene:
	sdefer .Script
	end

.Script:
	readvar VAR_XCOORD
	ifnotequal 9, .Done
	readvar VAR_YCOORD
	ifnotequal 15, .Done
	applyonemovement PLAYER, step_down
.Done
	setscene SCENE_GOLDENRODCITY_NOOP
	end

GoldenrodCityPanUpScript:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, GoldenrodCityPanUpMovementData
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene SCENE_GOLDENRODCITY_STEP_DOWN
	warpfacing UP, RADIO_TOWER_1F, 2, 7
	end

MoveTutor:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse_jumpopenedtext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	special Special_DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse_jumpopenedtext GoldenrodCityMoveTutorHmTooBadText
	checkcoins 200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .FirePunch
	ifequalfwd $2, .ThunderPunch
	ifequalfwd $3, .IcePunch
	jumpopenedtext GoldenrodCityMoveTutorBButText

.FirePunch:
	setval FIRE_PUNCH
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
	jumpopenedtext GoldenrodCityMoveTutorBButText

.ThunderPunch:
	setval THUNDERPUNCH
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
	jumpopenedtext GoldenrodCityMoveTutorBButText

.IcePunch:
	setval ICE_PUNCH
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
	jumpopenedtext GoldenrodCityMoveTutorBButText

.MoveMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Puño Fuego@"
	db "Puño Trueno@"
	db "Puño Hielo@"
	db "Salir@"

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	promptbutton
	takecoins 200
	waitsfx
	playsound SFX_TRANSACTION
	special Special_DisplayCoinCaseBalance
	jumpthisopenedtext

	text "¡Jajaja!"
	line "¡Buen día, chico!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "…No tienes fichas"
	line "suficientes…"
	done

GoldenrodCityCooltrainerF1Script:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	jumpthistextfaceplayer

	text "¿Ese hombre de"
	line "negro va vestido"

	para "como el Team"
	line "Rocket? ¡Qué"
	cont "ridículo!"
	done

GoldenrodCityCooltrainerF2Script:
	checkflag ENGINE_RADIO_CARD
	iffalse_jumptextfaceplayer GoldenrodCityCooltrainerF2Text
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer GoldenrodCityCooltrainerFOlivineText
	jumpthistextfaceplayer

	text "He venido en el"
	line "Magnetotrén."

	para "¡Es hora de ir"
	line "de compras!"
	done

GoldenrodCityYoungster2Script:
	faceplayer
	opentext
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumpopenedtext GoldenrodCityYoungster2Text
	jumpthisopenedtext

	text "¿Has estado en el"
	line "Museo?"

	para "¡Tiene cosas muy"
	line "geniales dentro!"
	done

GoldenrodCityRocketScoutScript:
	checkevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	iftruefwd .RocketScout
	jumptextfaceplayer GoldenrodCityRocket4Text

.RocketScout:
	opentext
	writetext GoldenrodCityRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

GoldenrodCityPanUpMovementData:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

GoldenrodCityPokefanMText:
	text "Construyeron la"
	line "nueva Torre Radio"
	cont "para reemplazar la"
	cont "antigua."

	para "Ahora emite todos"
	line "los programas en"
	cont "el #gear."
	done

GoldenrodCityYoungster1Text:
	text "Sé que hay una"
	line "tienda de bicis"

	para "nueva, pero no"
	line "logro encontrarla."
	done


GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "¿Ese tipo de negro"
	line "era del Team"
	cont "Rocket de verdad?"

	para "¡No me lo creo!"
	done

GoldenrodCityCooltrainerF2Text:
	text "La Torre Radio de"
	line "Trigal es enorme."

	para "Hay una promoción"
	line "ahora mismo:"

	para "te adaptan el"
	line "#gear para que"
	cont "tenga radio."
	done

GoldenrodCityCooltrainerFOlivineText:
	text "Vine aquí en el"
	line "S.S.Aqua."

	para "Es más lento que"
	line "el Magnetotrén,"
	cont "pero hay mejores"
	cont "vistas."
	done



GoldenrodCityYoungster2Text:
	text "Je, je, je… Me"
	line "regañaron por"
	cont "jugar en el sótano"
	cont "del C. Comercial."
	done

GoldenrodCityLassText:
	text "El hombre de esa"
	line "casa evalúa los"
	cont "motes de #mon."

	para "También ayuda a"
	line "cambiar el mote a"
	cont "tus #mon."

	para "¡Le gustaron mis"
	line "motes, hasta los"
	cont "más raros!"
	done

GoldenrodCityGrampsText:
	text "¡Uf! Esta ciudad"
	line "es enorme. No sé"
	cont "dónde está nada."
	done

GoldenrodCityRocketScoutText1:
	text "Así que esta es la"
	line "Torre Radio…"
	done

GoldenrodCityRocketScoutText2:
	text "¿Qué quieres,"
	line "mosca? ¡Largo!"
	done

GoldenrodCityRocket1Text:
	text "¡No estorbes!"
	line "¡Largo!"
	done

GoldenrodCityRocket2Text:
	text "Tomar la Torre"
	line "Radio…"

	para "¿Qué pasa? ¡No es"
	line "asunto tuyo!"
	done

GoldenrodCityRocket3Text:
	text "¿#mon? ¡Solo"
	line "son herramientas"
	cont "para sacar dinero!"
	done

GoldenrodCityRocket4Text:
	text "Nuestro sueño"
	line "pronto se hará"
	cont "realidad…"

	para "Ha sido una larga"
	line "lucha…"
	done

GoldenrodCityRocket5Text:
	text "¡Oye, mocoso! ¡No"
	line "perteneces a este"
	cont "lugar! ¡Piérdete!"
	done

GoldenrodCityRocket6Text:
	text "¡Ven a probar el"
	line "verdadero terror"
	cont "del Team Rocket!"
	done

GoldenrodCityGymLassText:
	text "Blanca no está"
	line "aquí ahora mismo."

	para "Salió corriendo"
	line "y gritando:"

	para "“¡Debo conseguir"
	line "la Tarjeta Radio!”"
	done

GoldenrodCityStationSignText:
	text "Estación de Ciudad"
	line "Trigal"
	done

GoldenrodCityRadioTowerSignText:
	text "Torre Radio de"
	line "Ciudad Trigal"
	done

GoldenrodDeptStoreSignText:
	text "¡Toda clase de"
	line "objetos #mon!"

	para "Centro Comercial"
	line "de Ciudad Trigal"
	done

GoldenrodGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Trigal"
	cont "Líder: Blanca"

	para "¡La increíble"
	line "chica guapa!"
	done

GoldenrodCitySignText:
	text "Ciudad Trigal"

	para "La ciudad festiva"
	line "y encantadora"
	done

GoldenrodCityBikeShopSignText:
	text "¡El mundo es un"
	line "carril bici!"

	para "Marabicicletas"
	done

GoldenrodCityGameCornerSignText:
	text "¡Tu parque de"
	line "atracciones!"

	para "Casino de"
	line "Ciudad Trigal"
	done

GoldenrodCityNameRaterSignText:
	text "Inspector de Motes"

	para "Evalúa el mote"
	line "de tu #mon"
	done

GoldenrodCityUndergroundSignText:
	text "Entrada al"
	line "Subterráneo"
	done

PokeComCenterSignText:
	text "¡Conecta al mundo!"
	line "Centro #Com"
	done

GoldenrodCityFlowerShopSignText:
	text "Floristería,"
	line "flores hermosas"
	done

GoldenrodMuseumSignText:
	text "Museo de Trigal"
	line "¡Inauguración!"

	para "¡Explora la"
	line "historia de Johto!"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Puedo enseñarles"
	line "grandes ataques"
	cont "a tus #mon."

	para "¿Quieres que les"
	line "enseñe alguno?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Te costará 200"
	line "fichas. ¿Vale?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Oh… Pero si son"
	line "increíbles…"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "¡Jajaja! ¡No te"
	line "arrepentirás!"

	para "¿Qué movimiento"
	line "debería enseñar?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Mmm, qué pena."
	line "Tendré que pedir"
	cont "dinero en casa…"
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "Si entiendes lo"
	line "bueno que es este"
	cont "ataque, ¡ya serás"
	cont "un gran experto!"
	done


GoldenrodCityMoveTutorBButText:
	text "P-pero…"
	done
