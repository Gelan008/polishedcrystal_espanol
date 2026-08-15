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
	line "de viajar es pro-"
	cont "bar los platos"
	cont "locales."

	para "El restaurante de"
	line "aquí cerca prepara"

	para "un postre de lo"
	line "más exquisito"
if DEF(FAITHFUL)
	line "con Miel."
else
	line "con Miel Dulce."
endc

	para "Permíteme compar-"
	line "tir algo contigo."
	done

.IntroText:
	text "Buenas."
	line "Soy Larry."

	para "Mi jefa me envió"
	line "aquí por negocios,"

	para "pero bien puedo"
	line "aprovechar para"
	cont "disfrutar un poco."

	para "Acabo de comer en"
	line "el Restaurante"
	cont "Oasis del hotel."

	para "Eso me ha abierto"
	line "el apetito para un"
	cont "combate más duro."

	para "¿Te apetece acom-"
	line "pañarme?"
	done

.RematchText:
	text "Hola de nuevo,"
	line "<PLAYER>."

	para "Ya nos hemos en-"
	line "frentado antes, así"

	para "que dudo que esto"
	line "te cause una gran"
	cont "impresión."

	para "En cualquier caso,"
	line "¿empezamos?"
	done

.SeenText:
	text "Un servidor, Lau-"
	line "rel, queda a tu"
	cont "disposición."
	done

.BeatenText:
	text "En fin, ya he te-"
	line "nido bastante…"
	done

.RefusedText:
	text "Quizá en otra oca-"
	line "sión, cuando nos"
	cont "cuadren las agen-"
	cont "das."
	done