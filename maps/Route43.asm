Route43_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route43CheckIfRocketsScript
	callback MAPCALLBACK_TILES, Route43RainScript

	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, Route43Sign1Text
	bg_event 11, 49, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 16, 38, BGEVENT_JUMPTEXT, Route43TrainerTipsText
	bg_event  7, 42, BGEVENT_JUMPTEXT, Route43AdvancedTipsText

	def_object_events
	object_event  1,  6, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route43SightseerfScript, -1
	object_event 13,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent1, -1
	object_event 14,  7, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFisherMarvin, -1
	object_event  8, 10, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany1, -1
	object_event 13, 40, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperSpencer, -1
	object_event  8, 32, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederJody, -1
	object_event 11, 24, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy1, -1
	object_event 11, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy2, -1
	cuttree_event  2, 28, EVENT_ROUTE_43_CUT_TREE
	fruittree_event  1, 26, FRUITTREE_ROUTE_43, PERSIM_BERRY, PAL_NPC_PINK
	itemball_event 12, 32, MAX_ETHER, 1, EVENT_ROUTE_43_MAX_ETHER

	object_const_def
	const ROUTE43_SIGHTSEER_F

Route43CheckIfRocketsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd Route43NoRocketsScript
	setmapscene ROUTE_43_GATE, $0
	endcallback

Route43RainScript:
	special Special_GetOvercastIndex
	ifequalfwd LAKE_OF_RAGE_OVERCAST, .flood
	changemapblocks Route43_BlockData
	endcallback

.flood
	changemapblocks Route43Raining_BlockData
	endcallback

Route43NoRocketsScript:
	setmapscene ROUTE_43_GATE, $1
	endcallback

Route43SightseerfScript:
	checkevent EVENT_GOT_FLAME_ORB_FROM_ROUTE_43_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_SIGHTSEERF_LENIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BREEDER_JODY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SR_AND_JR_IVY_AND_AMY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_CAMPER_SPENCER
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_BEN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_BRENT
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEMANIAC_RON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_FISHER_MARVIN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_TIFFANY
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE43_SIGHTSEER_F
	loadtrainer SIGHTSEERF, LENIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SIGHTSEERF_LENIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem FLAME_ORB
	iffalse_endtext
	setevent EVENT_GOT_FLAME_ORB_FROM_ROUTE_43_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Me encanta viajar"
	line "a sitios nuevos y"

	para "retar a todos los"
	line "entrenadores."

	para "Seguiré buscando a"
	line "entrenadores tan"
	cont "fuertes como tú."
	done

.IntroText:
	text "Busco rivales"
	line "fuertes en Johto,"
	cont "pero no hay nadie."

	para "Mmm… Pareces ser"
	line "alguien capaz."

	para "Puedo verlo en"
	line "tus ojos."

	para "Luchemos, pero"
	line "antes vence a los"
	cont "demás de la ruta."
	done

.QuestionText:
	text "¡Genial! Hora de"
	line "probar mi nueva"
	cont "estrategia…"

	para "¿Preparado para un"
	line "combate?"
	done

.RefusedText:
	text "Vaya… ¡Qué pena!"
	line "¡Tenía ganas!"

	para "¡No me hagas"
	line "esperar!"
	done

.SeenText:
	text "Veamos qué tan"
	line "fuertes son los"
	cont "rivales de Johto."

	para "¡Enfréntate a mi"
	line "táctica con la"
	cont "Llamasfera!"
	done

.BeatenText:
	text "¡Alucinante! ♥"
	done

.AfterText1:
	text "¡Guau! ¡Por fin he"
	line "hallado lo que"
	cont "buscaba!"

	para "Te daré una"
	line "Llamasfera, pero"
	cont "ten cuidado al"
	cont "equiparla."
	done

GenericTrainerBreederJody:
	generictrainer BREEDER, JODY, EVENT_BEAT_BREEDER_JODY, BreederJodySeenText, BreederJodyBeatenText

	text "A baby #mon"
	line "can sometimes"

	para "inherit a move"
	line "from its father,"

	para "even one that it"
	line "wouldn't normally"
	cont "learn."
	done

GenericTrainerSrandjrIvyandamy1:
	generictrainer SR_AND_JR, IVYANDAMY1, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy1SeenText, SrandjrIvyandamy1BeatenText

	text "Ivy: I don't want"
	line "my junior to think"
	cont "I can't help her."
	done

GenericTrainerSrandjrIvyandamy2:
	generictrainer SR_AND_JR, IVYANDAMY2, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy2SeenText, SrandjrIvyandamy2BeatenText

	text "Amy: I hope my"
	line "senior noticed"
	cont "how hard I tried."
	done

GenericTrainerCamperSpencer:
	generictrainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText

	text "What is going on"
	line "at Lake of Rage?"

	para "We were planning"
	line "to camp there."
	done

GenericTrainerPokemaniacBen:
	generictrainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText

	text "What else do I"
	line "like besides"
	cont "#mon?"

	para "Mary on the radio."
	line "I bet she's cute!"
	done

TrainerPokemaniacBrent1:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrent1SeenText, PokemaniacBrent1BeatenText, 0, PokemaniacBrent1Script

PokemaniacBrent1Script:
	loadvar VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	opentext
	checkflag ENGINE_BRENT_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftruefwd .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEMANIAC, BRENT1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrent1BeatenText, 0
	readmem wBrentFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 1
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 2
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 3
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Rematch:
	jumpstd rematchm

GenericTrainerPokemaniacRon:
	generictrainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText

	text "It's OK for people"
	line "to like different"
	cont "types of #mon."

	para "#mon isn't just"
	line "about having the"
	cont "most powerful one."
	done

