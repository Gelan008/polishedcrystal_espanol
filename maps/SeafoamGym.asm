SeafoamGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12, 20, SEAFOAM_ISLANDS_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 20, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
	object_event  7, 16, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistLowell, -1
	object_event 14, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistDennett, -1
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdCary, -1
	object_event 12,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 1, TrainerScientistLinden, -1
	object_event 10,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdWaldo, -1
	object_event  6, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdMerle, -1
	object_event 12, 11, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1

	object_const_def
	const SEAFOAMGYM_GYM_GUY

GenericTrainerScientistLowell:
	generictrainer SCIENTIST, LOWELL, EVENT_BEAT_SCIENTIST_LOWELL, ScientistLowellSeenText, ScientistLowellBeatenText

	text "Estaremos en una"
	line "cueva, pero siem-"
	cont "pre hacemos la"
	cont "colada."
	done

GenericTrainerScientistDennett:
	generictrainer SCIENTIST, DENNETT, EVENT_BEAT_SCIENTIST_DENNETT, ScientistDennettSeenText, ScientistDennettBeatenText

	text "¡Junto a Blaine,"
	line "reconstruiremos"
	cont "nuestro Gimnasio!"
	done

GenericTrainerSupernerdCary:
	generictrainer SUPER_NERD, CARY, EVENT_BEAT_SUPER_NERD_CARY, SupernerdCarySeenText, SupernerdCaryBeatenText

	text "El resentimiento"
	line "lleva a la mejora."
	done

TrainerScientistLinden:
	trainer SCIENTIST, LINDEN, EVENT_BEAT_SCIENTIST_LINDEN, ScientistLindenSeenText, ScientistLindenBeatenText, 0, .Script, TRAINERPAL_DARK_SCIENTIST

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "No todos los cien-"
	line "tíficos ayudan a"
	cont "los malos."
	done

GenericTrainerSupernerdWaldo:
	generictrainer SUPER_NERD, WALDO, EVENT_BEAT_SUPER_NERD_WALDO, SupernerdWaldoSeenText, SupernerdWaldoBeatenText

	text "¿Quién demonios"
	line "eres tú?"
	done

GenericTrainerSupernerdMerle:
	generictrainer SUPER_NERD, MERLE, EVENT_BEAT_SUPER_NERD_MERLE, SupernerdMerleSeenText, SupernerdMerleBeatenText

	text "No fui capaz de"
	line "intuir lo fuerte"
	cont "que eres."
	done

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftruefwd .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, 1
	startbattle
	reloadmapafterbattle
	iftruefwd .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_SCIENTIST_LOWELL
	setevent EVENT_BEAT_SCIENTIST_DENNETT
	setevent EVENT_BEAT_SUPER_NERD_CARY
	setevent EVENT_BEAT_SCIENTIST_LINDEN
	setevent EVENT_BEAT_SUPER_NERD_WALDO
	setevent EVENT_BEAT_SUPER_NERD_MERLE
	opentext
	givebadge VOLCANOBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM61_WILL_O_WISP
	iftrue_jumpopenedtext BlaineFightDoneText
	writetext BlaineAfterBattleText
	promptbutton
	verbosegivetmhm TM_WILL_O_WISP
	setevent EVENT_GOT_TM61_WILL_O_WISP
	jumpthisopenedtext

	text "¡Se llama Fuego"
	line "Fatuo!"

	para "Debilita a tu ri-"
	line "val causándole"
	cont "quemaduras."

	para "He perdido esta"
	line "vez, pero ganaré"
	cont "la próxima."

	para "Cuando reconstruya"
	line "el Gimnasio de"

	para "Isla Canela, ten-"
	line "dremos la revan-"
	cont "cha."
	done

SeafoamGymGuyScript:
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue_jumptextfaceplayer SeafoamGymGuyWinText2
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	jumpthistextfaceplayer

	text "¡Hola!"

	para "… ¿Eh? ¿Ya se ha"
	line "acabado?"

	para "¡Perdón, perdón!"

	para "Como el Gimnasio"
	line "de Isla Canela no"

	para "estaba, no sabía"
	line "dónde encontrarte."

	para "Pero bueno, ¡eres"
	line "muy fuerte incluso"

	para "sin mis consejos!"
	line "¡Sabía que ibas a"
	cont "ganar!"
	done

ScientistLowellSeenText:
	text "Por algún motivo,"
	line "esta bata me hace"
	cont "sentir más listo."
	done

ScientistLowellBeatenText:
	text "La bata blanca es"
	line "la vida de todo"
	cont "investigador."
	done

ScientistDennettSeenText:
	text "Blaine habrá per-"
	line "dido su Gimnasio,"
	cont "¡pero no se rinde!"
	done

ScientistDennettBeatenText:
	text "¡La perseverancia"
	line "de Blaine me mo-"
	cont "tiva mucho!"
	done

SupernerdCarySeenText:
	text "Vaya, ¿un Gimnasio"
	line "en una cueva así?"

	para "Me encantaría"
	line "explorarlo."
	done

SupernerdCaryBeatenText:
	text "Una amarga"
	line "derrota…"
	done

ScientistLindenSeenText:
	text "Perdimos el Gimna-"
	line "sio en Isla Cane-"
	cont "la, pero vinimos"
	cont "aquí."
	done

ScientistLindenBeatenText:
	text "Aceptamos la de-"
	line "rrota con digni-"
	cont "dad…"
	done

SupernerdWaldoSeenText:
	text "Estoy recopilando"
	line "datos de combates."

	para "¿Puedes ayudarme?"
	done

SupernerdWaldoBeatenText:
	text "¡No me esperaba"
	line "que fueras tan"
	cont "fuerte!"
	done

SupernerdMerleSeenText:
	text "¡Uf!"
	line "¡Pareces muy fácil"
	cont "de vencer!"
	done

SupernerdMerleBeatenText:
	text "¡Disculpa!"
	done

BlaineIntroText:
	text "Blaine: ¡Uaaah!"

	para "Mi Gimnasio de"
	line "Isla Canela ardió"
	cont "por completo."

	para "Mis #mon y yo nos"
	line "hemos quedado sin"

	para "hogar por culpa"
	line "del volcán."

	para "¡Uaaah!"

	para "¡Pero he vuelto al"
	line "negocio como Líder"

	para "de Gimnasio aquí,"
	line "en esta cueva!"

	para "Si puedes vencer-"
	line "me, te daré una"
	cont "Medalla."

	para "¡Ja! ¡Será mejor"
	line "que lleves Antique-"
	cont "maduras!"
	done

BlaineWinLossText:
	text "Blaine: Increíble."
	line "Me he consumido…"

	para "¡Te has ganado la"
	line "Medalla Volcán!"
	done

BlaineAfterBattleText:
	text "Toma, quédate esto"
	line "también."
	done

BlaineFightDoneText:
	text "Blaine: Mis #mon"
	line "de fuego serán aún"

	para "más fuertes."
	line "¡Ya lo verás!"
	done

SeafoamGymGuyWinText2:
	text "Un Gimnasio #mon"
	line "puede estar en"

	para "cualquier parte si"
	line "el Líder de Gimna-"
	cont "sio está allí."

	para "No hace falta un"
	line "edificio."
	done
