Route22Past_MapScriptHeader:
	def_scene_scripts
	scene_script Route22PastSilverGiovanniScene, SCENE_ROUTE22PAST_SILVER_GIOVANNI

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  8, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  7, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  2, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  2,  2, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1

	object_const_def
	const ROUTE22PAST_CELEBI
	const ROUTE22PAST_LYRA
	const ROUTE22PAST_RIVAL
	const ROUTE22PAST_GIOVANNI

Route22PastSilverGiovanniScene:
	sdefer .Script
	end

.Script:
	pause 30
	applymovement PLAYER, Route22Past_PlayerLooksAroundMovementData
	showemote EMOTE_SHOCK, ROUTE22PAST_LYRA, 15
	showtext Route22PastLyraWhereAreWeText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraLooksAroundMovementData
	showtext Route22PastLyraIlexForestDisappearedText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraStepDownMovementData
	turnobject PLAYER, LEFT
	showtext Route22PastLyraPokeGearText
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraStepDownTurnHeadRigthMovementData
	turnobject PLAYER, DOWN
	showtext Route22PastLyraExplainsTimeTravelText
	showemote EMOTE_SHOCK, ROUTE22PAST_LYRA, 15
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraMoveUpToHearMovementData
	showtext Route22PastLyraHearsSomeoneText
	applymovement PLAYER, Route22Past_PlayerStepUpToLyraMovementData
	follow ROUTE22PAST_LYRA, PLAYER
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraApproachesRivalMovementData
	turnobject ROUTE22PAST_LYRA, UP
	turnobject PLAYER, UP
	stopfollow
	applyonemovement ROUTE22PAST_CELEBI, step_up
	special Special_FadeOutMusic
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalQuestionsGiovanniText
	turnobject ROUTE22PAST_GIOVANNI, RIGHT
	showtext Route22PastGiovanniRivalArgumentText
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalProtestsText
	turnobject ROUTE22PAST_GIOVANNI, LEFT
	showtext Route22PastGiovanniGoodbyeText
	applymovement ROUTE22PAST_GIOVANNI, Route22Past_GiovanniLeavesMovementData
	pause 15
	applyonemovement ROUTE22PAST_RIVAL, slow_step_left
	showtext Route22PastRivalRantText
	special Special_FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE22PAST_RIVAL, ROUTE22PAST_RIVALRunsIntoPlayerMovementData
	showemote EMOTE_SHOCK, ROUTE22PAST_RIVAL, 15
	showtext Route22PastRivalInsultText
	playsound SFX_TACKLE
	applymovement PLAYER, ROUTE22PAST_RIVALShovesPlayerDownMovementData
	turnobject ROUTE22PAST_LYRA, DOWN
	applymovement ROUTE22PAST_RIVAL, ROUTE22PAST_RIVALLeavesMovementData
	special RestartMapMusic
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraMeetsPlayerMovementData
	showtext Route22PastLyraConclusionText
	cry CELEBI
	applymovement ROUTE22PAST_CELEBI, Route22Past_CelebiHopsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement ROUTE22PAST_LYRA, Route22Past_LyraLooksAroundAgainMovementData
	turnobject ROUTE22PAST_LYRA, DOWN
	showtext Route22PastLyraOhNoText
	playsound SFX_PROTECT
	applymovement ROUTE22PAST_CELEBI, Route22Past_CelebiFloatsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	clearevent EVENT_GIOVANNIS_CAVE_CELEBI
	clearevent EVENT_GIOVANNIS_CAVE_LYRA
	clearevent EVENT_GIOVANNIS_CAVE_GIOVANNI
	setmapscene GIOVANNIS_CAVE, SCENE_GIOVANNISCAVE_PAST_GIOVANNI
	warp GIOVANNIS_CAVE, 5, 5
	end

Route22Past_PlayerLooksAroundMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_end

Route22Past_LyraLooksAroundMovementData:
	slow_step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
Route22Past_LyraLooksAroundAgainMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_end

Route22Past_LyraStepDownMovementData:
	slow_step_down
	step_end

Route22Past_LyraStepDownTurnHeadRigthMovementData:
	slow_step_down
	turn_head_right
	step_end

Route22Past_LyraMoveUpToHearMovementData:
	slow_step_up
	slow_step_up
	step_end

Route22Past_PlayerStepUpToLyraMovementData:
	slow_step_up
	step_end

Route22Past_LyraApproachesRivalMovementData:
	slow_step_up
	slow_step_up
	slow_step_left
	step_end

Route22Past_GiovanniLeavesMovementData:
	slow_step_left
	slow_step_left
	step_end

