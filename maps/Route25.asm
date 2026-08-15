Route25_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 30,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, EVENT_ROUTE_25_COOLTRAINER_M_BEFORE
	object_event 32,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CooltrainermKevinAfterBattleText, EVENT_ROUTE_25_COOLTRAINER_M_AFTER
	object_event  7, 11, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyDudley, -1
	object_event 11,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassEllen, -1
	object_event 14, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyJoe, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassLaura, -1
	object_event 18,  9, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperLloyd, -1
	object_event 22, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassShannon, -1
	object_event 25,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdPat, -1
	itemball_event 25,  4, PROTEIN, 1, EVENT_ROUTE_25_PROTEIN
	cuttree_event 28,  6, EVENT_ROUTE_25_CUT_TREE
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route25MewYoungsterText, -1
	object_event 21,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, Route25SlowpokeScript, -1

	object_const_def
	const ROUTE25_COOLTRAINERM_BEFORE
	const ROUTE25_COOLTRAINERM_AFTER

GenericTrainerSchoolboyDudley:
	generictrainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText

	text "Hice lo que pude."
	line "No me arrepiento."
	done

GenericTrainerLassEllen:
	generictrainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText

	text "Hice lo que pude."
	line "No me arrepiento."
	done

GenericTrainerSchoolboyJoe:
	generictrainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText

	text "Hice lo que pude."
	line "No me arrepiento."
	done

GenericTrainerLassLaura:
	generictrainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText

	text "Hice lo que pude."
	line "No me arrepiento."
	done

GenericTrainerCamperLloyd:
	generictrainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText

	text "Hice lo que pude."
	line "No me arrepiento."
	done

GenericTrainerLassShannon:
	generictrainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText

	text "Hice lo que pude."
	line "No me arrepiento."
	done

GenericTrainerSupernerdPat:
	generictrainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText

	text "Perdón… No volveré"
	line "a hacer trampas…"
	done

Route25SlowpokeScript:
	opentext
	writetext Route25SlowpokeText1
	pause 60
	writetext Route25SlowpokeText2
	cry SLOWPOKE
	waitendtext

TrainerCooltrainermKevin:
	checkevent EVENT_BEAT_SUPER_NERD_PAT
	iffalse_jumptextfaceplayer NuggetBridgeNotClearedText
	faceplayer
	opentext
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftruefwd .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse_endtext
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	follow ROUTE25_COOLTRAINERM_BEFORE, PLAYER
	applymovement ROUTE25_COOLTRAINERM_BEFORE, Route25CooltrainerMovementData
	stopfollow
	turnobject ROUTE25_COOLTRAINERM_BEFORE, LEFT
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	disappear ROUTE25_COOLTRAINERM_BEFORE
	appear ROUTE25_COOLTRAINERM_AFTER
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	jumptext CooltrainermKevinAfterBattleText

Route25CooltrainerMovementData:
	step_right
	step_right
	step_end

SchoolboyDudleySeenText:
	text "¡Gana a los seis"
	line "entrenadores para"
	cont "un gran premio!"

	para "¿Crees que podrás"
	line "conseguir algo así?"
	done

SchoolboyDudleyBeatenText:
	text "¡Uau! Qué pasada."
	done

LassEllenSeenText:
	text "Soy la segunda."
	line "¡Esto va en serio!"
	done

LassEllenBeatenText:
	text "¿Cómo he podido"
	line "perder?"
	done

SchoolboyJoeSeenText:
	text "¡Llega el número 3!"
	line "No será fácil."
	done

SchoolboyJoeBeatenText:
	text "¡Ay! ¡Me has he-"
	line "cho papilla!"
	done

LassLauraSeenText:
	text "¡Soy la número 4!"
	line "¿Te estás cansando?"
	done

LassLauraBeatenText:
	text "Yo también perdí…"
	done

CamperLloydSeenText:
	text "¡Vale! Soy el nú-"
	line "mero 5. ¡Te voy a"
	cont "aplastar!"
	done

CamperLloydBeatenText:
	text "¡Uf! Demasiado."
	done

LassShannonSeenText:
	text "¡Soy la última, pe-"
	line "ro te aseguro que"
	cont "soy la más dura!"
	done

LassShannonBeatenText:
	text "Es una broma…"
	done

SupernerdPatSeenText:
	text "Mufufufu…"

	para "No tengo nada que"
	line "ver con los seis"
	cont "entrenadores."

	para "He esperado aquí"
	line "a que estuvieras"

	para "sin fuerzas tras"
	line "tantos combates."
	done

SupernerdPatBeatenText:
	text "¿Es que no estás"
	line "sin fuerzas?"
	done

Route25MewYoungsterText:
	text "¡Una vez vi a un"
	line "Mew por aquí!"

	para "¿No me crees? ¡Pues"
	line "Slowpoke también"
	cont "lo vio!"
	done

Route25SlowpokeText1:
	text "Slowpoke: …"

	para "…… …… ……"
	done

Route25SlowpokeText2:
	text "…… …… ¿Bostezo?"
	done

CooltrainermKevinNuggetText:
	text "Luchaste un comba-"
	line "te más de lo que"

	para "esperabas, pero"
	line "ganaste igualmente."

	para "Como prometí, aquí"
	line "tienes tu premio."
	done

CooltrainermKevinSeenText:
	text "Pero viendo cómo"
	line "luchas, quiero ver"

	para "cómo me desenvuel-"
	line "vo yo."

	para "¿Qué me dices?"
	line "Permíteme luchar."
	done

CooltrainermKevinBeatenText:
	text "¡Jamás tuve un com-"
	line "bate tan bueno!"
	done

CooltrainermKevinAfterBattleText:
	text "¡Menudo combate"
	line "tan genial!"

	para "¡Tus #mon y tú"
	line "sois asombrosos!"
	done

NuggetBridgeNotClearedText:
	text "¡Buenas!"

	para "Seis entrenadores"
	line "y yo organizamos"

	para "un desafío en"
	line "esta ruta."

	para "¡No te los puedes"
	line "saltar!"

	para "Abajo hay un ata-"
	line "jo para volver a"
	cont "la Ruta 24."
	done
