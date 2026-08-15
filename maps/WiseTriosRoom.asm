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
	line "afirmas haber"

	para "visto a Suicune,"
	line "Entei y Raikou"
	cont "mientras dormían!"

	para "¡Increíble!"

	para "La leyenda dice"
	line "que no se les pue-"
	cont "de ver mientras"
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
	para "La Torre Campana,"
endc
	line "donde se decía que"

	para "despertaban los"
	line "#mon, y la"

	para "Torre Hojalata,"
	line "donde decían que"
	cont "descansaban."

	para "La vista desde lo"
	line "alto de las torres"

	para "debía de ser"
	line "magnífica."

	para "En aquel tiempo,"
	line "un inmenso #mon"

	para "de color plateado"
	line "anidaba en la cima"

	para "de la"
if DEF(FAITHFUL)
	line "Torre Hojalata."
else
	line "Torre Hojalata."
endc

	para "Sin embargo…"

	para "Hace unos 150"
	line "años, un rayo al-"

	para "canzó una de las"
	line "torres."

	para "Fue envuelta por"
	line "llamas que ardieron"
	cont "durante tres días."

	para "Un repentino cha-"
	line "parrón apagó por"
	cont "fin el fuego."

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

	para "Suicune, Entei y"
	line "Raikou han desper-"
	cont "tado de su sueño…"

	para "¿Se estará cum-"
	line "pliendo la leyen-"
	cont "da?"
	done

WiseTriosRoomSage2Text:
	text "Entrenamos en la"
	line "Torre Quemada,"

	para "pero nunca hemos"
	line "oído que antes se"

	para "abriera un agujero"
	line "allí."

	para "Alguien debe de"
	line "haberlo hecho a"
	cont "propósito."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Solo pueden entrar"
	line "en Torre Hojalata"

	para "quienes lleven la"
	line "Medalla Niebla de"
	cont "Ciudad Iris."

	para "Pero ahora que"
	line "Suicune, Raikou y"

	para "Entei han desper-"
	line "tado, ¡te pido que"
	cont "no entres!"
	done

WiseTriosRoomSage3Text:
	text "Nosotros, los Tres"
	line "Sabios, somos los"

	para "protectores de los"
	line "#mon legenda-"
	cont "rios."
	done

ElderGakuSeenText:
	text "La leyenda cuenta"
	line "que al surgir un"

	para "entrenador capaz"
	line "de tocar el alma"
	cont "de los #mon,"

	para "un #mon apare-"
	line "cerá para poner a"

	para "prueba a dicho en-"
	line "trenador en la"
	cont "Torre Hojalata."

	para "¡La leyenda se ha"
	line "hecho realidad!"

	para "¡El #mon legen-"
	line "dario Suicune ha"
	cont "llegado!"

	para "¡Nosotros, los"
	line "Tres Sabios, pon-"

	para "dremos a prueba tu"
	line "valía para pasar!"
	done

ElderGakuBeatenText:
	text "¿Más fuerte de lo"
	line "que creíamos? Qui-"
	cont "zá…"
	done

ElderMasaSeenText:
	text "¿Se te puede con-"
	line "fiar la verdad?"

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
	text "Tú… ¿Eres el en-"
	line "trenador al que"

	para "esperan los #-"
	line "mon legendarios?"
	done

SageKojiAfterBattleSpeechText:
	text "Ya veo…"

	para "A nosotros, los"
	line "Tres Sabios, se"

	para "nos ha encomen-"
	line "dado proteger a"

	para "los #mon legen-"
	line "darios. Solo de-"

	para "bemos permitir el"
	line "paso a quienes po-"

	para "sean el poder y el"
	line "alma de la verdad."

	para "Por favor, sigue"
	line "adelante y entra"

	para "en la Torre Hoja-"
	line "lata."

	para "Suicune te pondrá"
	line "a prueba."
	done

SageKojiAfterBattleFinalText:
	text "Por favor, sigue"
	line "adelante."

	para "Suicune te pondrá"
	line "a prueba."
	done
