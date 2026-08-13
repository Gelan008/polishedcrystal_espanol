CeruleanCape_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CERULEANCAPE_NOOP
	scene_const SCENE_CERULEANCAPE_MISTYS_DATE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCapeFlyPoint

	def_warp_events
	warp_event  9,  5, BILLS_HOUSE, 1
	warp_event 38, 29, DIM_CAVE_2F, 1

	def_coord_events
	coord_event  4,  6, SCENE_CERULEANCAPE_MISTYS_DATE, CeruleanCapeDateInterruptedTrigger1
	coord_event  4,  7, SCENE_CERULEANCAPE_MISTYS_DATE, CeruleanCapeDateInterruptedTrigger2
	coord_event  9, 12, SCENE_CERULEANCAPE_MISTYS_DATE, CeruleanCapeDateInterruptedTrigger3

	def_bg_events
	bg_event  7,  5, BGEVENT_JUMPTEXT, BillsHouseSignText
	bg_event 27, 20, BGEVENT_ITEM + PEARL_STRING, EVENT_CERULEAN_CAPE_HIDDEN_PEARL_STRING
	bg_event 18,  3, BGEVENT_ITEM + BOTTLE_CAP, EVENT_CERULEAN_CAPE_HIDDEN_BOTTLE_CAP

	def_object_events
	object_event  8,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_CAPE_BOYFRIEND
	object_event  8, 10, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_CAPE_BOYFRIEND
	object_event 25,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermRomeo, -1
	object_event 41, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermMalcolm, -1
	object_event 25, 27, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermArmand, -1
	object_event 19, 12, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautyBridget, -1
	object_event  1, 21, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyVeronica, -1
	object_event  0, 27, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanCamus, -1
	object_event 41, 26, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanGeoffrey, -1
	object_event 16, 32, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfMorgan, -1
	object_event  7, 26, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerLadyJessica, -1
	object_event 32, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherLeroy, -1
	object_event -4, 8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_COOLTRAINER_M_BEFORE
	object_event -2, 8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CooltrainermKevinAfterBattleText, EVENT_ROUTE_25_COOLTRAINER_M_AFTER
	object_event 21, 19, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeruleanCapeSailboatText, -1
	object_event 21, 19, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeruleanCapeSailboatText, -1
	object_event 29, 11, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_ITEMBALL, PLAYEREVENT_ITEMBALL, SHELL_BELL, 1, EVENT_CERULEAN_CAPE_SHELL_BELL

	object_const_def
	const CERULEANCAPE_MISTY
	const CERULEANCAPE_BOYFRIEND

CeruleanCapeFlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN_CAPE
	endcallback

CeruleanCapeDateInterruptedTrigger1:
	showemote EMOTE_HEART, CERULEANCAPE_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, CERULEANCAPE_BOYFRIEND, 10
	turnobject CERULEANCAPE_MISTY, DOWN
	applyonemovement CERULEANCAPE_BOYFRIEND, big_step_down
	disappear CERULEANCAPE_BOYFRIEND
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject CERULEANCAPE_MISTY, UP
	pause 5
	applymovement CERULEANCAPE_MISTY, Route25MistyApproachesPlayerMovement1
	showtext Route25MistyDateText
	applymovement CERULEANCAPE_MISTY, Route25MistyLeavesPlayerMovement1
	sjumpfwd CeruleanCapeDateFinishScript

CeruleanCapeDateInterruptedTrigger2:
	showemote EMOTE_HEART, CERULEANCAPE_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, CERULEANCAPE_BOYFRIEND, 10
	turnobject CERULEANCAPE_MISTY, DOWN
	applymovement CERULEANCAPE_BOYFRIEND, Route25MistysDateLeavesMovement2
	disappear CERULEANCAPE_BOYFRIEND
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject CERULEANCAPE_MISTY, UP
	pause 5
	applymovement CERULEANCAPE_MISTY, Route25MistyApproachesPlayerMovement2
	showtext Route25MistyDateText
	applymovement CERULEANCAPE_MISTY, Route25MistyLeavesPlayerMovement2
CeruleanCapeDateFinishScript:
	turnobject PLAYER, LEFT
	applymovement CERULEANCAPE_MISTY, Route25MistyLeavesMovement
	disappear CERULEANCAPE_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_CERULEANCAPE_NOOP
	special RestartMapMusic
	end

