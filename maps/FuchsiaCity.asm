FuchsiaCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlyPoint
	callback MAPCALLBACK_CMDQUEUE, FuchsiaCitySetUpPaletteSwap

	def_warp_events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event  6, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, FUCHSIA_BILL_SPEECH_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE, 3
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 33, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 33, ROUTE_19_FUCHSIA_GATE, 2
	warp_event 15, 27, FUCHSIA_SAFARI_BALL_HOUSE, 1
	warp_event 22, 13, FUCHSIA_AQUARIUM_1F, 1
	warp_event 23, 13, FUCHSIA_AQUARIUM_1F, 2

	def_coord_events

	def_bg_events
	bg_event 25, 19, BGEVENT_JUMPTEXT, FuchsiaCitySignText
	bg_event  7, 27, BGEVENT_JUMPTEXT, FuchsiaGymSignText
	bg_event 21, 16, BGEVENT_JUMPTEXT, FuchsiaZooSignText
	bg_event 27, 29, BGEVENT_JUMPTEXT, WardensHomeSignText
	bg_event 17,  5, BGEVENT_JUMPTEXT, SafariZoneClosedSignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, NoLitteringSignText
	bg_event  7,  7, BGEVENT_READ, FuchsiaCityZooDratiniSign
	bg_event 13,  7, BGEVENT_READ, FuchsiaCityZooKangaskhanSign
	bg_event 27,  7, BGEVENT_READ, FuchsiaCityZooTaurosSign
	bg_event 33,  7, BGEVENT_READ, FuchsiaCityZooChanseySign
	bg_event 31, 13, BGEVENT_READ, FuchsiaCityZooSlowpokeSign
	bg_event  9, 15, BGEVENT_READ, FuchsiaCityZooLaprasSign
	bg_event 11, 35, BGEVENT_JUMPTEXT, FuchsiaCityCarefulSwimmingSignText
	bg_event 26, 13, BGEVENT_JUMPTEXT, FuchsiaAquariumSignText
	bg_event 31, 27, BGEVENT_JUMPTEXT, HouseForSaleSignText
	bg_event 26, 12, BGEVENT_ITEM + NUGGET, EVENT_FUCHSIA_CITY_HIDDEN_NUGGET

	def_object_events
	object_event 19, 18, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityYoungsterText, -1
	object_event 10,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanMText, -1
	object_event 16, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityTeacherText, -1
	object_event 30,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaCityPokefanFText, -1
	cuttree_event 16, 19, EVENT_FUCHSIA_CITY_CUT_TREE
	fruittree_event 14, 17, FRUITTREE_FUCHSIA_CITY, LIECHI_BERRY, PAL_NPC_RED
	pokemon_event  6,  5, DRATINI, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_AZURE, EmptyString, -1
	pokemon_event 12,  6, KANGASKHAN, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, EmptyString, -1
	pokemon_event 26,  6, TAUROS, TAUROS_PALDEAN_FIRE_FORM, SPRITEMOVEDATA_POKEMON, 1 << MORN, PAL_MON_RED, EmptyString, -1
	pokemon_event 25,  6, TAUROS, NO_FORM, SPRITEMOVEDATA_POKEMON, 1 << DAY, PAL_MON_BROWN, EmptyString, -1
	pokemon_event 25,  5, TAUROS, PALDEAN_FORM, SPRITEMOVEDATA_POKEMON, 1 << EVE, PAL_MON_BLACK, EmptyString, -1
	pokemon_event 26,  5, TAUROS, TAUROS_PALDEAN_WATER_FORM, SPRITEMOVEDATA_POKEMON, 1 << NITE, PAL_MON_BLUE, EmptyString, -1
	pokemon_event 31,  5, CHANSEY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, EmptyString, -1
	pokemon_event 30, 12, SLOWPOKE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, EmptyString, -1
	object_event  8, 17, SPRITE_LAPRAS, SPRITEMOVEDATA_SWIM_AROUND, 2, 1, -1, 0, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1

FuchsiaCityFlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

FuchsiaCitySetUpPaletteSwap:
	usepaletteswap .PaletteSwap
	endcallback

.PaletteSwap:
	paletteswap 9, 31, 0, 19, PAL_BG_ROOF, FuchsiaCityRoofPalettes, SafariZoneRoofPalettes
	db -1 ; end

FuchsiaCityYoungsterText:
	text "¿Por qué se fue el"
	line "Guarda de repente?"

	para "¡He oído que huía"
	line "de la policía!"
	done

FuchsiaCityPokefanMText:
	text "La hija de Koga le"
	line "sucedió de Líder"
	cont "al ir él al Alto"
	cont "Mando."
	done

FuchsiaCityTeacherText:
	text "El Juego Safari se"
	line "ha cancelado…"

	para "Pero la Zona sigue"
	line "abierta."

	para "Necesitarás un"
	line "#mon fuerte"
	cont "para explorarla"
	cont "bien."
	done

FuchsiaCityPokefanFText:
	text "Al irse el Guarda"
	line "de la Zona Safari,"
	cont "nadie cuidaba del"
	cont "zoo de la ciudad."

	para "Pero los vecinos"
	line "lo mantuvimos."

	para "¡Incluso transfor-"
	line "mamos su despacho"
	cont "en un acuario!"
	done

