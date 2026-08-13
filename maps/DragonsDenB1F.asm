DragonsDenB1F_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_DRAGONSDENB1F_NOOP
	scene_const SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DragonsDenB1FRivalCallback

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1FClairTrigger

	def_bg_events
	bg_event 18, 24, BGEVENT_JUMPTEXT, DragonsDenShrineSignText
	bg_event 33, 29, BGEVENT_ITEM + REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE
	bg_event 21, 17, BGEVENT_ITEM + MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION
	bg_event 31, 15, BGEVENT_ITEM + MAX_ELIXIR, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXIR

	def_object_events
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FRivalScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 34, 19, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, KimonoGirlMinaScript, -1
	object_event 20,  8, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerDragonTamerDarin, -1
	object_event  8,  8, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerAdam, -1
	object_event  4, 17, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoDanandcara1, -1
	object_event  4, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoDanandcara2, -1
	object_event 30, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsLeaandpia1, -1
	object_event 31, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsLeaandpia2, -1
	itemball_event 35, 16, DRAGON_FANG, 1, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	itemball_event 30,  4, CALCIUM, 1, EVENT_DRAGONS_DEN_B1F_CALCIUM
	itemball_event  5, 20, MAX_ELIXIR, 1, EVENT_DRAGONS_DEN_B1F_MAX_ELIXIR

	object_const_def
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_RIVAL
	const DRAGONSDENB1F_KIMONO_GIRL

DragonsDenB1FRivalCallback:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftruefwd .CheckDay
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.CheckDay:
	checkevent EVENT_GOT_RIVALS_EGG
	iffalsefwd .AppearRival
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .AppearRival
	ifequalfwd THURSDAY, .AppearRival
	ifequalfwd SATURDAY, .AppearRival
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.AppearRival:
	appear DRAGONSDENB1F_RIVAL
	endcallback

DragonsDenB1FClairTrigger:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext .WaitText
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, .WalksToYouMovement
	opentext
	writetext .GiveTMText
	promptbutton
	verbosegivetmhm TM_DRAGON_PULSE
	setevent EVENT_GOT_TM59_DRAGON_PULSE
	writetext .DescribeDragonPulseText
	promptbutton
	writetext ClairPokemonLeagueDirectionsText ; in BlackthornGym1F.asm
	waitbutton
	closetext
	applymovement DRAGONSDENB1F_CLAIR, .WalksAwayMovement
	special Special_FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOOP
	setmapscene NEW_BARK_TOWN, SCENE_NEWBARKTOWN_LYRA_FINAL
	clearevent EVENT_LYRA_IN_HER_ROOM
	end

.WaitText:
	text "¡Espera!"
	done

.GiveTMText:
	text "Débora: Siento"
	line "mucho esto."

	para "Toma, acepta esto"
	line "como disculpa."
	done

.DescribeDragonPulseText:
	text "Contiene Pulso"
	line "Dragón."

	para "Si no lo quieres,"
	line "no tienes que"
	cont "cogerlo."
	done

.WalksToYouMovement:
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end

.WalksAwayMovement:
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end

DragonsDenShrineSignText:
	text "Santuario Dragón"

	para "Santuario en honor"
	line "a los #mon"
	cont "dragón que dicen"

	para "que vivieron en la"
	line "Guarida Dragón."
	done

DragonsDenB1FRivalScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .RivalTalkAgain
	checkevent EVENT_GOT_RIVALS_EGG
	iftruefwd .RivalTalk
	writetext .Training1Text
	waitbutton
	writetext .GiveEggText
	promptbutton
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GiveChikoritaEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GiveCyndaquilEgg
	giveegg TOTODILE
	sjumpfwd .GotRivalsEgg

.GiveChikoritaEgg:
	giveegg CHIKORITA
	sjumpfwd .GotRivalsEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL
.GotRivalsEgg
	iffalsefwd .PartyAndBoxFull
	writetext .DescribeEggText
	waitbutton
	closetext
	setevent EVENT_GOT_RIVALS_EGG
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setmapscene ELMS_LAB, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	special RestartMapMusic
	end

.PartyAndBoxFull:
	writetext .PartyAndBoxFullText
	waitbutton
	closetext
	special RestartMapMusic
	end

.RivalTalk:
	writetext .Training1Text
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.RivalTalkAgain:
	writetext .Training2Text
	waitbutton
	closetext
	special RestartMapMusic
	end

.GiveEggText:
	text "..."
	line "Escucha."

	para "El #mon que..."
	line "cogí del Labora-"
	cont "torio..."

	para "Tenía un Huevo."
	line "No lo necesito."
	cont "Toma. Quédatelo."
	done

.DescribeEggText:
	text "Mpf. ¿Has termi-"
	line "nado aquí?"

	para "Entonces apártate"
	line "de mi camino."
	done

.PartyAndBoxFullText:
	text "Mpf. No tienes"
	line "espacio..."
	cont "Ni en tu Caja..."
	done

