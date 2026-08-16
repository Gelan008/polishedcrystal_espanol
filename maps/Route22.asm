Route22_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, POKEMON_LEAGUE_GATE, 1
	warp_event  4,  5, POKEMON_LEAGUE_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  7,  7, BGEVENT_JUMPTEXT, VictoryRoadEntranceSignText
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route22AdvancedTipsSignText

	def_object_events
	object_event 20, 11, SPRITE_KUKUI, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KukuiScript, -1
	object_event 28,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route22CooltrainerfText, -1

	object_const_def
	const ROUTE22_KUKUI

KukuiScript:
	checkevent EVENT_BEAT_KUKUI
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	checkevent EVENT_INTRODUCED_KUKUI
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	setevent EVENT_INTRODUCED_KUKUI
	winlosstext .BeatenText, 0
	setlasttalked ROUTE22_KUKUI
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer KUKUI, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer KUKUI, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KUKUI
	jumpthistext

.AfterText:
	text "¡Increíble! ¡Fui"
	line "con todo a por ti"
	cont "y aun así ganaste!"

	para "¡Con razón eres el"
	line "Campeón!"

	para "Tengo que entre-"
	line "nar más duro an-"
	cont "tes de estar listo"

	para "para la Liga."

	para "Y en cuanto lo"
	line "esté, ¡volveremos"
	cont "a luchar! ¡Ujuuu!"
	done

.IntroText:
	text "¡Hola, buenas!"
	line "Me llamo Kukui."

	para "¿Te llamas"
	line "<PLAYER>?"
	cont "¡Recibido, amigo!"

	para "¡Vengo de la leja-"
	line "na región de"
	cont "Alola!"

	para "Pero allí no tene-"
	line "mos Liga #mon,"

	para "así que vine a"
	line "Kanto a luchar"
	cont "contra el Alto"
	cont "Mando, ¡sí señor!"

	para "¿Cómo? ¿Eres el"
	line "nuevo Campeón?"

	para "¡Ujuuu! ¡Con razón"
	line "te ves con tanto"
	cont "estilo!"

	para "Mi equipo y yo nos"
	line "vemos listos. ¿Qué"

	para "tal si pasamos de"
	line "la Liga y te desa-"
	cont "fío directamente?"
	done

.RematchText:
	text "¡Hola de nuevo,"
	line "<PLAYER>!"

	para "He estado entre-"
	line "nando duro desde"
	cont "el último combate,"
	cont "¡sí señor!"

	para "¡Tú también pare-"
	line "ces más fuerte!"

	para "Dime, ¿qué tal una"
	line "revancha?"
	done

.SeenText:
	text "¡Tengamos un com-"
	line "bate digno de este"
	cont "momento!"
	done

.BeatenText:
	text "No pude ganar aun-"
	line "que di todo lo que"
	cont "tenía…"
	done

.RefusedText:
	text "Totalmente a lo"
	line "tuyo con tu viaje,"
	cont "¿eh?"

	para "¡Lo respeto!"
	done

Route22CooltrainerfText:
	text "El nombre “Kanto”"
	line "significa “al este"
	cont "de la barrera”."

	para "Supongo que dicha"
	line "barrera es el"
	cont "Monte Plateado."
	done

VictoryRoadEntranceSignText:
	text "Ruta 22"

	para "Control de Acceso"
	line "a la Liga #mon"
	done

Route22AdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡Empezar una"
	line "Nueva Partida+"
	cont "conservará el"
	cont "dinero anterior,"

	para "los Puntos de Ba-"
	line "talla y cualquier"

	para "#mon guardado"
	line "en el PC!"
	done