FuchsiaCitySignText:
	text "Ciudad Fucsia"

	para "¡Contemplad!"
	line "¡Es Rosa Pasión!"
	done

FuchsiaGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Fucsia: Sachiko"

	para "La Maestra Ninja"
	line "Venenosa"
	done

FuchsiaZooSignText:
	text "Zoo de Fucsia"

	para "Con los #mon de"
	line "la Zona Safari"
	done

FuchsiaAquariumSignText:
	text "Acuario de Fucsia"

	para "¡Contemplad la"
	line "maravilla de los"
	cont "#mon acuáticos!"
	done

WardensHomeSignText:
	text "Casa del Guarda de"
	line "la Zona Safari"
	done

SafariZoneClosedSignText:
	text "El Guarda no está"
	line "disponible."

	para "Por lo tanto, el"
	line "Juego Safari está"
	cont "cancelado."
	done

NoLitteringSignText:
	text "No tirar basura."

	para "Por favor, llévate"
	line "tus desperdicios"
	cont "contigo."
	done

FuchsiaCityZooDratiniSign:
	showtext .DratiniText
	reanchormap
	pokepic DRATINI
	cry DRATINI
	waitbutton
	closepokepic
	setmonval DRATINI
	special SpecialSeenMon
	end

.DratiniText:
	text "Nombre: Dratini"

	para "Vive bajo el agua"
	line "mientras acumula"
	cont "energía vital."
	done

FuchsiaCityZooKangaskhanSign:
	showtext .KangaskhanText
	reanchormap
	pokepic KANGASKHAN
	cry KANGASKHAN
	waitbutton
	closepokepic
	setmonval KANGASKHAN
	special SpecialSeenMon
	end

.KangaskhanText:
	text "Nombre: Kangaskhan"

	para "La cría de su"
	line "bolsa deja el nido"
	cont "tras unos tres"
	cont "años."
	done

FuchsiaCityZooTaurosSign:
	readvar VAR_TIMEOFDAY
	ifequalfwd MORN, .Fire
	ifequalfwd EVE, .Fighting
	ifequalfwd NITE, .Water
	showtext .TaurosText
	reanchormap
	pokepic TAUROS
	cry TAUROS
	waitbutton
	closepokepic
	setmonval TAUROS
	special SpecialSeenMon
	end

.Fire:
	showtext .TaurosText
	reanchormap
	pokepic TAUROS, TAUROS_PALDEAN_FIRE_FORM
	cry TAUROS, TAUROS_PALDEAN_FIRE_FORM
	waitbutton
	closepokepic
	setmonval TAUROS, TAUROS_PALDEAN_FIRE_FORM
	special SpecialSeenMon
	end

.Fighting:
	showtext .TaurosText
	reanchormap
	pokepic TAUROS, PALDEAN_FORM
	cry TAUROS, PALDEAN_FORM
	waitbutton
	closepokepic
	setmonval TAUROS, PALDEAN_FORM
	special SpecialSeenMon
	end

.Water:
	showtext .TaurosText
	reanchormap
	pokepic TAUROS, TAUROS_PALDEAN_WATER_FORM
	cry TAUROS, TAUROS_PALDEAN_WATER_FORM
	waitbutton
	closepokepic
	setmonval TAUROS, TAUROS_PALDEAN_WATER_FORM
	special SpecialSeenMon
	end

.TaurosText:
	text "Nombre: Tauros"

	para "Este toro salvaje"
	line "fue domesticado"

	para "en una variedad de"
	line "razas distintas."
	done

FuchsiaCityZooChanseySign:
	showtext .ChanseyText
	reanchormap
	pokepic CHANSEY
	cry CHANSEY
	waitbutton
	closepokepic
	setmonval CHANSEY
	special SpecialSeenMon
	end

.ChanseyText:
	text "Nombre: Chansey"

	para "Camina con cuidado"
	line "para evitar que"
	cont "su huevo se rompa."

	para "Sin embargo, es"
	line "extremadamente"
	cont "rápida corriendo."
	done

FuchsiaCityZooSlowpokeSign:
	showtext .SlowpokeText
	reanchormap
	pokepic SLOWPOKE
	cry SLOWPOKE
	waitbutton
	closepokepic
	setmonval SLOWPOKE
	special SpecialSeenMon
	end

.SlowpokeText:
	text "Nombre: Slowpoke"

	para "Le basta con"
	line "holgazanear sin"

	para "preocuparse por"
	line "el tiempo."
	done

FuchsiaCityZooLaprasSign:
	showtext .LaprasText
	reanchormap
	pokepic LAPRAS
	cry LAPRAS
	waitbutton
	closepokepic
	setmonval LAPRAS
	special SpecialSeenMon
	end

.LaprasText:
	text "Nombre: Lapras"

	para "Este “rey de los"
	line "mares” es capaz de"

	para "comprender el"
	line "lenguaje humano."
	done
	done

HouseForSaleSignText:
	text "¿Qué es esto?"

	para "Casa en Venta…"
	line "Aquí no vive"
	cont "nadie."
	done

FuchsiaCityCarefulSwimmingSignText:
	text "Por favor, ten"
	line "cuidado si nadas a"
	cont "las Islas Espuma."

	para "Policía Fucsia"
	done
