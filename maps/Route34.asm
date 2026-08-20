Route34_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE34_NOOP
	scene_const SCENE_ROUTE34_LYRA_DAYCARE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route34EggCheckCallback

	def_warp_events
	warp_event 13, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 14, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 11, 14, DAYCARE, 1
	warp_event 11, 15, DAYCARE, 2
	warp_event 13, 15, DAYCARE, 3

	def_coord_events
	coord_event  8, 17, SCENE_ROUTE34_LYRA_DAYCARE, Route34LyraTrigger1
	coord_event  9, 17, SCENE_ROUTE34_LYRA_DAYCARE, Route34LyraTrigger2
	coord_event 10, 17, SCENE_ROUTE34_LYRA_DAYCARE, Route34LyraTrigger3

	def_bg_events
	bg_event 12,  6, BGEVENT_JUMPTEXT, Route34SignText
	bg_event 13, 33, BGEVENT_JUMPTEXT, Route34TrainerTipsText
	bg_event 18, 23, BGEVENT_JUMPTEXT, Route34AdvancedTipsSignText
	bg_event 10, 13, BGEVENT_JUMPTEXT, DayCareSignText
	bg_event  8, 32, BGEVENT_ITEM + RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY
	bg_event 17, 19, BGEVENT_ITEM + SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

	def_object_events
	object_event 11, 20, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route34RichBoyIrvingScript, -1
	object_event 10, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAYCARE_MAN_ON_ROUTE_34
	object_event  8, 12, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_ROUTE_34
	object_event 13,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerCamperTodd1, -1
	object_event 15, 32, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederJulie, -1
	object_event 10, 26, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event  6, 10, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficerfMaraScript, -1
	object_event 18, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmBrandon, -1
	object_event 14, 18, SPRITE_DAYCARE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAYCARE_MON_1
	object_event 17, 19, SPRITE_DAYCARE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAYCARE_MON_2
	object_event 11, 48, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  3, 48, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event  6, 51, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	itemball_event  7, 30, NUGGET, 1, EVENT_ROUTE_34_NUGGET

	object_const_def
	const ROUTE34_RICH_BOY
	const ROUTE34_GRAMPS
	const ROUTE34_LYRA

Route34EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftruefwd .PutDayCareManOutside
	checkscene
	iftruefwd .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	sjumpfwd .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	; fallthrough

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalsefwd .HideMon1
	clearevent EVENT_DAYCARE_MON_1
	sjumpfwd .CheckMon2

.HideMon1:
	setevent EVENT_DAYCARE_MON_1
	; fallthrough

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalsefwd .HideMon2
	clearevent EVENT_DAYCARE_MON_2
	endcallback

.HideMon2:
	setevent EVENT_DAYCARE_MON_2
	endcallback

Route34LyraTrigger1:
	applyonemovement PLAYER, step_right
	sjumpfwd Route34LyraTrigger2

Route34LyraTrigger3:
	applyonemovement PLAYER, step_left
Route34LyraTrigger2:
	turnobject PLAYER, UP
	special Special_FadeOutMusic
	showtext Route34LyraText_Grandpa
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	appear ROUTE34_LYRA
	turnobject ROUTE34_GRAMPS, UP
	pause 10
	applymovement ROUTE34_LYRA, Route34MovementData_LyraComesDown
	turnobject ROUTE34_GRAMPS, LEFT
	showtext Route34LyraGoodWorkText
	showemote EMOTE_SHOCK, ROUTE34_LYRA, 15
	pause 15
	turnobject ROUTE34_LYRA, DOWN
	showtext Route34LyraGreetingText
	applyonemovement PLAYER, step_up
	pause 10
	turnobject ROUTE34_LYRA, RIGHT
	showtext Route34LyraIntroductionText
	turnobject ROUTE34_LYRA, DOWN
	pause 10
	showtext Route34LyraChallengeText
	setevent EVENT_LYRA_ROUTE_34
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext Route34LyraWinText, Route34LyraLossText
	setlasttalked ROUTE34_LYRA
	loadtrainer LYRA1, LYRA1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	sjumpfwd .AfterBattle

