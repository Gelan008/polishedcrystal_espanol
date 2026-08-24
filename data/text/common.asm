SECTION "_FruitBearingTreeText", ROMX
_FruitBearingTreeText::
	text "Es un árbol"
	line "frutal."
	done

SECTION "_HeyItsFruitText", ROMX
_HeyItsFruitText::
	text "¡Vaya! ¡Es"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedOneFruitText", ROMX
_ObtainedOneFruitText::
	text "¡Obtuviste "
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedTwoFruitText", ROMX
_ObtainedTwoFruitText::
	text "¡Obtuviste dos"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedThreeFruitText", ROMX
_ObtainedThreeFruitText::
	text "¡Obtuviste tres"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_FruitPackIsFullText", ROMX
_FruitPackIsFullText::
	text "Pero la Mochila"
	line "está llena…"
	done

SECTION "_NoApricornBoxText", ROMX
_NoApricornBoxText::
	text "Pero no tienes"
	line "dónde guardarlo…"
	done

SECTION "_ApricornBoxIsFullText", ROMX
_ApricornBoxIsFullText::
	text "La Caja Bonguri"
	line "está llena…"
	done

SECTION "_PutAwayTheApricornText", ROMX
_PutAwayTheApricornText::
	text "<PLAYER> guardó"
	line ""
	text_ram wStringBuffer3
	text " en"
	cont "la Caja Bonguri."
	done

SECTION "_NothingHereText", ROMX
_NothingHereText::
	text "Aquí no hay"
	line "nada…"
	done

SECTION "_WantToUseMulchText", ROMX
_WantToUseMulchText::
	text "¿Quieres usar"
	line "Abono?"
	done

SECTION "_UsedMulchText", ROMX
_UsedMulchText::
	text "¡<PLAYER> usó"
	line "Abono!"

	para "¡Fertilizó"
	line "el árbol!"
	done

SECTION "_WhichApricornText", ROMX
_WhichApricornText::
	text "¿Qué Bonguri"
	line "debo usar?"
	done

SECTION "_HowManyShouldIMakeText", ROMX
_HowManyShouldIMakeText::
	text "¿Cuántos debo"
	line "hacer?"
	done

SECTION "_HowManyDoYouWantToSellText", ROMX
_HowManyDoYouWantToSellText::
	text "¿Cuántos quieres"
	line "vender?"
	done

SECTION "_RecoveredSomeHPText", ROMX
_RecoveredSomeHPText::
	text_ram wStringBuffer1
	line "recuperó "
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " PS!"
	done

SECTION "_CuredOfPoisonText", ROMX
_CuredOfPoisonText::
	text_ram wStringBuffer1
	line "curó su veneno."
	done

SECTION "_RidOfParalysisText", ROMX
_RidOfParalysisText::
	text_ram wStringBuffer1
	line "curó su parálisis."
	done

SECTION "_BurnWasHealedText", ROMX
_BurnWasHealedText::
	text_ram wStringBuffer1
	line "curó su quemadura."
	done

SECTION "_WasDefrostedText", ROMX
_WasDefrostedText::
	text_ram wStringBuffer1
	line "se descongeló."
	done

SECTION "_WokeUpText", ROMX
_WokeUpText::
	text_ram wStringBuffer1
	line "se despertó."
	done

SECTION "_HealthReturnedText", ROMX
_HealthReturnedText::
	text_ram wStringBuffer1
	line "recuperó la salud."
	done

SECTION "_RevitalizedText", ROMX
_RevitalizedText::
	text_ram wStringBuffer1
	line "es revitalizado."
	done

SECTION "_GrewToLevelText", ROMX
_GrewToLevelText::
	text_ram wStringBuffer1
	text " subió"
	line "al nivel "
	text_decimal wCurPartyLevel, 1, 3
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_CameToItsSensesText", ROMX
_CameToItsSensesText::
	text_ram wStringBuffer1
	line "recuperó el"
	cont "conocimiento."
	done

SECTION "_OakTimeWokeUpText", ROMX
_OakTimeWokeUpText::
	text "… … … …"
	line "… … … …"

	para "Zzz… ¿Mmm? ¿Eh?"
	line "¡Me has"
	cont "despertado!"

	para "¿Podrías mirar el"
	line "reloj por mí?"
	prompt

SECTION "_OakTimeWhatTimeIsItText", ROMX
_OakTimeWhatTimeIsItText::
	text "¿Qué hora es?"
	done

SECTION "_OakTimeHowManyMinutesText", ROMX
_OakTimeHowManyMinutesText::
	text "¿Y los minutos?"
	done

SECTION "_OakTimeWhoaText", ROMX
_OakTimeWhoaText::
	text "¡Hala!"
	done

SECTION "_OakTimeQuestionMarkText", ROMX
_OakTimeQuestionMarkText::
	text "?"
	done

SECTION "_OakTimeOversleptText", ROMX
_OakTimeOversleptText::
	text "!"
	line "¡Me he dormido!"
	done

SECTION "_OakTimeYikesText", ROMX
_OakTimeYikesText::
	text "!"
	line "¡Ay! ¡Me he"
	cont "quedado dormido!"
	done

SECTION "ProfElmNappedText", ROMX
ProfElmNappedText::
	text "!"
	line "¡Dormí durante"
	cont "demasiado tiempo!"
	done

SECTION "_OakTimeSoDarkText", ROMX
_OakTimeSoDarkText::
	text "!"
	line "¡Con razón está"
	cont "tan oscuro!"
	done

SECTION "_OakTimeWhatDayIsItText", ROMX
_OakTimeWhatDayIsItText::
	text "¿Qué día es hoy?"
	done

SECTION "_OakTimeIsItText", ROMX
_OakTimeIsItText::
	text ", ¿verdad?"
	done

SECTION "_NothingToChooseText", ROMX
_NothingToChooseText::
	text "No hay nada para"
	line "elegir."
	prompt

SECTION "_WhichSidePutOnText", ROMX
_WhichSidePutOnText::
	text "¿En qué lado"
	line "quieres ponerlo?"
	done

SECTION "_WhichSidePutAwayText", ROMX
_WhichSidePutAwayText::
	text "¿De qué lado lo"
	line "quieres guardar?"
	done

SECTION "_PutAwayTheDecoText", ROMX
_PutAwayTheDecoText::
	text "Guardaste esto:"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_NothingToPutAwayText", ROMX
_NothingToPutAwayText::
	text "No hay nada para"
	line "guardar."
	prompt

SECTION "_SetUpTheDecoText", ROMX
_SetUpTheDecoText::
	text "Pusiste esto:"
	line ""
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PutAwayAndSetUpText", ROMX
_PutAwayAndSetUpText::
	text "Guardaste esto:"
	line ""
	text_ram wStringBuffer3

	para "y pusiste esto:"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

SECTION "_AlreadySetUpText", ROMX
_AlreadySetUpText::
	text "Ya está puesto."
	prompt

SECTION "_LookTownMapText", ROMX
_LookTownMapText::
	text "Es el Mapa Pueblo."
	done

SECTION "_LookPikachuPosterText", ROMX
_LookPikachuPosterText::
	text "Es un póster de un"
	line "bonito Pikachu."
	done

SECTION "_LookClefairyPosterText", ROMX
_LookClefairyPosterText::
	text "Es un póster de un"
	line "bonito Clefairy."
	done

SECTION "_LookJigglypuffPosterText", ROMX
_LookJigglypuffPosterText::
	text "Es un póster de un"
	line "bonito Marill."
	done

SECTION "_LookAdorableDecoText", ROMX
_LookAdorableDecoText::
	text "Es un adorable"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "DecoConsoleText", ROMX
DecoConsoleText::
	text "Es un brillante"
	line ""
	text_ram wStringBuffer3
	text "."
	done

SECTION "_LookGiantDecoText", ROMX
_LookGiantDecoText::
	text "¡Muñeco gigante!"
	line "Es muy suavecito."
	done

SECTION "_MomHiHowAreYouText", ROMX
_MomHiHowAreYouText::
	text "¡Hola, <PLAYER>!"
	line "¿Cómo estás?"
	prompt

SECTION "_MomFoundAnItemText", ROMX
_MomFoundAnItemText::
	text "Vi un objeto"
	line "muy útil, así que"
	prompt

SECTION "_MomBoughtWithYourMoneyText", ROMX
_MomBoughtWithYourMoneyText::
	text "lo compré con tu"
	line "dinero. ¡Perdón!"
	prompt

SECTION "_MomItsInPCText", ROMX
_MomItsInPCText::
	text "Está en tu PC."
	line "¡Te gustará!"
	done

SECTION "_MomFoundADollText", ROMX
_MomFoundADollText::
	text "Mientras compraba,"
	line "vi este adorable"
	cont "muñeco, así que"
	prompt

SECTION "_MomItsInYourRoomText", ROMX
_MomItsInYourRoomText::
	text "Está en tu cuarto."
	line "¡Te encantará!"
	done

SECTION "_MonWasSentToText", ROMX
_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " fue"
	line "enviado a "
	text_ram wOTTrademonSenderName
	text "."
	done

SECTION "_BidsFarewellToMonText", ROMX
_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " se"
	line "despide de"
	done

SECTION "_MonNameBidsFarewellText", ROMX
_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_TakeGoodCareOfMonText", ROMX
_TakeGoodCareOfMonText::
	text "Cuida muy bien de"
	line ""
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_ForYourMonSendsText", ROMX
_ForYourMonSendsText::
	text "Por "
	text_ram wPlayerTrademonSenderName
	text " y su"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

SECTION "_OTSendsText", ROMX
_OTSendsText::
	text_ram wOTTrademonSenderName
	text " envía"
	line "a "
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_WillTradeText", ROMX
_WillTradeText::
	text_ram wOTTrademonSenderName
	text " va a"
	line "cambiar a"
	cont ""
	text_ram wOTTrademonSpeciesName
	text_end

SECTION "_ForYourMonWillTradeText", ROMX
_ForYourMonWillTradeText::
	text "por "
	text_ram wPlayerTrademonSenderName
	text " y su"
	line ""
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

; Oak's Pokémon Talk

SECTION "_OPT_IntroText1", ROMX
_OPT_IntroText1::
	line "Rosa: ¡La Hora"
	done

SECTION "_OPT_IntroText2", ROMX
_OPT_IntroText2::
	line "Pokémon de Oak!"
	done

SECTION "_OPT_IntroText3", ROMX
_OPT_IntroText3::
	line "¡Conmigo, Rosa!"
	done

SECTION "_OPT_OakText1", ROMX
_OPT_OakText1::
	line "Oak: "
	text_ram wMonOrItemNameBuffer
	done

SECTION "_OPT_OakText2", ROMX
_OPT_OakText2::
	line "puede verse por"
	done

SECTION "_OPT_OakText3", ROMX
_OPT_OakText3::
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_OPT_MaryText1", ROMX
_OPT_MaryText1::
	line "Rosa: "
	text_ram wStringBuffer1
	done

SECTION "OPT_SweetAdorably", ROMX
OPT_SweetAdorably::
	line "es muy dulce y"
	done

SECTION "OPT_WigglySlickly", ROMX
OPT_WigglySlickly::
	line "es tan suave y"
	done

SECTION "OPT_AptlyNamed", ROMX
OPT_AptlyNamed::
	line "hace honor a ser"
	done

SECTION "OPT_UndeniablyKindOf", ROMX
OPT_UndeniablyKindOf::
	line "es sin duda algo"
	done

SECTION "OPT_Unbearably", ROMX
OPT_Unbearably::
	line "es tan pero tan"
	done

SECTION "OPT_WowImpressively", ROMX
OPT_WowImpressively::
	line "es de verdad muy"
	done

SECTION "OPT_AlmostPoisonously", ROMX
OPT_AlmostPoisonously::
	line "es casi casi tan"
	done

SECTION "OPT_Sensually", ROMX
OPT_Sensually::
	line "es la mar de"
	done

SECTION "OPT_Mischievously", ROMX
OPT_Mischievously::
	line "es tan pícaro y"
	done

SECTION "OPT_Topically", ROMX
OPT_Topically::
	line "es de lo más"
	done

SECTION "OPT_Addictively", ROMX
OPT_Addictively::
	line "es totalmente"
	done

SECTION "OPT_LooksInWater", ROMX
OPT_LooksInWater::
	line "en el agua es"
	done

SECTION "OPT_EvolutionMustBe", ROMX
OPT_EvolutionMustBe::
	line "evolucionado es"
	done

SECTION "OPT_Provocatively", ROMX
OPT_Provocatively::
	line "resulta de lo más"
	done

SECTION "OPT_FlippedOut", ROMX
OPT_FlippedOut::
	line "es tan alocado y"
	done

SECTION "OPT_HeartMeltingly", ROMX
OPT_HeartMeltingly::
	line "es tiernamente"
	done

SECTION "OPT_Cute", ROMX
OPT_Cute::
	line "mono."
	done

