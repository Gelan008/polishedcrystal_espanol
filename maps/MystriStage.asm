MystriStage_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_MYSTRISTAGE_NOOP
	scene_const SCENE_MYSTRISTAGE_ARCEUS_EVENT

	def_callbacks

	def_warp_events
	warp_event  6, 19, SINJOH_RUINS, 1
	warp_event  7, 19, SINJOH_RUINS, 1

	def_coord_events
	coord_event  6, 11, SCENE_MYSTRISTAGE_ARCEUS_EVENT, MystriStageTrigger1Script
	coord_event  7, 11, SCENE_MYSTRISTAGE_ARCEUS_EVENT, MystriStageTrigger2Script

	def_bg_events

	def_object_events
	object_event  6, 10, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MystriStageCynthiaSafeguardScript, EVENT_LISTENED_TO_CYNTHIA_INTRO
	object_event  7,  7, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MystriStageCynthiaScript, EVENT_MYSTRI_STAGE_CYNTHIA
	object_event  6,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, EGG, -1, PAL_MON_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, MystriStageEggScript, EVENT_MYSTRI_STAGE_EGG

	object_const_def
	const MYSTRISTAGE_CYNTHIA1
	const MYSTRISTAGE_CYNTHIA2
	const MYSTRISTAGE_EGG

MystriStageTrigger2Script:
	applyonemovement PLAYER, step_up
MystriStageTrigger1Script:
	faceobject PLAYER, MYSTRISTAGE_CYNTHIA1
	pause 10
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA1, 15
	pause 10
	faceobject MYSTRISTAGE_CYNTHIA1, PLAYER
MystriStageCynthiaSafeguardScript:
	showtext MystriStageCynthiaIntroText
	follow MYSTRISTAGE_CYNTHIA1, PLAYER
	applymovement MYSTRISTAGE_CYNTHIA1, MystriStageMovementData_CynthiaStepsUp
	stopfollow
	turnobject MYSTRISTAGE_CYNTHIA1, LEFT
	turnobject PLAYER, RIGHT
	showtext MystriStageCynthiaSpeechText
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA1, 15
	showtext MystriStageCynthiaLeadText2
	pause 10
	appear MYSTRISTAGE_CYNTHIA2
	disappear MYSTRISTAGE_CYNTHIA1
	setlasttalked MYSTRISTAGE_CYNTHIA2
	setevent EVENT_LISTENED_TO_CYNTHIA_INTRO
	setscene SCENE_MYSTRISTAGE_NOOP
	; fallthrough

MystriStageCynthiaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CYNTHIA
	iftruefwd MystriStageBeatCynthiaScript
	writetext MystriStageCynthiaIdeaText
	waitbutton
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse_jumpopenedtext MystriStageCynthiaNotNowText
	writetext MystriStageCynthiaChallengeText
	yesorno
	iffalse_jumpopenedtext MystriStageCynthiaNoText
	writetext MystriStageCynthiaYesText
	waitbutton
	closetext
	winlosstext MystriStageCynthiaWinText, 0
	setlasttalked MYSTRISTAGE_CYNTHIA2
	loadtrainer CYNTHIA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	opentext
MystriStageBeatCynthiaScript:
	checkevent EVENT_GOT_WISE_GLASSES_FROM_CYNTHIA
	iftrue_jumpopenedtext MystriStageCynthiaFinalText
	writetext MystriStageCynthiaItemText
	waitbutton
	verbosegiveitem WISE_GLASSES
	iffalse_endtext
	setevent EVENT_GOT_WISE_GLASSES_FROM_CYNTHIA
	writetext MystriStageCynthiaAfterText
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, MYSTRISTAGE_CYNTHIA2, 15
	special Special_FadeOutMusic
	pause 15
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	pause 15
	playsound SFX_UNKNOWN_60
	waitsfx
	pause 20
	playsound SFX_METRONOME
	waitsfx
	special Special_FadeInQuickly
	pause 10
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playsound SFX_PROTECT
	waitsfx
	special Special_FadeInQuickly
	pause 10
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	pause 20
	playsound SFX_EGG_HATCH
	waitsfx
	appear MYSTRISTAGE_EGG
	faceplayer
	pause 30
	special RestartMapMusic
	special Special_FadeInQuickly
	pause 20
	turnobject MYSTRISTAGE_CYNTHIA2, DOWN
	pause 40
	jumpthistextfaceplayer

	text "Cintia: ¿Podría"
	line "ser… un Huevo?"

	para "¿Presenciamos el"
	line "mismo instante en"
	cont "que un Huevo vino"
	cont "a este mundo?"

	para "¿Un momento que"
	line "nadie ha visto"
	cont "jamás?"
	done