.Totodile:
	winlosstext Route34LyraWinText, Route34LyraLossText
	setlasttalked ROUTE34_LYRA
	loadtrainer LYRA1, LYRA1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	sjumpfwd .AfterBattle

.Chikorita:
	winlosstext Route34LyraWinText, Route34LyraLossText
	setlasttalked ROUTE34_LYRA
	loadtrainer LYRA1, LYRA1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
.AfterBattle
	showtext Route34LyraFollowMeText
	applyonemovement ROUTE34_GRAMPS, slow_step_right
	playsound SFX_EXIT_BUILDING
	disappear ROUTE34_GRAMPS
	follow ROUTE34_LYRA, PLAYER
	applymovement ROUTE34_LYRA, Route34MovementData_LyraEntersDayCare
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear ROUTE34_LYRA
	applyonemovement PLAYER, step_right
	setscene SCENE_ROUTE34_NOOP
	pause 15
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

DayCareManScript_Outside:
	faceplayer
	opentext
	special Special_DayCareManOutside
	waitbutton
	closetext
	ifequalfwd $1, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	setevent EVENT_BRED_AN_EGG
	readvar VAR_FACING
	ifequalfwd LEFT, .walk_around_player
	applyonemovement ROUTE34_GRAMPS, slow_step_right
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special Special_DayCareMon1
	endtext

DayCareMon2Script:
	opentext
	special Special_DayCareMon2
	endtext

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_CAMPER_TODD
	opentext
	checkflag ENGINE_TODD_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue_jumpopenedtext CamperToddSaleText
	checkcellnum PHONE_CAMPER_TODD
	iftruefwd .NumberAccepted
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext CamperTodd1AfterText
	promptbutton
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .FinishAsk

.AskAgain:
	callstd asknumber2m
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername CAMPER, TODD1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext CamperTodd1BeatenText, 0
	readmem wToddFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 1
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 2
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 3
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 4
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_GINA
	opentext
	checkflag ENGINE_GINA_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftruefwd .LeafStone
	checkcellnum PHONE_PICNICKER_GINA
	iftruefwd .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PicnickerGina1AfterText
	promptbutton
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .FinishAsk

.AskAgain:
	callstd asknumber2f
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername PICNICKER, GINA1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.Rematch:
	callstd rematchf
	winlosstext PicnickerGina1BeatenText, 0
	readmem wGinaFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 1
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 2
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 3
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 4
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LeafStone:
	callstd giftf
	verbosegiveitem LEAF_STONE
	iffalsefwd .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	jumpstd numberacceptedf

.BagFull:
	jumpstd packfullf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

OfficerfMaraScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficerfMaraDaytimeText
	checkevent EVENT_BEAT_OFFICERF_MARA
	iftrue_jumptextfaceplayer OfficerfMaraAfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerfMaraSeenText
	waitbutton
	closetext
	winlosstext OfficerfMaraWinText, 0
	loadtrainer OFFICERF, MARA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_MARA
	endtext

GenericTrainerBreederJulie:
	generictrainer BREEDER, JULIE, EVENT_BEAT_BREEDER_JULIE, BreederJulieSeenText, BreederJulieBeatenText

	text "Uno de mis #mon"
	line "es de naturaleza"
	cont "Firme y otro de"
	cont "naturaleza Floja."

	para "Parece que marca"
	line "la diferencia al"
	cont "luchar."
	done

Route34RichBoyIrvingScript:
	checkevent EVENT_GOT_BIG_NUGGET_FROM_ROUTE_34_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_RICH_BOY_IRVING
	iftruefwd .Beaten
	checkevent EVENT_BEAT_CAMPER_TODD
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PICNICKER_GINA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_OFFICERF_MARA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANM_BRANDON
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BREEDER_JULIE
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE34_RICH_BOY
	loadtrainer RICH_BOY, IRVING
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RICH_BOY_IRVING
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem BIG_NUGGET
	iffalse_endtext
	setevent EVENT_GOT_BIG_NUGGET_FROM_ROUTE_34_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Hay cosas que el"
	line "dinero no puede"
	cont "comprar."
	done

