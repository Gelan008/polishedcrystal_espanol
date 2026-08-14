EmbeddedTower_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 23, ROUTE_47, 6
	warp_event  7, 23, ROUTE_47, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  9, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EmbeddedTowerSteven1Script, EVENT_EMBEDDED_TOWER_STEVEN_1
	object_event  4, 11, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EmbeddedTowerSteven2Script, EVENT_EMBEDDED_TOWER_STEVEN_2

	object_const_def
	const EMBEDDEDTOWER_STEVEN1
	const EMBEDDEDTOWER_STEVEN2

EmbeddedTowerSteven1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STEVEN
	iftruefwd .Beaten
	checkevent EVENT_LISTENED_TO_STEVEN_INTRO
	iftruefwd .HeardIntro
	writetext EmbeddedTowerSteven1IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_STEVEN_INTRO
.HeardIntro
	writetext EmbeddedTowerSteven1TowerText
	waitbutton
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse_jumpopenedtext EmbeddedTowerSteven1NotNowText
	writetext EmbeddedTowerSteven1ChallengeText
	yesorno
	iffalse_jumpopenedtext EmbeddedTowerSteven1NoText
	writetext EmbeddedTowerSteven1YesText
	waitbutton
	closetext
	winlosstext EmbeddedTowerSteven1WinText, 0
	setlasttalked EMBEDDEDTOWER_STEVEN1
	loadtrainer STEVEN, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	opentext
.Beaten:
	checkevent EVENT_GOT_MUSCLE_BAND_FROM_STEVEN
	iftrue_jumpopenedtext EmbeddedTowerSteven1AfterText
	writetext EmbeddedTowerSteven1ItemText
	waitbutton
	verbosegiveitem MUSCLE_BAND
	iffalse_endtext
	setevent EVENT_GOT_MUSCLE_BAND_FROM_STEVEN
.GotMuscleBand
	jumpopenedtext EmbeddedTowerSteven1AfterText

EmbeddedTowerSteven2Script:
	checkevent EVENT_BEAT_STEVEN
	iftrue_jumptextfaceplayer EmbeddedTowerSteven2AfterText
	faceplayer
	opentext
	writetext EmbeddedTowerSteven2ChallengeText
	yesorno
	iffalse_jumpopenedtext EmbeddedTowerSteven2NoText
	writetext EmbeddedTowerSteven2YesText
	waitbutton
	closetext
	winlosstext EmbeddedTowerSteven2WinText, 0
	setlasttalked EMBEDDEDTOWER_STEVEN2
	loadtrainer STEVEN, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	opentext
	jumpopenedtext EmbeddedTowerSteven2AfterText

EmbeddedTowerSteven1IntroText:
	text "¡Hola! Soy Máximo."
	line "Me apasionan las"
	cont "piedras raras."

	para "Soy de la región"
	line "de Hoenn. Es un"

	para "lugar precioso,"
	line "con el océano más"

	para "claro que puedas"
	line "imaginar."

	para "Deberías visitarlo"
	line "alguna vez."
	done

EmbeddedTowerSteven1TowerText:
	text "Máximo: Busco pie-"
	line "dras para mi co-"
	cont "lección."

	para "Ésta es la Torre"
	line "Oculta."

	para "La construyó gen-"
	line "te de Hoenn para"

	para "unir el mar, la"
	line "tierra y el cielo."
	done

EmbeddedTowerSteven1NotNowText:
	text "Máximo: Tus #"
	line "mon tienen muy"
	cont "buena pinta."

	para "Si puedes vencer"
	line "al Alto Mando,"

	para "vuelve aquí para"
	line "luchar conmigo."
	done

EmbeddedTowerSteven1ChallengeText:
	text "Máximo: Tus #"
	line "mon tienen muy"
	cont "buena pinta."

	para "Ya que estamos"
	line "los dos aquí, ¿por"
	cont "qué no luchamos?"
	done

EmbeddedTowerSteven1NoText:
EmbeddedTowerSteven2NoText:
	text "Máximo: Hmm."
	line "Si cambias de"

	para "opinión, estaré"
	line "justo aquí."
	done

EmbeddedTowerSteven1YesText:
EmbeddedTowerSteven2YesText:
	text "Máximo: ¡Quiero"
	line "que me des"

	para "con todo!"
	line "¡Venga, dale!"
	done

EmbeddedTowerSteven1WinText:
EmbeddedTowerSteven2WinText:
	text "¡Eres un entrena-"
	line "dor #mon muy"
	cont "noble!"
	done

EmbeddedTowerSteven1ItemText:
	text "Máximo: ¡Felicida-"
	line "des!"

	para "Los sentimientos"
	line "que tienes por"
	cont "tus #mon…"

	para "Y los #mon que"
	line "respondieron a"

	para "esos sentimientos"
	line "con todas sus"
	cont "fuerzas…"

	para "Se unieron como"
	line "uno solo y crea-"

	para "ron un poder aún"
	line "mayor."

	para "Y así, ¡pudisteis"
	line "alcanzar la vic-"
	cont "toria!"

	para "Seguro que puedes"
	line "sacarle partido a"
	cont "este objeto."
	done

EmbeddedTowerSteven1AfterText:
	text "Máximo: Que nues-"
	line "tros caminos vuel-"
	cont "van a cruzarse."
	done

EmbeddedTowerSteven2ChallengeText:
	text "Máximo: ¡Nos vol-"
	line "vemos a ver,"
	cont "<PLAYER>!"

	para "He encontrado muy"
	line "buenas piedras pa-"
	cont "ra mi colección."

	para "¿Y tú, qué has"
	line "estado haciendo?"

	para "¿Luchaste contra"
	line "el Alto Mando y"
	cont "volviste a ganar?"
	cont "¡Buen trabajo!"

	para "¿Por qué no echa-"
	line "mos otro combate?"
	done

EmbeddedTowerSteven2AfterText:
	text "Máximo: Al final,"
	line "sigues siendo más"
	cont "fuerte."

	para "Pero no me arre-"
	line "piento de haber"
	cont "luchado."

	para "¡Porque cada vez"
	line "que peleo contra"

	para "ti, aprendo más"
	line "sobre los #mon!"
	done
