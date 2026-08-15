PewterCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PewterCityFlyPoint

	def_warp_events
	warp_event 29, 15, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 12, 19, PEWTER_GYM, 1
	warp_event 23, 21, PEWTER_MART, 2
	warp_event 13, 27, PEWTER_POKECENTER_1F, 1
	warp_event  7, 31, PEWTER_SNOOZE_SPEECH_HOUSE, 1
	warp_event 14,  9, PEWTER_MUSEUM_OF_SCIENCE_1F, 1
	warp_event 19,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 3
	warp_event 15,  9, PEWTER_MUSEUM_OF_SCIENCE_1F, 2

	def_coord_events

	def_bg_events
	bg_event 25, 25, BGEVENT_JUMPTEXT, PewterCitySignText
	bg_event 13, 19, BGEVENT_JUMPTEXT, PewterGymSignText
	bg_event 13, 11, BGEVENT_JUMPTEXT, PewterMuseumOfScienceSignText
	bg_event 33, 21, BGEVENT_JUMPTEXT, PewterCityMtMoonGiftShopSignText
	bg_event 19, 31, BGEVENT_JUMPTEXT, PewterCityTrainerTipsText

	def_object_events
	object_event 22, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityCooltrainerFText, -1
	object_event 19, 12, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityCooltrainermText, -1
	object_event 14, 31, SPRITE_CHILD, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, PewterCityBugCatcherText, -1
	object_event 29, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event  6, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityYoungsterScript, -1
	object_event 25, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, PewterCityPokefanMScript, -1
	fruittree_event 32,  6, FRUITTREE_PEWTER_CITY_1, PETAYA_BERRY, PAL_NPC_PINK
	fruittree_event 30,  6, FRUITTREE_PEWTER_CITY_2, APICOT_BERRY, PAL_NPC_BLUE

PewterCityFlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	endcallback

PewterCityGrampsScript:
	checkevent EVENT_GOT_OLD_AMBER
	iftrue_jumptextfaceplayer PewterCityGrampsText_GotSilverWing
	faceplayer
	opentext
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem OLD_AMBER
	iffalse_endtext
	setevent EVENT_GOT_OLD_AMBER
	endtext

PewterCityYoungsterScript:
	faceplayer
	opentext
	writetext PewterCityYoungsterText1
	waitbutton
	checkflag ENGINE_BOULDERBADGE
	iffalse_endtext
	jumpthisopenedtext

	text "¿Venciste en el"
	line "Gimnasio? ¡Pues tú"

	para "también eres tan"
	line "fuerte como una"
	cont "roca!"
	done

PewterCityPokefanMScript:
	faceplayer
	opentext
	writetext .Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .Text3
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem PEWTERCRUNCH
	iffalse_jumpopenedtext .Text4
	waitsfx
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext .Text2
	promptbutton
	itemnotify
	endtext

.Text1:
	text "¡La especialidad"
	line "de Plateada:"
	cont "¡Rokikos!"

	para "¡Te vendo un"
	line "paquete por 300¥!"
	done

.Text2:
	text "¡Gracias!"
	line "¡Son muy duros,"
	cont "así que cuidado!"
	done

.Text3:
	text "¿Son demasiado"
	line "crujientes para"
	cont "ti?"
	done

.Text4:
	text "¡No tienes espacio"
	line "para llevarlos!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "¡No tienes dinero"
	line "para pagarlos!"
	done

PewterCityCooltrainerFText:
	text "Los #mon solo"
	line "pueden tener dos"
	cont "tipos a la vez,"

	para "pero si fuera po-"
	line "sible que tuviesen"
	cont "todos los tipos,"

	para "solo tendrían una"
	line "debilidad."

	para "¿Que cuál es?"

	para "¡Los ataques de"
	line "tipo Roca, claro!"
	done

PewterCityCooltrainermText:
	text "Esta chica cree"
	line "que los #mon"
	cont "Roca lo son todo,"

	para "pero están empata-"
	line "dos con los que"

	para "tienen más debili-"
	line "dades de todos."

	para "Pero no me atrevo"
	line "a decírselo."
	done

PewterCityBugCatcherText:
	text "Por la noche, los"
	line "Clefairy salen a"
	cont "jugar al Mt. Moon."

	para "Pero no todas las"
	line "noches."
	done

PewterCityGrampsText:
	text "¿Ah, has venido"
	line "desde Johto hasta"
	cont "aquí?"

	para "Qué recuerdos…"
	line "Cuando era joven,"

	para "fui a Johto a en-"
	line "trenar."

	para "Me recuerdas mu-"
	line "cho a cómo era yo"
	cont "de joven."

	para "Toma. Quiero darte"
	line "este objeto que"
	cont "hallé en Johto."
	done

PewterCityGrampsText_GotSilverWing:
	text "Ir a lugares nue-"
	line "vos y desconoci-"
	cont "dos, y conocer"
	cont "gente nueva…"

	para "Esa es la gran"
	line "alegría de viajar."
	done

PewterCityYoungsterText1:
	text "El Gimnasio de"
	line "Plateada es tan"

	para "duro y resistente"
	line "como una roca."

	para "Ten cuidado ahí"
	line "dentro."
	done

PewterCitySignText:
	text "Ciudad Plateada"
	line "Ciudad gris como"
	cont "la roca"
	done

PewterGymSignText:
	text "Gimnasio #mon"
	line "de Ciudad Plateada"
	cont "Líder: Brock"

	para "El entrenador más"
	line "fuerte que una"
	cont "roca"
	done

PewterMuseumOfScienceSignText:
	text "Museo de la Cien-"
	line "cia de Plateada"
	done

PewterCityMtMoonGiftShopSignText:
	text "Hay un aviso aquí…"

	para "Tienda de regalos"
	line "del Mt. Moon"
	cont "¡Ya abierta!"
	done

PewterCityTrainerTipsText:
	text "Pistas Entrenador"

	para "Un #mon que lleve"
	line "una Cápsula Ha-"
	cont "bilidad tendrá más"

	para "posibilidades de"
	line "criar una cría con"
	cont "habilidad rara."
	done
