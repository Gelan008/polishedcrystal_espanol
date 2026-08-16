Route45_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1
	warp_event 16, 22, HIDDEN_CAVE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route45SignText
	bg_event 17, 78, BGEVENT_ITEM + PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP
	bg_event 16, 21, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_ROUTE_45

	def_object_events
	object_event 19, 75, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45Dragon_tamerScript, -1
	object_event  5, 59, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBattleGirlNozomi, -1
	object_event 12, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerErik, -1
	object_event 19, 65, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerMichael, -1
	object_event  7, 28, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerParry, -1
	object_event 13, 65, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerHikerTimothy, -1
	object_event 16, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 21, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermRyan, -1
	object_event  6, 33, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainerfKelly, -1
	fruittree_event 20, 80, FRUITTREE_ROUTE_45, LEPPA_BERRY, PAL_NPC_RED
	itemball_event  8, 51, NUGGET, 1, EVENT_ROUTE_45_NUGGET
	itemball_event  5, 66, REVIVE, 1, EVENT_ROUTE_45_REVIVE
	itemball_event  7, 20, ELIXIR, 1, EVENT_ROUTE_45_ELIXIR
	itemball_event 15, 32, MAX_POTION, 1, EVENT_ROUTE_45_MAX_POTION
	object_event  4, 70, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperQuentin, -1

	object_const_def
	const ROUTE45_DRAGON_TAMER

Route45Dragon_tamerScript:
	checkevent EVENT_GOT_FOCUS_SASH_FROM_ROUTE_45_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_DRAGON_TAMER_AEGON
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BATTLE_GIRL_NOZOMI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BLACKBELT_KENJI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_ERIK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_MICHAEL
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_PARRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_HIKER_TIMOTHY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERM_RYAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_COOLTRAINERF_KELLY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE45_DRAGON_TAMER
	loadtrainer DRAGON_TAMER, AEGON
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DRAGON_TAMER_AEGON
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem FOCUS_SASH
	iffalse_endtext
	setevent EVENT_GOT_FOCUS_SASH_FROM_ROUTE_45_LEADER
	jumpthisopenedtext

.AfterText2:
	text "El arte de entre-"
	line "nar #mon de"
	cont "tipo Dragón es"
	cont "algo maravilloso."

	para "Tú también debe-"
	line "rías hacerte"
	cont "Domadragón."
	done

.IntroText:
	text "Estoy entrenando a"
	line "mis dragones aquí."

	para "¿Eh? ¿Un combate?"
	line "Quiero un combate"
	cont "de verdad,"

	para "así que demuéstra-"
	line "me tu fuerza."

	para "Vence a todos los"
	line "entrenadores de"

	para "esta ruta y lucha-"
	line "ré contigo."
	done

.QuestionText:
	text "¡Ah, ya estás a"
	line "punto! Es hora de"
	cont "un duelo: tus"
	cont "#mon contra mis"
	cont "dragones."

	para "¿Empezamos ya?"
	done

.RefusedText:
	text "Sin problema."
	line "Seguiré entrenan-"
	cont "do por aquí."
	done

.SeenText:
	text "¡A ver si aguantas"
	line "la férrea concen-"
	cont "tración de mis"
	cont "dragones!"

	para "¡Adelante,"
	line "Dragonite!"
	done

.BeatenText:
	text "¡Qué gran poder!"
	line "¡Mis #mon no"
	cont "han sido rivales"
	cont "para ti!"
	done

.AfterText1:
	text "¡Tu fuerza rivali-"
	line "za con la mía!"

	para "Toma esto. Te lo"
	line "has merecido."
	done

GenericTrainerBattleGirlNozomi:
	generictrainer BATTLE_GIRL, NOZOMI, EVENT_BEAT_BATTLE_GIRL_NOZOMI, BattleGirlNozomiSeenText, BattleGirlNozomiBeatenText

	text "Thanks for the"
	line "workout, <PLAYER>!"
	done

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI1, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenji1SeenText, BlackbeltKenji1BeatenText, 0, BlackbeltKenji1Script

