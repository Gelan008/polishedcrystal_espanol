VioletGym_MapScriptHeader:
	def_scene_scripts
	scene_script VioletGymTrigger0

	def_callbacks

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  4, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_FALKNER
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, EVENT_VIOLET_GYM_FALKNER
	object_event  7,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRod, EVENT_VIOLET_GYM_FALKNER
	object_event  2, 10, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperAbe, EVENT_VIOLET_GYM_FALKNER
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, EVENT_VIOLET_GYM_FALKNER

	object_const_def
	const VIOLETGYM_GYM_GUY2

VioletGymTrigger0:
	sdefer VioletGymFalknerAwayScript
	end

VioletGymFalknerAwayScript:
	showemote EMOTE_SHOCK, VIOLETGYM_GYM_GUY2, 15
	applyonemovement VIOLETGYM_GYM_GUY2, step_down
	showtext VioletGymGuyFalknerAwayText
	turnobject PLAYER, DOWN
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftruefwd .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	givebadge ZEPHYRBADGE, JOHTO_REGION
.FightDone:
	checkevent EVENT_GOT_TM31_ROOST
	iftrue_jumpopenedtext FalknerFightDoneText
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, $2
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegivetmhm TM_ROOST
	setevent EVENT_GOT_TM31_ROOST
	jumpopenedtext FalknerTMMudSlapText

GenericTrainerBird_keeperRod:
	generictrainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, Bird_keeperRodSeenText, Bird_keeperRodBeatenText

	text "Falkner's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

GenericTrainerBird_keeperAbe:
	generictrainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText

	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
	done

VioletGymGuyScript:
	checkevent EVENT_BEAT_FALKNER
	iftrue_jumptextfaceplayer VioletGymGuyWinText
	jumptextfaceplayer VioletGymGuyText

VioletGymStatue:
	gettrainername FALKNER, 1, STRING_BUFFER_4
	checkflag ENGINE_ZEPHYRBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 8, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

FalknerIntroText:
	text "¡Soy Pegaso, Líder"
	line "del Gimnasio"
	cont "#mon de Malva!"

	para "La gente dice que"
	line "basta una descarga"

	para "eléctrica para"
	line "cortarle las alas"
	cont "al tipo Volador…"

	para "¡No toleraré tales"
	line "insultos a los"
	cont "#mon pájaro!"

	para "¡Te mostraré el"
	line "gran poder de los"
	cont "#mon pájaro!"
	done

FalknerWinLossText:
	text "…¡Rayos! Los"
	line "#mon pájaro"
	cont "de mi padre…"

	para "De acuerdo."
	line "Toma esto."

	para "Es la Medalla"
	line "Céfiro oficial de"
	cont "la Liga #mon."
	done

FalknerZephyrBadgeText:
	text "La Medalla Céfiro"
	line "hace que los"
	cont "#mon"

	para "intercambiados de"
	line "hasta nivel 20"
	cont "te obedezcan."

	para "Oye, ¡toma esto"
	line "también!"
	done

FalknerTMMudSlapText:
	text "By using a TM, a"
	line "#mon will"

	para "instantly learn a"
	line "new move."

	para "A TM can be used"
	line "as many times as"
	cont "you want."

	para "TM51 contains"
	line "Roost."

	para "It lands on the"
	line "ground to restore"
	cont "half the max HP."
	done

FalknerFightDoneText:
	text "Hay Gimnasios"
	line "#mon en otras"
	cont "ciudades y pueblos"

	para "Deberías poner a"
	line "prueba tu talento"
	cont "en ellos."

	para "¡Entrenaré mucho"
	line "más para ser el"
	cont "mejor maestro de"
	cont "#mon pájaro!"
	done

Bird_keeperRodSeenText:
	text "¡La clave son las"
	line "agallas!"

	para "¡Aquí entrenamos"
	line "noche y día para"
	cont "ser maestros de"
	cont "#mon pájaro!"

	para "¡Vamos allá!"
	done

Bird_keeperRodBeatenText:
	text "¡Gaaah!"
	done

Bird_keeperAbeSeenText:
	text "¡A ver si tienes"
	line "nivel para luchar"
	cont "contra Pegaso!"
	done

Bird_keeperAbeBeatenText:
	text "¡Esto no puede"
	line "ser verdad!"
	done

VioletGymGuyText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "The Grass-type is"
	line "weak against the"

	para "Flying-type. Keep"
	line "this in mind."
	done

VioletGymGuyWinText:
	text "¡Buen combate!"
	line "¡Sigue así y serás"
	cont "Campeón en un"
	cont "santiamén!"
	done

VioletGymGuyFalknerAwayText:
	text "¡Oye! No puedes"
	line "retar a Pegaso"
	cont "ahora mismo."

	para "Está en la Cueva"
	line "Oscura amansando a"
	cont "un Ursaring fiero."

	para "Vuelve más tarde."
	done
