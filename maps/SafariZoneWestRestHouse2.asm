SafariZoneWestRestHouse2_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 8
	warp_event  3,  7, SAFARI_ZONE_WEST, 8

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKogaScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKogaScript

	def_object_events
	object_event  3,  4, SPRITE_FLANNERY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneWestRestHouse2FlanneryScript, -1

	object_const_def
	const SAFARIZONEWESTRESTHOUSE2_FLANNERY

SafariZoneWestRestHouse2FlanneryScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FLANNERY
	iftruefwd .Beaten
	checkevent EVENT_INTRODUCED_FLANNERY
	iftruefwd .Introduced
	writetext .IntroText
	sjumpfwd .Question
.Introduced
	writetext .RematchText
.Question
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SAFARIZONEWESTRESTHOUSE2_FLANNERY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch
	loadtrainer FLANNERY, 1
	sjumpfwd .StartBattle
.Rematch
	loadtrainer FLANNERY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	setevent EVENT_INTRODUCED_FLANNERY
	setevent EVENT_BEAT_FLANNERY
	opentext
.Beaten:
	jumpopenedtext .AfterText

.Refused:
	jumpopenedtext .RefusedText

.IntroText:
	text "¡Hola!"

	para "¡Qué bien ver a"
	line "alguien más explo-"
	cont "rando este lugar!"

	para "Soy Candela."

	para "Vengo de la región"
	line "de Hoenn, así que"

	para "me encantan la hu-"
	line "medad y las aguas"
	cont "termales."

	para "¡La Zona Safari me"
	line "hace sentir como"
	cont "en casa!"

	para "¡Intercambiemos"
	line "movimientos abra-"
	cont "sadores en combate!"
	done

.RematchText:
	text "¡Hola,"
	line "¡<PLAYER>!"

	para "¡Qué bien volver a"
	line "verte!"

	para "Perder un combate"
	line "no va a desani-"
	cont "marme."

	para "¡Intercambiemos"
	line "movimientos abra-"

	para "sadores en otro"
	line "combate!"
	done

.SeenText:
	text "¡Voy a hacerte una"
	line "demostración de"

	para "los movimientos"
	line "ardientes que per-"

	para "feccioné junto a"
	line "un volcán!"
	done

.BeatenText:
	text "¡Uf! ¡Al borde de"
	line "la erupción!"
	done

.AfterText:
	text "He perdido el com-"
	line "bate, pero estoy"
	cont "muy satisfecha."

	para "No suelo disfrutar"
	line "a menudo de com-"

	para "bates tan apasio-"
	line "nantes."

	para "¡Tenemos que repe-"
	line "tir otro igual al-"
	cont "guna vez!"
	done

.RefusedText:
	text "Vale… Eh…"
	line "¡No tengas corte"

	para "en pedirlo si"
	line "vuelves!"
	done