GenericTrainerFisherMarvin:
	generictrainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText

	text "Kurt's Lure Ball"
	line "is the best for"

	para "catching hooked"
	line "#mon."

	para "It's much more"
	line "effective than a"
	cont "Ultra Ball."
	done

TrainerPicnickerTiffany1:
	trainer PICNICKER, TIFFANY1, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffany1SeenText, PicnickerTiffany1BeatenText, 0, PicnickerTiffany1Script

PicnickerTiffany1Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	opentext
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftruefwd .HasPinkBow
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftruefwd .NumberAccepted
	checkpoke CLEFAIRY
	iffalsefwd .NoClefairy
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	promptbutton
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, TIFFANY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffany1BeatenText, 0
	readmem wTiffanyFightCount
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY_READY_FOR_REMATCH
	end

.HasPinkBow:
	scall .Gift
	verbosegiveitem PINK_BOW
	iffalsefwd .NoRoom
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoClefairy:
	jumpopenedtext PicnickerTiffanyClefairyText

.AskNumber1:
	jumpstd asknumber1f

.AskNumber2:
	jumpstd asknumber2f

.RegisteredNumber:
	jumpstd registerednumberf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

.Rematch:
	jumpstd rematchf

.Gift:
	jumpstd giftf

.PackFull:
	jumpstd packfullf

PokemaniacBenSeenText:
	text "¡Me encantan los"
	line "#mon!"

	para "¡Por eso empecé,"
	line "y por eso seguiré"

	para "coleccionando más"
	line "#mon!"
	done

PokemaniacBenBeatenText:
	text "¿Cómo has podido"
	line "hacerme esto?"
	done

PokemaniacBrent1SeenText:
	text "¡Oye! ¿Tienes un"
	line "#mon raro?"
	done

PokemaniacBrent1BeatenText:
	text "¡Ay, mis pobres"
	line "#mon! ¡Tesoros!"
	done

PokemaniacBrentAfterBattleText:
	text "Sería feliz solo"
	line "con tener algún"
	cont "#mon raro."
	done

PokemaniacRonSeenText:
	text "¿Te lo puedes"
	line "creer?"

	para "¡Un tal <RIVAL> se"
	line "burló de mis"
	cont "#mon!"

	para "¡Maldición! ¡Mis"
	line "#mon son"
	cont "geniales!"
	done

PokemaniacRonBeatenText:
	text "¡Mi Nidoking lo"
	line "hizo de fábula!"
	done

FisherMarvinSeenText:
	text "Estoy en mala"
	line "racha."

	para "Quizá sea por el"
	line "equipo que uso."

	para "¡Luchemos para"
	line "cambiar de aires!"
	done

FisherMarvinBeatenText:
	text "He perdido, pero"
	line "me siento mejor."
	done

CamperSpencerSeenText:
	text "¡Puedo hacer tanto"
	line "con mis #mon!"
	cont "¡Es divertidísimo!"
	done

CamperSpencerBeatenText:
	text "Perder no tiene"
	line "ninguna gracia…"
	done

PicnickerTiffany1SeenText:
	text "¿Tú también vas al"
	line "Lago de la Furia?"

	para "¡Vamos a jugar un"
	line "rato!"
	done

PicnickerTiffany1BeatenText:
	text "¡He jugado de más!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Hago un picnic con"
	line "mis #mon."

	para "¿Por qué no te"
	line "unes a nosotros?"
	done

PicnickerTiffanyClefairyText:
	text "Isn't my Clefairy"
	line "just the most"
	cont "adorable thing?"
	done

BreederJodySeenText:
	text "¡Crié a mis"
	line "#mon para"
	cont "que supieran"
	cont "movimientos"
	cont "especiales!"
	done

BreederJodyBeatenText:
	text "¡He perdido de"
	line "todas formas!"
	done

SrandjrIvyandamy1SeenText:
	text "Irene: ¡Enseñaré a"
	line "mi alumna cómo"
	cont "se hace!"
	done

SrandjrIvyandamy1BeatenText:
	text "Irene: ¡Qué gran"
	line "vergüenza…!"

	para "Delante de mi"
	line "alumna…"
	done

SrandjrIvyandamy2SeenText:
	text "Amy: ¡Un rival!"
	line "¡Porfa, tutora,"
	cont "ayúdame a ganar!"
	done

SrandjrIvyandamy2BeatenText:
	text "Amy: ¡No hemos"
	line "podido…!"
	done

Route43Sign1Text:
	text "Ruta 43"

	para "Lago de la Furia -"
	line "Pueblo Caoba"
	done

Route43Sign2Text:
	text "Ruta 43"

	para "Lago de la Furia -"
	line "Pueblo Caoba"
	done

Route43TrainerTipsText:
	text "Pistas Entrenador"

	para "Los #mon tienen"
	line "ventajas según"
	cont "su tipo."

	para "Por las ventajas,"
	line "un #mon con más"
	cont "nivel puede perder"
	cont "un combate."

	para "Aprende qué tipos"
	line "son fuertes o no"
	cont "contra los tuyos."
	done

Route43AdvancedTipsText:
	text "¡Consejo Avanzado!"

	para "¡Un #mon"
	line "heredará su"
	cont "naturaleza"

	para "si lleva equipada"
	line "una Piedraeterna!"

	para "¡Un Lazo Destino"
	line "puede transmitir"
	cont "todo su potencial!"

	para "¡Los seis objetos"
	line "Recios transmiten"

	para "el potencial de su"
	line "característica!"

	para "¡Y una Cápsula de"
	line "Habilidad aumenta"

	para "la opción de crías"
	line "con una Habilidad"
	cont "oculta!"
	done
