GoldenrodUnderground_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, GoldenrodUndergroundResetSwitches
	callback MAPCALLBACK_TILES, GoldenrodUndergroundCheckBasementKey
	callback MAPCALLBACK_OBJECTS, GoldenrodUndergroundCheckDayOfWeek

	def_warp_events
	warp_event  1,  2, GOLDENROD_UNDERGROUND_ENTRANCES, 4
	warp_event  1, 38, GOLDENROD_UNDERGROUND_ENTRANCES, 1
	warp_event 16,  6, GOLDENROD_UNDERGROUND, 4
	warp_event 17, 23, GOLDENROD_UNDERGROUND, 3
	warp_event 18, 23, GOLDENROD_UNDERGROUND, 3
	warp_event 18, 19, GOLDENROD_UNDERGROUND_SWITCH_ROOM, 1
	warp_event 19, 36, GOLDENROD_UNDERGROUND_ENTRANCES, 7

	def_coord_events

	def_bg_events
	bg_event 16,  6, BGEVENT_READ, BasementDoorScript
	bg_event 17,  6, BGEVENT_JUMPTEXT, GoldenrodUndergroundNoEntryText
	bg_event  4, 17, BGEVENT_ITEM + PARALYZEHEAL, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_PARALYZEHEAL
	bg_event  2, 22, BGEVENT_ITEM + SUPER_POTION, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_SUPER_POTION
	bg_event 15,  8, BGEVENT_ITEM + ANTIDOTE, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_ANTIDOTE
	bg_event 20, 31, BGEVENT_ITEM + X_SP_ATK, EVENT_GOLDENROD_UNDERGROUND_HIDDEN_X_SP_ATK

	def_object_events
	object_event  5, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BargainMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRAMPS
	object_event  5, 18, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlderHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_OLDER_HAIRCUT_BROTHER
	object_event  5, 19, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungerHaircutBrotherScript, EVENT_GOLDENROD_UNDERGROUND_YOUNGER_HAIRCUT_BROTHER
	object_event  5, 25, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BitterMerchantScript, EVENT_GOLDENROD_UNDERGROUND_GRANNY
	object_event 13, 29, SPRITE_PIERS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PiersScript, -1
	object_event  3, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSupernerdEric, -1
	object_event  4,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSupernerdTeru, -1
	object_event  1, 31, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacIssac, -1
	object_event  0,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokemaniacDonald, -1
	object_event  8, 31, SPRITE_COSPLAYER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCosplayerClara, -1
	object_event 14, 29, SPRITE_PIDGEOTTO_SIDE, SPRITEMOVEDATA_MICROPHONE, 0, 0, -1, PAL_NPC_EMOTE_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, PiersMicrophoneText, -1
	object_event  5, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLACK, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundCandyManScript, -1
	keyitemball_event  5, 28, COIN_CASE, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE

	object_const_def
	const GOLDENRODUNDERGROUND_GRAMPS
	const GOLDENRODUNDERGROUND_SUPER_NERD5
	const GOLDENRODUNDERGROUND_SUPER_NERD6
	const GOLDENRODUNDERGROUND_GRANNY
	const GOLDENRODUNDERGROUND_PIERS

GoldenrodUndergroundResetSwitches:
	setevent EVENT_DOOR_1_OPEN
	setevent EVENT_DOOR_2_OPEN
	setevent EVENT_DOOR_3_OPEN
	setevent EVENT_DOOR_4_OPEN
	setevent EVENT_DOOR_5_OPEN
	setevent EVENT_DOOR_6_OPEN
	clearevent EVENT_DOOR_7_OPEN
	clearevent EVENT_DOOR_8_OPEN
	setevent EVENT_DOOR_9_OPEN
	setevent EVENT_DOOR_10_OPEN
	clearevent EVENT_DOOR_11_OPEN
	endcallback

GoldenrodUndergroundCheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalsefwd .LockBasementDoor
	endcallback

.LockBasementDoor:
	changeblock 16, 6, $3d
	endcallback

GoldenrodUndergroundCheckDayOfWeek:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequalfwd THURSDAY, .Thursday
	ifequalfwd FRIDAY, .Friday
	ifequalfwd SATURDAY, .Saturday