CeruleanCapeDateInterruptedTrigger3:
	showemote EMOTE_HEART, CERULEANCAPE_MISTY, 15
	pause 30
	turnobject CERULEANCAPE_BOYFRIEND, DOWN
	showemote EMOTE_SHOCK, CERULEANCAPE_BOYFRIEND, 10
	turnobject CERULEANCAPE_MISTY, DOWN
	applymovement CERULEANCAPE_BOYFRIEND, .RunAwayMovement1
	turnobject CERULEANCAPE_MISTY, UP
	applymovement CERULEANCAPE_BOYFRIEND, .RunAwayMovement2
	disappear CERULEANCAPE_BOYFRIEND
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject CERULEANCAPE_MISTY, DOWN
	pause 5
	applymovement CERULEANCAPE_MISTY, .ApproachMovement
	showtext Route25MistyDateText
	applymovement CERULEANCAPE_MISTY, .LeaveMovement
	disappear CERULEANCAPE_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_CERULEANCAPE_NOOP
	special RestartMapMusic
	end

.RunAwayMovement1:
	big_step_right
	big_step_up
	step_end

.RunAwayMovement2:
	big_step_up
	big_step_up
	step_end

.ApproachMovement:
	step_right
	step_down
	step_down
	step_end

.LeaveMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

GenericTrainerSwimmermRomeo:
	generictrainer SWIMMERM, ROMEO, EVENT_BEAT_SWIMMERM_ROMEO, .SeenText, .BeatenText

	text "Ser un buen Nado-"
	line "dor no me hace un"

	para "buen entrenador..."
	done

.SeenText:
	text "¡Admira mi forma!"
	line "¡Mi victoria está"
	cont "asegurada!"
	done

.BeatenText:
	text "¡Oh! ¿Eso es todo?"
	done

TrainerSwimmermMalcolm:
	trainer SWIMMERM, MALCOLM, EVENT_BEAT_SWIMMERM_MALCOLM, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERM

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "No me digas, vi-"
	line "sitas muchos Gim-"

	para "nasios #mon,"
	line "¿verdad?"
	done

.SeenText:
	text "Mis #mon y yo"
	line "nadamos juntos,"

	para "¡pero también"
	line "luchamos!"
	done

.BeatenText:
	text "Ojalá fuera tan"
	line "fuerte como tú."
	done

GenericTrainerSwimmermArmand:
	generictrainer SWIMMERM, ARMAND, EVENT_BEAT_SWIMMERM_ARMAND, .SeenText, .BeatenText

	text "Esa chica de la"
	line "orilla... Su mú-"
	cont "sica es buena, ¡pe-"

	para "ro distrae a los"
	line "#mon!"
	done

.SeenText:
	text "Uf. ¿Podría esa"
	line "Guitarrista de la"

	para "orilla bajar un"
	line "poco el volumen?"
	done

.BeatenText:
	text "¡La guitarra me ha"
	line "despistado!"
	done

GenericTrainerBeautyBridget:
	generictrainer BEAUTY, BRIDGET, EVENT_BEAT_BEAUTY_BRIDGET, .SeenText, .BeatenText

	text "Creo que las vis-"
	line "tas aquí son her-"
	cont "mosas. ¿Verdad?"
	done

.SeenText:
	text "¡Eh! ¡Me estás ta-"
	line "pando las vistas!"
	done

.BeatenText:
	text "Solo intentaba dis-"
	line "frutar las vis-"
	cont "tas..."
	done

GenericTrainerBeautyVeronica:
	generictrainer BEAUTY, VERONICA, EVENT_BEAT_BEAUTY_VERONICA, .SeenText, .BeatenText

	text "¡Trátame mal y te"
	line "mandaré a paseo!"

	para "Debe ser por eso"
	line "que estoy soltera."
	cont "...¡Jaja!"
	done

.SeenText:
	text "No suelo tener ci-"
	line "tas, pero cuando"

	para "las tengo, el Cabo"
	line "Celeste es perfec-"
	cont "to."
	done

.BeatenText:
	text "Trátalos mal, man-"
	line "tenlos atentos,"
	cont "¿no?"
	done

GenericTrainerGentlemanCamus:
	generictrainer GENTLEMAN, CAMUS, EVENT_BEAT_GENTLEMAN_CAMUS, .SeenText, .BeatenText

	text "Una vez fui un en-"
	line "trenador de ta-"
	cont "lento,"

	para "pero ahora solo"
	line "soy un viejo inútil."

	para "Disfruta mientras"
	line "aún eres joven."
	done

