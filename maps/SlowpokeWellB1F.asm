SlowpokeWellB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 15, SLOWPOKE_WELL_ENTRANCE, 2
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_PROTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerProton2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  0, 17, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, end, NULL, EVENT_SLOWPOKE_WELL_KURT
	object_event  7,  4, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	strengthboulder_event  3, 2
	itemball_event 10,  3, SUPER_POTION, 1, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION

	object_const_def
	const SLOWPOKEWELLB1F_PROTON
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_KURT

GenericTrainerGruntM29:
	generictrainer GRUNTM, 29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText

	text "Sure, we've been"
	line "hacking the tails"

	para "off Slowpoke and"
	line "selling them."

	para "Everything we do"
	line "is for profit."

	para "That's right!"
	line "We're Team Rocket,"

	para "and we'll do any-"
	line "thing for money!"
	done

TrainerProton2:
	trainer PROTON, PROTON2, EVENT_BEAT_PROTON_2, Proton2SeenText, Proton2BeatenText, 0, Proton2Script

Proton2Script:
	showtext TrainerProton2WhenTalkText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_PROTON
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special Special_FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	showtext KurtLeaveSlowpokeWellText
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	setmapscene ILEX_FOREST, $2
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

GenericTrainerGruntM2:
	generictrainer GRUNTM, 2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText

	text "We need the money,"
	line "but selling Slow-"
	cont "pokeTails?"

	para "It's tough being a"
	line "Rocket Grunt!"
	done

GenericTrainerGruntF1:
	generictrainer GRUNTF, 1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText

	text "SlowpokeTails"
	line "grow back fast!"

	para "What's wrong with"
	line "selling them?"
	done

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue_jumpopenedtext SlowpokeWellB1FSlowpokeMailText
	endtext

SlowpokeWellB1FTaillessSlowpokeScript:
	showcrytext SlowpokeWellB1FTaillessSlowpokeText, SLOWPOKE
	end

KurtSlowpokeWellVictoryMovementData:
	step_left
	step_left
	step_left
	step_left
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_left
	step_up
	step_up
	step_sleep_8
	step_sleep_8
	step_sleep_8
	turn_head_left
	step_end

KurtLeaveSlowpokeWellText:
	text "César: ¡Muy bien"
	line "hecho, <PLAYER>!"

	para "El Team Rocket ha"
	line "huido de aquí."

	para "Mi espalda ya está"
	line "mucho mejor."
	cont "¡Vámonos a casa!"
	done

GruntM29SeenText:
	text "¡Maldita sea!"
	line "Montaba guardia"
	cont "arriba cuando un"
	cont "loco me gritó."

	para "¡Me asustó tanto"
	line "que me caí hasta"
	cont "aquí abajo!"

	para "¡Pagarás por ello"
	line "en este combate!"
	done

GruntM29BeatenText:
	text "¡Arrgh! ¡No es"
	line "mi día!"
	done

Proton2SeenText:
	text "¿Qué quieres?"

	para "Dicen que soy el"
	line "tipo más duro y"
	cont "cruel del Team"
	cont "Rocket…"

	para "¡Si interrumpes el"
	line "trabajo, no tendré"
	cont "piedad!"
	done

Proton2BeatenText:
	text "Hoy te has lucido,"
	line "¡pero espera a la"
	cont "próxima vez!"
	done

TrainerProton2WhenTalkText:
	text "Sí, el Team Rocket"
	line "se disolvió hace"
	cont "tres años."

	para "¡Pero seguimos con"
	line "nuestro trabajo"
	cont "en las sombras!"

	para "¡Prepárate para"
	line "ver cómo causamos"
	cont "más problemas!"
	done

GruntM2SeenText:
	text "¿Dejar de robar"
	line "Colas Slowpoke?"

	para "¡Si te hiciéramos"
	line "caso, arruinamos"
	cont "la reputación del"
	cont "Team Rocket!"
	done

GruntM2BeatenText:
	text "Eres…"
	line "Demasiado fuerte…"
	done

GruntF1SeenText:
	text "¿Dejar de robar"
	line "Colas Slowpoke?"

	para "¡Intenta vencer a"
	line "todos nosotros!"
	done

GruntF1BeatenText:
	text "¡Mocoso asqueroso!"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Un Slowpoke al que"
	line "le han cortado la"
	cont "cola…"

	para "¿Eh? Tiene una"
	line "Carta. ¿Leerla?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> lee la"
	line "Carta."

	para "Sé buena y cuida"
	line "de la casa junto"
	cont "al abuelo y a"
	cont "Slowpoke."

	para "Con cariño, Papá"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Un Slowpoke al que"
	line "le han cortado la"
	cont "cola…"
	done