ROUTE22PAST_RIVALRunsIntoPlayerMovementData:
	step_right
	step_right
	step_right
	step_down
	step_end

ROUTE22PAST_RIVALShovesPlayerDownMovementData:
	turn_head_up
	fix_facing
	jump_step_down
	step_sleep_6
	turn_head_left
	step_right
	remove_fixed_facing
	step_end

ROUTE22PAST_RIVALLeavesMovementData:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route22Past_LyraMeetsPlayerMovementData:
	step_right
	step_down
	step_down
	turn_head_right
	step_end

Route22Past_CelebiHopsMovementData:
	step_left
	turn_head_down
	step_end

Route22Past_CelebiFloatsMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

Route22PastLyraWhereAreWeText:
	text "Lira: ¿Dónde"
	line "estamos…?"
	done

Route22PastLyraIlexForestDisappearedText:
	text "Lira: ¡El Encinar"
	line "ha desaparecido!"

	para "… No, no es eso."
	line "¿Nos habremos"
	cont "teletransportado a"
	cont "otro lugar…?"
	done

Route22PastLyraPokeGearText:
	text "Lira: <PLAYER>,"
	line "¡el #gear marca"
	cont "una fecha de"
	cont "hace 3 años!"
	done

Route22PastLyraExplainsTimeTravelText:
	text "¿Acaso eso de ahí…"
	line "es… Celebi?"

	para "¡Eso lo explica!"
	line "¡Celebi usó su"
	cont "poder para viajar"
	cont "en el tiempo!"
	done

Route22PastLyraHearsSomeoneText:
	text "<PLAYER>, oigo a"
	line "alguien."

	para "¡Vamos a ver quién"
	line "es!"
	done

Route22PastRivalQuestionsGiovanniText:
	text "<RIVAL>: Dijiste"
	line "que eras el número"
	cont "uno del mundo…"

	para "¿Te vas a rendir?"

	para "¿Qué piensas hacer"
	line "ahora?"
	done

Route22PastGiovanniRivalArgumentText:
	text "…… …… ……"

	para "Uno debe aceptar"
	line "la derrota antes"
	cont "de poder seguir"
	cont "adelante…"

	para "Iré por mi cuenta…"
	line "por ahora…"

	para "¡Para crear un"
	line "día una banda"
	cont "mucho más fuerte!"

	para "<RIVAL>: ¿En qué"
	line "se supone que eras"
	cont "el número uno?"

	para "¡Reunir a tantos"
	line "solo para caer"
	cont "ante un crío!"

	para "…… …… ……"

	para "Unir el potencial"
	line "de muchos crea"
	cont "un gran poder…"

	para "¡En eso consiste"
	line "una organización!"

	para "He fracasado al"
	line "no aprovechar el"
	cont "gran potencial de"
	cont "mis subordinados…"

	para "¡Algún día verás"
	line "mi regreso y el"
	cont "del Team Rocket!"
	done

Route22PastRivalProtestsText:
	text "<RIVAL>: ¡No te"
	line "entiendo!"

	para "¡Nada de lo que"
	line "dices tiene algún"
	cont "sentido!"
	done

Route22PastGiovanniGoodbyeText:
	text "…… …… ……"

	para "Algún día lo vas a"
	line "comprender."
	done

Route22PastRivalRantText:
	text "<RIVAL>: ¡No"
	line "quiero entenderte!"

	para "¡Jamás seré como"
	line "tú!"

	para "¡Un cobarde cuando"
	line "estás solo y un"
	cont "tirano al estar"
	cont "rodeado de otros"
	cont "cobardes!"

	para "¡Me haré fuerte!"

	para "¡Llegaré a ser el"
	line "hombre más fuerte"
	cont "yo solito!"

	para "¡Yo solo!"
	done

Route22PastRivalInsultText:
	text "<RIVAL>: … ¿Qué me"
	line "estás mirando?"
	done

Route22PastLyraConclusionText:
	text "Lira: ¿Quién se ha"
	line "creído que es?"

	para "¡Ha sido de lo"
	line "más borde!"

	para "Pero hablaban del"
	line "regreso del Team"
	cont "Rocket…"

	para "Un niño venció al"
	line "Team Rocket en"
	cont "Kanto hace tres"
	cont "años."

	para "¡O sea que estamos"
	line "en el pasado de"
	cont "verdad!"
	done

Route22PastLyraOhNoText:
	text "Lira: ¡Oh, no!"
	line "¡Está pasando"
	cont "otra vez…!"

	para "¡Es el viaje en el"
	line "tiempo de Celebi!"
	done