SECTION "OPT_Weird", ROMX
OPT_Weird::
	line "raro."
	done

SECTION "OPT_Pleasant", ROMX
OPT_Pleasant::
	line "agradable."
	done

SECTION "OPT_BoldSortOf", ROMX
OPT_BoldSortOf::
	line "audaz, digamos."
	done

SECTION "OPT_Frightening", ROMX
OPT_Frightening::
	line "aterrador."
	done

SECTION "OPT_SuaveDebonair", ROMX
OPT_SuaveDebonair::
	line "¡elegante!"
	done

SECTION "OPT_Powerful", ROMX
OPT_Powerful::
	line "poderoso."
	done

SECTION "OPT_Exciting", ROMX
OPT_Exciting::
	line "emocionante."
	done

SECTION "OPT_Groovy", ROMX
OPT_Groovy::
	line "¡genial!"
	done

SECTION "OPT_Inspiring", ROMX
OPT_Inspiring::
	line "inspirador."
	done

SECTION "OPT_Friendly", ROMX
OPT_Friendly::
	line "amistoso."
	done

SECTION "OPT_HotHotHot", ROMX
OPT_HotHotHot::
	line "¡ardiente!"
	done

SECTION "OPT_Stimulating", ROMX
OPT_Stimulating::
	line "estimulante."
	done

SECTION "OPT_Guarded", ROMX
OPT_Guarded::
	line "reservado."
	done

SECTION "OPT_Lovely", ROMX
OPT_Lovely::
	line "encantador."
	done

SECTION "OPT_Speedy", ROMX
OPT_Speedy::
	line "veloz."
	done

SECTION "_OPT_PokemonChannelText", ROMX
_OPT_PokemonChannelText::
	text "#mon"
	done

; Pokémon Music Channel / Pokémusic

SECTION "_BenIntroText1", ROMX
_BenIntroText1::
	line "Ben: ¡Canal de"
	done

SECTION "_BenIntroText2", ROMX
_BenIntroText2::
	line "Música #mon! ♪"
	done

SECTION "_BenIntroText3", ROMX
_BenIntroText3::
	line "¡Soy yo, DJ Ben! ♪"
	done

SECTION "_FernIntroText1", ROMX
_FernIntroText1::
	line "Nando: ¡Música! ♪"
	done

SECTION "_FernIntroText2", ROMX
_FernIntroText2::
	line "¡Con DJ Nando! ♪"
	done

SECTION "_BenFernText1", ROMX
_BenFernText1::
	line "Hoy es "
	text_today
	text ","
	done

SECTION "_BenFernText2A", ROMX
_BenFernText2A::
	line "así que bailemos"
	done

SECTION "_BenFernText2B", ROMX
_BenFernText2B::
	line "relájate hoy con"
	done

SECTION "_BenFernText3A", ROMX
_BenFernText3A::
	line "¡Marcha #mon!"
	done

SECTION "_BenFernText3B", ROMX
_BenFernText3B::
	line "¡Nana #mon!"
	done

; Lucky Channel

SECTION "_LC_Text1", ROMX
_LC_Text1::
	line "Reed: ¡Yeehaw!"
	done

SECTION "_LC_Text2", ROMX
_LC_Text2::
	line "¿Cómo estáis?"
	done

SECTION "_LC_Text3", ROMX
_LC_Text3::
	line "Tanto si estás"
	done

SECTION "_LC_Text4", ROMX
_LC_Text4::
	line "arriba o abajo,"
	done

SECTION "_LC_Text5", ROMX
_LC_Text5::
	line "¡no te pierdas el"
	done

SECTION "_LC_Text6", ROMX
_LC_Text6::
	line "Número de Suerte!"
	done

SECTION "_LC_Text7", ROMX
_LC_Text7::
	line "El Número de la"
	done

SECTION "_LC_Text8", ROMX
_LC_Text8::
	line "Suerte es "
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_LC_Text9", ROMX
_LC_Text9::
	line "¡Lo repetiré!"
	done

SECTION "_LC_Text10", ROMX
_LC_Text10::
	line "¡Acertad y venid a"
	done

SECTION "_LC_Text11", ROMX
_LC_Text11::
	line "la Torre Radio!"
	done

SECTION "_LC_DragText1", ROMX
_LC_DragText1::
	line "…Repetirme tanto"
	done

SECTION "_LC_DragText2", ROMX
_LC_DragText2::
	line "es un fastidio…"
	done

; Places and People

SECTION "_PnP_Text1", ROMX
_PnP_Text1::
	line "¡Lugares y Gente!"
	done

SECTION "_PnP_Text2", ROMX
_PnP_Text2::
	line "¡Presentado"
	done

SECTION "_PnP_Text3", ROMX
_PnP_Text3::
	line "por mí, DJ Lily!"
	done

SECTION "_PnP_Text4", ROMX
_PnP_Text4::
	line ""
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	done

SECTION "_PnP_cute", ROMX
_PnP_cute::
	line "es muy mono."
	done

SECTION "_PnP_lazy", ROMX
_PnP_lazy::
	line "es algo vago."
	done

SECTION "_PnP_happy", ROMX
_PnP_happy::
	line "siempre es feliz."
	done

SECTION "_PnP_noisy", ROMX
_PnP_noisy::
	line "es muy ruidoso."
	done

SECTION "_PnP_precocious", ROMX
_PnP_precocious::
	line "es muy precoz."
	done

SECTION "_PnP_bold", ROMX
_PnP_bold::
	line "es muy audaz."
	done

SECTION "_PnP_picky", ROMX
_PnP_picky::
	line "es quisquilloso."
	done

SECTION "_PnP_sortofok", ROMX
_PnP_sortofok::
	line "está bastante bien"
	done

SECTION "_PnP_soso", ROMX
_PnP_soso::
	line "no está nada mal."
	done

SECTION "_PnP_great", ROMX
_PnP_great::
	line "es genial."
	done

SECTION "_PnP_mytype", ROMX
_PnP_mytype::
	line "es justo mi tipo."
	done

SECTION "_PnP_cool", ROMX
_PnP_cool::
	line "es genial, ¿no?"
	done

SECTION "_PnP_inspiring", ROMX
_PnP_inspiring::
	line "¡es inspirador!"
	done

SECTION "_PnP_weird", ROMX
_PnP_weird::
	line "es algo raro."
	done

SECTION "_PnP_rightforme", ROMX
_PnP_rightforme::
	line "¿es para mí?"
	done

SECTION "_PnP_odd", ROMX
_PnP_odd::
	line "¡es muy extraño!"
	done

SECTION "_PnP_Text5", ROMX
_PnP_Text5::
	line ""
	text_ram wStringBuffer1
	done

SECTION "_RocketRadioText1", ROMX
_RocketRadioText1::
	line "…Ejem, ¡somos el"
	done

SECTION "_RocketRadioText2", ROMX
_RocketRadioText2::
	line "Team Rocket!"
	done

SECTION "_RocketRadioText3", ROMX
_RocketRadioText3::
	line "¡Tras tres años de"
	done

SECTION "_RocketRadioText4", ROMX
_RocketRadioText4::
	line "preparación,"
	done

SECTION "_RocketRadioText5", ROMX
_RocketRadioText5::
	line "hemos resurgido"
	done

SECTION "_RocketRadioText6", ROMX
_RocketRadioText6::
	line "de las cenizas!"
	done

SECTION "_RocketRadioText7", ROMX
_RocketRadioText7::
	line "¡Giovanni! "
	text_pause
	text "¿Nos"
	done

SECTION "_RocketRadioText8", ROMX
_RocketRadioText8::
	line "oyes?"
	text_pause
	text " ¡Lo hicimos!"
	done

SECTION "_RocketRadioText9", ROMX
_RocketRadioText9::
	line ""
	text_pause
	text "¿Dónde está jefe?"
	done

SECTION "_RocketRadioText10", ROMX
_RocketRadioText10::
	line ""
	text_pause
	text "¿Estará oyendo?"
	done

SECTION "_BuenaRadioText1", ROMX
_BuenaRadioText1::
	line "Buena: ¡Al habla!"
	done

SECTION "_BuenaRadioText2", ROMX
_BuenaRadioText2::
	line "¡La Contraseña!"
	done

SECTION "_BuenaRadioText3", ROMX
_BuenaRadioText3::
	line "Déjame pensar…"
	done

SECTION "_BuenaRadioText4", ROMX
_BuenaRadioText4::
	line "¡"
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_BuenaRadioText5", ROMX
_BuenaRadioText5::
	line "¡No lo olvides!"
	done

SECTION "_BuenaRadioText6", ROMX
_BuenaRadioText6::
	line "¡Estoy en la Torre"
	done

SECTION "_BuenaRadioText7", ROMX
_BuenaRadioText7::
	line "Radio de Trigal!"
	done

SECTION "_BuenaRadioMidnightText1", ROMX
_BuenaRadioMidnightText1::
	line "Buena: Vaya…"
	done

SECTION "_BuenaRadioMidnightText2", ROMX
_BuenaRadioMidnightText2::
	line "¡Medianoche! ¡Me"
	done

SECTION "_BuenaRadioMidnightText3", ROMX
_BuenaRadioMidnightText3::
	line "tengo que ir ya!"
	done

SECTION "_BuenaRadioMidnightText4", ROMX
_BuenaRadioMidnightText4::
	line "¡Gracias por estar"
	done

SECTION "_BuenaRadioMidnightText5", ROMX
_BuenaRadioMidnightText5::
	line "hasta el final!"
	done

SECTION "_BuenaRadioMidnightText6", ROMX
_BuenaRadioMidnightText6::
	line "¡No te quedes"
	done

SECTION "_BuenaRadioMidnightText7", ROMX
_BuenaRadioMidnightText7::
	line "hasta muy tarde!"
	done

SECTION "_BuenaRadioMidnightText8", ROMX
_BuenaRadioMidnightText8::
	line "¡De DJ Buena!"
	done

SECTION "_BuenaRadioMidnightText9", ROMX
_BuenaRadioMidnightText9::
	text "¡Me voy de aquí!"
	done

SECTION "_BuenaRadioMidnightText10", ROMX
_BuenaRadioMidnightText10::
	text "…"
	done

SECTION "_BuenaOffTheAirText", ROMX
_BuenaOffTheAirText::
	line ""
	done

SECTION "Text_EnemyUsed", ROMX
Text_EnemyUsed::
	text "¡<ENEMY>"
	line "usó "
	text_ram wMonOrItemNameBuffer
	text "!"
	prompt

SECTION "Text_EnemyUsedOn", ROMX
Text_EnemyUsedOn::
	text "¡<ENEMY>"
	line "usó "
	text_ram wMonOrItemNameBuffer
	cont "en "
	text_ram wEnemyMonNickname
	text "!"
	prompt

SECTION "_AskFloorElevatorText", ROMX
_AskFloorElevatorText::
	text "¿Qué piso?"
	done

SECTION "_BugCatchingContestTimeUpText", ROMX
_BugCatchingContestTimeUpText::
	text "Anunciador: ¡PIIP!"

	para "¡Tiempo agotado!"
	done

SECTION "_BugCatchingContestIsOverText", ROMX
_BugCatchingContestIsOverText::
	text "Anunciador: ¡El"
	line "Concurso acabó!"
	done

SECTION "_RepelWoreOffText", ROMX
_RepelWoreOffText::
	text "El Repelente"
	line "se agotó."
	done

SECTION "UseAnotherRepelText", ROMX
UseAnotherRepelText::
	text "El Repelente"
	line "se agotó."

	para "¿Usar otro?"
	done

SECTION "_JustSawSomeRareMonText", ROMX
_JustSawSomeRareMonText::
	text "Acabo de ver un"
	line "raro "
	text_ram wStringBuffer1
	text " en"
	cont ""
	text_ram wStringBuffer2
	text "."

	para "Te llamaré si veo"
	line "otro #mon raro,"
	cont "¿vale?"
	prompt

SECTION "_SavingRecordText", ROMX
_SavingRecordText::
	text "Guardando…"
	line "¡No apagar!"
	done

SECTION "_NoCoinsText", ROMX
_NoCoinsText::
	text "No tienes Fichas."
	prompt

SECTION "_NoCoinCaseText", ROMX
_NoCoinCaseText::
	text "No tienes un"
	line "Monedero."
	prompt

SECTION "_NPCTradeCableText", ROMX
_NPCTradeCableText::
	text "Vale, conecta el"
	line "Cable Link."
	prompt

SECTION "Text_NPCTraded", ROMX
Text_NPCTraded::
	text "<PLAYER> cambió a"
	line ""
	text_ram wMonOrItemNameBuffer
	text " por"
	cont ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_NPCTradeFanfareText", ROMX
_NPCTradeFanfareText::
	text_sound SFX_DEX_FANFARE_80_109
	text_pause
	text_end

