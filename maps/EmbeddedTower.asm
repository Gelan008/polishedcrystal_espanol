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

	para "Vengo de Hoenn, un"
	line "lugar precioso con"
	cont "un océano claro."

	para "Deberías visitarlo"
	line "alguna vez."
	done

EmbeddedTowerSteven1TowerText:
	text "Máximo: Busco más"
	line "piedras para mi"
	cont "colección."

	para "Esta es la Torre"
	line "Oculta."

	para "La construyó la"
	line "gente de Hoenn"
	cont "para unir tierra,"
	cont "mar y cielo."
	done

EmbeddedTowerSteven1NotNowText:
	text "Máximo: Tus"
	line "#mon tienen muy"
	cont "buena pinta."

	para "Si vences al Alto"
	line "Mando, ¡vuelve a"
	cont "luchar conmigo!"
	done

EmbeddedTowerSteven1ChallengeText:
	text "Máximo: Tus"
	line "#mon tienen muy"
	cont "buena pinta."

	para "Ya que estamos"
	line "aquí los dos, ¿por"
	cont "qué no luchamos?"
	done

EmbeddedTowerSteven1NoText:
EmbeddedTowerSteven2NoText:
	text "Máximo: Hmm."
	line "Si cambias de idea"
	cont "estaré por aquí."
	done

EmbeddedTowerSteven1YesText:
EmbeddedTowerSteven2YesText:
	text "Máximo: ¡Dalo todo"
	line "en este combate!"
	cont "¡Vamos allá!"
	done

EmbeddedTowerSteven1WinText:
EmbeddedTowerSteven2WinText:
	text "¡Eres un"
	line "entrenador #mon"
	cont "muy noble!"
	done

EmbeddedTowerSteven1ItemText:
	text "Máximo: ¡Bravo!"

	para "El cariño hacia"
	line "tus #mon…"
	cont "y su respuesta con"
	cont "todas sus fuerzas…"

	para "¡Se unieron para"
	line "crear un poder aún"
	cont "mucho más grande!"

	para "¡Así alcanzasteis"
	line "la victoria!"

	para "Seguro que sabes"
	line "aprovechar esto."
	done

EmbeddedTowerSteven1AfterText:
	text "Máximo: ¡Ojalá nos"
	line "volvamos a ver!"
	done

EmbeddedTowerSteven2ChallengeText:
	text "Máximo: ¡Nos vemos"
	line "de nuevo, <PLAYER>!"

	para "Hallé muy buenas"
	line "piedras para mi"
	cont "colección."

	para "¿Y qué hay de ti?"
	line "¿Has vencido otra"
	cont "vez al Alto Mando?"

	para "¡Buen trabajo!"
	line "¿Echamos otro"
	cont "combate tú y yo?"
	done

EmbeddedTowerSteven2AfterText:
	text "Máximo: Sigues"
	line "siendo muy fuerte."

	para "Pero no lamento"
	line "haber luchado."

	para "¡Al luchar contra"
	line "ti, aprendo más de"
	cont "los #mon!"
	done
