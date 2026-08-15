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
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_ROCKET_SHAKEDOWN
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
	setmapscene ROUTE_43_GATE, SCENE_ROUTE43GATE_NOOP
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
	text "Busco a entrena-"
	line "dores fuertes en"

	para "Johto, pero no he"
	line "hallado a ninguno."

	para "Mmm… Pareces pro-"
	line "meter."

	para "Puedo verlo en"
	line "tus ojos."

	para "Luchemos, pero"
	line "primero quiero ver"

	para "cómo dominas esta"
	line "ruta venciendo a"
	cont "todos los demás."
	done

.QuestionText:
	text "¡Excelente! Hora de"
	line "probar mi nueva"
	cont "estrategia…"

	para "¿Preparado para un"
	line "combate?"
	done

.RefusedText:
	text "Vaya… ¡Con las ga-"
	line "nas que tenía!"

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
	cont "estaba buscando!"

	para "Te daré una Llana-"
	line "sfera, pero ten"

	para "cuidado al equi-"
	line "pársela a un"
	cont "#mon."
	done

GenericTrainerBreederJody:
	generictrainer BREEDER, JODY, EVENT_BEAT_BREEDER_JODY, BreederJodySeenText, BreederJodyBeatenText

	text "A veces un #mon"
	line "bebé puede heredar"

	para "un movimiento de"
	line "su padre,"

	para "incluso uno que no"
	line "aprendería de for-"
	cont "ma normal."
	done

GenericTrainerSrandjrIvyandamy1:
	generictrainer SR_AND_JR, IVYANDAMY1, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy1SeenText, SrandjrIvyandamy1BeatenText

	text "Irene: No quiero"
	line "que mi alumna crea"

	para "que no puedo ayu-"
	line "darla."
	done

GenericTrainerSrandjrIvyandamy2:
	generictrainer SR_AND_JR, IVYANDAMY2, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy2SeenText, SrandjrIvyandamy2BeatenText

	text "Amy: Espero que mi"
	line "tutora haya visto"

	para "lo mucho que me he"
	line "esforzado."
	done

GenericTrainerCamperSpencer:
	generictrainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText

	text "¿Qué estará pasan-"
	line "do en el Lago de"
	cont "la Furia?"

	para "Teníamos planeado"
	line "acampar allí."
	done

GenericTrainerPokemaniacBen:
	generictrainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText

	text "¿Qué más me gusta"
	line "aparte de los"
	cont "#mon?"

	para "Rosa en la radio."
	line "¡Seguro que es"
	cont "muy maja!"
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

	text "Es normal que a la"
	line "gente le gusten"

	para "distintos tipos"
	line "de #mon."

	para "Tener #mon no"
	line "es solo quedarse"

	para "con el más fuerte"
	line "de todos."
	done

GenericTrainerFisherMarvin:
	generictrainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText

	text "La Cebo Ball de"
	line "César es la mejor"

	para "para atrapar #-"
	line "mon pescados."

	para "¡Es mucho más efi-"
	line "caz que una Ultra"
	cont "Ball!"
	done

TrainerPicnickerTiffany1:
	trainer PICNICKER, TIFFANY1, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffany1SeenText, PicnickerTiffany1BeatenText, 0, PicnickerTiffany1Script

PicnickerTiffany1Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	opentext
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
	iftruefwd .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	iftruefwd .HasFairyFeather
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

.HasFairyFeather:
	scall .Gift
	verbosegiveitem FAIRYFEATHER
	iffalsefwd .NoRoom
	clearflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	setevent EVENT_TIFFANY_GAVE_FAIRYFEATHER
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoClefairy:
	jumpthisopenedtext

	text "¿A que mi Clefairy"
	line "es lo más adorable"
	cont "del mundo?"
	done

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
	text "¡Oye! ¿Tienes al-"
	line "gún #mon raro?"
	done

PokemaniacBrent1BeatenText:
	text "¡Ay, mis pobres"
	line "#mon! ¡Tesoros!"
	done

PokemaniacBrentAfterBattleText:
	text "Sería feliz con te-"
	line "ner solo un #-"
	cont "mon raro."
	done

PokemaniacRonSeenText:
	text "¿Te lo puedes"
	line "creer?"

	para "¡Un tal <RIVAL> se"
	line "burló de mis"
	cont "#mon!"

	para "¡Maldita sea! ¡Mis"
	line "#mon son genia-"
	cont "les!"
	done

PokemaniacRonBeatenText:
	text "¡Mi Nidoking lo"
	line "hizo de fábula!"
	done

FisherMarvinSeenText:
	text "Estoy en mala"
	line "racha."

	para "Quizá sea el equi-"
	line "po que estoy usan-"
	cont "do."

	para "¡Luchemos para"
	line "cambiar de aires!"
	done

FisherMarvinBeatenText:
	text "He perdido, pero me"
	line "siento mejor."
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
	text "Estoy de picnic con"
	line "mis #mon."

	para "¿No te unes a no-"
	line "sotros?"
	done


BreederJodySeenText:
	text "¡Crié a mis #mon"
	line "para que supieran"

	para "movimientos espe-"
	line "ciales!"
	done

BreederJodyBeatenText:
	text "¡He perdido de to-"
	line "das formas!"
	done

SrandjrIvyandamy1SeenText:
	text "Irene: ¡Le mostra-"
	line "ré a mi alumna"
	cont "cómo se hace!"
	done

SrandjrIvyandamy1BeatenText:
	text "Irene: Me has de-"
	line "jado en evidencia"

	para "delante de mi"
	line "alumna…"
	done

SrandjrIvyandamy2SeenText:
	text "Amy: ¡Un rival!"
	line "¡Porfa, tutora,"
	cont "ayúdame a ganar!"
	done

SrandjrIvyandamy2BeatenText:
	text "Amy: No hemos po-"
	line "dido…"
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
	line "ventajas y desven-"
	cont "tajas según su"
	cont "tipo."

	para "Si los tipos difie-"
	line "ren, un #mon de"

	para "mayor nivel puede"
	line "perder un combate."

	para "Aprende qué tipos"
	line "son fuertes y dé-"

	para "biles contra el"
	line "tipo de tu #mon."
	done

Route43AdvancedTipsText:
	text "¡Pistas Entren.!"

	para "¡Un #mon hereda-"
	line "rá su naturaleza"

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
