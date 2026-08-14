DEF BLUE_CARD_POINT_CAP EQU 30

RadioTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower2FSalesSignText
	bg_event  5,  0, BGEVENT_JUMPTEXT, RadioTower2FOaksPKMNTalkSignText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower2FPokemonRadioSignText

	def_object_events
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event  6,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FSuperNerdText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt1Text, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FBlackBelt2Text, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	pokemon_event 12,  1, JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, RadioTowerJigglypuffText, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  3,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower2FRockerText, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER2F_BUENA

RadioTower2FTeacherScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FTeacherText_Rockets
	jumpthistextfaceplayer

	text "Las nanas de la"
	line "radio pueden dor-"
	cont "mir a los #mon."
	done

GenericTrainerGruntM4:
	generictrainer GRUNTM, 4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText

	text "¡No dejaremos que"
	line "arruines nuestro"
	cont "gran regreso!"
	done

GenericTrainerGruntM5:
	generictrainer GRUNTM, 5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText

	text "No siempre somos"
	line "malos. Solo hace-"
	cont "mos lo que nos da"
	cont "la gana."
	done

GenericTrainerGruntM6:
	generictrainer GRUNTM, 6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText

	text "Nuestros Ejecuti-"
	line "vos intentan apo-"
	cont "derarse de este"
	cont "lugar."

	para "Tienen un gran"
	line "plan. Me pregunto"
	cont "cuál será."
	done

GenericTrainerGruntF2:
	generictrainer GRUNTF, 2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText

	text "¡Me has ganado,"
	line "pero no lo voy a"
	cont "olvidar!"
	done
	
Buena:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower2FBuenaPasswordIsHelpText
	faceplayer
	opentext
	checkevent EVENT_MET_BUENA
	iffalsefwd .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftruefwd .PlayedAlready
	readvar VAR_HOUR
	ifless EVE_HOUR, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalsefwd .TuneIn
	checkkeyitem BLUE_CARD
	iffalsefwd .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalsefwd .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	showtext RadioTower2FBuenaEveryoneSayPasswordText
	turnobject RADIOTOWER2F_BUENA, DOWN
	reanchormap
	special SpecialBuenasPassword
	closetext
	iffalsefwd .WrongAnswer
	showtext RadioTower2FBuenaCorrectAnswerText
	readvar VAR_BLUECARDBALANCE
	addval $1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	showtext RadioTower2FBuenaThanksForComingText
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequalfwd BLUE_CARD_POINT_CAP, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegivekeyitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	showtext RadioTower2FBuenaDidYouForgetText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	showtext RadioTower2FBuenaThanksForComingText
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftruefwd .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftruefwd .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftruefwd .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftruefwd .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjumpfwd .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	checkkeyitem BLUE_CARD
	iffalse_jumptextfaceplayer RadioTower2FBuenaReceptionistNoCardText
	pokemart MARTTYPE_BLUECARD, 0

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step_down
	slow_step_right
	step_end

RadioTower2FSuperNerdText:
	text "Puedes escuchar la"
	line "radio en cualquier"

	para "sitio. ¡Sintoniza!"
	done

RadioTower2FRockerText:
	text "Tengo una entre-"
	line "vista en la radio"

	para "para promocionar"
	line "mi última canción."

	para "He actuado ante"
	line "mucho público"
	cont "otras veces,"

	para "¡pero no veas lo"
	line "nervioso que"
	cont "estoy!"
	done

RadioTower2FTeacherText_Rockets:
	text "¿Por qué querrán"
	line "apoderarse de la"
	cont "Torre Radio?"
	done

RadioTowerJigglypuffText:
	text "Jigglypuff:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Perdón. Solo per-"
	line "sonal autorizado a"
	cont "partir de aquí."

	para "Antes no era así."

	para "Al Director le"
	line "pasa algo raro…"
	done

RadioTower2FBlackBelt2Text:
	text "Mira con total"
	line "libertad por donde"
	cont "quieras."

	para "El Director vuelve"
	line "a ser tan amable"
	cont "como antes."
	done

GruntM4SeenText:
	text "¡Hace tres años,"
	line "el Team Rocket fue"
	cont "disuelto!"

	para "¡Pero aquí estamos"
	line "de vuelta!"
	done

GruntM4BeatenText:
	text "¡Guaah! ¡No te ha-"
	line "gas el listo!"
	done

GruntM5SeenText:
	text "¡Somos el Team"
	line "Rocket, explotado-"
	cont "res de #mon!"

	para "¡Nos encanta ser"
	line "malos! ¿Asustado?"
	done

GruntM5BeatenText:
	text "¿Te crees un hé-"
	line "roe?"
	done

GruntM6SeenText:
	text "¡Oye, oye! ¡No te"
	line "cruces en nuestro"
	cont "camino!"
	done

GruntM6BeatenText:
	text "Arggh. Me rindo."
	done