.Training1Text:
	text "..."
	line "¿Qué? ¿<PLAYER>?"

	para "... No, no lucharé"
	line "contigo ahora..."

	para "Mis #mon no"
	line "están listos para"
	cont "vencerte."

	para "No puedo forzarlos"
	line "demasiado ahora."

	para "Debo ser disci-"
	line "plinado para ser"

	para "el mejor entrena-"
	line "dor #mon..."
	done

.Training2Text:
	text "..."

	para "Uff..."

	para "Aprende a apartar-"
	line "te de mi camino..."
	done

GenericTrainerDragonTamerDarin:
	generictrainer DRAGON_TAMER, DARIN, EVENT_BEAT_DRAGON_TAMER_DARIN, .SeenText, .BeatenText

	text "El Santuario de"
	line "delante es hogar"

	para "del Maestro de"
	line "nuestro clan de"
	cont "domadragones."

	para "¡No tienes per-"
	line "miso para entrar"
	cont "así como así!"
	done

.SeenText:
	text "¡Tú! ¡Cómo te"
	line "atreves a entrar"
	cont "sin invitación!"
	done

.BeatenText:
	text "¡F-fuerte!"
	done

GenericTrainerDragonTamerAdam:
	generictrainer DRAGON_TAMER, ADAM, EVENT_BEAT_DRAGON_TAMER_ADAM, .SeenText, .BeatenText

	text "Ni siquiera el po-"
	line "der de los drago-"
	cont "nes pudo pararte."

	para "Puede que seas el"
	line "tipo de entrenador"

	para "que nuestro"
	line "Maestro busca."
	done

.SeenText:
	text "¡No deberías"
	line "estar aquí!"
	done

.BeatenText:
	text "¡No! ¡Me han"
	line "derrotado!"
	done

GenericTrainerAceDuoDanandcara1:
	generictrainer ACE_DUO, DANANDCARA1, EVENT_BEAT_ACE_DUO_DAN_AND_CARA, .SeenText, .BeatenText

	text "Dan: Pronto"
	line "obtendré permiso"

	para "de nuestro Maestro"
	line "para usar drago-"
	cont "nes."

	para "Cuando lo haga,"
	line "voy a convertir-"
	cont "me en un domadra-"
	cont "gones admirable y"

	para "a ganarme la"
	line "aprobación de"
	cont "nuestro Maestro."
	done

.SeenText:
	text "Dan: ¡Puede que no"
	line "use dragones, pe-"
	cont "ro sigo siendo"
	cont "fuerte!"
	done

.BeatenText:
	text "Dan: ¡Tú eres aún"
	line "más fuerte!"
	done

GenericTrainerAceDuoDanandcara2:
	generictrainer ACE_DUO, DANANDCARA2, EVENT_BEAT_ACE_DUO_DAN_AND_CARA, .SeenText, .BeatenText

	text "Cara: Los dragones"
	line "son difíciles de"

	para "criar, y muy"
	line "poderosos."

	para "No son para cual-"
	line "quiera."
	done

.SeenText:
	text "Cara: ¿Tú también"
	line "quieres entrenar"
	cont "dragones?"
	done

.BeatenText:
	text "Cara: Oh cielos,"
	line "¡he perdido!"
	done

GenericTrainerTwinsLeaandpia1:
	generictrainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, .SeenText, .BeatenText

	text "Fue como tener que"
	line "luchar contra"
	cont "Lance."
	done

.SeenText:
	text "Es un extraño que"
	line "no conocemos."
	done

.BeatenText:
	text "Ay, duele."
	done

GenericTrainerTwinsLeaandpia2:
	generictrainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, .SeenText, .BeatenText

	text "Te acusaremos."

	para "El Maestro se"
	line "enfadará contigo."
	done

.SeenText:
	text "¿Quién eres tú?"
	done

.BeatenText:
	text "Malo."
	done

KimonoGirlMinaScript:
	checkevent EVENT_GOT_ABILITYPATCH_FROM_KIMONO_GIRL_MINA
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_MINA
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked DRAGONSDENB1F_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, MINA, TRAINERPAL_MINA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_MINA
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem ABILITYPATCH
	iffalse_jumpopenedtext .BagFullText
	setevent EVENT_GOT_ABILITYPATCH_FROM_KIMONO_GIRL_MINA
	jumpthisopenedtext

.OutroText:
	text "Venir aquí desde"
	line "Ciudad Iris"

	para "valió la pena."

	para "La Guarida Dragón"
	line "es el lugar ideal"
	cont "para entrenar."
	done

.BagFullText:
	text "... Eso es, una"
	line "vez que hagas"
	cont "espacio en tu"
	cont "Mochila."
	done

.IntroText:
	text "Soy una Chica"
	line "Kimono."

	para "¿No has conocido a"
	line "mis cinco primas"
	cont "bailarinas en"
	cont "Iris?"

	para "Avísame si lo"
	line "haces."
	done

.SeenText:
	text "¡Quien más sabe,"
	line "menos habla!"

	para "¡Permíteme retarte"
	line "a ti y a tus #"
	cont "mon!"
	done

.BeatenText:
	text "Oh, eres maravi-"
	line "lloso..."
	done

.AfterText:
	text "Eres todo un En-"
	line "trenador."

	para "¡Eres digno de"
	line "este objeto!"
	done
