RadioTower5F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_const SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_const SCENE_RADIOTOWER5F_NOOP

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossTrigger

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FOffice
	bg_event 11,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FStudio
	bg_event 15,  0, BGEVENT_JUMPTEXT, SignpostRadioTower5FStudio

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower5FDirectorText, EVENT_RADIO_TOWER_DIRECTOR
	object_event  0,  4, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Petrel1Script, EVENT_RADIO_TOWER_PETREL
	object_event 13,  5, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAriana1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BenText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	itemball_event  8,  5, ZOOM_LENS, 1, EVENT_RADIO_TOWER_5F_ZOOM_LENS

	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_PETREL
	const RADIOTOWER5F_ARCHER
	const RADIOTOWER5F_ARIANA

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	showtext FakeDirectorTextBefore1
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	showtext FakeDirectorTextBefore2
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorSpinMovement
	appear RADIOTOWER5F_PETREL
	disappear RADIOTOWER5F_DIRECTOR
	turnobject RADIOTOWER5F_PETREL, UP
	pause 10
Petrel1Script:
	checkevent EVENT_BEAT_PETREL_1
	iftrue_jumptextfaceplayer FakeDirectorTextAfter
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	faceplayer
	showtext FakeDirectorTextBefore3
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_PETREL
	loadtrainer PETREL, PETREL1
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegivekeyitem BASEMENT_KEY
	closetext
	setevent EVENT_BEAT_PETREL_1
	end

GenericTrainerAriana1:
	generictrainer ARIANA, ARIANA1, EVENT_BEAT_ARIANA_1, Ariana1SeenText, Ariana1BeatenText

	text "Eres <PLAYER>,"
	line "¿verdad?"

	para "Un mocoso como tú"
	line "no apreciará la"

	para "grandeza del"
	line "Team Rocket."

	para "Es una pena."
	line "Admiro mucho tu"
	cont "fuerza."
	done

RadioTower5FRocketBossTrigger:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ARCHER, RIGHT
	showtext RadioTower5FRocketBossBeforeText
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ARCHER
	loadtrainer ARCHER, ARCHER1
	startbattle
	reloadmapafterbattle
	showtext RadioTower5FRocketBossAfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ARCHER
	disappear RADIOTOWER5F_ARIANA
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_BEAT_ARCHER_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_DRAGON_TAMER_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_DRAGON_TAMER_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_PETREL
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegivekeyitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_HOUSE, SCENE_ECRUTEAKHOUSE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 3, 6
	appear RADIOTOWER5F_DIRECTOR
	end

FakeDirectorMovement:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

FakeDirectorSpinMovement:
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	step_sleep 8
	step_end

RadioTower5FDirectorWalksIn:
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end

RadioTower5FDirectorWalksOut:
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step_left
	step_left
	step_end

FakeDirectorTextBefore1:
	text "¡T-tú! ¿Has venido"
	line "a rescatarme?"
	done

FakeDirectorTextBefore2:
	text "¿Es eso lo que"
	line "te esperabas?"

	para "¡Pues no!"
	line "¡Soy un impostor!"
	done

FakeDirectorTextBefore3:
	text "Me hice pasar por"
	line "el auténtico para"

	para "preparar la toma"
	line "del edificio."

	para "¿Quieres saber dón-"
	line "de escondimos al"
	cont "Director real?"

	para "Vale, te lo diré."
	line "¡Pero solo si me"
	cont "vences!"
	done

FakeDirectorWinText:
	text "Vale, vale. Te di-"
	line "ré dónde está."
	done

FakeDirectorTextAfter:
	text "Encerramos al Di-"
	line "rector real en el"

	para "Almacén Subterrá-"
	line "neo."

	para "Está al final del"
	line "Subterráneo."

	para "Pero dudo que lle-"
	line "gues tan lejos."
	done

Ariana1SeenText:
	text "¿Te acuerdas de mí"
	line "en la guarida de"
	cont "Pueblo Caoba?"

	para "Perdí entonces,"
	line "¡pero esta vez no!"
	done

Ariana1BeatenText:
	text "¡Esto no puede"
	line "estar pasando!"

	para "Luché con todo, pe-"
	line "ro volví a perder…"
	done

RadioTower5FRocketBossBeforeText:
	text "¿Eh? ¿Has logrado"
	line "llegar hasta aquí?"

	para "Debes de ser un"
	line "gran entrenador."

	para "Pensamos tomar es-"
	line "ta emisora de ra-"

	para "dio y anunciar"
	line "nuestro regreso."

	para "Eso hará volver a"
	line "nuestro jefe Gio-"

	para "vanni de su entre-"
	line "namiento en soli-"
	cont "tario."

	para "¡Recuperaremos"
	line "nuestra antigua"
	cont "gloria!"

	para "¡No permitiré que"
	line "te metas en nues-"
	cont "tros planes!"
	done

RadioTower5FRocketBossWinText:
	text "¡No! ¡Perdóname,"
	line "Giovanni!"
	done

RadioTower5FRocketBossAfterText:
	text "¿Cómo ha podido"
	line "pasar esto?"

	para "Nuestros sueños"
	line "se han esfumado."

	para "Al final no estuve"
	line "a la altura."

	para "Igual que hizo"
	line "Giovanni antes que"

	para "yo, disolveré el"
	line "Team Rocket hoy"
	cont "mismo."

	para "Adiós."
	done

RadioTower5FDirectorThankYouText:
	text "Director: ¡<PLAYER>,"
	line "muchas gracias!"

	para "Tu valerosa acción"
	line "ha salvado a los"

	para "#mon de todo el"
	line "país."

	para "Sé que no es mu-"
	line "cho, pero toma"
	cont "esto, por favor."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Antes había una"
	line "torre justo aquí,"
	cont "en Ciudad Trigal."

	para "Pero era vieja y"
	line "estaba en ruinas."

	para "Así que la sustitui-"
	line "mos por la Torre"
	cont "Radio."

	para "Desenterramos esa"
	line "campana durante"
	cont "las obras."

	para "Oí que en el pasa-"
	line "do vivían muchos"

	para "#mon en Ciudad"
	line "Trigal."

	para "Tal vez…"

	para "Esa campana guarde"
	line "alguna relación"

	para "con la Torre Cam-"
	line "pana de Ciudad"
	cont "Iris…"

	para "¡Ah!"

	para "Eso me recuerda…"

	para "Oí susurrar al"
	line "Team Rocket."

	para "Al parecer, algo"
	line "pasa en la Torre"
	cont "Campana."

	para "No tengo ni idea"
	line "de qué ocurre,"

	para "pero deberías in-"
	line "vestigarlo."

	para "Bueno, será mejor"
	line "que vaya a mi des-"
	cont "pacho."
	done

RadioTower5FDirectorText:
	text "Director: ¡Hola,"
	line "<PLAYER>!"

	para "Sabes, me encan-"
	line "tan los #mon."

	para "Construí esta To-"
	line "rre Radio para"

	para "expresar mi amor"
	line "por los #mon."

	para "Sería genial que"
	line "la gente disfru-"
	cont "tara de los pro-"
	cont "gramas."
	done

BenText:
	text "Nacho: ¿Escuchas"
	line "nuestra música?"
	done

SignpostRadioTower5FOffice:
	text "4P Despacho del"
	line "   Director"
	done

SignpostRadioTower5FStudio:
	text "4P Estudio 1"
	done