SECTION "_NPCTradeIntroText1", ROMX
_NPCTradeIntroText1::
	text "Colecciono #mon"
	line "¿Tienes a"
	cont ""
	text_ram wStringBuffer1
	text "?"

	para "¿Quieres cambiarlo"
	line "por mi"
	cont ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText1", ROMX
_NPCTradeCancelText1::
	text "¿No quieres hacer"
	line "el cambio? Oh…"
	done

SECTION "_NPCTradeWrongText1", ROMX
_NPCTradeWrongText1::
	text "¿Eh? Ese no es"
	line ""
	text_ram wStringBuffer1
	text "."
	cont "Qué decepción…"
	done

SECTION "_NPCTradeCompleteText1", ROMX
_NPCTradeCompleteText1::
	text "¡Bieeen! ¡Tengo a"
	line ""
	text_ram wStringBuffer1
	text "!"
	cont "¡Gracias!"
	done

SECTION "_NPCTradeAfterText1", ROMX
_NPCTradeAfterText1::
	text "Hola, ¿qué tal"
	line "está mi viejo"
	cont ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeIntroText2", ROMX
_NPCTradeIntroText2::
	text "Hola, busco a este"
	line "#mon."

	para "Si tienes un"
	line ""
	text_ram wStringBuffer1
	text ","

	para "¿me lo cambias por"
	line "mi "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText2", ROMX
_NPCTradeCancelText2::
	text "¿Tampoco tienes"
	line "uno?"

	para "Vaya, qué"
	line "decepción…"
	done

SECTION "_NPCTradeWrongText2", ROMX
_NPCTradeWrongText2::
	text "¿No tienes a"
	line ""
	text_ram wStringBuffer1
	text "? Qué"
	cont "lástima entonces."
	done

SECTION "_NPCTradeCompleteText2", ROMX
_NPCTradeCompleteText2::
	text "¡Genial! ¡Gracias!"

	para "Por fin tengo a"
	line ""
	text_ram wStringBuffer1
	text "."
	done

SECTION "_NPCTradeAfterText2", ROMX
_NPCTradeAfterText2::
	text "¡Hola! ¡El"
	line ""
	text_ram wMonOrItemNameBuffer
	text " que me"
	cont "pasaste está bien!"
	done

SECTION "_NPCTradeIntroText3", ROMX
_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " es mono,"
	line "pero no lo tengo."

	para "¿Tienes a"
	line ""
	text_ram wStringBuffer1
	text "?"

	para "¿Lo cambiarías por"
	line "mi "
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText3", ROMX
_NPCTradeCancelText3::
	text "¿No quieres"
	line "cambiar? Vaya…"
	done

SECTION "_NPCTradeWrongText3", ROMX
_NPCTradeWrongText3::
	text "Ese no es"
	line ""
	text_ram wStringBuffer1
	text "."

	para "Cámbiamelo si"
	line "consigues uno."
	done

SECTION "_NPCTradeCompleteText3", ROMX
_NPCTradeCompleteText3::
	text "¡Hala! ¡Gracias!"
	line "¡Siempre quise a"
	cont ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_NPCTradeAfterText3", ROMX
_NPCTradeAfterText3::
	text "¿Qué tal le va a"
	line "ese "
	text_ram wStringBuffer2
	text ""
	cont "que te cambié?"

	para "¡Tu "
	text_ram wMonOrItemNameBuffer
	text ""
	line "es muy mono!"
	done

SECTION "_NPCTradeCompleteText4", ROMX
_NPCTradeCompleteText4::
	text "¿Eh? ¿Qué pasó?"
	done

SECTION "_NPCTradeAfterText4", ROMX
_NPCTradeAfterText4::
	text "Intercambiar es"
	line "tan raro…"

	para "Aún tengo mucho"
	line "que aprender."
	done

SECTION "_MomLeavingText1", ROMX
_MomLeavingText1::
	text "Hala, qué #mon"
	line "tan mono."

	para "¿De dónde lo"
	line "sacaste?"

	para "…"

	para "Así que te vas de"
	line "aventura…"

	para "¡Vale!"
	line "Yo también te"
	cont "ayudaré."

	para "Pero, ¿qué puedo"
	line "hacer por ti?"

	para "¡Ya sé! Te"
	line "guardaré dinero."

	para "En un viaje largo,"
	line "el dinero importa."

	para "¿Quieres que te"
	line "guarde tu dinero?"
	done

SECTION "_MomLeavingText2", ROMX
_MomLeavingText2::
	text "Vale, cuidaré de"
	line "tu dinero."

	para "………"
	prompt

SECTION "_MomLeavingText3", ROMX
_MomLeavingText3::
	text "Ten cuidado."

	para "Los #mon son"
	line "tus amigos. Debéis"
	cont "trabajar unidos."

	para "¡Ahora, ve!"
	done

SECTION "_MomIsThisAboutYourMoneyText", ROMX
_MomIsThisAboutYourMoneyText::
	text "¡Hola! ¡Bienvenido"
	line "a casa! Te estás"
	cont "esforzando mucho."

	para "He limpiado tu"
	line "habitación."

	para "¿O vienes por tu"
	line "dinero?"
	done

SECTION "_MomBankWhatDoYouWantToDoText", ROMX
_MomBankWhatDoYouWantToDoText::
	text "¿Qué quieres"
	line "hacer?"
	done

SECTION "_MomStoreMoneyText", ROMX
_MomStoreMoneyText::
	text "¿Cuánto quieres"
	line "ingresar?"
	done

SECTION "_MomTakeMoneyText", ROMX
_MomTakeMoneyText::
	text "¿Cuánto quieres"
	line "sacar?"
	done

SECTION "_MomSaveMoneyText", ROMX
_MomSaveMoneyText::
	text "¿Quieres ingresar"
	line "algo de dinero?"
	done

SECTION "_MomHaventSavedThatMuchText", ROMX
_MomHaventSavedThatMuchText::
	text "No has ingresado"
	line "tanto."
	prompt

SECTION "_MomNotEnoughRoomInWalletText", ROMX
_MomNotEnoughRoomInWalletText::
	text "No puedes llevar"
	line "tanto encima."
	prompt

SECTION "_MomInsufficientFundsInWalletText", ROMX
_MomInsufficientFundsInWalletText::
	text "No tienes tanto."
	prompt

SECTION "_MomNotEnoughRoomInBankText", ROMX
_MomNotEnoughRoomInBankText::
	text "No puedes ingresar"
	line "tanto."
	prompt

SECTION "_MomStartSavingMoneyText", ROMX
_MomStartSavingMoneyText::
	text "Vale, guardaré tu"
	line "dinero. ¡Confía!"

	para "¡<PLAYER>, no"
	line "te rindas!"
	done

SECTION "_MomStoredMoneyText", ROMX
_MomStoredMoneyText::
	text "¡Tu dinero está a"
	line "salvo! ¡En marcha!"
	done

SECTION "_MomTakenMoneyText", ROMX
_MomTakenMoneyText::
	text "¡<PLAYER>,"
	line "no te rindas!"
	done

SECTION "_MomJustDoWhatYouCanText", ROMX
_MomJustDoWhatYouCanText::
	text "Haz lo que"
	line "puedas."
	done

SECTION "_DayCareManIntroText", ROMX
_DayCareManIntroText::
	text "Soy el Abuelo de"
	line "la Guardería. ¿Te"
	cont "crío un #mon?"
	done

SECTION "_DayCareManIntroEggText", ROMX
_DayCareManIntroEggText::
	text "Soy el Abuelo de"
	line "la Guardería."
	cont "¿Sabes de Huevos?"

	para "Verás, mi mujer y"
	line "yo criábamos"
	cont "unos #mon."

	para "¡Nos sorprendió"
	line "hallar un Huevo!"

	para "¿No es increíble?"

	para "¿Quieres que críe"
	line "a un #mon?"
	done

SECTION "_DayCareLadyIntroText", ROMX
_DayCareLadyIntroText::
	text "Soy la Abuela de"
	line "la Guardería."

	para "¿Quieres que críe"
	line "un #mon por ti?"
	done

SECTION "_DayCareLadyIntroEggText", ROMX
_DayCareLadyIntroEggText::
	text "Soy la Abuela de"
	line "la Guardería."
	cont "¿Sabes de Huevos?"

	para "Verás, mi marido y"
	line "yo criábamos"
	cont "unos #mon."

	para "¡Nos sorprendió"
	line "hallar un Huevo!"

	para "¿No es increíble?"

	para "¿Quieres que críe"
	line "un #mon por ti?"
	done

SECTION "_WhatShouldIRaiseText", ROMX
_WhatShouldIRaiseText::
	text "¿Qué crío por ti?"
	prompt

SECTION "_OnlyOneMonText", ROMX
_OnlyOneMonText::
	text "¿Oh? Pero si solo"
	line "tienes un #mon."
	prompt

SECTION "_CantAcceptEggText", ROMX
_CantAcceptEggText::
	text "Lo siento, pero"
	line "no acepto Huevos."
	prompt

SECTION "_RemoveMailText", ROMX
_RemoveMailText::
	text "Quítale la Carta"
	line "antes de dármelo."
	prompt

SECTION "_LastHealthyMonText", ROMX
_LastHealthyMonText::
	text "Si me das ese,"
	line "¿con qué vas a"
	cont "luchar?"
	prompt

SECTION "_IllRaiseYourMonText", ROMX
_IllRaiseYourMonText::
	text "Vale, cuidaré de"
	line "tu "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_ComeBackLaterText", ROMX
_ComeBackLaterText::
	text "Vuelve a por él"
	line "más tarde."
	done

SECTION "_AreWeGeniusesText", ROMX
_AreWeGeniusesText::
	text "¿Somos genios o"
	line "qué? ¿Quieres ver"
	cont "a tu "
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_YourMonHasGrownText", ROMX
_YourMonHasGrownText::
	text "Tu "
	text_ram wStringBuffer1
	line "ha crecido mucho."

	para "Su nivel subió"
	line "en "
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Si quieres a tu"
	line "#mon de vuelta,"
	cont "costará "
	text_decimal wStringBuffer2 + 2, 3, 5
	text "¥."
	done

SECTION "_PerfectHeresYourMonText", ROMX
_PerfectHeresYourMonText::
	text "¡Perfecto! ¡Aquí"
	line "está tu #mon!"
	prompt

SECTION "_GotBackMonText", ROMX
_GotBackMonText::
	text "<PLAYER> recuperó"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BackAlreadyText", ROMX
_BackAlreadyText::
	text "¿Eh? ¿Ya vuelves?"
	line "Tu "
	text_ram wStringBuffer1

	para "necesita un poco"
	line "más de tiempo."

	para "Si quieres a tu"
	line "#mon de vuelta,"
	cont "costará 100¥."
	done

SECTION "_HaveNoRoomText", ROMX
_HaveNoRoomText::
	text "No tienes sitio"
	line "para llevarlo."
	prompt

SECTION "_NotEnoughMoneyText", ROMX
_NotEnoughMoneyText::
	text "No tienes"
	line "bastante dinero."
	prompt

SECTION "_OhFineThenText", ROMX
_OhFineThenText::
	text "Oh, de acuerdo."
	prompt

SECTION "_ComeAgainText", ROMX
_ComeAgainText::
	text "Vuelve cuando"
	line "quieras."
	done

SECTION "_NotYetText", ROMX
_NotYetText::
	text "Aún no…"
	done

SECTION "_FoundAnEggAgainText", ROMX
_FoundAnEggAgainText::
	text "¡Ah, eres tú!"

	para "¡Tu #mon ha"
	line "tenido otro Huevo!"

	para "¿Lo quieres?"
	done

SECTION "_FoundAnEggText", ROMX
_FoundAnEggText::
	text "¡Ah, eres tú!"

	para "Cuidábamos de"
	line "tu #mon, y…"

	para "¡madre mía, qué"
	line "sorpresa!"

	para "¡Tu #mon ha"
	line "tenido un Huevo!"

	para "No sabemos cómo"
	line "ha llegado ahí,"

	para "pero tu #mon"
	line "lo tenía. ¿Lo"
	cont "quieres?"
	done

SECTION "_ReceivedEggText", ROMX
_ReceivedEggText::
	text "¡<PLAYER> recibió"
	line "el Huevo!"
	done

SECTION "_TakeGoodCareOfEggText", ROMX
_TakeGoodCareOfEggText::
	text "Cuida muy bien de"
	line "él."
	done

SECTION "_IllKeepItThanksText", ROMX
_IllKeepItThanksText::
	text "En ese caso, me lo"
	line "quedo. ¡Gracias!"
	done

SECTION "_NoRoomForEggText", ROMX
_NoRoomForEggText::
	text "No tienes espacio"
	line "en el equipo o"
	cont "en el PC. Vuelve"
	cont "luego."
	done

SECTION "_NameRaterHelloText", ROMX
_NameRaterHelloText::
	text "¡Hola, hola! Soy"
	line "el Inspector de"
	cont "Motes."

	para "Evalúo los motes"
	line "de los #mon."

	para "¿Quieres que"
	line "evalúe motes?"
	done

