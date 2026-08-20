RadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower1FDirectoryText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower1FLuckyChannelSignText

	def_object_events
	object_event  8,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  6, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower1FWhitneyScript, EVENT_GOLDENROD_GYM_WHITNEY
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 17,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower1FLassText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower1FYoungsterText, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  6, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS

	object_const_def
	const RADIOTOWER1F_FELICITY
	const RADIOTOWER1F_WHITNEY

RadioTower1FReceptionistScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower1FReceptionistNoToursText
	jumpthistextfaceplayer

	text "¡Bienvenido!"
	done

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	waitbutton
	checkevent EVENT_INTRODUCED_FELICITY
	iftruefwd .introduced
	writetext IntroduceFelicityText
	waitbutton
	setevent EVENT_INTRODUCED_FELICITY
.introduced
	writetext ExplainLuckyNumberShowText
	promptbutton
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftruefwd .skip
	special Special_ResetLuckyNumberShowFlag
.skip
	special Special_PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue_jumpopenedtext RadioTower1FLuckyNumberManComeAgainText
	writetext RadioTower1FLuckyNumberManTodayIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_FELICITY, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	special Special_CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_FELICITY, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequalfwd 5, .FirstPlace
	ifequalfwd 4, .SecondPlace
	ifequalfwd 3, .ThirdPlace
	ifequalfwd 2, .FourthPlace
	ifequalfwd 1, .FifthPlace
	jumpthisopenedtext

	text "Vaya, no coincide"
	line "ninguno de tus IDs"
	done

.FirstPlace:
	giveitem MASTER_BALL
	writetext WonFirstPlaceText
	special ShowItemIcon
	playsound SFX_1ST_PLACE
	sjumpfwd .Finish

.SecondPlace:
	giveitem BOTTLE_CAP
	writetext WonSecondPlaceText
	special ShowItemIcon
	playsound SFX_2ND_PLACE
	sjumpfwd .Finish

.ThirdPlace:
	giveitem PP_MAX
	writetext WonThirdPlaceText
	special ShowItemIcon
	playsound SFX_2ND_PLACE
	sjumpfwd .Finish

.FourthPlace:
	giveitem PP_UP
	writetext WonFourthPlaceText
	special ShowItemIcon
	playsound SFX_3RD_PLACE
	sjumpfwd .Finish

.FifthPlace:
	giveitem RARE_CANDY
	writetext WonFifthPlaceText
	special ShowItemIcon
	playsound SFX_3RD_PLACE
.Finish:
	waitsfx
	promptbutton
	iffalse_jumpopenedtext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jumpthisopenedtext

RadioTower1FLuckyNumberManComeAgainText:
	text "Vuelve mañana"
	line "para el próximo"
	cont "Num. de la Suerte."
	done

RadioTower1FRadioCardWomanScript:
	checkevent EVENT_GOLDENROD_GYM_WHITNEY
	iftrue_jumptextfaceplayer RadioTower1FRadioCardWomanTuneInText
	faceplayer
	opentext
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse_jumpopenedtext RadioTower1FRadioCardWomanNotTakingQuizText
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalsefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalsefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftruefwd .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	givespecialitem RADIO_CARD
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, RADIOTOWER1F_WHITNEY, 15
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyApproachesMovementData
	turnobject PLAYER, RIGHT
	showtext RadioTower1FWhitney2Text
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyLeaves1MovementData
	turnobject PLAYER, LEFT
	applymovement RADIOTOWER1F_WHITNEY, RadioTower1FWhitneyLeaves2MovementData
	disappear RADIOTOWER1F_WHITNEY
	end

.WrongAnswer:
	playsound SFX_WRONG
	jumpthisopenedtext

	text "¡Vaya por Dios!"
	line "Has fallado."

	para "¡Inténtalo otra"
	line "vez!"
	done

GenericTrainerGruntM3:
	generictrainer GRUNTM, 3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText

	text "Eres demasiado"
	line "fuerte."

	para "Podrías arruinar"
	line "el plan. ¡Iré a"
	cont "avisar al resto…!"
	done

RadioTower1FWhitneyScript:
	showtextfaceplayer RadioTower1FWhitney1Text
	turnobject RADIOTOWER1F_WHITNEY, LEFT
	end

RadioTower1FLuckyNumberManGoToPCMovement:
	step_right
	turn_head_up
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step_left
	turn_head_up
	step_end

RadioTower1FWhitneyApproachesMovementData:
	step_up
	step_up
	step_left
	step_end

RadioTower1FWhitneyLeaves1MovementData:
	step_up
	step_left
	step_left
	step_end

RadioTower1FWhitneyLeaves2MovementData:
	step_left
	step_left
	step_left
	step_left
	step_end


RadioTower1FReceptionistNoToursText:
	text "Hola. Lo siento,"
	line "pero hoy no hay"
	cont "visitas guiadas."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Hola, ¿vienes por"
	line "el Concurso del"
	cont "Num. de la Suerte?"
	done