.Sunday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Monday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	checktime 1 << MORN
	iffalsefwd .NotMondayMorning
	appear GOLDENRODUNDERGROUND_GRAMPS
.NotMondayMorning:
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Tuesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Wednesday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Thursday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Friday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	disappear GOLDENRODUNDERGROUND_SUPER_NERD5
	appear GOLDENRODUNDERGROUND_SUPER_NERD6
	disappear GOLDENRODUNDERGROUND_GRANNY
	endcallback

.Saturday:
	disappear GOLDENRODUNDERGROUND_GRAMPS
	appear GOLDENRODUNDERGROUND_SUPER_NERD5
	disappear GOLDENRODUNDERGROUND_SUPER_NERD6
	appear GOLDENRODUNDERGROUND_GRANNY
	endcallback

GenericTrainerSupernerdEric:
	generictrainer SUPER_NERD, ERIC, EVENT_BEAT_SUPER_NERD_ERIC, SupernerdEricSeenText, SupernerdEricBeatenText

	text "Supongo que ten-"
	line "dré que hacer"
	cont "las cosas bien..."
	done

GenericTrainerSupernerdTeru:
	generictrainer SUPER_NERD, TERU, EVENT_BEAT_SUPER_NERD_TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText

	text "Me sé bien los"
	line "tipos de #mon."

	para "Pero yo sólo uso"
	line "un tipo de"
	cont "#mon."
	done

GenericTrainerPokemaniacIssac:
	generictrainer POKEMANIAC, ISSAC, EVENT_BEAT_POKEMANIAC_ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText

	text "A tus #mon"
	line "les gustarás más"

	para "si les haces unos"
	line "cortes de pelo."
	done

GenericTrainerPokemaniacDonald:
	generictrainer POKEMANIAC, DONALD, EVENT_BEAT_POKEMANIAC_DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText

	text "¿Estás haciendo"
	line "una #dex?"
	cont "Tengo un consejo."

	para "El Montañero de la"
	line "Ruta 33, Antonio,"
	cont "es un buen tipo."

	para "Te llamará si ve"
	line "algún #mon"
	cont "raro."
	done

GenericTrainerCosplayerClara:
	generictrainer COSPLAYER, CLARA, EVENT_BEAT_COSPLAYER_CLARA, CosplayerClaraSeenText, CosplayerClaraBeatenText

	text "¡Hice este"
	line "disfraz yo misma!"
	done

BitterMerchantScript:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .Open
	ifequalfwd SATURDAY, .Open
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.Open:
	pokemart MARTTYPE_BITTER, MART_UNDERGROUND

BargainMerchantScript:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue_jumptext GoldenrodUndergroundWeAreNotOpenTodayText
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .CheckMorn
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.CheckMorn:
	checktime 1 << MORN
	iffalse_jumptext GoldenrodUndergroundWeAreNotOpenTodayText
	pokemart MARTTYPE_BARGAIN, 0

OlderHaircutBrotherScript:
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .DoHaircut
	ifequalfwd THURSDAY, .DoHaircut
	ifequalfwd SATURDAY, .DoHaircut
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.DoHaircut:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftruefwd .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText
	yesorno
	iffalsefwd .Refused
	checkmoney YOUR_MONEY, 500
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText
	promptbutton
	special Special_OlderHaircutBrother
	ifequalfwd $0, .Refused
	ifequalfwd $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequalfwd $2, .two
	ifequalfwd $3, .three
	sjumpfwd .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	; fallthrough

.then
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundOlderHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue EitherHaircutBrotherScript_Happier
	sjump EitherHaircutBrotherScript_MuchHappier

.Refused:
	jumpthisopenedtext

	text "¿De verdad?"
	line "¡Qué lástima!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Necesitarás más"
	line "dinero que ese."
	done

.AlreadyGotHaircut:
	jumpthisopenedtext

	text "Sólo hago un corte"
	line "al día. Ya he aca-"
	cont "bado por hoy."
	done

YoungerHaircutBrotherScript:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .DoHaircut
	ifequalfwd WEDNESDAY, .DoHaircut
	ifequalfwd FRIDAY, .DoHaircut
	jumptext GoldenrodUndergroundWeAreNotOpenTodayText

