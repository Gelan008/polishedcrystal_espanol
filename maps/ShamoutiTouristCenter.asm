ShamoutiTouristCenter_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SHAMOUTI_ISLAND, 4
	warp_event  3,  7, SHAMOUTI_ISLAND, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_LARRY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LarryScript, -1

	object_const_def
	const SHAMOUTITOURISTCENTER_LARRY

LarryScript:
	faceplayer
	checkevent EVENT_BEAT_LARRY
	iftruefwd .After
	opentext
	checkevent EVENT_INTRODUCED_LARRY
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
	setevent EVENT_INTRODUCED_LARRY
	winlosstext .BeatenText, 0
	setlasttalked SHAMOUTITOURISTCENTER_LARRY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer LARRY, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer LARRY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LARRY
.After
	opentext
	checkevent EVENT_GOT_SWEET_HONEY_FROM_LARRY
	iftruefwd .Done
	writetext .RewardText
	promptbutton
	verbosegiveitem SWEET_HONEY
	iffalse_endtext
	setevent EVENT_GOT_SWEET_HONEY_FROM_LARRY
.Done
	jumpthisopenedtext

	text "Bueno, será mejor"
	line "que vuelva al"
	cont "trabajo."

	para "Con su permiso."
	done

.RewardText:
	text "Para mí, lo mejor"
	line "es probar platos"
	cont "locales al viajar."

	para "El restaurante de"
	line "aquí sirve un"
	cont "postre exquisito"
if DEF(FAITHFUL)
	cont "con Miel."
else
	cont "con Miel Dulce."
endc

	para "Permíteme darte un"
	line "poco."
	done

.IntroText:
	text "Buenas."
	line "Soy Larry."

	para "Mi jefa me envió"
	line "por negocios, pero"
	cont "aprovecharé para"
	cont "disfrutar un poco."

	para "Acabo de comer en"
	line "el Restaurante"
	cont "Oasis del hotel."

	para "Eso me abrió el"
	line "apetito para un"
	cont "buen combate."

	para "¿Te apetece un"
	line "combate conmigo?"
	done

.RematchText:
	text "Hola de nuevo,"
	line "<PLAYER>."

	para "Ya luchamos antes,"
	line "así que dudo que"
	cont "te impresione."

	para "En cualquier caso,"
	line "¿empezamos?"
	done

.SeenText:
	text "Un servidor,"
	line "Laurel, queda a tu"
	cont "disposición."
	done

.BeatenText:
	text "En fin, ya tuve"
	line "bastante…"
	done

.RefusedText:
	text "Quizás en otra"
	line "ocasión, si nos"
	cont "cuadra la agenda."
	done