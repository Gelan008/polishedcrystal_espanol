CherrygroveCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CHERRYGROVECITY_GUIDE_GENT
	scene_const SCENE_CHERRYGROVECITY_MEET_RIVAL
	scene_const SCENE_CHERRYGROVECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlyPoint

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  7, SCENE_CHERRYGROVECITY_GUIDE_GENT, CherrygroveGuideGentTrigger
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalTriggerNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalTriggerSouth

	def_bg_events
	bg_event 30,  8, BGEVENT_JUMPTEXT, CherrygroveCitySignText
	bg_event 23,  9, BGEVENT_JUMPTEXT, GuideGentsHouseSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, CherrygroveCityAdvancedTipsSignText
	bg_event 35,  2, BGEVENT_ITEM + NUGGET, EVENT_CHERRYGROVE_CITY_HIDDEN_NUGGET

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 25, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveTeacherText_HaveMapCard, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
	pokemon_event 26, 13, PIDGEY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, CherrygrovePidgeyText, -1

	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_RIVAL

CherrygroveCityFlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveGuideGentTrigger:
	applymovement PLAYER, GuideGentPlayerMovement
	setlasttalked CHERRYGROVECITY_GRAMPS
CherrygroveCityGuideGent:
	showtextfaceplayer GuideGentIntroText
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	showtext GuideGentPokeCenterText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	showtext GuideGentMartText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	showtext GuideGentRoute30Text
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3_5
	turnobject PLAYER, LEFT
	showtext GuideGentAdvancedTipsText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	showtext GuideGentSeaText
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	givespecialitem MAP_CARD
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	playmusic MUSIC_CHERRYGROVE_CITY
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setscene SCENE_CHERRYGROVECITY_NOOP
	waitsfx
	end

CherrygroveRivalTriggerSouth:
	moveobject CHERRYGROVECITY_RIVAL, 39, 7
CherrygroveRivalTriggerNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_RIVAL
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext CherrygroveRivalText_Seen
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL0, 3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	reloadmap
	sjumpfwd .FinishRival

.Totodile:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL0, 1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	reloadmap
	sjumpfwd .FinishRival

.Chikorita:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL0, 2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	reloadmap
.FinishRival:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext CherrygroveRivalTextAfter1
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalStartsToLeave
	showemote EMOTE_SHOCK, CHERRYGROVECITY_RIVAL, 15
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalComesBack
	turnobject PLAYER, UP
	showtext CherrygroveRivalTextAfter2
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_RIVAL
	special HealParty
	setscene SCENE_CHERRYGROVECITY_NOOP
	playmusic MUSIC_CHERRYGROVE_CITY
	end

CherrygroveYoungsterScript:
	checkflag ENGINE_POKEDEX
	iftrue_jumptextfaceplayer CherrygroveYoungsterText_HavePokedex
	jumpthistextfaceplayer

	text "La casa del Sr."
	line "#mon está"
	cont "más adelante."
	done

MysticWaterGuy:
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue_jumptextfaceplayer MysticWaterGuyTextAfter
	faceplayer
	opentext
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse_endtext
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	jumpthisopenedtext

MysticWaterGuyTextAfter:
	text "Volveré a"
	line "pescar, entonces."
	done

GuideGentMovement1:
	step_left
	step_left
	step_up
GuideGentPlayerMovement:
	step_left
	turn_head_up
	step_end

GuideGentMovement3:
	step_left
GuideGentMovement2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end

GuideGentMovement3_5:
	step_left
	step_left
	step_down
	step_left
	turn_head_up
	step_end

GuideGentMovement4:
	step_down
	step_down
	step_down
	turn_head_left
	step_end

GuideGentMovement5:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end

GuideGentMovement6:
	step_up
	step_up
	step_end

CherrygroveCity_RivalWalksToYou:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	run_step_down
	turn_head_left
	step_end

CherrygroveCity_RivalExitsStageLeft:
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
CherrygroveCity_RivalStartsToLeave:
	run_step_left
	run_step_left
	step_end

CherrygroveCity_RivalComesBack:
	run_step_right
	turn_head_down
	step_end

GuideGentIntroText:
	text "Eres un entrena-"
	line "dor novato,"
	cont "¿verdad?"
	cont "¡Se te nota!"

	para "¡No pasa nada!"
	line "¡Todos somos"
	cont "novatos al"
	cont "principio!"

	para "Puedo enseñarte"
	line "algunas cosas."
	cont "¡Sígueme!"
	done

