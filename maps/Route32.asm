Route32_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_const SCENE_ROUTE32_LYRA_GROTTOES
	scene_const SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_const SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route32FlyPoint
	callback MAPCALLBACK_OBJECTS, Route32Frieda

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4
	warp_event  4, 24, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYou
	coord_event 10, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes1
	coord_event 11, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes2
	coord_event 12, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes3
	coord_event 13, 24, SCENE_ROUTE32_LYRA_GROTTOES, Route32LyraIntroducesHiddenGrottoes4
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_JUMPTEXT, Route32SignText
	bg_event  7,  1, BGEVENT_JUMPTEXT, Route32RuinsSignText
	bg_event 10, 84, BGEVENT_JUMPTEXT, Route32UnionCaveSignText
	bg_event 14,  1, BGEVENT_JUMPTEXT, Route32AdvancedTips1Text
	bg_event  1, 59, BGEVENT_JUMPTEXT, Route32AdvancedTips2Text
	bg_event 12, 67, BGEVENT_ITEM + GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL_1
	bg_event 11, 40, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION_1
	bg_event  8, 10, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION_2
	bg_event 18, 49, BGEVENT_ITEM + GOLD_LEAF, EVENT_ROUTE_32_HIDDEN_GOLD_LEAF
	bg_event  8, 80, BGEVENT_ITEM + GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL_2
	bg_event  4, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32
	bg_event  5, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_32

	def_object_events
	object_event 19,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainermPetrieScript, -1
	object_event  7, 70, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event 13, 29, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_32
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event 12, 33, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherHenry, -1
	object_event 16, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperRoland, -1
	object_event 11, 82, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperPeter, -1
	itemball_event  6, 53, GREAT_BALL, 1, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	itemball_event  6, 32, REPEL, 1, EVENT_ROUTE_32_REPEL
	cuttree_event 10, 19, EVENT_ROUTE_32_CUT_TREE
	cuttree_event -1, 29, EVENT_MAGNET_TUNNEL_EAST_CUT_TREE
	cuttree_event 19, 32, EVENT_CHERRYGROVE_BAY_CUT_TREE

	object_const_def
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_FISHER4
	const ROUTE32_FRIEDA
	const ROUTE32_LYRA

Route32FlyPoint:
	setflag ENGINE_FLYPOINT_UNION_CAVE
	endcallback

Route32Frieda:
	readvar VAR_WEEKDAY
	ifequalfwd FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainermPetrieScript:
	faceplayer
Route32CooltrainerMTrigger:
	checkflag ENGINE_ZEPHYRBADGE
	iffalse_jumptext Route32CooltrainerMText_VioletGym
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse_jumptext Route32CooltrainerMText_AideIsWaiting
	checkevent EVENT_GOT_MIRACLE_SEED_FROM_ROUTE_32_LEADER
	iftrue_jumptext .AfterText2
	checkevent EVENT_BEAT_COOLTRAINERM_PETRIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_CAMPER_ROLAND
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_JUSTIN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_RALPH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_HENRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_LIZ
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_ALBERT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_YOUNGSTER_GORDON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_PETER
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE32_COOLTRAINER_M
	loadtrainer COOLTRAINERM, PETRIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_PETRIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse_endtext
	setevent EVENT_GOT_MIRACLE_SEED_FROM_ROUTE_32_LEADER
.GotMiracleSeed:
	jumpthisopenedtext

.AfterText2:
	text "Tu experiencia en"
	line "Ciudad Malva"

	para "te resultará muy"
	line "útil en tu viaje."
	done

.IntroText:
	text "Tienes unos buenos"
	line "#mon ahí."

	para "Se nota que los"
	line "has entrenado por"
	cont "Ciudad Malva."

	para "No deberías tener"
	line "problemas para"
	cont "vencer a los de"
	cont "esta ruta."

	para "Si lo consigues,"
	line "me enfrentaré a"
	cont "ti personalmente."
	done

.QuestionText:
	text "Parece que has"
	line "vencido a todos"
	cont "los de aquí."

	para "Tu entrenamiento"
	line "en el Gimnasio"

	para "debió de ser muy"
	line "bueno."

	para "Yo también tengo"
	line "la Medalla Céfiro."

	para "¿Lucharás conmigo?"
	done

.RefusedText:
	text "Así que prefieres"
	line "seguir tu viaje…"
	done