SECTION "_NameRaterWhichMonText", ROMX
_NameRaterWhichMonText::
	text "¿De qué #mon"
	line "debo evaluar"
	cont "el mote?"
	prompt

SECTION "_NameRaterBetterNameText", ROMX
_NameRaterBetterNameText::
	text "Mmm…"
	text_ram wStringBuffer1
	text "…"
	line "Es un buen mote."

	para "¿Qué tal si le"
	line "damos uno mejor?"

	para "¿Quieres que le dé"
	line "un nombre mejor?"
	done

SECTION "_NameRaterWhatNameText", ROMX
_NameRaterWhatNameText::
	text "Vale. ¿Qué mote le"
	line "pondremos, pues?"
	prompt

SECTION "_NameRaterFinishedText", ROMX
_NameRaterFinishedText::
	text "¡Es mejor que el"
	line "de antes!"

	para "¡Bien hecho!"
	done

SECTION "_NameRaterComeAgainText", ROMX
_NameRaterComeAgainText::
	text "De acuerdo. Vuelve"
	line "cuando quieras."
	done

SECTION "_NameRaterPerfectNameText", ROMX
_NameRaterPerfectNameText::
	text "Mmm… ¿"
	text_ram wStringBuffer1
	text "?"
	line "¡Qué gran mote!"
	cont "Es perfecto."

	para "Trata a "
	text_ram wStringBuffer1
	line "con mucho amor."
	done

SECTION "_NameRaterEggText", ROMX
_NameRaterEggText::
	text "Vaya… Eso solo"
	line "es un Huevo."
	done

SECTION "_NameRaterSameNameText", ROMX
_NameRaterSameNameText::
	text "Puede parecer el"
	line "mismo de antes,"

	para "¡pero este nuevo"
	line "mote es mejor!"

	para "¡Bien hecho!"
	done

SECTION "_NameRaterNamedText", ROMX
_NameRaterNamedText::
	text "Vale. Ahora este"
	line "#mon se"
	cont "llama "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "Text_Gained", ROMX
Text_Gained::
	text "¡"
	text_ram wStringBuffer1
	text " ganó@"
	text_end

SECTION "Text_ABoostedStringBuffer2ExpPoints", ROMX
Text_ABoostedStringBuffer2ExpPoints::
	line "un extra de"
	cont ""
	text_decimal wStringBuffer2, 3, 6
	text " Puntos EXP!"
	prompt

SECTION "Text_StringBuffer2ExpPoints", ROMX
Text_StringBuffer2ExpPoints::
	line ""
	text_decimal wStringBuffer2, 3, 6
	text " Puntos EXP!"
	prompt

SECTION "Text_GoPkmn", ROMX
Text_GoPkmn::
	text "¡Adelante,"
	line "@"
	text_end

SECTION "Text_DoItPkmn", ROMX
Text_DoItPkmn::
	text "¡Hazlo,"
	line "@"
	text_end

SECTION "Text_GoForItPkmn", ROMX
Text_GoForItPkmn::
	text "¡A por ellos,"
	line "@"
	text_end

SECTION "Text_YourFoesWeakGetmPkmn", ROMX
Text_YourFoesWeakGetmPkmn::
	text "¡Está débil!"
	line "¡A por él,"
	cont "@"
	text_end

SECTION "Text_BattleMonNick01", ROMX
Text_BattleMonNick01::
	text_ram wBattleMonNickname
	text "!"
	done

SECTION "Text_BattleMonNickComma", ROMX
Text_BattleMonNickComma::
	text_ram wBattleMonNickname
	text ",@"
	text_end

SECTION "Text_ThatsEnoughComeBack", ROMX
Text_ThatsEnoughComeBack::
	text " ¡ya"
	line "basta! ¡Vuelve!@"
	text_end

SECTION "Text_OKComeBack", ROMX
Text_OKComeBack::
	text " ¡vale!"
	line "¡Vuelve!@"
	text_end

SECTION "Text_GoodComeBack", ROMX
Text_GoodComeBack::
	text " ¡bien!"
	line "¡Vuelve!@"
	text_end

SECTION "Text_ComeBack", ROMX
Text_ComeBack::
	line "¡vuelve!"
	done

SECTION "_BootedTMText", ROMX
_BootedTMText::
	text "Cargaste una MT."
	done

SECTION "_BootedHMText", ROMX
_BootedHMText::
	text "Cargaste una MO."
	done

SECTION "_ContainedMoveText", ROMX
_ContainedMoveText::
	text "Contiene"
	line ""
	text_ram wStringBuffer2
	text "."

	para "¿Enseñar"
	line ""
	text_ram wStringBuffer2
	cont "a un #mon?"
	done

SECTION "_TMHMNotCompatibleText", ROMX
_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " no"
	line "es compatible"
	cont "con "
	text_ram wStringBuffer1
	text "."

	para "No puede"
	line "aprender"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_BadgeRequiredText", ROMX
_BadgeRequiredText::
	text "¡Perdón! Necesitas"
	line "una Medalla nueva."
	prompt

SECTION "_CantUseItemText", ROMX
_CantUseItemText::
	text "No puedes usar"
	line "eso aquí."
	prompt

SECTION "_UseCutText", ROMX
_UseCutText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Corte!"
	prompt

SECTION "_CutNothingText", ROMX
_CutNothingText::
	text "No hay nada para"
	line "Cortar aquí."
	prompt

SECTION "_AskFlashText", ROMX
_AskFlashText::
	text "Está muy oscuro."
	line "¿Usar Destello?"
	done

SECTION "_BlindingFlashText", ROMX
_BlindingFlashText::
	text "¡Un gran Destello"
	line "ilumina el área!"
	text_promptbutton
	text_end

SECTION "_UsedSurfText", ROMX
_UsedSurfText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Surf!"
	done

SECTION "_CantSurfText", ROMX
_CantSurfText::
	text "No puedes hacer"
	line "Surf aquí."
	prompt

SECTION "_AlreadySurfingText", ROMX
_AlreadySurfingText::
	text "Ya estás haciendo"
	line "Surf."
	prompt

SECTION "_AskSurfText", ROMX
_AskSurfText::
	text "El agua está en"
	line "calma. ¿Surf?"
	done

SECTION "_UseWaterfallText", ROMX
_UseWaterfallText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Cascada!"
	done

SECTION "_HugeWaterfallText", ROMX
_HugeWaterfallText::
	text "¡Hala, es una gran"
	line "Cascada!"
	done

SECTION "_AskWaterfallText", ROMX
_AskWaterfallText::
	text "¿Quieres usar"
	line "Cascada?"
	done

SECTION "_UseDigText", ROMX
_UseDigText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Excavar!"
	done

SECTION "_UseEscapeRopeText", ROMX
_UseEscapeRopeText::
	text "¡<PLAYER> usó una"
	line "Cuerda Huida!"
	done

SECTION "_CantUseDigText", ROMX
_CantUseDigText::
	text "No puedes usar"
	line "eso aquí."
	done

SECTION "_CantUseTeleportText", ROMX
_CantUseTeleportText::
	text "No puedes usar"
	line "eso aquí."

	para ""
	done

SECTION "_UseStrengthText", ROMX
_UseStrengthText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Fuerza!"
	done

SECTION "_MoveBoulderText", ROMX
_MoveBoulderText::
	text "¡"
	text_ram wStringBuffer1
	text " puede"
	line "mover rocas!"
	prompt

SECTION "_AskStrengthText", ROMX
_AskStrengthText::
	text "Un #mon podría"
	line "mover esto."

	para "¿Quieres usar"
	line "Fuerza?"
	done

SECTION "_BouldersMoveText", ROMX
_BouldersMoveText::
	text "¡Ahora puedes"
	line "mover las rocas!"
	done

SECTION "_BouldersMayMoveText", ROMX
_BouldersMayMoveText::
	text "Un #mon podría"
	line "mover esto."
	done

SECTION "_UseWhirlpoolText", ROMX
_UseWhirlpoolText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Torbellino!"
	prompt

SECTION "_MayPassWhirlpoolText", ROMX
_MayPassWhirlpoolText::
	text "¡Es un Torbellino"
	line "muy fuerte!"

	para "Un #mon podría"
	line "atravesarlo."
	done

SECTION "_AskWhirlpoolText", ROMX
_AskWhirlpoolText::
	text "Hay un Torbellino"
	line "en el camino."

	para "¿Quieres usar"
	line "Torbellino?"
	done

SECTION "_UseHeadbuttText", ROMX
_UseHeadbuttText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
	line "Golpe Cabeza!"
	prompt

SECTION "_HeadbuttNothingText", ROMX
_HeadbuttNothingText::
	text "No. Nada…"
	done

SECTION "_AskHeadbuttText", ROMX
_AskHeadbuttText::
	text "Un #mon podría"
	line "estar en el árbol."

	para "¿Usar Golpe"
	line "Cabeza?"
	done

SECTION "_UseRockSmashText", ROMX
_UseRockSmashText::
	text "¡"
	text_ram wStringBuffer2
	text " usó"
if DEF(FAITHFUL)
	line "Golpe Roca!"
else
	line "Demolición!"
endc
	prompt

SECTION "_MaySmashText", ROMX
_MaySmashText::
	text "A lo mejor un"
	line "#mon lo rompe."
	done

SECTION "_AskRockSmashText", ROMX
_AskRockSmashText::
	text "Esta roca podría"
	line "romperse."

if DEF(FAITHFUL)
	para "¿Quieres usar"
	line "Golpe Roca?"
else
	para "¿Quieres usar"
	line "Demolición?"
endc
	done

SECTION "_RodBiteText", ROMX
_RodBiteText::
	text "¡Oh!"
	line "¡Han picado!"
	prompt

SECTION "_RodNothingText", ROMX
_RodNothingText::
	text "¡No pican!"

	para "¿Seguir pescando?"
	done

SECTION "_CantGetOffBikeText", ROMX
_CantGetOffBikeText::
	text "¡No puedes bajarte"
	line "aquí!"
	done

SECTION "_GotOnBikeText", ROMX
_GotOnBikeText::
	text "<PLAYER> subió en"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_GotOffBikeText", ROMX
_GotOffBikeText::
	text "<PLAYER> bajó de"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_AskCutText", ROMX
_AskCutText::
	text "¡Este árbol se"
	line "puede Cortar!"

	para "¿Quieres usar"
	line "Corte?"
	done

SECTION "_CanCutText", ROMX
_CanCutText::
	text "¡Este árbol se"
	line "puede Cortar!"
	done

SECTION "_FoundItemText", ROMX
_FoundItemText::
	text "¡<PLAYER> obtuvo"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_GotTheItemText", ROMX
_GotTheItemText:
	text "¡<PLAYER> obtuvo"
	line ""
	text_ram wStringBuffer4
	text "!"
	done

SECTION "_ReceivedTheBadgeText", ROMX
_ReceivedTheBadgeText:
	text "¡<PLAYER> recibió"
	line "la Medalla"
	cont ""
	text_ram wStringBuffer4
	text "!"
	done

SECTION "WhiteoutText", ROMX
WhiteoutText::
	text "¡A <PLAYER> no le"
	line "quedan #mon!"

	para "¡<PLAYER> se quedó"
	line "fuera de combate!"
	done

SECTION "WhiteoutToWildText", ROMX
WhiteoutToWildText::
	text "¡A <PLAYER> no le"
	line "quedan #mon!"

	para "¡<PLAYER> huyó"
	line "y tiró "
	text_decimal hMoneyTemp, 3, 7
	text "¥…"

	para "………………"
	line "………………"

	para "¡<PLAYER> se quedó"
	line "fuera de combate!"
	done

SECTION "WhiteoutToTrainerText", ROMX
WhiteoutToTrainerText::
	text "¡A <PLAYER> no le"
	line "quedan #mon!"

	para "<PLAYER> pagó"
	line ""
	text_decimal hMoneyTemp, 3, 7
	text "¥ al"
	cont "ganador…"

	para "………………"
	line "………………"

	para "¡<PLAYER> se quedó"
	line "fuera de combate!"
	done

SECTION "ForfeitToTrainerText", ROMX
ForfeitToTrainerText::
	text "<PLAYER> abandonó"
	line "el combate…"

	para "<PLAYER> pagó"
	line ""
	text_decimal hMoneyTemp, 3, 7
	text "¥ al"
	cont "ganador…"

	para "………………"
	line "………………"

	para "¡<PLAYER> se quedó"
	line "fuera de combate!"
	done

SECTION "_PoisonFaintText", ROMX
_PoisonFaintText::
	text_ram wStringBuffer3
	line "se recuperó del"
	cont "envenenamiento."
	prompt

SECTION "_UseSweetHoneyText", ROMX
_UseSweetHoneyText::
	text "<PLAYER> untó"
if DEF(FAITHFUL)
	line "la Miel."
else
	line "la Miel Dulce."
endc
	done