.IntroText:
	text "No me hace falta"
	line "apostar Fichas."

	para "¡Soy rico, así que"
	line "compré #mon al"
	cont "contado!"

	para "¡Vencimos en el"
	line "Gim. de Azalea!"

	para "¿Quieres luchar?"
	line "¡Pues vence antes"
	cont "a los demás!"

	para "Incluso a la"
	line "policía, aunque no"
	cont "luchará hasta la"
	cont "noche."
	done

.QuestionText:
	text "¡De verdad lo has"
	line "hecho! En fin,"
	cont "noblesse oblige."

	para "¿Aceptas el duelo"
	line "contra mi equipo"
	cont "de primera?"
	done

.RefusedText:
	text "¿No tienes tantas"
	line "ganas del premio"
	cont "en metálico?"
	done

.SeenText:
	text "¡Estoy por encima"
	line "de la plebe a la"
	cont "que has ganado!"
	done

.BeatenText:
	text "¡No! Mi dinero no"
	line "ha sido bastante…"
	done

.AfterText1:
	text "Te has ganado este"
	line "objeto sin duda."

	para "Véndelo y date un"
	line "buen capricho, o"
	cont "guárdalo como un"
	cont "recuerdo nuestro."
	done

GenericTrainerPokefanmBrandon:
	generictrainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText

	text "Mi #mon usó"
	line "ataques que no"
	cont "sabía que tenía."

	para "¡Eso me dejó muy"
	line "desconcertado!"
	done

TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_POWER_HERB_FROM_KATE
	iftrue_jumptext CooltrainerfIreneAfterText2
	jumpthistext

	text "Irene: ¡Mi hermana"
	line "Kate te dará una"
	cont "lección por esto!"
	done

TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_POWER_HERB_FROM_KATE
	iftrue_jumptext CooltrainerfJennAfterText2
	jumpthistext

	text "Jenn: ¡No te fíes!"
	line "¡Mi hermana Kate"
	cont "es muy dura!"
	done

TrainerCooltrainerfKate:
	trainer COOLTRAINERF, KATE, EVENT_BEAT_COOLTRAINERF_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	checkevent EVENT_GOT_POWER_HERB_FROM_KATE
	iftrue_jumptext CooltrainerfKateAfterText
	opentext
	writetext CooltrainerfKateOfferPowerHerbText
	promptbutton
	verbosegiveitem POWER_HERB
	iffalse_endtext
	setevent EVENT_GOT_POWER_HERB_FROM_KATE
	jumpthisopenedtext

CooltrainerfKateAfterText:
	text "Kate: Siento que"
	line "te atacáramos así."

	para "No creíamos que"
	line "nadie nos fuera a"
	cont "encontrar aquí."

	para "Menudo susto nos"
	line "has dado."
	done

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step_up
	slow_step_right
	step_end

Route34MovementData_LyraComesDown:
	step_down
	step_down
	step_down
	step_right
	step_end

Route34MovementData_LyraEntersDayCare:
	step_right
	step_right
	step_end

Route34LyraText_Grandpa:
	text "Lira: ¡Abuelito!"
	done

Route34LyraGoodWorkText:
	text "Lira: ¡Abuelito,"
	line "buen trabajo!"

	para "¡El #mon que"
	line "has cuidado está"
	cont "sanísimo!"

	para "¡Y a ti se te ve"
	line "en plena forma!"
	done

Route34LyraGreetingText:
	text "Lira: ¡Hola,"
	line "<PLAYER>!"
	done

Route34LyraIntroductionText:
	text "¡Abuelito, mira,"
	line "te presento a"
	cont "mi compi!"

	para "<PLAYER> cría"
	line "genial a los"
	cont "#mon."

	para "Bueno, ¡no tanto"
	line "como tú, claro!"
	done

Route34LyraChallengeText:
	text "<PLAYER>, ¿por qué"
	line "no le enseñamos al"

	para "abuelito lo que"
	line "sabes hacer?"
	done

Route34LyraWinText:
	text "¡Luchas aún mejor"
	line "de lo que creía!"
	done

Route34LyraLossText:
	text "Bueno, aún tienes"
	line "que mejorar…"
	done

Route34LyraFollowMeText:
	text "Lira: ¡Ven, que te"
	line "presento a la"
	cont "abuelita también!"
	done

