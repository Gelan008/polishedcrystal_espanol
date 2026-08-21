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
	object_event 12,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerScientistLinden, -1
	object_event 10,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdWaldo, -1
	object_event  6, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSupernerdMerle, -1
	object_event 12, 11, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1

	object_const_def
	const SEAFOAMGYM_GYM_GUY

GenericTrainerScientistLowell:
	generictrainer SCIENTIST, LOWELL, EVENT_BEAT_SCIENTIST_LOWELL, ScientistLowellSeenText, ScientistLowellBeatenText

	text "We may be in a"
	line "cave, but we"
	cont "always do the"
	cont "laundry."
	done

GenericTrainerScientistDennett:
	generictrainer SCIENTIST, DENNETT, EVENT_BEAT_SCIENTIST_DENNETT, ScientistDennettSeenText, ScientistDennettBeatenText

	text "Together with"
	line "Blaine, we will"
	cont "rebuild our Gym!"
	done

GenericTrainerSupernerdCary:
	generictrainer SUPER_NERD, CARY, EVENT_BEAT_SUPER_NERD_CARY, SupernerdCarySeenText, SupernerdCaryBeatenText

	text "Bitterness leads"
	line "to improvement."
	done

GenericTrainerScientistLinden:
	generictrainer SCIENTIST, LINDEN, EVENT_BEAT_SCIENTIST_LINDEN, ScientistLindenSeenText, ScientistLindenBeatenText

	text "Not all scientists"
	line "help the bad guys."
	done

GenericTrainerSupernerdWaldo:
	generictrainer SUPER_NERD, WALDO, EVENT_BEAT_SUPER_NERD_WALDO, SupernerdWaldoSeenText, SupernerdWaldoBeatenText

	text "Who in the world"
	line "are you?"
	done

GenericTrainerSupernerdMerle:
	generictrainer SUPER_NERD, MERLE, EVENT_BEAT_SUPER_NERD_MERLE, SupernerdMerleSeenText, SupernerdMerleBeatenText

	text "I failed to"
	line "sense how strong"
	cont "you are."
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

	text "It's called Will-"
	line "O-Wisp!"

	para "It weakens your"
	line "foe by inflicting"
	cont "a burn."

	para "I did lose this"
	line "time, but I'm going"
	cont "to win next time."

	para "When I rebuild my"
	line "Cinnabar Gym,"

	para "we'll have to have"
	line "a rematch."
	done

SeafoamGymGuyScript:
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue_jumptextfaceplayer SeafoamGymGuyWinText2
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	jumpthistextfaceplayer

	text "Yo!"

	para "…Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "Cinnabar Gym was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
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
	text "Blaine perdió su"
	line "Gimnasio, ¡pero no"
	cont "se rendirá!"
	done

ScientistDennettBeatenText:
	text "¡La fuerza de"
	line "Blaine me motiva"
	cont "mucho!"
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
	text "Nos quedamos sin"
	line "Gimnasio en Isla"
	cont "Canela, y vinimos"
	cont "a esta cueva."
	done

ScientistLindenBeatenText:
	text "Acepto la derrota"
	line "con dignidad…"
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

	para "¡Mis #mon y yo"
	line "nos quedamos sin"
	cont "hogar por culpa"
	cont "del volcán!"

	para "¡Uaaah!"

	para "¡Pero he vuelto"
	line "como Líder aquí,"
	cont "en esta cueva!"

	para "Si logras vencer,"
	line "te daré una"
	cont "Medalla."

	para "¡Ja! ¡Lleva algún"
	line "Antiquemaduras!"
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
	text "Blaine: Mis"
	line "#mon de fuego"
	cont "serán aún más"
	cont "fuertes."

	para "¡Ya lo verás!"
	done

SeafoamGymGuyWinText2:
	text "Un Gimnasio puede"
	line "estar en cualquier"
	cont "lugar si su Líder"
	cont "está ahí."

	para "¡No hace falta un"
	line "edificio!"
	done