SECTION "_SweetHoneyNothingText", ROMX
_SweetHoneyNothingText::
	text "Parece que no hay"
	line "nada aquí…"
	done

SECTION "_SquirtbottleNothingText", ROMX
_SquirtbottleNothingText::
	text "<PLAYER> echó agua"

	para "Pero no pasó"
	line "nada…"
	done

SECTION "_UseSacredAshText", ROMX
_UseSacredAshText::
	text "¡Los #mon de"
	line "<PLAYER>"
	cont "se curaron!"
	done

SECTION "Text_AnEGGCantHoldAnItem", ROMX
Text_AnEGGCantHoldAnItem::
	text "Un Huevo no puede"
	line "llevar objetos."
	prompt

SECTION "_AskThrowAwayText", ROMX
_AskThrowAwayText::
	text "¿Cuántos quieres"
	line "tirar?"
	done

SECTION "_AskQuantityThrowAwayText", ROMX
_AskQuantityThrowAwayText::
	text "¿Tirar "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done

SECTION "_ThrewAwayText", ROMX
_ThrewAwayText::
	text "Tiraste"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_OakThisIsntTheTimeText", ROMX
_OakThisIsntTheTimeText::
	text "Oak: ¡<PLAYER>!"
	line "¡No es el momento"
	cont "de usar eso!"
	prompt

SECTION "Text_YouDontHaveAPkmn", ROMX
Text_YouDontHaveAPkmn::
	text "¡No tienes ningún"
	line "#mon!"
	prompt

SECTION "_RegisteredItemText", ROMX
_RegisteredItemText::
	text "Has asignado"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "UnregisteredItemText", ROMX
UnregisteredItemText::
	text "Has quitado"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_CantRegisterText", ROMX
_CantRegisterText::
	text "No puedes asignar"
	line "este objeto."
	prompt

SECTION "_AskItemMoveText", ROMX
_AskItemMoveText::
	text "¿A dónde quieres"
	line "mover esto?"
	done

SECTION "Text_AreYouABoyOrAreYouAGirl", ROMX
Text_AreYouABoyOrAreYouAGirl::
	text "¿Qué foto tiene"
	line "tu Ficha Entren.?"
	done

SECTION "Text_SoThisIsYou", ROMX
Text_SoThisIsYou::
	text "¿Es correcto?"
	done

SECTION "Text_BattleUser", ROMX
Text_BattleUser::
	text "<USER>@"
	text_end

SECTION "_BattleTookSunlightText", ROMX
_BattleTookSunlightText::
	line "¡absorbió luz!"
	prompt

SECTION "_BattleFlewText", ROMX
_BattleFlewText::
	line "¡voló muy alto!"
	prompt

SECTION "_BattleDugText", ROMX
_BattleDugText::
	line "¡cavó un hoyo!"
	prompt

SECTION "Text_BreedHuh", ROMX
Text_BreedHuh::
	text "¿Eh?"
	para "@"
	text_end

SECTION "_BreedEggHatchText", ROMX
_BreedEggHatchText::
	text "¡"
	text_ram wStringBuffer1
	text " salió"
	line "del huevo!"
	text_sound SFX_CAUGHT_MON
	text_promptbutton
	text_end

SECTION "_BreedAskNicknameText", ROMX
_BreedAskNicknameText::
	text "¿Darle un mote a"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_LeftWithDayCareLadyText", ROMX
_LeftWithDayCareLadyText::
	text "Es "
	text_ram wBreedMon2Nickname
	text ","
	line "a quien dejaste"
	cont "con la Abuela."
	done

SECTION "_LeftWithDayCareManText", ROMX
_LeftWithDayCareManText::
	text "Es "
	text_ram wBreedMon1Nickname
	text ","
	line "a quien dejaste"
	cont "con el Abuelo."
	done

SECTION "_BreedNoInterestText", ROMX
_BreedNoInterestText::
	text "No le interesa"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedAppearsToCareForText", ROMX
_BreedAppearsToCareForText::
	text "Parece que le"
	line "importa"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedFriendlyText", ROMX
_BreedFriendlyText::
	text "Es amigable con"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedShowsInterestText", ROMX
_BreedShowsInterestText::
	text "Muestra interés"
	line "por "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_EmptyMailboxText", ROMX
_EmptyMailboxText::
	text "No hay cartas"
	line "aquí."
	prompt

SECTION "ClearedMailPutAwayText", ROMX
ClearedMailPutAwayText::
	text "Se borró la Carta"
	line "y se guardó."
	prompt

SECTION "MailPackFullText", ROMX
MailPackFullText::
	text "La Mochila está"
	line "llena."
	prompt

SECTION "MailMessageLostText", ROMX
MailMessageLostText::
	text "El mensaje de la"
	line "Carta se borrará."
	cont "¿Vale?"
	done

SECTION "MailAlreadyHoldingItemText", ROMX
MailAlreadyHoldingItemText::
	text "Ya lleva otro"
	line "objeto."
	prompt

SECTION "MailEggText", ROMX
MailEggText::
	text "Un Huevo no puede"
	line "llevar Cartas."
	prompt

SECTION "MailMovedFromBoxText", ROMX
MailMovedFromBoxText::
	text "Se retiró la"
	line "Carta del Buzón."
	prompt

SECTION "_ReceivedGiftMonText", ROMX
_ReceivedGiftMonText::
	text "¡<PLAYER> recibió"
	line ""
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_EggSentToPCText", ROMX
_EggSentToPCText::
	text "El Huevo se"
	line "envió a "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_PCGottaHavePokemonText", ROMX
_PCGottaHavePokemonText::
	text "¡Debes tener"
	line "#mon para"
	cont "poder llamar!"
	prompt

SECTION "_ContestCaughtMonText", ROMX
_ContestCaughtMonText::
	text "¡Atrapaste a"
	line ""
	text_ram wStringBuffer1
	text "!"
	prompt

SECTION "_ContestAskSwitchText", ROMX
_ContestAskSwitchText::
	text "¿Cambiar #mon?"
	done

SECTION "_ContestAlreadyCaughtText", ROMX
_ContestAlreadyCaughtText::
	text "Ya has atrapado"
	line "a "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "ContestJudging_FirstPlaceText", ROMX
ContestJudging_FirstPlaceText::
	text "Y el ganador del"
	line "Concurso es"
	text_pause
	text "…"

	para "¡"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó a"
	cont ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_FirstPlaceScoreText", ROMX
ContestJudging_FirstPlaceScoreText::
	para "¡La puntuación"
	line "ganadora es de"
	cont ""
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " puntos!"
	prompt

SECTION "ContestJudging_SecondPlaceText", ROMX
ContestJudging_SecondPlaceText::
	text "En segundo lugar,"
	line "¡"
	text_ram wBugContestWinnerName
	text ","
	para "que atrapó a"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_SecondPlaceScoreText", ROMX
ContestJudging_SecondPlaceScoreText::
	para "¡La puntuación"
	line "es de "
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " puntos!"
	prompt

SECTION "ContestJudging_ThirdPlaceText", ROMX
ContestJudging_ThirdPlaceText::
	text "En tercer lugar,"
	line "¡"
	text_ram wBugContestWinnerName
	text ","
	para "que atrapó a"
	line ""
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "ContestJudging_ThirdPlaceScoreText", ROMX
ContestJudging_ThirdPlaceScoreText::
	para "¡La puntuación"
	line "es de "
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " puntos!"
	prompt

SECTION "_MagikarpGuruMeasureText", ROMX
_MagikarpGuruMeasureText::
	text "Déjame medir ese"
	line "Magikarp."

	para "… Mmm, mide"
	line ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_KarpGuruRecordText", ROMX
_KarpGuruRecordText::
	text "Récord Actual"
	para ""
	text_ram wStringBuffer1
	text " atrapado por"
	line ""
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

SECTION "_LuckyNumberMatchPartyText", ROMX
_LuckyNumberMatchPartyText::
	text "¡Felicidades!"

	para "Hay un número de"
	line "ID coincidente"

	para "con "
	text_ram wStringBuffer2
	text ","
	line "de tu equipo."
	prompt

SECTION "_LuckyNumberMatchPCText", ROMX
_LuckyNumberMatchPCText::
	text "¡Felicidades!"

	para "Hay un número de"
	line "ID coincidente"

	para "con "
	text_ram wStringBuffer2
	line "en la Caja"
	cont "“"
	text_ram wStringBuffer1
	text "”."
	prompt

SECTION "_CaughtAskNicknameText", ROMX
_CaughtAskNicknameText::
	text "¿Darle un mote"
	line "al "
	text_ram wStringBuffer1
	text " que"
	cont "has recibido?"
	done

SECTION "_PokecenterPCCantUseText", ROMX
_PokecenterPCCantUseText::
	text "¡Biiiip! ¡Debes"
	line "tener un #mon"
	cont "para usar esto!"
	prompt

SECTION "_PlayersPCTurnOnText", ROMX
_PlayersPCTurnOnText::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

SECTION "_PlayersPCAskWhatDoText", ROMX
_PlayersPCAskWhatDoText::
	text "¿Qué quieres"
	line "hacer?"
	done

SECTION "_PlayersPCHowManyWithdrawText", ROMX
_PlayersPCHowManyWithdrawText::
	text "¿Cuántos quieres"
	line "sacar?"
	done

SECTION "_PlayersPCWithdrewItemsText", ROMX
_PlayersPCWithdrewItemsText::
	text "Sacaste "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomWithdrawText", ROMX
_PlayersPCNoRoomWithdrawText::
	text "No hay espacio"
	line "para más objetos."
	prompt

SECTION "_PlayersPCNoItemsText", ROMX
_PlayersPCNoItemsText::
	text "¡No hay objetos!"
	prompt

SECTION "_PlayersPCCantDepositItemText", ROMX
_PlayersPCCantDepositItemText::
	text "Ese objeto no se"
	line "puede guardar."
	prompt

SECTION "_PlayersPCHowManyDepositText", ROMX
_PlayersPCHowManyDepositText::
	text "¿Cuántos quieres"
	line "guardar?"
	done

SECTION "_PlayersPCDepositItemsText", ROMX
_PlayersPCDepositItemsText::
	text "Guardaste "
	text_decimal wItemQuantityChangeBuffer, 1, 2
	line ""
	text_ram wStringBuffer2
	text_plural
	text "."
	prompt

SECTION "_PlayersPCNoRoomDepositText", ROMX
_PlayersPCNoRoomDepositText::
	text "No hay espacio"
	line "para guardar obj."
	prompt

SECTION "_PokecenterPCTurnOnText", ROMX
_PokecenterPCTurnOnText::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

SECTION "_PokecenterPCWhoseText", ROMX
_PokecenterPCWhoseText::
	text "¿A qué PC quieres"
	line "acceder?"
	done

SECTION "_PokecenterBillsPCText", ROMX
_PokecenterBillsPCText::
	text "Se ha accedido al"
	line "PC de Bill."

	para "Sistema de Almac."
	line "de #mon abierto"
	prompt

SECTION "_PokecenterPlayersPCText", ROMX
_PokecenterPlayersPCText::
	text "Accediste a tu PC."

	para "Sistema de Almac."
	line "de Objetos abierto"
	prompt

SECTION "_PokecenterOaksPCText", ROMX
_PokecenterOaksPCText::
	text "Se ha accedido al"
	line "PC del Prof.Oak."

	para "Sistema de Eval."
	line "de la #dex."
	prompt

SECTION "_PokecenterPCOaksClosedText", ROMX
_PokecenterPCOaksClosedText::
	text "…"
	line "Conexión cerrada…"
	done

SECTION "_OakPCText1", ROMX
_OakPCText1::
	text "¿Quieres que"
	line "evalúe tu #dex?"
	done

SECTION "_OakPCText2", ROMX
_OakPCText2::
	text "Nivel actual de"
	line "la #dex:"
	prompt

SECTION "_OakPCText3", ROMX
_OakPCText3::
	text_decimal wTempDexSeen, 2, 3
	text " vistos"
	line ""
	text_decimal wTempDexOwn, 2, 3
	text " atrapados"

	para "Evaluación del"
	line "Prof.Oak:"
	done

SECTION "_OakRating01", ROMX
_OakRating01::
	text "¡Busca #mon"
	line "en la hierba alta!"
	done

SECTION "_OakRating02", ROMX
_OakRating02::
	text "Bien. Veo que ya"
	line "sabes usar las"
	cont "# Ball."
	done

SECTION "_OakRating03", ROMX
_OakRating03::
	text "Estás mejorando"
	line "en esto."

	para "Pero te queda"
	line "un largo camino."
	done

SECTION "_OakRating04", ROMX
_OakRating04::
	text "Tienes que llenar"
	line "la #dex."

	para "¡Atrapa distintos"
	line "tipos de #mon!"
	done

SECTION "_OakRating05", ROMX
_OakRating05::
	text "¡Se nota que te"
	line "estás esforzando!"

	para "Tu #dex va"
	line "tomando forma."
	done

