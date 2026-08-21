IcePathB3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	def_coord_events

	def_bg_events
	bg_event 16,  3, BGEVENT_JUMPTEXT, Text_IcePathB3FIceRock

	def_object_events
	object_event 10,  3, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LoreleiScript, -1
	itemball_event  5,  7, NEVERMELTICE, 1, EVENT_ICE_PATH_B3F_NEVERMELTICE
	smashrock_event  6, 6

	object_const_def
	const ICEPATHB3F_LORELEI

LoreleiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd LoreleiRematchScript
	checkevent EVENT_BEAT_LORELEI
	iftruefwd LoreleiAfterScript
	checkevent EVENT_INTRODUCED_LORELEI
	iftruefwd LoreleiAfterIntroScript
	writetext LoreleiIntroText
	waitbutton
	setevent EVENT_INTRODUCED_LORELEI
LoreleiAfterIntroScript:
	writetext LoreleiAfterIntroText
	yesorno
	iffalse_jumpopenedtext LoreleiNoBattleText
	writetext LoreleiSeenText
	waitbutton
	closetext
	winlosstext LoreleiBeatenText, 0
	setlasttalked ICEPATHB3F_LORELEI
	loadtrainer LORELEI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI
	opentext
	writetext LoreleiRewardText
	promptbutton
	verbosegiveitem ICY_ROCK
	setevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
LoreleiAfterScript:
	readvar VAR_BADGES
	ifequalfwd NUM_JOHTO_BADGES, .AllEightBadges
	writetext LoreleiOneMoreBadgeText
	sjumpfwd .Finish

.AllEightBadges:
	writetext LoreleiAllBadgesText
.Finish
	promptbutton
	jumpthisopenedtext

	text "If you do beat"
	line "them, meet me here"
	cont "for a rematch."
	done

LoreleiRematchScript:
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iftrue_jumpopenedtext LoreleiRematchAfterText
	checkevent EVENT_INTRODUCED_LORELEI
	iftruefwd LoreleiReintroductionScript
	writetext LoreleiIntroText
	waitbutton
	setevent EVENT_INTRODUCED_LORELEI
LoreleiAfterRematchIntroScript:
	writetext LoreleiRematchSeenText
	waitbutton
	closetext
	winlosstext LoreleiRematchBeatenText, 0
	setlasttalked ICEPATHB3F_LORELEI
	loadtrainer LORELEI, 3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI_AGAIN
	opentext
	checkevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	iftrue_jumpopenedtext LoreleiRematchAfterText
	writetext LoreleiRewardText
	promptbutton
	verbosegiveitem ICY_ROCK
	setevent EVENT_GOT_ICY_ROCK_FROM_LORELEI
	jumpthisopenedtext

LoreleiRematchAfterText:
	text "Tu viaje no ha"
	line "terminado aún."

	para "Puedes ganar más"
	line "Medallas en Kanto,"
	cont "atrapar nuevos"
	cont "#mon y mejorar."

	para "Convertirse en un"
	line "Maestro #mon"
	cont "lleva una vida."
	done

LoreleiReintroductionScript:
	writetext LoreleiRematchIntroAgainText
	waitbutton
	sjump LoreleiAfterRematchIntroScript

Text_IcePathB3FIceRock:
	text "La roca está"
	line "cubierta de hielo."

	para "Hiela la sangre"
	line "solo con tocarla."
	done

LoreleiIntroText:
	text "Lorelei: Hola,"
	line "joven. Soy Lorelei"

	para "¿Ves esa roca de"
	line "hielo de ahí?"

	para "Emite una energía"
	line "que nunca he visto"
	cont "en Kanto."

	para "Como experta en el"
	line "tipo Hielo, vine"
	cont "a investigarla."

	para "¿Y tú qué haces"
	line "por aquí?"
	done

LoreleiAfterIntroText:
	text "Lorelei: Así que"
	line "vas a desafiar a"
	cont "la Liga #mon."
	cont "Qué irónico."

	para "¿Por qué no pongo"
	line "a prueba tu valor?"
	done

LoreleiNoBattleText:
	text "Si no puedes"
	line "luchar contra mí,"

	para "¡nunca vencerás al"
	line "Campeón!"
	done

LoreleiSeenText:
	text "¡Jajaja! ¡Vas a"
	line "quedarte helado!"
	done

LoreleiBeatenText:
	text "¡Eres mejor de lo"
	line "que pensaba!"
	done

LoreleiRewardText:
	text "Sabes controlar a"
	line "los #mon de"
	cont "tipo Hielo."

	para "Seguro que podrás"
	line "usar este objeto."
	done

LoreleiRematchIntroAgainText:
	text "Lorelei: Hola de"
	line "nuevo, <PLAYER>."
	done

LoreleiRematchSeenText:
	text "¿Así que luchaste"
	line "con el Alto Mando?"

	para "Espero que le ba-"
	line "jaras los humos a"
	cont "Karen."

	para "…Eres el nuevo"
	line "Campeón. ¡Me has"
	cont "impresionado!"

	para "¡Pues ahora no me"
	line "contendré nada!"
	done

LoreleiRematchBeatenText:
	text "¡Como esperaba"
	line "del Campeón!"
	done

LoreleiOneMoreBadgeText:
	text "Sigue adelante."
	line "Podrás desafiar la"
	cont "Liga #mon con"
	cont "una Medalla más."
	done

LoreleiAllBadgesText:
	text "Sigue adelante."
	line "Ya tienes todas"
	cont "las Medallas para"
	cont "retar a la Liga."
	done