IntroduceFelicityText:
	text "Soy Felicidad,"
	line "tu azafata hoy."
	done

ExplainLuckyNumberShowText:
	text "¿Quieres ver los"
	line "números ID de tus"
	cont "#mon?"

	para "¡Si tienes suerte,"
	line "ganarás un premio!"
	done

RadioTower1FLuckyNumberManTodayIdIsText:
	text "El N. premiado de"
	line "hoy es "
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Veamos si coincide"
	line "con alguno."
	done

RadioTower1FLuckyNumberManDotDotDotText: ; text > text
	text "……"
	line "……"
	done

WonFirstPlaceText:
	text "¡Hala! ¡Coinciden"
	line "los cinco números!"

	para "¡Tenemos ganador"
	line "del premio gordo!"

	para "¡Has ganado una"
	line "Master Ball!"
	done

WonSecondPlaceText:
	text "¡Coinciden los"
	line "4 últimos números!"

	para "¡Segundo premio:"
	line "una Chapa Plata!"
	done

WonThirdPlaceText:
	text "¡Coinciden los"
	line "3 últimos números!"

	para "¡Tercer premio:"
	line "un Máx. PP!"
	done

WonFourthPlaceText:
	text "¡Coinciden los"
	line "2 últimos números!"

	para "¡Cuarto premio:"
	line "un Más PP!"
	done

WonFifthPlaceText:
	text "¡Oh! ¡Coincide el"
	line "último número!"

	para "Has ganado el"
	line "quinto premio: un"
	cont "Caramelo Raro."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "No tienes sitio"
	line "para tu premio."

	para "Haz sitio en la"
	line "Mochila y vuelve."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "¡Tenemos una gran"
	line "promoción con un"
	cont "concurso!"

	para "¡Si aciertas cinco"
	line "preguntas, ganas"
	cont "una Tarjeta Radio!"

	para "Úsala en tu"
	line "#gear para oír"
	cont "la radio cuando"
	cont "quieras."

	para "¿Te gustaría"
	line "participar en el"
	cont "concurso?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "1a pregunta:"

	para "¿Hay algún #mon"
	line "que solo aparezca"
	cont "por la mañana?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "¡Correcto!"
	line "2a pregunta:"

	para "Nidorina solo es"
	line "hembra, ¿verdad?"
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "¡En el blanco!"
	line "3a pregunta:"

	para "¿Puede Magikarp"
	line "aprender MTs?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "¡Vas muy bien!"
	line "4a pregunta:"

	para "¿César hace sus"
	line "# Balls con"
	cont "albaricoques?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "¡Genial! ¡Has"
	line "acertado otra vez!"

	para "La última es:"

	para "¿En el Casino se"
	line "ve a Charmander en"
	cont "las tragaperras?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "¡Acertaste todas!"
	line "¡Enhorabuena!"

	para "¡Aquí tienes tu"
	line "Tarjeta Radio!"
	done
RadioTower1FPokegearIsARadioText:
	text "¡El #gear de"
	line "<PLAYER> ya puede"
	cont "usarse como radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Sintoniza nuestros"
	line "programas de"
	cont "radio, por favor."
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Ah, ya veo. Si"
	line "cambias de idea,"
	cont "¡ven a verme!"
	done

RadioTower1FLassText:
	text "Nacho es un DJ"
	line "fabuloso."

	para "¡Su dulce voz me"
	line "derrite!"
	done

RadioTower1FYoungsterText:
	text "Me encanta Rosa,"
	line "de La Hora Oak."

	para "Aunque solo le"
	line "conozco la voz."
	done

GruntM3SeenText:
	text "¡Tomamos la Torre"
	line "Radio por fin!"

	para "¡Conocerán el gran"
	line "terror del"
	cont "Team Rocket!"

	para "¡Verás lo temibles"
	line "que somos!"
	done

GruntM3BeatenText:
	text "¡Eres muy fuerte!"
	line "¡No te perderemos"
	cont "de vista…!"
	done

RadioTower1FWhitney1Text:
	text "¡Hola! Soy Blanca."

	para "Vine a ganar una"
	line "Tarjeta Radio en"
	cont "este concurso…"

	para "¡Pero esto es"
	line "dificilísimo!"
	done

RadioTower1FWhitney2Text:
	text "Blanca: ¡Hala,"
	line "lo lograste!"

	para "Pensaba que la"
	line "cuarta respuesta"
	cont "era albaricoques…"

	para "¡Uy! ¡Debo volver"
	line "al Gimnasio!"
	done

RadioTower1FDirectoryText:
	text "PB Recepción"
	line "1P Ventas"

	para "2P Personal"
	line "3P Producción"

	para "4P Despacho del"
	line "   Director"
	done

RadioTower1FLuckyChannelSignText:
	text "¡Canal Suerte!"

	para "¡Gana premios con"
	line "los ID #mon!"

	para "¡Haz intercambios"
	line "para conseguir más"
	cont "números ID!"
	done