SECTION "_OakRating06", ROMX
_OakRating06::
	text "Para evolucionar,"
	line "algunos crecen,"

	para "y otros necesitan"
	line "Piedras."
	done

SECTION "_OakRating07", ROMX
_OakRating07::
	text "¿Ya conseguiste"
	line "una Caña? Puedes"

	para "pescar para"
	line "atrapar #mon."
	done

SECTION "_OakRating08", ROMX
_OakRating08::
	text "¡Excelente! Parece"
	line "que te gusta"
	cont "coleccionar cosas"
	done

SECTION "_OakRating09", ROMX
_OakRating09::
	text "Algunos #mon"
	line "solo aparecen a"

	para "ciertas horas"
	line "del día."
	done

SECTION "_OakRating10", ROMX
_OakRating10::
	text "Tu #dex se"
	line "está llenando."
	cont "¡Sigue así!"
	done

SECTION "_OakRating11", ROMX
_OakRating11::
	text "¡Me impresionas!"
	line "No solo atrapas"

	para "#mon, ¡también"
	line "los evolucionas!"
	done

SECTION "_OakRating12", ROMX
_OakRating12::
	text "¿Conoces a César?"
	line "Sus Balls a medida"
	cont "te ayudarán."
	done

SECTION "_OakRating13", ROMX
_OakRating13::
	text "Guau. Has atrapado"
	line "más #mon que"

	para "el último proyecto"
	line "de la #dex."
	done

SECTION "_OakRating14", ROMX
_OakRating14::
	text "¿Intercambias tus"
	line "#mon con otros?"

	para "¡Es muy difícil"
	line "hacerlo todo solo!"
	done

SECTION "_OakRating15", ROMX
_OakRating15::
	text "¡Guau! ¡Llegaste"
	line "a 200! ¡Tu #dex"
	cont "se ve genial!"
	done

SECTION "_OakRating16", ROMX
_OakRating16::
	text "¡Has encontrado"
	line "muchos #mon!"

	para "¡Me has ayudado"
	line "mucho en mis"
	cont "estudios!"
	done

SECTION "_OakRating17", ROMX
_OakRating17::
	text "¡Magnífico! ¡Ya"
	line "podrías ser un"

	para "profesor #mon"
	line "ahora mismo!"
	done

SECTION "_OakRating18", ROMX
_OakRating18::
	text "¡Tu #dex es"
	line "increíble! ¡Estás"

	para "listo para ser"
	line "un profesional!"
	done

SECTION "_OakRating19", ROMX
_OakRating19::
	text "¡Guau! ¡Tu #dex"
	line "es perfecta!"

	para "¡Siempre había"
	line "soñado con esto!"
	cont "¡Enhorabuena!"
	done

SECTION "_OakPCText4", ROMX
_OakPCText4::
	text "La conexión al PC"
	line "del Prof.Oak"
	cont "se cerró."
	done

SECTION "_MemoryGameYeahText", ROMX
_MemoryGameYeahText::
	text " , yeah!"
	done

SECTION "_MemoryGameDarnText", ROMX
_MemoryGameDarnText::
	text "Rayos…"
	done

SECTION "_StartMenuContestEndText", ROMX
_StartMenuContestEndText::
	text "¿Quieres terminar"
	line "el Concurso ya?"
	done

SECTION "_ItemsTossOutHowManyText", ROMX
_ItemsTossOutHowManyText::
	text "¿Cuantos tiras?"
	line ""
	text_ram wStringBuffer2
	text_plural
	text "?"
	done

SECTION "_ItemsDiscardedText", ROMX
_ItemsDiscardedText::
	text "Has tirado"
    line ""
    text_ram wStringBuffer1
    text_plural
    text "."
    prompt

SECTION "_ItemsOakWarningText", ROMX
_ItemsOakWarningText::
	text "Oak: ¡<PLAYER>!"
    line "¡No es momento de"
    cont "usar eso!"
    done

SECTION "_PokemonSwapItemText", ROMX
_PokemonSwapItemText::
	text "Quitaste"
	line ""
	text_ram wStringBuffer1
	para "a "
	text_ram wMonOrItemNameBuffer
	text " y"
	line "ahora lleva"
	cont ""
	text_ram wStringBuffer2
	prompt

SECTION "_PokemonHoldItemText", ROMX
_PokemonHoldItemText::
	text "Ahora "
	text_ram wMonOrItemNameBuffer
	line "lleva "
	text_ram wStringBuffer2
	prompt

SECTION "_PokemonRemoveMailText", ROMX
_PokemonRemoveMailText::
	text "Por favor, quita"
	line "la Carta primero."
	prompt

SECTION "_PokemonNotHoldingText", ROMX
_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " no"
	line "lleva nada."
	prompt

SECTION "_ItemStorageFullText", ROMX
_ItemStorageFullText::
	text "No hay espacio."
	prompt

SECTION "_PokemonTookItemText", ROMX
_PokemonTookItemText::
	text "Quitaste"
	line ""
	text_ram wStringBuffer1
	cont "a "
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

SECTION "_PokemonAskSwapItemText", ROMX
_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " ya"
	line "lleva un objeto:"

	para ""
	text_ram wStringBuffer1
	text "."
	line "¿Cambiar objetos?"
	done

SECTION "_ItemCantHeldText", ROMX
_ItemCantHeldText::
	text "Este objeto no se"
	line "puede equipar."
	prompt

SECTION "_MailLoseMessageText", ROMX
_MailLoseMessageText::
	text "El mensaje de la"
	line "Carta se borrará."
	cont "¿Vale?"
	done

SECTION "_MailDetachedText", ROMX
_MailDetachedText::
	text "Quitaste la Carta"
	line "a "
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_MailNoSpaceText", ROMX
_MailNoSpaceText::
	text "No hay sitio para"
	line "quitar la Carta."
	prompt

SECTION "_MailAskSendToPCText", ROMX
_MailAskSendToPCText::
	text "¿Enviar la Carta"
	line "quitada a tu PC?"
	done

SECTION "_MailboxFullText", ROMX
_MailboxFullText::
	text "El Buzón de tu"
	line "PC está lleno."
	prompt

SECTION "_MailSentToPCText", ROMX
_MailSentToPCText::
	text "La Carta fue"
	line "enviada a tu PC."
	prompt

SECTION "_PokemonNotEnoughHPText", ROMX
_PokemonNotEnoughHPText::
	text "¡No tiene los"
	line "PS suficientes!"
	prompt

SECTION "_MayRegisterItemText", ROMX
_MayRegisterItemText::
	text "Puedes asignar un"
	line "objeto de la"
	cont "Mochila a Select."
	done

SECTION "_InitialOptionsText", ROMX
_InitialOptionsText::
	text "Elige la forma de"
	line "jugar a Polished"
	cont "Crystal."
	prompt

SECTION "_ElmText1", ROMX
_ElmText1::
	text "¡Hola! ¡Siento"
	line "hacerte esperar!"

if !DEF(DEBUG)
	para "¡Te doy la"
	line "bienvenida al"
	cont "mundo de los"
	cont "#mon!"

	para "Me llamo Elm."

	para "¡Pero todos me"
	line "llaman Prof."
	cont "#mon!"
endc
	prompt

SECTION "_ElmText2", ROMX
_ElmText2::
	text "Este mundo está"
	line "habitado por unas"
	cont "criaturas llamadas"
	cont "#mon.@"
	text_end

SECTION "_ElmText4", ROMX
_ElmText4::
	text "Humanos y #mon"
	line "conviven en mutua"
	cont "armonía."

	para "Unos juegan con"
	line "los #mon y"
	cont "otros combaten."
	prompt

SECTION "_ElmText5", ROMX
_ElmText5::
	text "Pero todavía no lo"
	line "sabemos todo sobre"
	cont "los #mon."

	para "Aún nos quedan"
	line "muchos misterios"
	cont "por resolver."

	para "Por eso investigo"
	line "a los #mon"
	cont "a diario."
	prompt

SECTION "_ElmText6", ROMX
_ElmText6::
	text "Dime, ¿cómo te"
	line "llamas?"
	prompt

SECTION "_ElmText7", ROMX
_ElmText7::
	text "¡<PLAYER>!"
	line "¿Todo listo?"

if !DEF(DEBUG)
	para "Tu propia historia"
	line "#mon está a"
	cont "punto de comenzar."

	para "Pasarás por buenos"
	line "momentos y duros"
	cont "desafíos."

	para "¡Te espera un"
	line "mundo de sueños"

	para "y aventuras con"
	line "los #mon!"
	cont "¡Vamos allá!"
endc

	para "¡Nos vemos más"
	line "tarde!"
	done

SECTION "_WarnVBAText", ROMX
_WarnVBAText::
if !DEF(DEBUG)
	text "¡Aviso!"

	para "Este emulador de"
	line "Game Boy tiene"

	para "fallos que pueden"
	line "colgar el juego."

	para "Usa un emulador"
	line "más preciso como"

	para "BGB, mGBA o"
	line "Gambatte."
	prompt
else
	text "Fallo de la prueba"
	line "del emulador."
	prompt
endc

SECTION "_ClockTimeMayBeWrongText", ROMX
_ClockTimeMayBeWrongText::
	text "La hora del reloj"
	line "podría estar mal."

	para "Por favor, vuelve"
	line "a ajustarla."
	prompt

SECTION "_ClockSetWithControlPadText", ROMX
_ClockSetWithControlPadText::
	text "Ajusta con la Cruz"
	line "de Control."

	para "Confirma: Botón A"
	line "Cancela: Botón B"
	done

SECTION "_ClockIsThisOKText", ROMX
_ClockIsThisOKText::
	text "¿Está bien así?"
	done

SECTION "_ClockHasResetText", ROMX
_ClockHasResetText::
	text "La hora ha sido"
	line "ajustada."
	done

SECTION "_LinkTimeoutText", ROMX
_LinkTimeoutText::
	text "Pasó demasiado"
	line "tiempo. Prueba"
	cont "otra vez."
	prompt

SECTION "_LinkTradeCantBattleText", ROMX
_LinkTradeCantBattleText::
	text "Si cambias ese"
	line "#mon, no podrás"
	cont "luchar."
	prompt

SECTION "_LinkAbnormalMonText", ROMX
_LinkAbnormalMonText::
	text "¡El "
	text_ram wStringBuffer1
	line "de tu amigo"
	cont "parece anormal!"
	prompt

SECTION "_LinkAskTradeForText", ROMX
_LinkAskTradeForText::
	text "¿Intercambiar a"
	line ""
	text_ram wBufferTrademonNickname
	text " por"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_WouldYouLikeToSaveTheGameText", ROMX
_WouldYouLikeToSaveTheGameText::
	text "¿Quieres guardar"
	line "la partida?"
	done

SECTION "_SavedTheGameText", ROMX
_SavedTheGameText::
	text "<PLAYER> guardó"
	line "la partida."
	done

SECTION "_AnotherSaveFileText", ROMX
_AnotherSaveFileText::
	text "¡Aviso! Ya existe"
	line "otra partida"
	cont "guardada."

	para "¿Sobrescribir los"
	line "datos anteriores?"
	done

SECTION "_SaveFileCorruptedText", ROMX
_SaveFileCorruptedText::
	text "¡La partida está"
	line "dañada!"
	prompt

SECTION "_GainedItemText", ROMX
_GainedItemText::
	text "<PLAYER> obtuvo"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "_GainedMultipleItemsText", ROMX
_GainedMultipleItemsText::
	text "<PLAYER> obtuvo"
	line ""
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer4
	text "."
	done

SECTION "_PutItemInPocketText", ROMX
_PutItemInPocketText::
	text "<PLAYER> guardó"
	line ""
	text_ram wStringBuffer1
	cont "en "
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PocketIsFullText", ROMX
_PocketIsFullText::
	text "El "
	text_ram wStringBuffer3
	line "está lleno…"
	prompt

SECTION "_FoundWingsText", ROMX
_FoundWingsText::
	text "¡<PLAYER> obtuvo "
	text_decimal wCurWingQuantity, 1, 2
	line ""
	text_ram wStringBuffer4
	text "!"
	done

SECTION "_CongratulationsYourPokemonText", ROMX
_CongratulationsYourPokemonText::
	text "¡Felicidades!"
	line "Tu "
	text_ram wStringBuffer2
	text_end

SECTION "_EvolvedIntoText", ROMX
_EvolvedIntoText::
	para "evolucionó a"
	line ""
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_StoppedEvolvingText", ROMX
_StoppedEvolvingText::
	text "¿Eh? ¡"
	text_ram wStringBuffer2
	line "no evolucionó!"
	prompt

SECTION "_EvolvingText", ROMX
_EvolvingText::
	text "¿Anda? ¡"
	text_ram wStringBuffer2
	line "está"
	cont "evolucionando!"
	done

SECTION "_MartHowManyText", ROMX
_MartHowManyText::
	text "¿Cuántos?"
	done