.SeenText:
	text "Mi entrenamiento"
	line "en la Torre"
	cont "Bellsprout superó"
	cont "incluso a Pegaso."

	para "¡Veamos cómo te"
	line "desenvuelves!"
	done

.BeatenText:
	text "¡Mi equipo ha sido"
	line "desarraigado!"
	done

.AfterText1:
	text "Tu entrenamiento"
	line "ha sido superior."

	para "Toma esto como un"
	line "recuerdo de este"
	cont "combate."

	para "Aumenta la fuerza"
	line "de los ataques de"
	cont "tipo Planta."
	done

Route32CooltrainerMStopsYou:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	showtext Route32CooltrainerMText_WhatsTheHurry
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMTrigger
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	end

Route32LyraIntroducesHiddenGrottoes1:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left3
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left5
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes2:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left2
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left6
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes3:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left1
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left7
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes4:
	scall Route32LyraIntroducesHiddenGrottoesIntroScript
	scall Route32LyraIntroducesHiddenGrottoesMainScript
	applymovement ROUTE32_LYRA, Route32LyraIntroducesHiddenGrottoes_Left8
	sjump Route32LyraIntroducesHiddenGrottoesOutroScript

Route32LyraIntroducesHiddenGrottoes_Left8:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left7:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left6:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left5:
	step_left
	step_left
Route32LyraIntroducesHiddenGrottoes_Left3:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left2:
	step_left
Route32LyraIntroducesHiddenGrottoes_Left1:
	step_left
	step_end

Route32LyraIntroducesHiddenGrottoesIntroScript:
	applymovement ROUTE32_LYRA, .StepUpMovement
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE32_LYRA, .StepUpMovement
	end

.StepUpMovement:
	step_up
	step_up
	step_end

Route32LyraIntroducesHiddenGrottoesMainScript:
	turnobject ROUTE32_LYRA, UP
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	opentext
	writetext .GreetingText
	promptbutton
	checkegg
	iftruefwd .HaveEgg
	writetext .NoEggText
	sjumpfwd .Continue
.HaveEgg
	writetext .HaveEggText
.Continue
	waitbutton
	closetext
	playsound SFX_SANDSTORM
	waitsfx
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	applymovement ROUTE32_LYRA, .LookAroundMovement
	showtext .QuestionText
	follow ROUTE32_LYRA, PLAYER
	end

.GreetingText:
	text "¡<PLAYER>!"
	line "¡Hola!"
	done

.NoEggText:
	text "El Prof. Elm dijo"
	line "que su ayudante te"
	cont "traería un Huevo."

	para "¡Llévalo siempre"
	line "encima! Qué ganas"
	cont "de ver qué #mon"
	cont "nacerá!"
	done

.HaveEggText:
	text "¡Qué bien! Llevas"
	line "el Huevo encima,"
	cont "como te pidió el"
	cont "Prof. Elm."

	para "¡Qué curiosidad"
	line "por ver qué"
	cont "#mon será!"
	done

.QuestionText:
	text "<PLAYER>, ¿has"
	line "oído eso?"

	para "Ha venido de por"
	line "aquí cerca…"
	done

.LookAroundMovement:
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_up
	step_end

Route32LyraIntroducesHiddenGrottoesOutroScript:
	stopfollow
	turnobject ROUTE32_LYRA, UP
	showemote EMOTE_SHOCK, ROUTE32_LYRA, 15
	pause 7
	follow ROUTE32_LYRA, PLAYER
	applyonemovement ROUTE32_LYRA, slow_step_up
	stopfollow
	turnobject PLAYER, UP
	pause 15
	turnobject ROUTE32_LYRA, DOWN
	showtext .GrottoText
	applymovement ROUTE32_LYRA, .LeaveMovement1
	turnobject PLAYER, DOWN
	applymovement ROUTE32_LYRA, .LeaveMovement2
	disappear ROUTE32_LYRA
	setscene SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	playmusic MUSIC_ROUTE_30
	end

