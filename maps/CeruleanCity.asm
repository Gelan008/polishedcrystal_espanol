CeruleanCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlyPoint
	callback MAPCALLBACK_CMDQUEUE, CeruleanCitySetUpPaletteSwap

	def_warp_events
	warp_event  8,  9, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 24,  9, CERULEAN_POLICE_STATION, 1
	warp_event 13, 13, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 15, CERULEAN_POKECENTER_1F, 1
	warp_event 26, 17, CERULEAN_GYM, 1
	warp_event 25, 23, CERULEAN_MART, 2
	warp_event  2,  7, CERULEAN_CAVE_1F, 1
	warp_event 13, 23, CERULEAN_BIKE_SHOP, 1
	warp_event 14,  9, CERULEAN_BERRY_POWDER_HOUSE, 1
	warp_event 19, 23, CERULEAN_COUPLE_HOUSE, 1
	warp_event 31,  9, CERULEAN_WATER_SHOW_SPEECH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 17, 18, BGEVENT_JUMPTEXT, CeruleanCitySignText
	bg_event 27, 17, BGEVENT_JUMPTEXT, CeruleanGymSignText
	bg_event 11, 23, BGEVENT_JUMPTEXT, CeruleanBikeShopSignText
	bg_event 29,  9, BGEVENT_JUMPTEXT, CeruleanPoliceSignText
	bg_event 19,  3, BGEVENT_JUMPTEXT, CeruleanCapeSignText
	bg_event 12, 17, BGEVENT_JUMPTEXT, CeruleanBubblerText
	bg_event 21, 25, BGEVENT_JUMPTEXT, CeruleanTrainerTipsText
	bg_event  4,  7, BGEVENT_ITEM + BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	bg_event 31, 15, BGEVENT_ITEM + RARE_CANDY, EVENT_CERULEAN_CITY_HIDDEN_RARE_CANDY

	def_object_events
	object_event 21, 18, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event  7,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 30, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 28, 12, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanCitySuperNerdText, -1
	pokemon_event 20, 18, SLOWBRO, SPRITEMOVEDATA_STILL, -1, PAL_MON_PINK, CeruleanCitySlowbroText, -1
	object_event 10, 17, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  2,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeruleanCaveGuardText, EVENT_BEAT_BLUE
	cuttree_event 44, 14, EVENT_ROUTE_9_CUT_TREE

	object_const_def
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_YOUNGSTER

CeruleanCityFlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCitySetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 12, 29, 0, 3, PAL_BG_YELLOW, OverworldYellowPalettes, NuggetBridgePalettes
	db -1 ; end

CeruleanCityCooltrainerMScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer CeruleanCityCooltrainerMText2
	jumpthistextfaceplayer

	text "¿La Central de"
	line "Energía de Kanto?"

	para "Está al final de"
	line "la Ruta 9, al este"
	cont "de aquí."

	para "Creo que hubo un"
	line "accidente allí."
	done

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	writetext CeruleanCityCooltrainerFText3
	waitendtext
	end

CeruleanCityFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer CeruleanCityFisherText
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue_jumptextfaceplayer CeruleanCityFisherRocketTipText
	jumptextfaceplayer CeruleanCityFisherText

CeruleanCityYoungsterScript:
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iftrue_jumptextfaceplayer CeruleanCityYoungsterText
	faceplayer
	showtext CeruleanCityYoungsterText1
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	jumpthistext

	text "¿Eh?"

	para "El Buscaobjetos"
	line "está reaccionando."
	done


CeruleanCityCooltrainerMText2:
	text "¿Coleccionas cada"
	line "tipo de #mon?"

	para "¡Debe de ser un"
	line "gran reto, pero"
	cont "suena divertido!"
	done

CeruleanCitySuperNerdText:
	text "El Cabo del norte"
	line "es un buen sitio"

	para "para citas."
	line "¡A las chicas les"
	cont "gusta!"
	done

CeruleanCitySlowbroText:
	text "Slowbro: ¿Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "¡Slowbro y yo"
	line "hacemos un gran"
	cont "equipo!"
	done

CeruleanCityCooltrainerFText2:
	text "Slowbro, ¡usa tu"
	line "Confusión!"
	done

CeruleanCityCooltrainerFText3: ; text > text
	text "…"
	done

CeruleanCityFisherText:
	text "Soy un gran fan de"
	line "Misty, del Gim. de"
	cont "Celeste."
	done

CeruleanCityFisherRocketTipText:
	text "Vi a un tipo muy"
	line "sospechoso ir al"
	cont "Cabo Celeste."
	done

CeruleanCityYoungsterText1:
	text "Por aquí hay una"
	line "cueva con #mon"
	cont "muy fuertes."
	done


CeruleanCityYoungsterText:
	text "El Buscaobjetos ya"
	line "no reacciona…"

	para "Alguien se me ha"
	line "adelantado."
	done

CeruleanCaveGuardText:
	text "Esta es…"

	para "¡La gran Cueva"
	line "Celeste!"

	para "Aquí viven #mon"
	line "muy poderosos."

	para "Solo los que hayan"
	line "vencido a los 8"
	cont "Líderes de Kanto"
	cont "pueden entrar."
	done

CeruleanCitySignText:
	text "Ciudad Celeste"

	para "Un aura mística y"
	line "azul la rodea"
	done

CeruleanGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Celeste: Misty"

	para "La sirena cabezota"
	done

CeruleanBikeShopSignText:
	text "Los creadores del"
	line "boom de las Bicis"

	para "Bicis Milagro"
	done

CeruleanPoliceSignText:
	text "Hay un aviso"
	line "aquí…"

	para "¡Erradiquemos los"
	line "robos y hagamos"

	para "de la ciudad un"
	line "lugar amigable!"

	para "Policía de Celeste"
	done

CeruleanCapeSignText:
	text "Cabo Celeste"
	line "Adelante"
	done

CeruleanBubblerText:
	text "¡El agua"
	line "sabe bien!"
	done

CeruleanTrainerTipsText:
	text "Pistas Entrenador"

	para "Incluso sin un"
	line "Buscaobjetos,"
	cont "puedes encontrar"
	cont "cosas en árboles,"
	cont "bajo rocas o agua."
	done