.DoHaircut:
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftruefwd .AlreadyGotHaircut
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText
	yesorno
	iffalsefwd .Refused
	checkmoney YOUR_MONEY, 300
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText
	promptbutton
	special Special_YoungerHaircutBrother
	ifequalfwd $0, .Refused
	ifequalfwd $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequalfwd $2, .two
	ifequalfwd $3, .three
	sjumpfwd .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjumpfwd .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
.then
	takemoney YOUR_MONEY, 300
	special PlaceMoneyTopRight
	writetext GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestartMapMusic
	opentext
	writetext GoldenrodUndergroundYoungerHaircutBrotherAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd EitherHaircutBrotherScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftruefwd EitherHaircutBrotherScript_Happier
	sjumpfwd EitherHaircutBrotherScript_MuchHappier

.Refused:
	jumpthisopenedtext

	text "¿No?"
	line "¡Qué decepción!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Estás un poco"
	line "corto de fondos."
	done

.AlreadyGotHaircut:
	jumpthisopenedtext

	text "Sólo puedo hacer"
	line "un corte al día."

	para "Lo siento, pero"
	line "he acabado por"
	cont "hoy."
	done

EitherHaircutBrotherScript_SlightlyHappier:
	writetext HaircutBrosText_SlightlyHappier
	special PlayCurMonCry
	waitendtext

EitherHaircutBrotherScript_Happier:
	writetext HaircutBrosText_Happier
	special PlayCurMonCry
	waitendtext

EitherHaircutBrotherScript_MuchHappier:
	writetext HaircutBrosText_MuchHappier
	special PlayCurMonCry
	waitendtext

BasementDoorScript::
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue_jumptext GoldenrodUndergroundTheDoorIsOpenText
	checkkeyitem BASEMENT_KEY
	iffalse_jumptext GoldenrodUndergroundTheDoorsLockedText
	opentext
	playsound SFX_TRANSACTION
	writetext GoldenrodUndergroundBasementKeyOpenedDoorText
	waitbutton
	closetext
	changeblock 16, 6, $2e
	refreshmap
	setevent EVENT_USED_BASEMENT_KEY
	endtext

GoldenrodUndergroundCandyManScript:
	checkevent EVENT_GOT_CANDY_JAR
	iftruefwd .AlreadyGotCandyJar
	opentext
	writetext .GiveCandyJarText1
	waitbutton
	verbosegivekeyitem CANDY_JAR
	setevent EVENT_GOT_CANDY_JAR
	writetext .GiveCandyJarText2
	waitbutton
	setval 1
	writemem wExpCandySAmount
	endtext

.AlreadyGotCandyJar:
	pokemart MARTTYPE_EXP_CANDY, 0

.GiveCandyJarText1:
	text "¡Psst! Por aquí..."
	line "Parece que te"
	cont "vendría bien una"
	cont "ayuda."

	para "No hagas muchas"
	line "preguntas."

	para "Toma, coge esto."
	done

.GiveCandyJarText2:
	text "Es un Tarro"
	line "Caramelos."

	para "Lo necesitarás"
	line "para guardar mis,"
	cont "eh, caramelos"
	cont "especiales."

	para "¡El primero in-"
	line "vita la casa!"
	cont "Pruébalo."

	para "...Para tu"
	line "#mon,"
	cont "por supuesto."
	done

PiersScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd PiersRematchScript
	checkevent EVENT_BEAT_PIERS
	iftrue_jumpopenedtext PiersAfterText
	checkevent EVENT_INTRODUCED_PIERS
	iftruefwd .AfterIntro
	writetext PiersIntroText
	waitbutton
	setevent EVENT_INTRODUCED_PIERS
.AfterIntro:
	writetext PiersAfterIntroText
	yesorno
	iffalse_jumpopenedtext PiersNoBattleText
	writetext PiersSeenText
	waitbutton
	closetext
	winlosstext PiersBeatenText, 0
	setlasttalked GOLDENRODUNDERGROUND_PIERS
	loadtrainer PIERS, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PIERS
	opentext
	writetext PiersRewardText
	promptbutton
	verbosegiveitem THROAT_SPRAY
	iffalse_jumpopenedtext PiersAfterText
	setevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	jumpthisopenedtext