BlackbeltKenji1Script:
	loadvar VAR_CALLERID, PHONE_BLACKBELT_KENJI
	opentext
	checkcellnum PHONE_BLACKBELT_KENJI
	iftruefwd .Registered
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	special Special_SampleKenjiBreakCountdown
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequalfwd $1, Route45PhoneFullM
	ifequalfwd $2, Route45NumberDeclinedM
	gettrainername BLACKBELT_T, KENJI1, STRING_BUFFER_3
	scall Route45RegisteredNumberM
	sjumpfwd Route45NumberAcceptedM

.Registered:
	readvar VAR_KENJI_BREAK
	ifnotequal $1, Route45NumberAcceptedM
	checktime 1 << MORN
	iftruefwd .Morning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Night
	checkevent EVENT_KENJI_ON_BREAK
	iffalsefwd Route45NumberAcceptedM
	scall Route45GiftM
	verbosegiveitem PP_UP
	iffalsefwd .NoRoom
	clearevent EVENT_KENJI_ON_BREAK
	special Special_SampleKenjiBreakCountdown
	sjumpfwd Route45NumberAcceptedM

.Morning:
	jumpthisopenedtext

	text "Voy a entrenar un"
	line "poco más antes de"
	cont "parar a comer."
	done

.Night:
	jumpthisopenedtext

	text "Hemos descansado"
	line "mucho al comer,"

	para "¡así que estamos"
	line "a punto otra vez!"

	para "¡Vamos a volver a"
	line "entrenar!"
	done

.NoRoom:
	sjumpfwd Route45PackFullM

Route45AskNumber1M:
	jumpstd asknumber1m

Route45AskNumber2M:
	jumpstd asknumber2m

Route45RegisteredNumberM:
	jumpstd registerednumberm

Route45NumberAcceptedM:
	jumpstd numberacceptedm

Route45NumberDeclinedM:
	jumpstd numberdeclinedm

Route45PhoneFullM:
	jumpstd phonefullm

Route45RematchM:
	jumpstd rematchm

Route45GiftM:
	jumpstd giftm

Route45PackFullM:
	jumpstd packfullm

HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd packfullm
	end

Route45RematchGiftM:
	jumpstd rematchgiftm

GenericTrainerHikerErik:
	generictrainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText

	text "Volveré a la Ruta"
	line "Helada de Endrino"

	para "a entrenar un poco"
	line "más."
	done

GenericTrainerHikerMichael:
	generictrainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText

	text "¡Madre mía, cómo"
	line "me gusta Más PS!"
	cont "¡Mmm, qué rico!"

	para "¡No paro de beber-"
	line "me el de mis"
	cont "#mon!"

	para "¡Es que no puedo"
	line "evitarlo!"
	done

TrainerHikerParry:
	trainer HIKER, PARRY1, EVENT_BEAT_HIKER_PARRY, HikerParry1SeenText, HikerParry1BeatenText, 0, HikerParry1Script

HikerParry1Script:
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	opentext
	checkflag ENGINE_PARRY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjumpfwd .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal $1, Route45PhoneFullM
	ifequal $2, Route45NumberDeclinedM
	gettrainername HIKER, PARRY1, STRING_BUFFER_3
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry1BeatenText, 0
	readmem wParryFightCount
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 1
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 2
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY_READY_FOR_REMATCH
	checkevent EVENT_PARRY_IRON
	iftruefwd .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftruefwd .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

GenericTrainerHikerTimothy:
	generictrainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText

	text "Lo mejor que me ha"
	line "pasado en la vida"

	para "ha sido descubrir"
	line "a los #mon."
	done

GenericTrainerCooltrainermRyan:
	generictrainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText

	text "Veo que crías a"
	line "tus #mon con"
	cont "mucho esmero."

	para "El vínculo que"
	line "creas te salvará"

	para "en situaciones"
	line "difíciles."
	done

