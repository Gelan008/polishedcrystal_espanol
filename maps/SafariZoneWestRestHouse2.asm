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
	line "alguien más por"
	cont "este lugar!"

	para "Soy Candela."

	para "Vengo de Hoenn,"
	line "adoro el calor y"
	cont "las aguas termales"

	para "¡La Zona Safari me"
	line "hace sentir como"
	cont "en casa!"

	para "¡Usemos ataques"
	line "abrasadores en un"
	cont "buen combate!"
	done

.RematchText:
	text "¡Hola, <PLAYER>!"

	para "¡Qué bien volver a"
	line "verte!"

	para "Perder una batalla"
	line "no me desanima."

	para "¡Tengamos otro"
	line "combate ardiente y"
	cont "abrasador!"
	done

.SeenText:
	text "¡Te mostraré los"
	line "ataques ardientes"
	cont "que perfeccioné en"
	cont "un volcán!"
	done

.BeatenText:
	text "¡Uf! ¡Al borde de"
	line "la erupción!"
	done

.AfterText:
	text "He perdido, pero"
	line "estoy satisfecha."

	para "No suelo tener"
	line "combates tan"
	cont "apasionantes."

	para "¡Hay que repetir"
	line "otro combate algún"
	cont "día!"
	done

.RefusedText:
	text "Vale… Eh…"

	para "¡No tengas corte"
	line "en pedirmelo si"
	cont "te apetece!"
	done