.SeenText:
	text "Verte me recuerda"
	line "a mi propia y"
	cont "alocada juventud."
	done

.BeatenText:
	text "¡Qué combate tan"
	line "alocado!"
	done

GenericTrainerGentlemanGeoffrey:
	generictrainer GENTLEMAN, GEOFFREY, EVENT_BEAT_GENTLEMAN_GEOFFREY, .SeenText, .BeatenText

	text "A veces un cambio"
	line "es tan bueno como"
	cont "un descanso."

	para "¡Me siento tan re-"
	line "novado!"
	done

.SeenText:
	text "¡Quería un cambio,"
	line "así que me metí"
	cont "en los #mon!"
	done

.BeatenText:
	text "A pesar de mi"
	line "edad, aún soy un"
	cont "principiante."
	done

GenericTrainerGuitaristfMorgan:
	generictrainer GUITARISTF, MORGAN, EVENT_BEAT_GUITARISTF_MORGAN, .SeenText, .BeatenText

	text "¡Los acantilados"
	line "hacen del Cabo una"
	cont "caja de resonan-"
	cont "cia perfecta!"
	done

.SeenText:
	text "¡Escucha esa"
	line "reverberación!"
	done

.BeatenText:
	text "¡Qué combate tan"
	line "rockero!"
	done

TrainerLadyJessica:
	trainer LADY, JESSICA, EVENT_BEAT_LADY_JESSICA, .SeenText, .BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_SPOKE_TO_LADY_JESSICA
	iftruefwd .SpokeAgain
	writetext .AfterText1
	setevent EVENT_SPOKE_TO_LADY_JESSICA
	waitendtext

.SpokeAgain:
	writetext .AfterText2
	clearevent EVENT_SPOKE_TO_LADY_JESSICA
	waitendtext

.SeenText:
	text "¡Ah! ¡Tú!"
	line "¿Quieres luchar"
	cont "conmigo?"
	done

.BeatenText:
	text "¡Oh no! ¡Me he"
	line "mojado el vesti-"
	cont "do!"
	done

.AfterText1:
	text "Tendré que com-"
	line "prar un #mon"
	cont "mejor..."
	cont "......"
	cont "Y un vestido"
	cont "nuevo..."
	done

.AfterText2:
	text "¿Por qué sigues"
	line "aquí?"

	para "¡Deja de mirar-"
	line "me!"
	cont "......"
	cont "¡Asqueroso!"
	done

GenericTrainerFisherLeroy:
	generictrainer FISHER, LEROY, EVENT_BEAT_FISHER_LEROY, .SeenText, .BeatenText

	text "Todo lo que atra-"
	line "po son Magikarp..."

	para "Al menos todos tie-"
	line "nen un aspecto ú-"
	cont "nico."
	done

.SeenText:
	text "No dejo de atrapar"
	line "al mismo #mon..."

	para "Quizás un combate"
	line "haga que cambie mi"
	cont "suerte."
	done

.BeatenText:
	text "Nada me sale bien"
	line "últimamente..."
	done

Route25MistysDateLeavesMovement2:
	run_step_down
	run_step_down
	step_end

Route25MistyApproachesPlayerMovement1:
	step_up
Route25MistyApproachesPlayerMovement2:
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end

Route25MistyLeavesPlayerMovement1:
	step_down
	step_left
	step_end

Route25MistyLeavesPlayerMovement2:
	step_up
	step_left
	step_end

Route25MistyLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route25MistyDateText:
	text "Misty: ¡Uf! ¿Por"
	line "qué tienes que"

	para "aparecer y moles-"
	line "tarnos ahora?"

	para "¿Sabes cómo lla-"
	line "man a la gente co-"
	cont "mo tú?"

	para "¡Plasta! ¡Has oí-"
	line "do bien, plasta!"

	para "..."

	para "...¿Oh? Esas Me-"
	line "dallas... ¿Son de"
	cont "Gimnasios de"
	cont "Johto?"

	para "Si tienes ocho,"
	line "debes ser bueno."

	para "Vale. Ven al Gim-"
	line "nasio de Celeste."

	para "Estaré encantada"
	line "de enfrentarme a"
	cont "ti."

	para "Soy Misty, la Lí-"
	line "der del Gimnasio"
	cont "de Celeste."
	done

BillsHouseSignText:
	text "Casa del Mar"
	line "Casa de Bill"
	done

CeruleanCapeSailboatText:
	text "Es un velero"
	line "llamado Amistad."
	done
