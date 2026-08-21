WiseTriosRoom_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomCallback

	def_warp_events
	warp_event  7,  4, BELLCHIME_TRAIL, 1
	warp_event  7,  5, BELLCHIME_TRAIL, 2
	warp_event  1,  4, ECRUTEAK_HOUSE, 5

	def_coord_events
	coord_event  7,  4, 0, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage1Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage2Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage3Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerElderGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerElderMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerElderKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2

	object_const_def
	const WISETRIOSROOM_ELDER1
	const WISETRIOSROOM_ELDER2
	const WISETRIOSROOM_ELDER3
	const WISETRIOSROOM_ELDER4
	const WISETRIOSROOM_ELDER5
	const WISETRIOSROOM_ELDER6

WiseTriosRoomCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftruefwd .WiseTrio2
	checkkeyitem CLEAR_BELL
	iftruefwd .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_ELDER3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_ELDER3, 20
	follow PLAYER, WISETRIOSROOM_ELDER3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	showtext WiseTriosRoomSage3BlocksExitText
	applymovement WISETRIOSROOM_ELDER3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_ELDER3, LEFT
	end

TrainerElderGaku:
	trainer ELDER, GAKU, EVENT_BEAT_ELDER_GAKU, ElderGakuSeenText, ElderGakuBeatenText, 0, ElderGakuScript

ElderGakuScript:
	jumptext SageGakuAfterBattleText

TrainerElderMasa:
	trainer ELDER, MASA, EVENT_BEAT_ELDER_MASA, ElderMasaSeenText, ElderMasaBeatenText, 0, ElderMasaScript

ElderMasaScript:
	jumptext SageMasaAfterBattleText

TrainerElderKoji:
	trainer ELDER, KOJI, EVENT_BEAT_ELDER_KOJI, ElderKojiSeenText, ElderKojiBeatenText, 0, ElderKojiScript

ElderKojiScript:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue_jumptext SageKojiAfterBattleFinalText
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_ELDER6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_ELDER6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_ELDER6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene $1
	end

WiseTriosRoomSageBlocksPlayerMovement:
	step_left
	step_left
	step_end

WiseTriosRoomSageReturnsMovement:
	step_right
	step_down
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step_right
	step_down
	step_end

WiseTriosRoomSage1Text:
	text "Asombroso…"

	para "¡Suicune, Entei y"
	line "Raikou despertaron"
	cont "de su largo sueño!"

	para "¿Se cumplirá al"
	line "fin la leyenda?"
	done

WiseTriosRoomSage2Text:
	text "Entrenamos en la"
	line "Torre Quemada,"
	cont "pero nunca antes"
	cont "hubo un boquete."

	para "Alguien debió de"
	line "haberlo hecho a"
	cont "propósito."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Solo pueden entrar"
	line "a Torre Hojalata"
	cont "quienes porten la"
	cont "Medalla Niebla."

	para "Mas ahora que los"
	line "tres legendarios"
	cont "han despertado,"
	cont "¡no debes pasar!"
	done

WiseTriosRoomSage3Text:
	text "Nosotros, los Tres"
	line "Sabios, somos los"
	cont "custodios de los"
	cont "#mon"
	cont "legendarios."
	done

ElderGakuSeenText:
	text "La leyenda dice"
	line "que si surge un"
	cont "entrenador con"
	cont "un alma pura,"

	para "un #mon vendrá"
	line "para probarlo en"
	cont "la Torre Hojalata."

	para "¡La leyenda se ha"
	line "hecho realidad!"

	para "¡El legendario"
	line "Suicune ya está"
	cont "aquí!"

	para "¡Los Tres Sabios"
	line "probaremos tu"
	cont "valía!"
	done

ElderGakuBeatenText:
	text "¿Más fuerte de lo"
	line "pensado? Quizá…"
	done

SageGakuAfterBattleText:
	text "Ah, so it is you"
	line "who claim to have"

	para "seen Suicune,"
	line "Entei and Raikou"
	cont "while they slept?"

	para "Unbelievable!"

	para "Legend has it that"
	line "they can't be seen"
	cont "while they sleep…"
	done

ElderMasaSeenText:
	text "¿Podemos confiarte"
	line "la verdad?"

	para "Debo comprobar"
	line "tu valía."
	done

ElderMasaBeatenText:
	text "…Te diré la"
	line "verdad…"
	done

SageMasaAfterBattleText:
	text "In the past, there"
	line "were two nine-tier"
	cont "towers here."

if DEF(FAITHFUL)
	para "The Brass Tower,"
else
	para "The Gong Tower,"
endc
	line "which was said to"

	para "waken #mon, and"
	line "the Bell Tower,"

	para "where #mon were"
	line "said to rest."

	para "The view from the"
	line "tops of the towers"

	para "must have been"
	line "magnificent."

	para "At the time, an"
	line "immense, silver-"

	para "colored #mon"
	line "was said to make"

	para "its roost atop the"
if DEF(FAITHFUL)
	line "Brass Tower."
else
	line "Gong Tower."
endc

	para "However…"

	para "About 150 years"
	line "ago, a lightning"

	para "bolt struck one of"
	line "the towers."

	para "It was engulfed in"
	line "flames that raged"
	cont "for three days."

	para "A sudden downpour"
	line "finally put out"
	cont "the blaze."

	para "And that is how"
	line "the Burned Tower"
	cont "came to be."
	done

ElderKojiSeenText:
	text "¡Déjame ver tu"
	line "fuerza!"
	done

ElderKojiBeatenText:
	text "¡Demasiado fuerte!"
	line "¿Por qué?"
	done

SageKojiAfterBattleQuestionText:
	text "Tú… ¿Eres quien"
	line "esperan los"
	cont "#mon"
	cont "legendarios?"
	done

SageKojiAfterBattleSpeechText:
	text "Ya veo…"

	para "A los Tres Sabios"
	line "se nos encomendó"
	cont "proteger a los"
	cont "#mon"
	cont "legendarios."

	para "Solo abrimos el"
	line "paso a quienes"
	cont "posean poder y un"
	cont "alma sincera."

	para "Por favor, entra"
	line "a Torre Hojalata."

	para "Suicune te pondrá"
	line "a prueba."
	done

SageKojiAfterBattleFinalText:
	text "Por favor, sigue"
	line "adelante."

	para "Suicune te pondrá"
	line "a prueba."
	done