.GrottoText:
	text "¡Aquí está! ¡Hay"
	line "un hueco entre"
	cont "los árboles!"

	para "Había oído hablar"
	line "de estos lugares."

	para "¡Es un Claro"
	line "Oculto!"

	para "Los Claros Ocultos"
	line "se hallan entre"
	cont "árboles o en los"
	cont "acantilados."

	para "¡Podría haber"
	line "#mon increíbles"
	cont "escondidos dentro!"

	para "Ojalá tuviera"
	line "tiempo para mirar,"
	cont "pero tengo prisa."

	para "¡<PLAYER>! ¡No"
	line "pierdas de vista"
	cont "los Claros"
	cont "Ocultos!"
	done

.LeaveMovement1:
	step_left
	step_down
	step_end

.LeaveMovement2:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjumpfwd _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalsefwd .refused
	jumpthisopenedtext

	text "¡Tch! Creía que"
	line "los críos de hoy"
	cont "estaban forrados…"
	done

.refused
	jumpthisopenedtext

	text "¿No lo quieres?"
	line "Pues lárgate."
	cont "¡Largo!"
	done

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftruefwd .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegivetmhm TM_ROAR
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	jumpopenedtext Text_RoarOutro

GenericTrainerCamperRoland:
	generictrainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText

	text "Si no quieres un"
	line "combate, evita el"
	cont "contacto visual."
	done

GenericTrainerFisherJustin:
	generictrainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText

	text "Calma y sosiego…"
	line "La pesca y los"

	para "#mon comparten"
	line "la misma esencia."
	done

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_FISH_SWARM
	iftruefwd .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftruefwd .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskForNumber

.AskAgain:
	callstd asknumber2m
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername FISHER, RALPH1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	jumpthisopenedtext

	text "Uno, dos, tres…"
	line "¡Ja, ja, ja! ¡Qué"
	cont "buena pesca!"

	para "¡Yo ya he acabado!"
	line "¡Atrapa todos los"
	cont "que puedas, chico!"
	done

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerFisherHenry:
	generictrainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText

	text "Un #mon recién"
	line "atrapado no puede"
	cont "competir con uno"
	cont "bien entrenado."
	done

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftruefwd .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForNumber

.AskAgain:
	callstd asknumber2f
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, LIZ1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.Rematch:
	callstd rematchf
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

GenericTrainerYoungsterAlbert:
	generictrainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText

	text "Intentaré ser el"
	line "mejor con mis"
	cont "favoritos."

	para "No pienso usar"
	line "los mismos #mon"
	cont "fuertes de todos."
	done

GenericTrainerYoungsterGordon:
	generictrainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText

	text "La hierba está"
	line "llena de cosas"
	cont "pegajosas."
	done

GenericTrainerBird_keeperPeter:
	generictrainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, Bird_keeperPeterSeenText, Bird_keeperPeterBeatenText

	text "Debería volver a"
	line "entrenar al"
	cont "Gimnasio de Malva."
	done

FriedaScript:
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue_jumptextfaceplayer FriedaFridayText
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	faceplayer
	opentext
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftruefwd .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse_endtext
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	jumpthisopenedtext

	text "Vero: Dáselo a un"
	line "#mon con ataque"
	cont "de tipo Veneno."

	para "¡Ah, es genial!"

	para "¡Alucinarás con lo"
	line "fuertes que hace"
	cont "los ataques de"
	cont "tipo Veneno!"
	done

.NotFriday:
	jumpthistextfaceplayer

	text "Vero: ¿Hoy no es"
	line "viernes?"

	para "¡Qué rollo cuando"
	line "no lo es!"
	done

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step_up
	step_up
	step_end

Movement_Route32CooltrainerMReset:
	step_down
	step_right
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "¡Espera!"
	line "¿Cuál es la prisa?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "¿Eres <PLAYER>?"
	line "Un tipo con gafas"

	para "te está buscando."
	line "Ve a comprobarlo."

	para "Te está esperando"
	line "en el Centro"
	cont "#mon."
	done

Route32CooltrainerMText_VioletGym:
	text "¿Has visitado el"
	line "Gimnasio #mon?"

	para "Allí te pondrás a"
	line "prueba junto a tus"
	cont "#mon."

	para "¡Es una prueba"
	line "de fuego para"
	cont "todo entrenador!"
	done

Text_MillionDollarSlowpokeTail:
	text "¿Quieres una rica"
	line "y nutritiva"
	cont "Colaslowpoke?"

	para "¡Para ti ahora,"
	line "por tan solo"
	cont "10.000.000¥!"

	para "¡Seguro que la"
	line "quieres!"
	done

