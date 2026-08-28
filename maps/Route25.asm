Route25_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 30,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, EVENT_ROUTE_25_COOLTRAINER_M_BEFORE
	object_event 32,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CooltrainermKevinAfterBattleText, EVENT_ROUTE_25_COOLTRAINER_M_AFTER
	object_event  7,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyDudley, -1
	object_event 11,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassEllen, -1
	object_event 14,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSchoolboyJoe, -1
	object_event 12,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassLaura, -1
	object_event 18,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperLloyd, -1
	object_event 22,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassShannon, -1
	object_event 25,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdPat, -1
	itemball_event 25,  2, PROTEIN, 1, EVENT_ROUTE_25_PROTEIN
	cuttree_event 28,  4, EVENT_ROUTE_25_CUT_TREE
	object_event 20,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route25MewYoungsterText, -1
	object_event 21,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, Route25SlowpokeScript, -1

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
	text "¡Vence a los seis"
	line "entrenadores para"
	cont "un gran premio!"

	para "¿Crees que podrás?"
	done

SchoolboyDudleyBeatenText:
	text "¡Uau! Qué pasada."
	done

LassEllenSeenText:
	text "Soy la número 2."
	line "¡Esto va en serio!"
	done

LassEllenBeatenText:
	text "¿Cómo he podido"
	line "perder?"
	done

SchoolboyJoeSeenText:
	text "¡Soy el número 3!"
	line "No será fácil."
	done

SchoolboyJoeBeatenText:
	text "¡Ay! ¡Me hiciste"
	line "papilla!"
	done

LassLauraSeenText:
	text "¡Soy la número 4!"
	line "¿Te has cansado?"
	done

LassLauraBeatenText:
	text "Yo también perdí…"
	done

CamperLloydSeenText:
	text "¡Soy el número 5!"
	line "¡Te voy a ganar!"
	done

CamperLloydBeatenText:
	text "¡Uf! Demasiado."
	done

LassShannonSeenText:
	text "¡Soy la última!"
	line "¡Y la más dura!"
	done

LassShannonBeatenText:
	text "Es una broma…"
	done

SupernerdPatSeenText:
	text "Mufufu…"

	para "No tengo nada que"
	line "ver con los seis"
	cont "entrenadores."

	para "Esperé a que te"
	line "quedaras sin"
	cont "fuerzas."
	done

SupernerdPatBeatenText:
	text "¿Es que aún te"
	line "quedan fuerzas?"
	done

Route25MewYoungsterText:
	text "¡Una vez vi a un"
	line "Mew por aquí!"

	para "¿No me crees?"
	line "¡Pues Slowpoke"
	cont "también lo vio!"
	done

Route25SlowpokeText1:
	text "Slowpoke: …"

	para "…… …… ……"
	done

Route25SlowpokeText2:
	text "…… …… ¿Bostezo?"
	done

CooltrainermKevinNuggetText:
	text "Luchaste un duelo"
	line "más de la cuenta,"
	cont "pero ganaste."

	para "Como prometí, aquí"
	line "tienes tu premio."
	done

CooltrainermKevinSeenText:
	text "Al ver cómo peleas"
	line "quiero probar mi"
	cont "propia fuerza."

	para "¿Qué me dices?"
	line "Permíteme luchar."
	done

CooltrainermKevinBeatenText:
	text "¡Qué gran combate!"
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
	cont "un desafío aquí."

	para "¡No te los puedes"
	line "saltar!"

	para "Abajo tienes un"
	line "atajo para volver"
	cont "a la Ruta 24."
	done
