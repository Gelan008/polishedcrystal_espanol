RocketHideoutB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RocketHideoutB1FDoorScript

	def_warp_events
	warp_event 15,  2, ROCKET_HIDEOUT_B2F, 1
	warp_event 13,  2, CELADON_GAME_CORNER, 3
	warp_event 16, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 13, 24, ROCKET_HIDEOUT_B2F, 4
	warp_event 17, 19, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 13, 15, BGEVENT_ITEM + MAX_REVIVE, EVENT_ROCKET_HIDEOUT_B1F_HIDDEN_MAX_REVIVE

	def_object_events
	object_event 20, 18, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, RocketHideoutB1FBlackBeltRylan, -1
	object_event  4,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, RocketHideoutB1FScientistSanders, -1
	object_event 18,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, RocketHideoutB1FPicnickerZane, -1
	object_event 12, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, RocketHideoutB1FBattleGirlSasha, -1
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, RocketHideoutB1FLassMavis, -1
	itemball_event  1, 17, MOON_STONE, 1, EVENT_ROCKET_HIDEOUT_B1F_MOON_STONE
	itemball_event  3, 14, ZINC, 1, EVENT_ROCKET_HIDEOUT_B1F_ZINC

RocketHideoutB1FDoorScript:
	checkevent EVENT_BEAT_BLACKBELT_RYLAN
	iftruefwd .DoorOpen
	changeblock 16, 16, $06
.DoorOpen
	endcallback

RocketHideoutB1FBlackBeltRylan:
	trainer BLACKBELT_T, RYLAN, EVENT_BEAT_BLACKBELT_RYLAN, .SeenText, .BeatenText, 0, .AfterScript

.Script:
	checkevent EVENT_BEAT_BLACKBELT_RYLAN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.SeenText:
	text "En el Equipo Va-"
	line "lor, superamos"
	cont "nuestros límites."

	para "¡La fuerza es lo"
	line "único que importa!"
	done

.AfterScript
	checkjustbattled
	iffalsefwd .AfterText
	changeblock 16, 16, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end

.AfterText
	jumptextfaceplayer .Text
	end

.Text
	text "Tienes agallas…"

	para "Quizá deberías"
	line "unirte al Equipo"
	cont "Valor."
	done

.BeatenText:
	text "Tu fuerza es"
	line "superior…"
	done

RocketHideoutB1FScientistSanders:
	generictrainer SCIENTIST, SANDERS, EVENT_BEAT_SCIENTIST_SANDERS, .SeenText, .BeatenText

	text "Blanche destaca en"
	line "estrategia."

	para "Decide dónde nos"
	line "destina."
	done

.SeenText:
	text "El Equipo Sabidu-"
	line "ría valora la es-"
	cont "trategia."

	para "Solo una mente"
	line "fuerte ganaría"
	cont "aquí."
	done

.BeatenText:
	text "¡Tus tácticas son"
	line "impecables!"
	done

RocketHideoutB1FPicnickerZane:
	generictrainer PICNICKER, ZANE, EVENT_BEAT_PICNICKER_ZANE, .SeenText, .BeatenText

	text "Spark quedaría"
	line "impresionado."

	para "¡A ver si puedes"
	line "seguir adelante!"
	done

.SeenText:
	text "En el Equipo Ins-"
	line "tinto confiamos en"
	cont "la intuición."

	para "¡Sin pensar, solo"
	line "actúa!"
	done

.BeatenText:
	text "Tienes una buena"
	line "chispa, sí."

	para "¡Manténla viva!"
	done

RocketHideoutB1FBattleGirlSasha:
	generictrainer BATTLE_GIRL, SASHA, EVENT_BEAT_BATTLE_GIRL_SASHA, .SeenText, .BeatenText

	text "La llama de Valor"
	line "arde en tu inte-"
	cont "rior."

	para "La prueba de Can-"
	line "dela medirá tus"
	cont "límites."
	done

.SeenText:
	text "El Equipo Valor es"
	line "pura pasión y"
	cont "riesgo."

	para "¿Crees que puedes"
	line "igualar mi inten-"
	cont "sidad?"
	done

.BeatenText:
	text "Tu llama…"
	line "¡Brilla demasiado!"
	done

RocketHideoutB1FLassMavis:
	generictrainer LASS, MAVIS, EVENT_BEAT_LASS_MAVIS, .SeenText, .BeatenText

	text "Los combates de"
	line "Spark son imprede-"
	cont "cibles."

	para "¡Por eso varío"
	line "mis tácticas!"
	done

.SeenText:
	text "¿Mi estrategia?"

	para "¡Puro instinto y"
	line "nada más!"
	done

.BeatenText:
	text "Tu instinto es"
	line "mejor que el mío."
	done