GuideGentPokeCenterText:
	text "Este es un Centro"
	line "#mon. Curarán a"

	para "tus #mon en"
	line "un santiamén."

	para "Dependerás mucho"
	line "de ellos, así"

	para "que mejor que"
	line "aprendas sobre"
	cont "ellos."
	done

GuideGentMartText:
	text "Esta es una Tien-"
	line "da #mon, o"
	cont "solo Tienda #."

	para "Venden Balls"
	line "para atrapar a"

	para "#mon salvajes y"
	line "otros objetos."
	done

GuideGentRoute30Text:
	text "La Ruta 30 está"
	line "por este camino."

	para "Los entrenadores"
	line "estarán luchando"

	para "con sus #mon"
	line "allí."
	done

GuideGentAdvancedTipsText:
	text "Los carteles de"
	line "Pistas Entren."
	cont "tienen este raro"
	cont "aspecto."

	para "Están llenos de"
	line "consejos útiles."
	done

GuideGentSeaText:
	text "Este es el mar,"
	line "como puedes ver."

	para "La Ruta 32 está"
	line "cruzando la ba-"
	cont "hía."
	done

GuideGentGiftText:
	text "Aquí…"

	para "¡Esta es mi casa!"
	line "Gracias por tu"
	cont "compañía."

	para "Déjame darte un"
	line "pequeño regalo."
	done

GotMapCardText:
	text "¡El #gear de"
	line "<PLAYER> ahora"
	cont "tiene un Mapa!"
	done

GuideGentPokegearText:
	text "El #gear se"
	line "vuelve más útil"
	cont "al añadir"
	cont "Tarjetas."

	para "¡Te deseo suerte"
	line "en tu viaje!"
	done

CherrygroveRivalText_Seen:
	text "… … … …"

	para "Conseguiste un"
	line "#mon en el"
	cont "Laboratorio."

	para "Qué desperdicio."
	line "Un debilucho"
	cont "como tú."

	para "… … … …"

	para "¿No entiendes lo"
	line "que te digo?"

	para "Bueno, yo tam-"
	line "bién tengo un"
	cont "buen #mon."

	para "¡Te enseñaré a"
	line "qué me refiero!"
	done

RivalCherrygroveWinText:
	text "Hmpf. ¿Estás fe-"
	line "liz de ganar?"
	done

RivalCherrygroveLossText:
	text "Hmpf. Ha sido una"
	line "pérdida de tiem-"
	cont "po."
	done

CherrygroveRivalTextAfter1:
	text "… … … …"

	para "¿Quieres saber"
	line "quién soy?"

	para "Voy a ser el me-"
	line "jor entrenador"
	cont "#mon del mun-"
	cont "do."
	done

CherrygroveRivalTextAfter2:
	text "Se me cayó mi Tar-"
	line "jeta Entrenador…"

	para "¡Eh! ¡Devuélveme-"
	line "la!"

	para "Oh no… Has visto"
	line "mi nombre…"
	done

CherrygroveTeacherText_HaveMapCard:
	text "Cuando estás con"
	line "un #mon, ir a"
	cont "cualquier sitio"
	cont "es divertido."
	done

CherrygroveYoungsterText_HavePokedex:
	text "Luché con los en-"
	line "trenadores del ca-"
	cont "mino."

	para "Mis #mon perdi-"
	line "eron. ¡Están fa-"
	cont "tal! "

	para "Tengo que llevar-"
	line "los a un Centro"
	cont "#mon."
	done

MysticWaterGuyTextBefore:
	text "Un #mon que"
	line "atrapé tenía un"
	cont "objeto."

	para "Creo que es"
	line "Agua Mística."

	para "No lo necesito,"
	line "¿así que lo quie-"
	cont "res?"
	done

CherrygrovePidgeyText:
	text "Pidgey: ¡Pijji!"
	done

CherrygroveCitySignText:
	text "Ciudad Cerezo"

	para "La ciudad de las"
	line "flores hermosas y"
	cont "fragantes"
	done

GuideGentsHouseSignText:
	text "Casa del Guía"
	done

CherrygroveCityAdvancedTipsSignText:
	text "¡Pistas Entren.!"

	para "Las Tiendas #"
	line "te darán una"

	para "Honor Ball gra-"
	line "tis con cada"
	cont "compra de 10"
	cont "# Balls."
	done