GruntF2SeenText:
	text "¡Jajaja!"

	para "Qué aburrimiento."
	line "¡Fue demasiado fá-"

	para "cil apoderarse de"
	line "este lugar!"

	para "¡Vamos, diviérte-"
	line "me un poco!"
	done

GruntF2BeatenText:
	text "¿Qu-quién eres?"
	done

RadioTower2FBuenaShowIntroductionText:
	text "Buena: ¡Hola! ¡Soy"
	line "Buena!"

	para "¿Conoces el pro-"
	line "grama de radio"
	cont "llamado Contrase-"
	cont "ña?"

	para "Si me dices la"
	line "contraseña del"

	para "programa, ganarás"
	line "puntos."

	para "¡Acumula esos pun-"
	line "tos y cámbialos a"

	para "esa simpática chi-"
	line "ca de allí por fa-"
	cont "bulosos premios!"

	para "¡Aquí tienes!"

	para "¡Tu propia Tarje-"
	line "ta Puntos!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "Buena: ¡Sintoniza"
	line "mi programa"
	cont "Contraseña!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "Buena: ¡Hola!"
	line "¿Has sintonizado"
	cont "mi programa?"

	para "¿Te acuerdas de"
	line "la contraseña"
	cont "de hoy?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "Buena: ¡Hala!"
	line "¡Muchas gracias!"

	para "¿Cómo te llamabas?"

	para "… <PLAYER>, ¡bien!"

	para "¡Vamos, <PLAYER>!"
	line "¡Entra en antena!"
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "Buena: ¿Listos to-"
	line "dos?"

	para "¡Quiero oíros gri-"
	line "tar la contraseña"

	para "de hoy para"
	line "<PLAYER>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "Buena: Vuelve des-"
	line "pués de escuchar"

	para "mi programa, ¿vale?"
	line "¡Hasta luego!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "Buena: Perdona…"

	para "Solo tienes una"
	line "oportunidad al"
	cont "día."

	para "¡Vuelve mañana"
	line "para intentarlo!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "Buena: ¡YUPI!"
	line "¡Es correcto!"

	para "¡Sí que lo escu-"
	line "chaste! ¡Qué bien!"

	para "¡Has ganado un"
	line "punto! ¡Felicida-"
	cont "des!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "Buena: Vaya…"
	line "No es esa…"

	para "¿Has olvidado la"
	line "contraseña?"
	done

RadioTower2FBuenaThanksForComingText:
	text "Buena: ¡Sí! Nues-"
	line "tro concursante"
	cont "era <PLAYER>."

	para "¡Muchas gracias"
	line "por venir!"

	para "¡Espero que todos"
	line "los oyentes ven-"
	cont "gáis también!"

	para "¡Os estaré espe-"
	line "rando!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "Buena: ¿Eh?"
	line "¿La contraseña?"

	para "¡SOCORRO, claro!"
	done

RadioTower2FBuenaCardIsFullText:
	text "Buena: Tu Tarjeta"
	line "Puntos está llena."

	para "¡Cámbiala por un"
	line "fabuloso premio!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "Buena: Sintoniza"
	line "Contraseña cada"

	assert EVE_HOUR == 12 + 5
	para "noche de seis a"
	line "doce."

	para "¡Sintonízalo y ven"
	line "a visitarme!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "Buena: ¿Eh? ¿Olvi-"
	line "daste traer tu"
	cont "Tarjeta Puntos?"

	para "No puedo darte"
	line "puntos si no la"
	cont "llevas contigo."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "Buena: ¡Hala! ¡Tu"
	line "Tarjeta Puntos ya"

	para "tiene {d:BLUE_CARD_POINT_CAP} puntos!"
	line "¡Qué pasada!"

	para "Hum… No hay premio"
	line "por llegar a los"

	para "{d:BLUE_CARD_POINT_CAP} puntos, pero…"

	para "Has venido tanto,"
	line "<PLAYER>…"

	para "¡Te haré un favor"
	line "especial!"

	para "¿Te gustaría tener"
	line "mi número de telé-"
	cont "fono?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "Buena: <PLAYER>,"
	line "¿quieres registrar"

	para "mi número de telé-"
	line "fono?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> registró el"
	line "número de Buena."
	done

RadioTower2FBuenaCallMeText:
	text "Buena: ¡Espero tu"
	line "llamada!"
	done

RadioTower2FBuenaSadRejectedText:
	text "Buena: Oh… Era un"
	line "premio especial…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "Buena: <PLAYER>,"
	line "no queda espacio"

	para "en tu teléfono pa-"
	line "ra mí…"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "No puedes canjear"
	line "puntos sin tu Tar-"
	cont "jeta Puntos."

	para "¡No olvides tu"
	line "Tarjeta Puntos!"
	done

RadioTower2FSalesSignText:
	text "1P Ventas"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "La Hora #mon"
	line "del Prof. Oak"

	para "¡El programa líder"
	line "en antena!"
	done

RadioTower2FPokemonRadioSignText:
	text "Radio #mon"
	line "Donde y cuando sea"
	done