GenericTrainerCooltrainerfKelly:
	generictrainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText

	text "No soy partidaria"
	line "de usar ataques"
	cont "demasiado fuertes."

	para "Quiero ganar, pero"
	line "tampoco quiero"
	cont "dañar a los"
	cont "#mon."
	done

GenericTrainerCamperQuentin:
	generictrainer CAMPER, QUENTIN, EVENT_BEAT_CAMPER_QUENTIN, CamperQuentinSeenText, CamperQuentinBeatenText

	text "¿Has estado en la"
	line "Torre Batalla?"

	para "Allí nunca, jamás"
	line "pierdo, pero…"
	done

BattleGirlNozomiSeenText:
	text "¡Este no es lugar"
	line "para #mon débi-"
	cont "les!"
	done

BattleGirlNozomiBeatenText:
	text "¡Vaya combate!"
	done

HikerErikSeenText:
	text "¡Hay que estar"
	line "preparado para"
	cont "todo!"

	para "¡Veamos si has"
	line "criado bien a tus"
	cont "#mon!"
	done

HikerErikBeatenText:
	text "¡Oh, he perdido!"
	done

HikerMichaelSeenText:
	text "¡Epa! ¡Tienes mu-"
	line "chas agallas!"

	para "¡Pero en agallas"
	line "el amo soy yo!"
	done

HikerMichaelBeatenText:
	text "¡A mis #mon les"
	line "faltaban agallas!"
	done

HikerParry1SeenText:
	text "¡Mis #mon están"
	line "llenos de fuerza!"
	done

HikerParry1BeatenText:
	text "¡Ja, ja, ja! ¡Vaya"
	line "pique y qué palo!"
	done

HikerParryAfterBattleText:
	text "No se me da bien"
	line "pensar, ¿sabes?"

	para "¡Así que solo tiro"
	line "hacia adelante con"
	cont "fuerza bruta!"
	done

HikerTimothySeenText:
	text "¿Por qué escalo"
	line "montañas?"

	para "Porque están ahí."

	para "¿Por qué entreno a"
	line "#mon?"

	para "¡Porque están ahí!"
	done

HikerTimothyBeatenText:
	text "Derrotas…"
	line "¡También las hay!"
	done

HikerParryGivesIronText:
	text "¡No encuentro la"
	line "forma de ganar!"

	para "¡Sigue así!"

	para "Ah, toma esto:"
	line "es el regalo que"

	para "no pudiste llevar-"
	line "te la otra vez."
	done

BlackbeltKenji1SeenText:
	text "Estaba entrenando"
	line "aquí a solas."

	para "¡He aquí el fruto"
	line "de mi esfuerzo!"
	done

BlackbeltKenji1BeatenText:
	text "¡Uaaaarrrg!"
	done

BlackbeltKenjiAfterBattleText:
	text "Esto requiere me-"
	line "didas extremas."

	para "Debo adentrarme"
	line "en los montes y"

	para "entrenar en sole-"
	line "dad."
	done

CooltrainermRyanSeenText:
	text "¿Qué opinas tú de"
	line "la crianza de los"
	cont "#mon?"
	done

CooltrainermRyanBeatenText:
	text "Te has ganado mi"
	line "respeto."
	done

CooltrainerfKellySeenText:
	text "¿Cuál es tu estra-"
	line "tegia de combate?"

	para "Es una insensatez"
	line "usar ataques fuer-"
	cont "tes a lo loco."
	done

CooltrainerfKellyBeatenText:
	text "Está bien. He per-"
	line "dido."
	done

CamperQuentinSeenText:
	text "¡Soy muy, pero que"
	line "muy fuerte!"

	para "¿Hay algún sitio"
	line "donde demostrar lo"
	cont "fuerte que soy?"
	done

CamperQuentinBeatenText:
	text "En la Torre Bata-"
	line "lla era fuerte…"
	done

Route45SignText:
	text "Ruta 45"
	line "Camino de montaña"
	cont "más adelante"
	done
