PlayersHouse1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_const SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

	def_warp_events
	warp_event  8,  7, NEW_BARK_TOWN, 2
	warp_event  9,  7, NEW_BARK_TOWN, 2
	warp_event 11,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event 10,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger1
	coord_event 11,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger2
	coord_event  9,  1, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger3
	coord_event  9,  2, SCENE_PLAYERSHOUSE1F_MEET_MOM, MomTrigger4

	def_bg_events
	bg_event  1,  1, BGEVENT_JUMPTEXT, PlayersHouse1FFridgeText
	bg_event  2,  1, BGEVENT_JUMPTEXT, PlayersHouse1FSinkText
	bg_event  3,  1, BGEVENT_JUMPTEXT, PlayersHouse1FStoveText
	bg_event  6,  1, BGEVENT_UP, PlayersHouse1FTVScript

	def_object_events
	object_event  9,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  3,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  9,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << DAY), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  6,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  1,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  6,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR

	object_const_def
	const PLAYERSHOUSE1F_MOM1

MomTrigger1:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, RIGHT
	turnobject PLAYER, LEFT
	sjumpfwd MomEventScript

MomTrigger2:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, RIGHT
	applyonemovement PLAYER, slow_step_left
	sjumpfwd MomEventScript

MomTrigger3:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, UP
	applymovement PLAYER, .two_steps_down
	sjumpfwd MomEventScript

.two_steps_down
	step_down
	step_down
	step_end

MomTrigger4:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYERSHOUSE1F_MOM1, UP
	applyonemovement PLAYER, slow_step_down
MomEventScript:
	opentext
	writetext MomIntroText
	promptbutton
	givespecialitem POKEGEAR
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomPokegearText
	promptbutton
	special Special_SetDayOfWeek
.InitialSetDSTFlag:
	writetext MomDSTText
	yesorno
	iffalsefwd .NotDST
	special Special_InitialSetDSTFlag
	yesorno
	iffalse .InitialSetDSTFlag
	sjumpfwd .InitializedDSTFlag
.NotDST:
	special Special_InitialClearDSTFlag
	yesorno
	iffalse .InitialSetDSTFlag
.InitializedDSTFlag:
	writetext MomRunningShoesText
	yesorno
	iftruefwd .NoInstructions
	writetext MomInstructionsText
	promptbutton
.NoInstructions:
	writetext MomOutroText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	special RestartMapMusic
	end

PlayersHouse1FFridgeText:
	text "A ver qué hay en"
	line "el frigorífico…"

	para "¡Agua Fresca y una"
	line "rica Limonada!"
	done

PlayersHouse1FSinkText:
	text "El fregadero está"
	line "impoluto. A Mamá"
	cont "le gusta limpio."
	done

PlayersHouse1FStoveText:
	text "¡La especialidad"
	line "de Mamá!"

	para "¡Hamburguesa"
	line "Volcán Canela!"
	done

PlayersHouse1FTVScript:
	jumpthistext

	text "En la tele: Un"
	line "pirata con su"
	cont "tripulación busca"
	cont "un tesoro…"

	para "¡Yo también me voy"
	line "a poner en marcha!"
	done

MomScript:
	faceplayer
	checkscene
	iffalsefwd .MomEvent
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue_jumpopenedtext MomDoItText
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftruefwd .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftruefwd .FirstTimeBanking
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumpopenedtext MomErrandText
	jumpthisopenedtext

	text "El Prof. Elm te"
	line "está esperando."

	para "¡Date prisa!"
	done

.FirstTimeBanking:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special Special_BankOfMom
	waitendtext

.MomEvent:
	playmusic MUSIC_MOM
	sjump MomEventScript

MomIntroText:
if DEF(DEBUG)
	text "¡No olvides usar"
	line "tu radio debug!"
	done
else
	text "¡Oh, <PLAYER>!"
	line "Ya has despertado."

	para "Tu amiga Lira"
	line "estuvo aquí hace"
	cont "un momento."

	para "Dijo que el Prof."
	line "Elm te buscaba."

	para "¡Ah! ¡Casi se me"
	line "olvida!"

	para "Tu #gear ya"
	line "está arreglado."

	para "¡Aquí lo tienes!"
	done
endc

MomPokegearText:
	text "#mon Gear, o"
	line "simplemente"
	cont "#gear."

	para "Es esencial si"
	line "quieres ser un"
	cont "buen entrenador."

	para "¡Vaya! No está"
	line "puesto el día de"
	cont "la semana."

	para "¡No debes olvidar"
	line "eso!"
	done

MomDSTText:
	text "¿Está activo el"
	line "horario de verano?"
	done

MomRunningShoesText:
	text "Vuelve a casa para"
	line "ajustar el reloj"
	cont "al horario de"
	cont "verano."

	para "Por cierto, ¿sabes"
	line "cómo usar tus"
	cont "Deportivas nuevas?"
	done

MomInstructionsText:
	text "Leeré las"
	line "instrucciones."

	para "Mantén pulsado el"
	line "Botón B para"
	cont "correr en todas"
	cont "partes."

	para "O activa la opción"
	line "de Auto-Correr y"
	cont "mantén B para ir"
	cont "caminando."
	done

MomOutroText:
	text "¡Vaya! ¿A que son"
	line "muy prácticas?"
	done

MomErrandText:
	text "Y bien, ¿qué te ha"
	line "pedido el Prof."
	cont "Elm?"

	para "…"

	para "Parece un encargo"
	line "difícil."

	para "¡Enorgullécete de"
	line "que confíen en ti!"
	done

MomDoItText:
	text "¡Animo, <PLAYER>!"

	para "¡Te apoyaré en"
	line "todo momento!"
	done

NeighborScript:
	faceplayer
	opentext
	checktime 1 << MORN
	iftruefwd .MornScript
	checktime 1 << DAY
	iftruefwd .DayScript
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .NiteScript

.MornScript:
	writetext .MornIntroText
	promptbutton
	sjumpfwd .Main

.DayScript:
	writetext .DayIntroText
	promptbutton
	sjumpfwd .Main

.NiteScript:
	writetext .NiteIntroText
	promptbutton
	; fallthrough

.Main:
	writetext .NeighborText
	waitbutton
	closetext
	turnobject LAST_TALKED, RIGHT
	end

.MornIntroText:
	text "¡Buenos días,"
	line "<PLAYER>!"

	para "¡Vengo de visita!"
	done

.DayIntroText:
	text "¡Hola, <PLAYER>!"
	line "¡Vengo de visita!"
	done

.NiteIntroText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "¡Vengo de visita!"
	done

.NeighborText:
	text "<PLAYER>, ¿te has"
	line "enterado?"

	para "Mi hija está"
	line "empeñada en ser"
	cont "la ayudante del"
	cont "Profesor Elm."

	para "¡Le encantan los"
	line "#mon!"
	done