PiersAfterText:
	text "Si quieres ser el"
	line "nuevo Campeón,"

	para "¡mejor que te pon-"
	line "gas en marcha!"

	para "¡Te mandaré algo"
	line "de apoyo con"
	cont "un grito!"
	done

PiersRematchScript:
	checkevent EVENT_BEAT_PIERS_AGAIN
	iffalsefwd .DoRematch
	checkevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	iftrue_jumpopenedtext PiersRematchAfterText
	opentext
	sjumpfwd .GiveThroatSpray
.DoRematch:
	checkevent EVENT_INTRODUCED_PIERS
	iffalsefwd .Intro
	writetext PiersRematchIntroAgainText
	sjumpfwd .AfterIntro
.Intro:
	writetext PiersIntroText
.AfterIntro:
	setevent EVENT_INTRODUCED_PIERS
	waitbutton
	writetext PiersRematchSeenText
	waitbutton
	closetext
	winlosstext PiersRematchBeatenText, 0
	setlasttalked GOLDENRODUNDERGROUND_PIERS
	loadtrainer PIERS, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PIERS_AGAIN
	opentext
	checkevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	iftrue_jumpopenedtext PiersRematchAfterText
.GiveThroatSpray:
	writetext PiersRewardText
	promptbutton
	verbosegiveitem THROAT_SPRAY
	iffalse_jumpopenedtext PiersRematchAfterText
	setevent EVENT_GOT_THROAT_SPRAY_FROM_PIERS
	jumpthisopenedtext

PiersRematchAfterText:
	text "Tengo una herma-"
	line "nita."
	cont "Se llama Roxy."

	para "Es tan mona como"
	line "parece."

	para "Cuando sea mayor,"
	line "no sé si"

	para "querrá cantar,"
	line "tocar música,"

	para "luchar con #-"
	line "mon, o algo to-"
	cont "talmente nuevo."

	para "Pero elija lo"
	line "que elija, espe-"
	cont "ro"

	para "¡que tenga tanta"
	line "pasión como"
	cont "tú, <PLAYER>!"
	done

PiersIntroText:
	text "Nerio: Lo único"
	line "que puede hacer un"
	cont "humilde cantante"
	cont "es cantar una hu-"
	cont "milde canción... ♪"

	para "Me llamo Nerio."
	line "No soy de Johto,"

	para "pero vine aquí"
	line "para cantar en la"

	para "radio y hacer"
	line "sonreír a todos"
	cont "en mi ciudad."
	done

PiersAfterIntroText:
	text "Algunos de mis me-"
	line "jores riffs han"

	para "salido de ganar un"
	line "buen combate."

	para "¿Qué te parece si"
	line "tenemos uno aquí"
	cont "y ahora?"
	done

PiersNoBattleText:
	text "Ay... Siento que"
	line "mi alma llora."
	done

PiersSeenText:
	text "¡Hago música os-"
	line "cura y uso #mon"
	cont "de tipo Siniestro!"

	para "¡Hora de rockear!"
	done

PiersBeatenText:
	text "Mi equipo y yo in-"
	line "tentamos darlo"
	cont "todo."
	done

PiersRewardText:
	text "Me alegro de que"
	line "pudiéramos luchar."

	para "Parece que mis"
	line "#mon sienten"
	cont "lo mismo."

	para "¡Aquí tienes algo"
	line "para ayudarte a"

	para "rockear aún más"
	line "fuerte la próxima"
	cont "vez!"
	done

PiersRematchIntroAgainText:
	text "Nerio: Hola,"
	line "<PLAYER>."
	done

PiersRematchSeenText:
	text "¡Ja! Así que eres"
	line "el nuevo Campeón."

	para "¡Eres alguien"
	line "importante ahora!"

	para "Y yo sigo cantando"
	line "mis humildes can-"
	cont "ciones..."

	para "¿Así que quieres"
	line "un bis?"

	para "¡Haré una excep-"
	line "ción por ti, solo"
	cont "por esta vez!"
	done

PiersRematchBeatenText:
	text "¡¿Eso es todo?!"
	line "¡No puede ser!"
	done

SupernerdEricSeenText:
	text "Me echaron del"
	line "Casino."

	para "Intentaba hacer"
	line "trampas con mi"
	cont "#mon..."
	done

