ValeriesHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SetupValerieAfterMorningWalkScript

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 12
	warp_event  4,  7, ECRUTEAK_CITY, 12

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_VALERIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ValeriesHouseValerieText, EVENT_VALERIE_ECRUTEAK_CITY
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ValeriesHouseFairyBookScript, -1

	object_const_def
	const VALERIESHOUSE_VALERIE
	const VALERIESHOUSE_FAIRY_BOOK

SetupValerieAfterMorningWalkScript:
	checkevent EVENT_FOUGHT_SUICUNE
	iffalsefwd .Disappear
	checkevent EVENT_BEAT_VALERIE
	iffalsefwd .Disappear
	checkflag ENGINE_VALERIE_MORNING_WALK
	iftruefwd .Appear
	checktime 1 << MORN
	iffalsefwd .Appear
.Disappear:
	disappear VALERIESHOUSE_VALERIE
	sjumpfwd SetupFairyBookScript

.Appear
	appear VALERIESHOUSE_VALERIE
	; fallthrough

SetupFairyBookScript:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .Sunday
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequalfwd THURSDAY, .Thursday
	ifequalfwd FRIDAY, .Friday
	ifequalfwd SATURDAY, .Saturday
.Sunday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_PINK
	endcallback
.Monday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_BROWN
	endcallback
.Tuesday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_RED
	endcallback
.Wednesday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_BLUE
	endcallback
.Thursday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_GREEN
	endcallback
.Friday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_ENV_YELLOW
	endcallback
.Saturday
	setmapobjectpal VALERIESHOUSE_FAIRY_BOOK, PAL_NPC_PURPLE
	endcallback

ValeriesHouseValerieText:
	text "Valeria: Dicen"
	line "que mis diseños"

	para "de moda son bas-"
	line "tante enigmáticos."
	cont "¿Estás de acuerdo?"

	para "La verdad es que"
	line "siempre he querido"
	cont "ser un #mon."

	para "Ese deseo me sirve"
	line "de inspiración y"

	para "es lo que intento"
	line "plasmar en mis"
	cont "diseños."

	para "Y aun así… solo me"
	line "siento en perfecta"

	para "comunión con los"
	line "#mon cuando nos"

	para "envolvemos en un"
	line "combate a deses-"
	cont "perar."

	para "¿Por qué será?…"
	done

ValeriesHouseFairyBookScript:
	opentext
	writetext ValeriesHouseFairyBookText
	waitbutton
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .Sunday
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequalfwd THURSDAY, .Thursday
	ifequalfwd FRIDAY, .Friday
	ifequalfwd SATURDAY, .Saturday
.Sunday
	jumpthisopenedtext

	text "Una tortuga guía"
	line "a un hombre bajo"
	cont "el mar…"
	done

.Monday
	jumpthisopenedtext

	text "La choza de un la-"
	line "brador se ha con-"

	para "vertido en palacio"
	line "de la noche a la"
	cont "mañana…"
	done

.Tuesday
	jumpthisopenedtext

	text "Una joven de lar-"
	line "ga cabellera está"

	para "encerrada en una"
	line "torre…"
	done

.Wednesday
	jumpthisopenedtext

	text "Una hermosa joven"
	line "habla con la cabe-"
	cont "za de un caballo…"
	done

.Thursday
	jumpthisopenedtext

	text "Un pez parlante"
	line "afirma que puede"

	para "conceder deseos…"
	done

.Friday
	jumpthisopenedtext

	text "Un manzano de oro"
	line "se alza en la cima"

	para "de una montaña de"
	line "cristal…"
	done

.Saturday
	jumpthisopenedtext

	text "Un perro escarba"
	line "en el jardín y ha-"

	para "lla un tesoro de"
	line "oro…"
	done

ValeriesHouseFairyBookText:
	text "Es un libro de"
	line "cuentos de hadas."
	done