SECTION "_MartFinalPriceText", ROMX
_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "serán "
	text_decimal hMoneyTemp, 3, 7
	text "¥."
	done

SECTION "_HerbShopLadyIntroText", ROMX
_HerbShopLadyIntroText::
	text "Hola, encanto."

	para "Vendo medicina"
	line "herbal barata."

	para "Es buena, pero un"
	line "poco amarga."

	para "A tus #mon les"
	line "sabrá amarga…"

	para "Jejejeje…"
	done

SECTION "_HerbalLadyFinalPriceText", ROMX
_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "serán "
	text_decimal hMoneyTemp, 3, 7
	text "¥."
	done

SECTION "_HerbalLadyThanksText", ROMX
_HerbalLadyThanksText::
	text "Gracias, encanto."
	line "Jejejeje…"
	done

SECTION "_HerbalLadyPackFullText", ROMX
_HerbalLadyPackFullText::
	text "¿Oh? Tu Mochila"
	line "está llena."
	done

SECTION "_HerbalLadyNoMoneyText", ROMX
_HerbalLadyNoMoneyText::
	text "Jejeje… No tienes"
	line "suficiente dinero."
	done

SECTION "_HerbalLadyComeAgainText", ROMX
_HerbalLadyComeAgainText::
	text "Vuelve pronto,"
	line "encanto. Jejejeje…"
	done

SECTION "_BargainShopIntroText", ROMX
_BargainShopIntroText::
	text "¡Buenas! ¿Buscas"
	line "alguna ganga?"

	para "Vendo objetos muy"
	line "raros y únicos,"
	cont "¡solo uno de cada!"
	done

SECTION "_BargainShopFinalPriceText", ROMX
_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	line "cuesta "
	text_decimal hMoneyTemp, 3, 7
	text "¥."
	cont "¿Lo quieres?"
	done

SECTION "_BargainShopThanksText", ROMX
_BargainShopThanksText::
	text "Gracias."
	done

SECTION "_BargainShopPackFullText", ROMX
_BargainShopPackFullText::
	text "Uy, tu Mochila"
	line "está a rebosar."
	done

SECTION "_BargainShopSoldOutText", ROMX
_BargainShopSoldOutText::
	text "Ya compraste eso."
	line "Se me ha agotado."
	done

SECTION "_BargainShopNoFundsText", ROMX
_BargainShopNoFundsText::
	text "Uy, andas corto"
	line "de dinero."
	done

SECTION "_BargainShopComeAgainText", ROMX
_BargainShopComeAgainText::
	text "Vuelve en otro"
	line "momento."
	done

SECTION "_PharmacyIntroText", ROMX
_PharmacyIntroText::
	text "¿Qué tal? ¿Buscas"
	line "medicinas?"
	done

SECTION "_HowManyText", ROMX
_HowManyText::
	text "¿Cuántos?"
	done

SECTION "_PharmacyFinalPriceText", ROMX
_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer2
	text_plural
	line "serán "
	text_decimal hMoneyTemp, 3, 7
	text "¥."
	done

SECTION "_PharmacyThanksText", ROMX
_PharmacyThanksText::
	text "¡Muchas gracias!"
	done

SECTION "_PharmacyPackFullText", ROMX
_PharmacyPackFullText::
	text "No tienes más"
	line "espacio."
	done

SECTION "_PharmacyNoMoneyText", ROMX
_PharmacyNoMoneyText::
	text "¿Eh? No tienes"
	line "suficiente dinero."
	done

SECTION "_PharmacyComeAgainText", ROMX
_PharmacyComeAgainText::
	text "De acuerdo."
	line "¡Hasta otra!"
	done

SECTION "_MartSellHowManyText", ROMX
_MartSellHowManyText::
	text "¿Cuántos?"
	done

SECTION "_MartSellPriceText", ROMX
_MartSellPriceText::
	text "Puedo pagarte"
	line ""
	text_decimal hMoneyTemp, 3, 7
	text "¥."

	para "¿Te parece bien?"
	done

SECTION "_MartWelcomeText", ROMX
_MartWelcomeText::
	text "¡Hola! ¿En qué"
	line "puedo ayudarte?"
	done

SECTION "_MartThanksText", ROMX
_MartThanksText::
	text "¡Aquí tienes!"
	line "¡Muchas gracias!"
	done

SECTION "_MartNoMoneyText", ROMX
_MartNoMoneyText::
	text "No tienes"
	line "suficiente dinero."
	done

SECTION "_MartPackFullText", ROMX
_MartPackFullText::
	text "No puedes llevar"
	line "más objetos."
	done

SECTION "_MartCantBuyText", ROMX
_MartCantBuyText::
	text "Lo siento, pero"
	line "no puedo comprarte"
	cont "eso."
	prompt

SECTION "_MartComeAgainText", ROMX
_MartComeAgainText::
	text "¡Vuelve cuando"
	line "quieras!"
	done

SECTION "_MartAskMoreText", ROMX
_MartAskMoreText::
	text "¿Puedo hacer algo"
	line "más por ti?"
	done

SECTION "_MartBoughtText", ROMX
_MartBoughtText::
	text "Obtuviste "
	text_decimal hMoneyTemp, 3, 7
	text "¥"
	line "por "
	text_ram wStringBuffer2
	text_plural
	text "."
	done

SECTION "_SlotsBetHowManyCoinsText", ROMX
_SlotsBetHowManyCoinsText::
	text "¿Cuantas fichas"
	line "vas a apostar?"
	done

SECTION "TMMartCostsThisMuchText", ROMX
TMMartCostsThisMuchText::
	text_ram wStringBuffer2
	text " "
	text_ram wStringBuffer1
	line "será "
	text_decimal hMoneyTemp, 3, 7
	text "¥."
	done

SECTION "BTMartHowMayIHelpYouText", ROMX
BTMartHowMayIHelpYouText::
	text "¡Te damos la"
	line "bienvenida al"
	cont "Servicio de Canje!"

	para "Puedes canjear tus"
	line "PB por premios."
	done

SECTION "BTMartCostsThisMuchText", ROMX
BTMartCostsThisMuchText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " "
	text_ram wStringBuffer1
	text_plural
	line "costarán "
	text_decimal hMoneyTemp+1, 2, 4
	text " PB."
	done

SECTION "BTMartInsufficientFundsText", ROMX
BTMartInsufficientFundsText::
	text "Lo siento, pero"
	line "no tienes PB"
	cont "suficientes."
	done

SECTION "BTMartBagFullText", ROMX
BTMartBagFullText::
	text "Lo siento, tu"
	line "Mochila está llena"
	done

SECTION "BTMartComeAgainText", ROMX
BTMartComeAgainText::
	text "¡Vuelve cuando"
	line "quieras!"
	done

SECTION "_SlotsStartText", ROMX
_SlotsStartText::
	text "¡Ya!"
	done

SECTION "_SlotsNotEnoughCoinsText", ROMX
_SlotsNotEnoughCoinsText::
	text "No tienes"
	line "bastantes fichas."
	prompt

SECTION "_SlotsRanOutOfCoinsText", ROMX
_SlotsRanOutOfCoinsText::
	text "Vaya… No quedan"
	line "fichas…"
	done

SECTION "_SlotsPlayAgainText", ROMX
_SlotsPlayAgainText::
	text "¿Jugar otra vez?"
	done

SECTION "_SlotsLinedUpText", ROMX
_SlotsLinedUpText::
	text "¡se han alineado!"
	line "¡Ganas "
	text_ram wStringBuffer2
	text " fichas!"
	done

SECTION "_SlotsDarnText", ROMX
_SlotsDarnText::
	text "¡Vaya!"
	done

SECTION "_PhoneWrongNumberText", ROMX
_PhoneWrongNumberText::
	text "¿Eh? ¡Perdón!"
	line "¡Número erróneo!"
	done

SECTION "_PhoneClickText", ROMX
_PhoneClickText::
	text "¡Clic!"
	done

SECTION "_PhoneEllipseText", ROMX
_PhoneEllipseText::
	text "……"
	done

SECTION "_PhoneOutOfAreaText", ROMX
_PhoneOutOfAreaText::
	text "Ese número está"
	line "sin cobertura."
	done

SECTION "_PhoneJustTalkToThemText", ROMX
_PhoneJustTalkToThemText::
	text "¡Ve a hablar con"
	line "esa persona!"
	done

SECTION "_PasswordAskResetText", ROMX
_PasswordAskResetText::
	text "Elige Continuar"
	line "para poner la"
	cont "hora."
	prompt

SECTION "_PasswordAskResetClockText", ROMX
_PasswordAskResetClockText::
	text "¿Ajustar el reloj?"
	done

SECTION "_ClearAllSaveDataText", ROMX
_ClearAllSaveDataText::
	text "¿Borrar todos los"
	line "datos guardados?"
	done

SECTION "ResetInitialOptionsText", ROMX
ResetInitialOptionsText::
	text "¿Reestablecer las"
	line "opc. de inicio?"
	done

SECTION "_LearnedMoveText", ROMX
_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " aprendió"
	line ""
	text_ram wStringBuffer2
	text "!"
	text_sound SFX_DEX_FANFARE_50_79
	text_promptbutton
	text_end

SECTION "_MoveAskForgetText", ROMX
_MoveAskForgetText::
	text "¿Qué movimiento"
	next "debe olvidar?"
	done

SECTION "_StopLearningMoveText", ROMX
_StopLearningMoveText::
	text "¿No aprender"
	line ""
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_DidNotLearnMoveText", ROMX
_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	line "no aprendió"
	cont ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_AskForgetMoveText", ROMX
_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	line "quiere aprender"
	cont ""
	text_ram wStringBuffer2
	text "!"

	para "Pero ya conoce"
	line "4 movimientos."

	para "¿Quieres que"
	line "olvide uno para"
	cont "aprenderlo?"
	done


SECTION "Text_MoveForgetCount", ROMX
Text_MoveForgetCount::
	text "1, 2 y…"
	text_pause
	text_end

SECTION "_MoveForgotText", ROMX
_MoveForgotText::
	text " ¡Puf!"
	text_pause

	para ""
	text_ram wMonOrItemNameBuffer
	text " olvidó"
	line ""
	text_ram wStringBuffer1
	text "."

	para "¡Y…"
	prompt

SECTION "_MoveCantForgetHMText", ROMX
_MoveCantForgetHMText::
	text "¡No puedes olvidar"
	line "movimientos MO!"
	prompt

SECTION "_CardFlipPlayWithThreeCoinsText", ROMX
_CardFlipPlayWithThreeCoinsText::
	text "¿Jugar con tres"
	line "fichas?"
	done

SECTION "_CardFlipNotEnoughCoinsText", ROMX
_CardFlipNotEnoughCoinsText::
	text "Faltan fichas…"
	prompt

SECTION "_CardFlipChooseACardText", ROMX
_CardFlipChooseACardText::
	text "Elige una carta."
	done

SECTION "_CardFlipPlaceYourBetText", ROMX
_CardFlipPlaceYourBetText::
	text "Haz tu apuesta."
	done

SECTION "_CardFlipPlayAgainText", ROMX
_CardFlipPlayAgainText::
	text "¿Quieres volver a"
	line "jugar?"
	done

SECTION "_CardFlipShuffledText", ROMX
_CardFlipShuffledText::
	text "Se han barajado"
	line "las cartas."
	prompt

SECTION "_CardFlipYeahText", ROMX
_CardFlipYeahText::
	text "¡Sí!"
	done

SECTION "_CardFlipDarnText", ROMX
_CardFlipDarnText::
	text "Vaya…"
	done

SECTION "_GearTodayText", ROMX
_GearTodayText::
	text_today
	text_end

SECTION "_GearEllipseText", ROMX
_GearEllipseText::
	text "……"
	done

SECTION "_GearOutOfServiceText", ROMX
_GearOutOfServiceText::
	text "Estás sin"
	line "cobertura."
	prompt

SECTION "_PokegearAskWhoCallText", ROMX
_PokegearAskWhoCallText::
	text "¿A quién quieres"
	line "llamar?"
	done

SECTION "_PokegearPressButtonText", ROMX
_PokegearPressButtonText::
	text "Pulsa cualquier"
	line "btn para salir."
	done

SECTION "_PokegearAskDeleteText", ROMX
_PokegearAskDeleteText::
	text "¿Eliminar este"
	line "núm de la Agenda?"
	done

SECTION "_BuenaAskWhichPrizeText", ROMX
_BuenaAskWhichPrizeText::
	text "¡Canjea tus puntos"
	line "por un regalo a"
	cont "tu elección!"

	para "¿Qué premio te"
	line "gustaría?"
	done

SECTION "_BuenaIsThatRightText", ROMX
_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "¿Es eso?"
	done

SECTION "_BuenaHereYouGoText", ROMX
_BuenaHereYouGoText::
	text "¡Aquí tienes!"
	done