SupernerdEricBeatenText:
	text "...Grrr..."
	done

SupernerdTeruSeenText:
	text "¿Tienes en cuenta"
	line "los tipos en un"
	cont "combate?"

	para "Si conoces las"
	line "ventajas de tipo,"

	para "te irá mejor en"
	line "combate."
	done

SupernerdTeruBeatenText:
	text "¡Ay, ay, ay!"
	done

PokemaniacIssacSeenText:
	text "¡Le acaban de cor-"
	line "tar el pelo a mi"
	cont "#mon!"

	para "¡Te mostraré lo"
	line "fuerte que es!"
	done

PokemaniacIssacBeatenText:
	text "¡Ayyyyy!"
	done

PokemaniacDonaldSeenText:
	text "Creo que llevas"
	line "algún #mon"
	cont "raro."

	para "¡Déjame verlos!"
	done

PokemaniacDonaldBeatenText:
	text "¡Aah! ¡Perdí!"
	line "¡Qué rabia me da!"
	done

CosplayerClaraSeenText:
	text "¡Pix! ¡Vul, pix! ♥"
	done

CosplayerClaraBeatenText:
	text "¿Pensaste que"
	line "era un #mon?"

	para "¡No! Es solo"
	line "un cosplay de"
	cont "calidad."
	done

GoldenrodUndergroundTheDoorsLockedText:
	text "La puerta está ce-"
	line "rrada..."
	done

GoldenrodUndergroundTheDoorIsOpenText:
	text "La puerta está"
	line "abierta."
	done

GoldenrodUndergroundBasementKeyOpenedDoorText:
	text "La Llave Sótano"
	line "abrió la puerta."
	done

GoldenrodUndergroundOlderHaircutBrotherOfferHaircutText:
	text "¡Hola!"

	para "¡Llevo la Pelu-"
	line "quería #mon!"

	para "Soy el mayor y el"
	line "mejor de los"
	cont "Hermanos Peluque-"
	cont "ros."

	para "Puedo poner pre-"
	line "cioso a tu #mon"
	cont "por sólo 500¥."

	para "¿Quieres que"
	line "se lo corte?"
	done

GoldenrodUndergroundOlderHaircutBrotherAskWhichMonText:
	text "¿A qué #mon"
	line "se lo corto?"
	done

GoldenrodUndergroundOlderHaircutBrotherWatchItBecomeBeautifulText:
	text "¡Vale! ¡Mira qué"
	line "bien se queda!"
	done

GoldenrodUndergroundOlderHaircutBrotherAllDoneText:
	text "¡Ya está! ¡Listo!"
	done

GoldenrodUndergroundYoungerHaircutBrotherOfferHaircutText:
	text "¡Te damos la bien-"
	line "venida a la Pelu-"
	cont "quería #mon!"

	para "Soy el menor de"
	line "los Hermanos Pe-"
	cont "luqueros y el más"
	cont "barato."

	para "Pondré a tu #mon"
	line "guapísimo por"
	cont "sólo 300¥."

	para "¿Qué te parece?"
	done

GoldenrodUndergroundYoungerHaircutBrotherAskWhichMonText:
	text "Vale, ¿a qué #-"
	line "mon se lo corto?"
	done

GoldenrodUndergroundYoungerHaircutBrotherIllMakeItLookCoolText:
	text "¡Vale! ¡Lo dejaré"
	line "súper guay!"
	done

GoldenrodUndergroundYoungerHaircutBrotherAllDoneText:
	text "¡Ya está!"
	line "¡Todo listo!"
	done

HaircutBrosText_SlightlyHappier:
	text_ram wStringBuffer3
	text " parece"
	line "un poco más feliz."
	done

HaircutBrosText_Happier:
	text_ram wStringBuffer3
	text " parece"
	line "feliz."
	done

HaircutBrosText_MuchHappier:
	text_ram wStringBuffer3
	text " parece"
	line "encantado."
	done

GoldenrodUndergroundWeAreNotOpenTodayText:
	text "Hoy no abrimos."
	done

GoldenrodUndergroundNoEntryText: ; text > text
	text "PROHIBIDO EL PASO"
	line "A PARTIR DE AQUI"
	done

PiersMicrophoneText:
	text "Es un micrófono."
	done
