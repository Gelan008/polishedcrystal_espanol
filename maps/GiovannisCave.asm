GiovannisCave_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_GIOVANNISCAVE_NOOP
	scene_script GiovannisCavePastBattleScene, SCENE_GIOVANNISCAVE_PAST_GIOVANNI

	def_callbacks

	def_warp_events
	warp_event  5,  7, TOHJO_FALLS, 3

	def_coord_events

	def_bg_events
	bg_event  5,  2, BGEVENT_READ, GiovannisCaveRadioScript
	bg_event  2,  6, BGEVENT_ITEM + BERSERK_GENE, EVENT_GIOVANNIS_CAVE_HIDDEN_BERSERK_GENE

	def_object_events
	object_event  5,  6, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_CELEBI
	object_event  4,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_LYRA
	object_event  5,  3, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNIS_CAVE_GIOVANNI
	smashrock_event  3,  6
	smashrock_event  6,  2

	object_const_def
	const GIOVANNISCAVE_CELEBI
	const GIOVANNISCAVE_LYRA
	const GIOVANNISCAVE_GIOVANNI

GiovannisCavePastBattleScene:
	sdefer .Script
	end

.Script:
	pause 30
	turnobject PLAYER, UP
	turnobject GIOVANNISCAVE_LYRA, UP
	showemote EMOTE_SHOCK, GIOVANNISCAVE_GIOVANNI, 15
	turnobject GIOVANNISCAVE_GIOVANNI, DOWN
	showtext GiovannisCaveGiovanniIntroText
	applyonemovement GIOVANNISCAVE_GIOVANNI, slow_step_down
	showtext GiovannisCaveGiovanniMemoriesText
	turnobject GIOVANNISCAVE_LYRA, RIGHT
	showtext GiovannisCaveLyraQuestionsText
	showemote EMOTE_SHOCK, GIOVANNISCAVE_LYRA, 15
	showtext GiovannisCaveLyraRecognizesGiovanniText
	playmusic MUSIC_ROCKET_OVERTURE
	turnobject GIOVANNISCAVE_LYRA, UP
	turnobject GIOVANNISCAVE_GIOVANNI, UP
	showtext GiovannisCaveBroadcastText
	turnobject GIOVANNISCAVE_GIOVANNI, DOWN
	showtext GiovannisCaveGiovanniIMustGoText
	setmapscene GIOVANNIS_CAVE, SCENE_GIOVANNISCAVE_NOOP
	clearevent EVENT_TIME_TRAVELING
	winlosstext GiovannisCaveGiovanniBeatenText, 0
	setlasttalked GIOVANNISCAVE_GIOVANNI
	loadtrainer GIOVANNI, GIOVANNI2
	startbattle
	reloadmapafterbattle
	setevent EVENT_TIME_TRAVELING
	applymovement GIOVANNISCAVE_GIOVANNI, GiovannisCave_GiovanniStepsBackMovementData
	showtext GiovannisCaveGiovanniAfterText
	applymovement GIOVANNISCAVE_GIOVANNI, GiovannisCave_GiovanniLeavesMovementData
	playsound SFX_ENTER_DOOR
	disappear GIOVANNISCAVE_GIOVANNI
	waitsfx
	turnobject PLAYER, DOWN
	turnobject GIOVANNISCAVE_LYRA, DOWN
	showtext GiovannisCaveBroadcastAfterText
	applyonemovement GIOVANNISCAVE_LYRA, slow_step_down
	showtext GiovannisCaveLyraFeelsSorryText
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	special LoadMapPalettes
	pause 30
	special FadeInPalettes_EnableDynNoApply
	waitsfx
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, GiovannisCave_PlayerStepsAsideMovementData
	applymovement GIOVANNISCAVE_LYRA, GiovannisCave_LyraLooksAroundMovementData
	showtext GiovannisCaveLyraWantsToLeaveText
	playsound SFX_PROTECT
	applymovement GIOVANNISCAVE_CELEBI, GiovannisCave_CelebiFloatsMovementData
	waitsfx
	playsound SFX_GAME_FREAK_LOGO_GS
	special FadeOutPalettes
	pause 30
	waitsfx
	disappear GIOVANNISCAVE_CELEBI
	disappear GIOVANNISCAVE_LYRA
	warp CINNABAR_LAB, 30, 16
	end

GiovannisCaveRadioScript:
	checkevent EVENT_TIME_TRAVEL_FINISHED
	iftrue_jumptext GiovannisCaveRadioAfterTimeTravelText
	jumpthistext

	text "Hay una radio que"
	line "ya no funciona..."
	done

GiovannisCaveRadioAfterTimeTravelText:
	text "No puedes encender"
	line "la radio."

	para "Giovanni debe ha-"
	line "berla dejado"
	cont "aquí..."
	done

GiovannisCave_GiovanniStepsBackMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	remove_fixed_facing
	slow_step_right
	step_end