SECTION "_BuenaNotEnoughPointsText", ROMX
_BuenaNotEnoughPointsText::
	text "No tienes puntos"
	line "suficientes."
	done

SECTION "_BuenaNoRoomText", ROMX
_BuenaNoRoomText::
	text "No tienes sitio"
	line "para eso."
	done

SECTION "_BuenaComeAgainText", ROMX
_BuenaComeAgainText::
	text "Oh. ¡Vuelve en"
	line "otro momento!"
	done

SECTION "_BallBrokeFreeText", ROMX
_BallBrokeFreeText::
	text "¡Oh, no! ¡El"
	line "#mon se escapó!"
	prompt

SECTION "_BallAppearedCaughtText", ROMX
_BallAppearedCaughtText::
	text "¡Vaya! ¡Parecía"
	line "que ya estaba!"
	prompt

SECTION "_BallAlmostHadItText", ROMX
_BallAlmostHadItText::
	text "¡Uf! ¡Casi lo"
	line "consigues!"
	prompt

SECTION "_BallSoCloseText", ROMX
_BallSoCloseText::
	text "¡Vaya! ¡Ha faltado"
	line "poco!"
	prompt

SECTION "Text_BallCaught", ROMX
Text_BallCaught::
	text "¡Bien! ¡"
	text_ram wEnemyMonNickname
	line "fue capturado!"
	text_sound SFX_CAUGHT_MON
	text_end

SECTION "Text_Waitbutton_2", ROMX
Text_Waitbutton_2::
	text_promptbutton
	text_end

SECTION "_CurBoxFullText", ROMX
_CurBoxFullText::
	text_ram wStringBuffer1
	text " está llena."
	prompt

SECTION "_MonSentToPCText", ROMX
_MonSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " fue"
	line "enviado a"
	cont ""
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_NewDexDataText", ROMX
_NewDexDataText::
	text "Los datos de"
	line ""
	text_ram wEnemyMonNickname
	cont "han sido añadidos"
	cont "a la #dex."
	text_sound SFX_SLOT_MACHINE_START
	text_promptbutton
	text_end

SECTION "_AskGiveNicknameText", ROMX
_AskGiveNicknameText::
	text "¿Quieres ponerle"
	line "un mote a"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_ItemHappinessRoseButStatFellText", ROMX
_ItemHappinessRoseButStatFellText::
	text_ram wStringBuffer1
	text " se"
	line "hizo más amigo."

	para "¡La base "
	text_ram wStringBuffer2
	line "de "
	text_ram wStringBuffer1
	text " bajó!"
	prompt

SECTION "_ItemStatRoseText", ROMX
_ItemStatRoseText::
	text "La "
	text_ram wStringBuffer2
	line "de "
	text_ram wStringBuffer1
	text " subió."
	prompt

SECTION "_ItemCantUseOnMonText", ROMX
_ItemCantUseOnMonText::
	text "No se puede usar"
	line "en este #mon."
	prompt

SECTION "Text_RepelUsedEarlierIsStillInEffect", ROMX
Text_RepelUsedEarlierIsStillInEffect::
	text "El Repelente que"
	line "usaste antes aún"
	cont "hace efecto."
	prompt

SECTION "_BlueCardBalanceText", ROMX
_BlueCardBalanceText::
	text "Ahora tienes"
	line ""
	text_decimal wBlueCardBalance, 1, 2
	text " puntos."
	done

SECTION "_CoinCaseCountText", ROMX
_CoinCaseCountText::
	text "Fichas:"
	line ""
	text_decimal wCoins, 2, 5
	text_end

SECTION "Text_RaiseThePPOfWhichMove", ROMX
Text_RaiseThePPOfWhichMove::
	text "¿De qué ataque"
	line "subo los PP?"
	done

SECTION "Text_RestoreThePPOfWhichMove", ROMX
Text_RestoreThePPOfWhichMove::
	text "¿De qué ataque"
	line "restauro los PP?"
	done

SECTION "Text_PPIsMaxedOut", ROMX
Text_PPIsMaxedOut::
	text "Los PP de"
	line ""
	text_ram wStringBuffer2
	text " están al máximo."
	prompt

SECTION "Text_PPsIncreased", ROMX
Text_PPsIncreased::
	text "Los PP de"
	line ""
	text_ram wStringBuffer2
	text " aumentaron."
	prompt

SECTION "Text_PPsMaximized", ROMX
Text_PPsMaximized::
	text "Los PP de"
	line ""
	text_ram wStringBuffer2
	text " se maximizaron."
	prompt

SECTION "_PPRestoredText", ROMX
_PPRestoredText::
	text "PP restaurados."
	prompt

SECTION "_ItemLooksBitterText", ROMX
_ItemLooksBitterText::
	text "Parece amargo…"
	prompt

SECTION "_ItemCantUseOnEggText", ROMX
_ItemCantUseOnEggText::
	text "No se puede usar"
	line "en un Huevo."
	prompt

SECTION "_ItemOakWarningText", ROMX
_ItemOakWarningText::
	text "Oak: ¡<PLAYER>!"
	line "¡Este no es el"
	cont "momento de"
	cont "usar eso!"
	prompt

SECTION "_ItemWontHaveEffectText", ROMX
_ItemWontHaveEffectText::
	text "No tendrá ningún"
	line "efecto."
	prompt

SECTION "_BallBlockedText", ROMX
_BallBlockedText::
	text "¡El entrenador"
	line "bloqueó la Ball!"
	prompt

SECTION "_BallDontBeAThiefText", ROMX
_BallDontBeAThiefText::
	text "¡No robes!"
	prompt

SECTION "_BallStorageFullText", ROMX
_BallStorageFullText::
	text "El Sistema de"
	line "Almacenamiento"
	cont "está lleno."
	prompt

SECTION "_BallDatabaseFullText", ROMX
_BallDatabaseFullText::
	text "La base de datos"
	line "del PC está al"
	cont "límite. Guarda."
	prompt

SECTION "Text_MonIsHiddenFromBall", ROMX
Text_MonIsHiddenFromBall::
	text "¡No se ve al"
	line "#mon!"
	prompt

SECTION "Text_MonCantBeCaught", ROMX
Text_MonCantBeCaught::
	text "¡Ese #mon no se"
	line "puede atrapar!"
	prompt

SECTION "_ItemUsedText", ROMX
_ItemUsedText::
	text "<PLAYER> usó"
	line ""
	text_ram wStringBuffer2
	text "."
	done

SECTION "_KnowsMoveText", ROMX
_KnowsMoveText::
	text_ram wStringBuffer1
	text " conoce"
	line ""
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_MoveKnowsOneText", ROMX
_MoveKnowsOneText::
	text "Ese #mon solo"
	line "sabe un mov."
	done

SECTION "_AskDeleteMoveText", ROMX
_AskDeleteMoveText::
	text "¿Quieres olvidar"
	line ""
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_DeleterForgotMoveText", ROMX
_DeleterForgotMoveText::
	text "¡Hecho! Tu #mon"
	line "olvidó el mov."
	done

SECTION "_DeleterEggText", ROMX
_DeleterEggText::
	text "¡Un Huevo no sabe"
	line "ningún mov.!"
	done

SECTION "_DeleterNoComeAgainText", ROMX
_DeleterNoComeAgainText::
	text "¿No? Vuelve cuando"
	line "quieras."
	done

SECTION "_DeleterAskWhichMoveText", ROMX
_DeleterAskWhichMoveText::
	text "¿Qué movimiento"
	line "debe olvidar?"
	prompt

SECTION "_DeleterIntroText", ROMX
_DeleterIntroText::
	text "Eh… Ah, sí, soy el"
	line "Quita-Movimientos."

	para "Hago olvidar sus"
	line "ataques a los"
	cont "#mon."

	para "¿Quieres que un"
	line "#mon olvide"
	cont "algún ataque?"
	done

SECTION "_DeleterAskWhichMonText", ROMX
_DeleterAskWhichMonText::
	text "¿Qué #mon?"
	prompt

SECTION "Text_DSTIsThatOK", ROMX
Text_DSTIsThatOK::
	text " HDV,"
	line "¿está bien?"
	done

SECTION "_TimeAskOkayText", ROMX
_TimeAskOkayText::
	text ","
	line "¿está bien?"
	done

SECTION "_TimesetAskDSTText", ROMX
_TimesetAskDSTText::
	text "¿Quieres cambiar"
	line "al Horario de"
	cont "Verano?"
	done

SECTION "_TimesetDSTText", ROMX
_TimesetDSTText::
	text "He adelantado el"
	line "reloj una hora."
	prompt

SECTION "_TimesetAskNotDSTText", ROMX
_TimesetAskNotDSTText::
	text "¿Terminó ya el"
	line "Horario de Verano?"
	done

SECTION "_TimesetNotDSTText", ROMX
_TimesetNotDSTText::
	text "He atrasado una"
	line "hora el reloj."
	prompt

SECTION "_TimesetAskAdjustDSTText", ROMX
_TimesetAskAdjustDSTText::
	text "¿Quieres ajustar"
	line "tu reloj"

	para "al Horario de"
	line "Verano?"
	done

SECTION "_MomLostGearBookletText", ROMX
_MomLostGearBookletText::
	text "Perdí el manual"
	line "de instrucciones"
	cont "del #gear."

	para "Vuelve en un"
	line "rato."
	prompt

SECTION "WonderTradeQuestionText", ROMX
WonderTradeQuestionText::
	text "¿Quieres hacer un"
	line "intercambio?"
	done

SECTION "WonderTradePromptText", ROMX
WonderTradePromptText::
	text "¿Qué #mon vas"
	line "a intercambiar?"
	prompt

SECTION "WonderTradeCantTradeSpikyEaredPichuText", ROMX
WonderTradeCantTradeSpikyEaredPichuText::
	text "Este Pichu parece"
	line "haber viajado por"
	cont "el tiempo."

	para "Sería arriesgado"
	line "transferirlo,"

	para "así que es mejor"
	line "que Pichu se quede"
	cont "donde está."
	prompt

;SECTION "WonderTradeCantTradeEggText", ROMX
;WonderTradeCantTradeEggText::
;	text "Sorry. We can't"
;	line "accept an Egg."
;	prompt

;SECTION "WonderTradeCantAcceptAbnormalMonText", ROMX
;WonderTradeCantAcceptAbnormalMonText::
;	text "Sorry, but your"
;	line "#mon appears to"
;
;	para "be abnormal. We"
;	line "can't accept it."
;	prompt

SECTION "WonderTradeConfirmText", ROMX
WonderTradeConfirmText::
	text "¿Ofrecer a"
	line ""
	text_ram wStringBuffer1
	text " para"
	cont "intercambiar?"
	done

SECTION "WonderTradeSetupText", ROMX
WonderTradeSetupText::
	text "Buscando a un"
	line "compañero…"
	prompt

SECTION "WonderTradeReadyText", ROMX
WonderTradeReadyText::
	text "¡Se ha encontrado"
	line "un compañero!"
	prompt

SECTION "SilphMartIntroText", ROMX
SilphMartIntroText::
	text "Empleados como yo"
	line "tenemos acceso al"
	cont "botín de Silph."

	para "¿Quieres comprar"
	line "algo?"
	done

SECTION "SilphMartComeAgainText", ROMX
SilphMartComeAgainText::
	text "¡Vuelve cuando"
	line "quieras! Me vienen"
	cont "bien estos extras."
	done

SECTION "AdventurerMartIntroText", ROMX
AdventurerMartIntroText::
	text "¡Conseguí objetos"
	line "raros en el"
	cont "extranjero!"
	done

SECTION "AdventurerMartComeAgainText", ROMX
AdventurerMartComeAgainText::
	text "¡Vuelve pronto!"
	done

SECTION "InformalMartIntroText", ROMX
InformalMartIntroText::
	text "¿Qué tal? ¿Buscas"
	line "suministros?"
	done

SECTION "BazaarMartIntroText", ROMX
BazaarMartIntroText::
	text "¡Ven a echar un"
	line "vistazo a mis"
	cont "productos!"
	done

SECTION "AlreadyHaveTMText", ROMX
AlreadyHaveTMText::
	text "Ya tienes esta MT."
	done

SECTION "MartPremierBallText", ROMX
MartPremierBallText::
	text "Y de regalo, te"
	line "llevas una Honor"
	text_sound SFX_TRANSACTION
	cont "Ball."
	done

SECTION "ItemCantBeSelectedText", ROMX
ItemCantBeSelectedText::
	text "Ese objeto no se"
	line "puede seleccionar."
	prompt

SECTION "AlreadyInThatBallTextData", ROMX
AlreadyInThatBallTextData::
	text "Tu #mon ya está"
	line "en esa Ball."
	prompt

SECTION "CantChangeTradedMonBallTextData", ROMX
CantChangeTradedMonBallTextData::
	text "No puedes cambiar"
	line "la Ball si el"
	cont "#mon ya fue"
	cont "intercambiado."
	prompt
