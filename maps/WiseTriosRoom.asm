WiseTriosRoom_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_const SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomCallback

	def_warp_events
	warp_event  7,  4, BELLCHIME_TRAIL, 1
	warp_event  7,  5, BELLCHIME_TRAIL, 2
	warp_event  1,  4, ECRUTEAK_HOUSE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage1Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage2Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WiseTriosRoomSage3Text, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerElderGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerElderMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerElderKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2

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
	trainer ELDER, GAKU, EVENT_BEAT_ELDER_GAKU, ElderGakuSeenText, ElderGakuBeatenText, 0, .Script, TRAINERPAL_GAKU

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¡Ah, conque tú"
	line "dices haber visto"
	cont "a Suicune, Entei y"
	cont "Raikou durmiendo!"

	para "¡Increíble!"

	para "La leyenda dice"
	line "que nadie puede"
	cont "verlos mientras"
	cont "duermen…"
	done

TrainerElderMasa:
	trainer ELDER, MASA, EVENT_BEAT_ELDER_MASA, ElderMasaSeenText, ElderMasaBeatenText, 0, .Script, TRAINERPAL_MASA

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Antaño, aquí se"
	line "alzaban dos torres"
	cont "de nueve pisos."

if DEF(FAITHFUL)
	para "La Torre Latón,"
else
	para "La Torre Latón,"
endc
	line "donde se decía que"
	cont "despertaban los"
	cont "#mon, y la"

if DEF(FAITHFUL)
	para "Torre Hojalata,"
else
	para "Torre Hojalata,"
endc
	line "donde decían que"
	cont "descansaban."

	para "La vista desde lo"
	line "alto de las torres"
	cont "debía de ser"
	cont "magnífica."

	para "En aquel tiempo,"
	line "un inmenso #mon"
	cont "de color plateado"
	cont "anidaba en la cima"

if DEF(FAITHFUL)
	para "de la Torre Latón."
else
	para "de la Torre Latón."
endc

	para "Sin embargo…"

	para "Hace unos 150"
	line "años, un rayo cayó"
	cont "en una de las"
	cont "torres."

	para "El fuego ardió"
	line "durante tres días."

	para "Un repentino"
	line "chaparrón apagó"
	cont "por fin el fuego."

	para "Y así nació la"
	line "Torre Quemada."
	done

TrainerElderKoji:
	trainer ELDER, KOJI, EVENT_BEAT_ELDER_KOJI, ElderKojiSeenText, ElderKojiBeatenText, 0, .Script, TRAINERPAL_KOJI

.Script:
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
	setscene SCENE_WISETRIOSROOM_NOOP
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