GiovannisCave_GiovanniLeavesMovementData:
	step_down
	step_down
	step_down
	step_down
	step_left
	turn_head_down
	step_end

GiovannisCave_PlayerStepsAsideMovementData:
	turn_head_left
	fix_facing
	slow_step_right
	remove_fixed_facing
	step_end

GiovannisCave_LyraLooksAroundMovementData:
	turn_head_left
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_right
	step_end

GiovannisCave_CelebiFloatsMovementData:
	turn_head_down
	fix_facing
	slow_step_up
	slow_step_up
	slow_step_up
	remove_fixed_facing
	step_end

GiovannisCaveGiovanniIntroText:
	text "..."

	para "No sé por qué has"
	line "venido aquí,"

	para "pero te advierto"
	line "que este no es"
	cont "lugar para críos"
	cont "como tú."

	para "Lira: ¿Eh? ¡Ese es"
	line "el hombre que aca-"

	para "bamos de ver dis-"
	line "cutir con ese chi-"
	cont "co!"
	done

GiovannisCaveGiovanniMemoriesText:
	text "Me suenas de algo."
	line "..."

	para "¡Me acuerdo de ti!"

	para "Hace tres años ese"
	line "chico arruinaba"
	cont "nuestros planes,"

	para "¡pero tú causaste"
	line "todos nuestros"
	cont "problemas primero!"

	para "..."

	para "Voy de camino a"
	line "Ciudad Trigal para"

	para "responder a la"
	line "llamada y unirme a"
	cont "mi equipo."

	para "¿Vas a interpo-"
	line "nerte en mi camino"
	cont "otra vez?"
	done

GiovannisCaveLyraQuestionsText:
	text "Lira: ¿Hace tres"
	line "años...? ¿Ciudad"
	cont "Trigal...?"
	done

GiovannisCaveLyraRecognizesGiovanniText:
	text "¡A él es a quien"
	line "el Team Rocket"
	cont "intentaba"
	cont "contactar!"

	para "¡Su jefe,"
	line "Giovanni!"

	para "<PLAYER>, ¿cuándo"
	line "te encontraste con"
	cont "Giovanni antes...?"
	done

GiovannisCaveBroadcastText:
	text "... ...Ejem, ¡so-"
	line "mos el Team"
	cont "Rocket!"
	cont "¡Tras tres años de"
	cont "preparación, hemos"
	cont "resurgido de nues-"
	cont "tras cenizas!"
	cont "¡Giovanni! ¿Nos"
	cont "oyes? ¡Lo hicimos!"
	cont "¿Dónde está nues-"
	cont "tro jefe? ¿Nos"
	cont "está escuchando?"

	para "Lira: El Team Roc-"
	line "ket ha ocupado la"

	para "Torre Radio ahora"
	line "mismo..."

	para "Tú estás allí,"
	line "pero también estás"
	cont "aquí..."
	done

GiovannisCaveGiovanniIMustGoText:
	text "Giovanni: Mis vie-"
	line "jos socios me"
	cont "necesitan..."

	para "¡No repetiremos el"
	line "fracaso de hace"
	cont "tres años!"

	para "¡El Team Rocket"
	line "renacerá!"

	para "Lira: ¡Ja!"
	line "¡<PLAYER> ya te ha"
	cont "detenido!"
	cont "...Te detendrá."

	para "¿Te habrá"
	line "detenido...?"

	para "...¡Viajar en el"
	line "tiempo es confuso!"

	para "Giovanni: ¡Basta"
	line "de cháchara! ¡A-"
	cont "pártate de mi"
	cont "camino!"
	done

GiovannisCaveGiovanniBeatenText:
	text "¿Qué demonios eres"
	line "tú?"
	done

GiovannisCaveGiovanniAfterText:
	text "Giovanni: ¿Cómo es"
	line "esto posible...?"

	para "¿Los últimos tres"
	line "años han sido en"
	cont "vano...?"

	para "¿Cómo puede un ni-"
	line "ño como tú lograr"

	para "destruir mi sueño"
	line "una vez más?"
	done

GiovannisCaveBroadcastAfterText:
	text "... ...¡Eh! ¿A"
	line "dónde ha ido"
	cont "Giovanni?"
	cont "Me pregunto si"
	cont "está escuchando"
	cont "nuestra emi-"
	cont "sión... ..."
	done

GiovannisCaveLyraFeelsSorryText:
	text "Lira: Siguen lla-"
	line "mando a su jefe."

	para "Siento pena de que"
	line "no sepan que no va"
	cont "a venir."

	para "¡Pero ahora mismo,"
	line "<PLAYER> ¡debes de"
	cont "estar venciéndo-"
	cont "los!"
	done

GiovannisCaveLyraWantsToLeaveText:
	text "Lira: ¡Otra vez"
	line "no...! ¡Ya tengo"
	cont "suficiente!"

	para "¡Por favor, déja-"
	line "nos volver a nues-"
	cont "tro tiempo!"
	done
