MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftruefwd .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	givebadge GLACIERBADGE, JOHTO_REGION
	; Begin Team Rocket takeover of Radio Tower
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	setmapscene MAHOGANY_TOWN, $1
.FightDone:
	checkevent EVENT_GOT_TM67_AVALANCHE
	iftrue_jumpopenedtext PryceText_CherishYourPokemon
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegivetmhm TM_AVALANCHE
	setevent EVENT_GOT_TM67_AVALANCHE
	jumpthisopenedtext

	text "That TM contains"
	line "Avalanche."

	para "It deals more"
	line "damage if the user"
	cont "was hurt first."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this Gym."
	done

GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

	text "I think there's a"
	line "move a #mon"

	para "can use while it's"
	line "frozen."
	done

GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText

	text "This Gym is great."
	line "I love boarding"
	cont "with my #mon!"
	done

GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText

	text "The secret behind"
	line "Pryce's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done

MahoganyGymGuyScript:
	checkevent EVENT_BEAT_PRYCE
	iftrue_jumptextfaceplayer MahoganyGymGuyWinText
	jumptextfaceplayer MahoganyGymGuyText

MahoganyGymStatue:
	gettrainername PRYCE, 1, STRING_BUFFER_4
	checkflag ENGINE_GLACIERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 14, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

PryceText_Intro:
	text "Los #mon viven"
	line "muchas cosas, como"
	cont "nosotros."

	para "Yo he visto y he"
	line "sufrido mucho."

	para "Yo ya soy viejo,"
	line "te enseñaré lo"
	cont "que quiero decir."

	para "Llevo con #mon"
	line "desde antes de que"
	cont "tú nacieras."

	para "¡No perderé fácil!"

	para "¡Yo, Fredo, señor"
	line "del Invierno, te"
	cont "mostraré mi poder!"
	done

PryceText_Impressed:
	text "Ah, me impresiona"
	line "tu gran destreza."

	para "Con esa voluntad,"
	line "superarás cada"
	cont "obstáculo vital."

	para "¡Eres digno de"
	line "esta Medalla!"
	done

PryceText_GlacierBadgeSpeech:
	text "Esa Medalla deja"
	line "a tus #mon usar"
	cont "Torbellino para"
	cont "cruzar remolinos."

	para "¡Y esto es un"
	line "regalo para ti!"
	done

PryceText_CherishYourPokemon:
	text "Al fundirse el"
	line "hielo y la nieve,"
	cont "llega primavera."

	para "Tú y tus #mon"
	line "estaréis juntos"
	cont "por muchos años."

	para "¡Atesora vuestro"
	line "tiempo juntos!"
	done

BoarderRonaldSeenText:
	text "¡Congelaré a tus"
	line "#mon! ¡No vas a"
	cont "poder hacer nada!"
	done

BoarderRonaldBeatenText:
	text "¡Maldición! No he"
	line "podido hacer nada."
	done

BoarderBradSeenText:
	text "Este Gimnasio"
	line "resbala mucho."

	para "Es divertido, ¿a"
	line "que sí?"

	para "¡Pero no estamos"
	line "aquí para jugar!"
	done

BoarderBradBeatenText:
	text "¿Ves lo en serio"
	line "que vamos?"
	done

BoarderDouglasSeenText:
	text "Sé el secreto"
	line "de Fredo."
	done

BoarderDouglasBeatenText:
	text "Vale. Te contaré"
	line "el secreto."
	done

SkierRoxanneSeenText:
	text "Para llegar hasta"
	line "nuestro Líder,"

	para "debes pensar bien"
	line "antes de patinar."
	done

SkierRoxanneBeatenText:
	text "¡Esquiando no me"
	line "ganarías jamás!"
	done

SkierClarissaSeenText:
	text "¡Mira mis giros"
	line "en paralelo!"
	done

SkierClarissaBeatenText:
	text "¡No! ¡Me hiciste"
	line "caer!"
	done

MahoganyGymGuyText:
	text "Pryce is a veteran"
	line "who has trained"

	para "#mon for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done

MahoganyGymGuyWinText:
	text "¡Fredo es genial,"
	line "pero tú eres de"
	cont "otro nivel!"

	para "¡Fue un combate"
	line "tan ardiente que"
	cont "cerró la brecha"
	cont "generacional!"
	done