BreederJulieSeenText:
	text "¡Aquí es donde"
	line "entreno a mis"
	cont "#mon bebé!"
	done

BreederJulieBeatenText:
	text "¡He perdido con un"
	line "desconocido!"
	done

CamperTodd1SeenText:
	text "Confío mucho en mi"
	line "habilidad criando"
	cont "#mon."

	para "¿Quieres verlo?"
	done

CamperTodd1BeatenText:
	text "¿Habré fallado en"
	line "mi entrenamiento?"
	done

CamperTodd1AfterText:
	text "Quizá deba llevar"
	line "uno a la Guardería"
	cont "o usar objetos…"
	done

CamperToddSaleText:
	text "¡De compras bajo"
	line "el cielo abierto!"

	para "¡Da gusto estar en"
	line "la azotea!"
	done

PicnickerGina1SeenText:
	text "¿Eres entrenador?"

	para "¡Hagamos un duelo"
	line "de prueba!"
	done

PicnickerGina1BeatenText:
	text "¡Oh, no! Es que no"
	line "puedo ganar…"
	done

PicnickerGina1AfterText:
	text "Eres demasiado"
	line "fuerte para ser un"
	cont "rival de prueba."
	done

OfficerfMaraSeenText:
	text "¿Quién está ahí?"
	line "¿Qué estás"
	cont "tramando?"
	done

OfficerfMaraWinText:
	text "Eres un niño muy"
	line "duro de pelar."
	done

OfficerfMaraAfterText:
	text "Sí, no veo nada"
	line "raro por aquí."

	para "Pórtate bien y no"
	line "te metas en líos."
	done

OfficerfMaraDaytimeText:
	text "Estoy patrullando"
	line "en busca de gente"
	cont "sospechosa."
	done

PokefanmBrandonSeenText:
	text "Acabo de recoger a"
	line "mi #mon de la"
	cont "Guardería."

	para "¡A ver cuánto ha"
	line "mejorado!"
	done

PokefanmBrandonBeatenText:
	text "¿Por qué siempre"
	line "acaba así?"
	done

CooltrainerfIreneSeenText:
	text "Irene: ¡Kyaaah!"
	line "¡Nos han pillado!"
	done

CooltrainerfIreneBeatenText:
	text "Irene: ¡Auuuch!"
	line "¡Qué fuerza!"
	done

CooltrainerfIreneAfterText2:
	text "Irene: ¿A que esta"
	line "playa mola mucho?"

	para "¡Es nuestro rincón"
	line "secreto!"
	done

CooltrainerfJennSeenText:
	text "Jenn: ¡No vencerás"
	line "a Irene y te irás"
	cont "de rositas!"
	done

CooltrainerfJennBeatenText:
	text "Jenn: ¡Lo siento,"
	line "Irene! ¡Hermana!"
	done

CooltrainerfJennAfterText2:
	text "Jenn: La luz del"
	line "sol hace que el"
	cont "cuerpo sea fuerte."
	done

CooltrainerfKateSeenText:
	text "Kate: ¡Te pasaste"
	line "un pelo con mis"
	cont "hermanitas!"
	done

CooltrainerfKateBeatenText:
	text "Kate: ¡No! No me"
	line "creo que haya"
	cont "perdido."
	done

CooltrainerfKateOfferPowerHerbText:
	text "Kate: Qué fuerza"
	line "tienes. No tuve"
	cont "opción."

	para "Toma. Has ganado"
	line "este objeto."
	done

Route34SignText:
	text "Ruta 34"

	para "Ciudad Trigal -"
	line "Pueblo Azalea"

	para "Encinar"
	line "A medio camino"
	done

Route34TrainerTipsText:
	text "Pistas Entrenador"

	para "Los árboles dan"
	line "nuevas Bayas cada"
	cont "día."

	para "Apunta qué frutos"
	line "da cada árbol."
	done

Route34AdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡Algunos #mon"
	line "tienen potencial"
	cont "para ser mejores!"

	para "¡Y todos pueden"
	line "esforzarse al"
	cont "luchar o tomar"
	cont "vitaminas!"
	done

DayCareSignText:
	text "Guardería"

	para "¡Déjanos criar a"
	line "tus #mon!"
	done