FisherJustinSeenText:
	text "¡Hala!"

	para "¡Has hecho que se"
	line "me escape el pez!"
	done

FisherJustinBeatenText:
	text "¡Chof!"
	done

FisherRalph1SeenText:
	text "Se me da genial"
	line "pescar y entrenar"
	cont "#mon."

	para "¡No pienso perder"
	line "ante ningún crío!"
	done

FisherRalph1BeatenText:
	text "¡Tch! Quise ir muy"
	line "deprisa…"
	done

FisherRalphAfterText:
	text "La pesca es una"
	line "pasión para toda"
	cont "la vida."

	para "¡Y los #mon son"
	line "amigos eternos!"
	done

FisherHenrySeenText:
	text "¿Mis #mon?"
	line "¡Recién atrapados!"
	done

FisherHenryBeatenText:
	text "¿Chof?"
	done

YoungsterAlbertSeenText:
	text "No te había visto"
	line "por aquí antes."

	para "¿Te crees muy"
	line "fuerte?"
	done

YoungsterAlbertBeatenText:
	text "¡Eres fuerte!"
	done

YoungsterGordonSeenText:
	text "¡Encontré buenos"
	line "#mon entre la"
	cont "hierba!"

	para "¡Creo que bastará"
	line "con ellos!"
	done

YoungsterGordonBeatenText:
	text "Vaya. Creía que"
	line "podría ganar."
	done

CamperRolandSeenText:
	text "Esa mirada…"
	line "Es intrigante."
	done

CamperRolandBeatenText:
	text "Mmm. Esto es una"
	line "decepción."
	done

PicnickerLiz1SeenText:
	text "Ajá. Sí, y ya te"
	line "lo imaginas…"

	para "¿Eh? ¿Un combate?"
	line "Estoy hablando por"
	cont "teléfono."

	para "En fin. Que sea"
	line "rápido."
	done

PicnickerLiz1BeatenText:
	text "¡Oh! ¡Qué furia"
	line "tengo encima!"
	done

PicnickerLiz1AfterText:
	text "Con lo a gusto que"
	line "estaba hablando."
	done

Bird_keeperPeterSeenText:
	text "¡Esa Medalla! ¡Es"
	line "de Ciudad Malva!"

	para "¿Has ganado a"
	line "Pegaso?"
	done

Bird_keeperPeterBeatenText:
	text "Ya conozco mis"
	line "puntos débiles."
	done

Text_RoarIntro: ; text > text
	text "¡GRRRRAAA!"
	line "¡LA GENTE HUYE"

	para "CUANDO RUJO! ¡PERO"
	line "TÚ ME HAS BUSCADO!"

	para "¡ESO ME GUSTA!"
	line "¡TOMA ESTO!"
	done

Text_RoarOutro: ; text > text
	text "¡GRRRRAA!"
	line "¡ES RUGIDO!"

	para "¡HASTA LOS POKéMON"
	line "HUYEN DE UN BUEN"
	cont "RUGIDO!"
	done

MeetFriedaText:
	text "Vero: ¡Yuuuju!"
	line "¡Es viernes!"

	para "¡Soy Vero, la del"
	line "viernes!"

	para "¡Mucho gusto en"
	line "conocerte!"
	done

FriedaGivesGiftText:
	text "¡Aquí tienes una"
	line "Flecha Venenosa!"
	done

FriedaFridayText:
	text "Vero: Hola, ¿qué"
	line "día te gusta más?"

	para "A mí me encanta"
	line "el viernes."

	para "¿A ti también"
	line "te gusta mucho?"
	done

Route32SignText:
	text "Ruta 32"

	para "Ciudad Malva -"
	line "Pueblo Azalea"
	done

Route32RuinsSignText:
	text "Ruinas Alfa"
	line "Entrada este"
	done

Route32UnionCaveSignText:
	text "Cueva Unión"
	line "Más adelante"
	done

Route32AdvancedTips1Text:
	text "¡Consejo Avanzado!"

	para "¡Puedes encontrar"
	line "objetos pescando o"
	cont "rompiendo rocas!"
	done

Route32AdvancedTips2Text:
	text "¡Consejo Avanzado!"

	para "Si pierdes un"
	line "duelo contra otro"
	cont "entrenador,"

	para "¡pagarás dinero"
	line "según cuántas"
	cont "Medallas tengas!"
	done