MystriStageEggScript:
	special GiveMystriEgg
	iffalse_jumptext MystriStageNoRoomText
	disappear MYSTRISTAGE_EGG
	opentext
	writetext MystriStageEggText
	playsound SFX_KEY_ITEM
	waitsfx
	ifequalfwd 1, .InParty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
.InParty
	waitendtext

MystriStageCynthiaIntroText:
	text "Me llamo Cintia."
	line "Soy entrenadora"
	cont "#mon."

	para "¿Y tú quién eres?"

	para "…Ya veo. El poder"
	line "de los Unown te ha"
	cont "traído hasta aquí."
	done

MystriStageCynthiaSpeechText:
	text "Cintia: Estas son"
	line "las Ruinas Sinjoh."

	para "Hace mucho tiempo,"
	line "la gente vino a"
	cont "vivir aquí desde"
	cont "Sinnoh, mi tierra."

	para "Por nostalgia a"
	line "su hogar, alzaron"
	cont "este templo en"
	cont "su honor."

	para "Estamos en el"
	line "Estrado Mistrío."

	para "Antaño celebraban"
	line "aquí con música."

	para "Cintia: Estudio"
	line "los mitos sobre"
	cont "lugares antiguos."

	para "Uno dice que este"
	line "estrado alberga el"
	cont "poder del creador."

	para "Habla de cuando"
	line "el elegido suba al"
	cont "Estrado Mistrío…"
	done

MystriStageCynthiaLeadText2:
	text "Cintia: ¿Qué?"
	line "¿Leíste esa frase"
	cont "en Ruinas Alfa?"

	para "Es de lo más"
	line "intrigante."

	para "Ese elegido será"
	line "un #mon?"
	cont "¿O una persona?"
	done

MystriStageCynthiaIdeaText:
	text "Cintia: …Tengo"
	line "una idea. Llámalo"
	cont "intuición mía."

	para "Si combatimos tú"
	line "y yo en este"
	cont "estrado, ocurrirá"
	cont "algo."
	done

MystriStageCynthiaNotNowText:
	text "Cintia: Pero no"
	line "creo que debamos"
	cont "luchar ahora."

	para "Aún no estás a"
	line "punto."

	para "Vuelve cuando"
	line "hayas vencido al"
	cont "Alto Mando."
	done

MystriStageCynthiaChallengeText:
	text "Cintia: ¿Te has"
	line "preparado para ser"
	cont "mi rival?"
	done

MystriStageCynthiaNoText:
	text "Cintia: Vuelve"
	line "cuando estés a"
	cont "punto."
	done

MystriStageCynthiaYesText:
	text "Cintia: Antes de"
	line "sacar a mis"
	cont "#mon,"

	para "el corazón siempre"
	line "me late con"
	cont "fuerza…"
	done

MystriStageCynthiaWinText:
	text "¡Hacía mucho que"
	line "no me superaban de"
	cont "esta forma!"
	done

MystriStageCynthiaItemText:
	text "Cintia: ¡Superaste"
	line "mis expectativas!"

	para "¡Qué combate tan"
	line "excepcional!"

	para "Toma este objeto."
	line "Sé que sabrás"
	cont "usarlo bien."
	done

MystriStageCynthiaAfterText:
	text "Cintia: ¿Habrá"
	line "afectado la lucha"
	cont "al Estrado"
	cont "Mistrío?"
	done

MystriStageCynthiaFinalText:
	text "Cintia: Un Huevo"
	line "es la cuna de"
	cont "todo ser."

	para "El planeta es un"
	line "Huevo en cierto"
	cont "sentido…"

	para "La vida que nace"
	line "de un Huevo tiene"
	cont "su fin a su debido"
	cont "tiempo…"

	para "para renacer de"
	line "nuevo…"
	done

MystriStageEggText:
	text "¡<PLAYER> halló"
	line "un misterioso"
	cont "Huevo!"
	done

MystriStageNoRoomText:
	text "¡No tienes sitio"
	line "para esto, ni en"
	cont "la Caja!"
	done

MystriStageMovementData_CynthiaStepsUp:
	step_up
	step_up
	step_up
	step_right
	step_end
