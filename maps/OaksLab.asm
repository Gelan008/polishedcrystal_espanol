OaksLab_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  1,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  3,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  4,  0, BGEVENT_JUMPTEXT, OaksLabPoster1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, OaksLabPoster2Text
	bg_event  0,  1, BGEVENT_JUMPTEXT, OaksLabPCText

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, EEVEE, -1, PAL_MON_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, EeveeDollScript, EVENT_DECO_EEVEE_DOLL
	object_event  1,  8, SPRITE_AROMA_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant1Text, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant2Text, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OaksAssistant3Text, -1
	object_event  2,  1, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, OaksLabPokedexText, -1

	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_EEVEE_DOLL

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .GiveStarter
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftruefwd .GiveStarter
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.GiveStarter:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftruefwd .CheckBadges
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .CheckBadges
	writetext OakLabGiveStarterText
	promptbutton
	waitsfx
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftruefwd .Charmander
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftruefwd .Squirtle
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Charmander:
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.Squirtle:
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalsefwd .PartyAndBoxFull
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	sjumpfwd .CheckBadges

.PartyAndBoxFull:
	writetext OakLabPartyAndBoxFullText
	waitbutton
.CheckBadges:
	checkevent EVENT_OPENED_MT_SILVER
	iftruefwd .CheckPokedex
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .BattleOak
	readvar VAR_BADGES
	ifequalfwd 16, .Complain1
	ifequalfwd  8, .Complain2
	writetext OakYesKantoBadgesText
	promptbutton
.CheckPokedex:
	checkkeyitem CATCH_CHARM
	iftruefwd .GotCatchCharm
	writetext OakLabCatchMoreText
	promptbutton
	verbosegivekeyitem CATCH_CHARM
	writetext OakLabCatchCharmText
	waitbutton
.GotCatchCharm
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	checkkeyitem OVAL_CHARM
	iftruefwd .NoOvalCharm
	setval16 NUM_POKEMON
	special CountSeen
	iffalsefwd .NoOvalCharm
	writetext OakLabSeenAllText
	promptbutton
	verbosegivekeyitem OVAL_CHARM
	writetext OakLabOvalCharmText
	waitbutton
.NoOvalCharm
	checkkeyitem SHINY_CHARM
	iftruefwd .NoShinyCharm
	setval16 NUM_POKEMON
	special CountCaught
	iffalsefwd .NoShinyCharm
	writetext OakLabCaughtAllText
	promptbutton
	verbosegivekeyitem SHINY_CHARM
	writetext OakLabShinyCharmText
	waitbutton
.NoShinyCharm
	jumpthisopenedtext

	text "Si pasas por la"
	line "zona, ¡espero que"
	cont "vengas a verme!"
	done

.BattleOak:
	checkevent EVENT_LISTENED_TO_OAK_INTRO
	iftruefwd .HeardIntro
	writetext OakMightBeReadyText
	waitbutton
	setevent EVENT_LISTENED_TO_OAK_INTRO
.HeardIntro:
	writetext OakChallengeText
	yesorno
	iffalsefwd .NotReady
	writetext OakSeenText
	waitbutton
	closetext
	winlosstext OakWinText, 0
	setlasttalked OAKSLAB_OAK
	loadtrainer PROF_OAK, 1
	startbattle
	reloadmapafterbattle
	opentext
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_BEAT_PROF_OAK
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.NotReady:
	writetext OakRefusedText
	promptbutton
	sjump .CheckPokedex

.Complain1:
	writetext OakNoEliteFourRematchText
	promptbutton
	sjump .CheckPokedex

.Complain2:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

EeveeDollScript:
	turnobject OAKSLAB_OAK, RIGHT
	opentext
	writetext ProfOakEeveeDollTradeText
	waitbutton
	checkitem EVERSTONE
	iffalse_jumpopenedtext NoEverstoneText
	writetext WantToTradeText
	yesorno
	iffalse_jumpopenedtext NoTradeText
	takeitem EVERSTONE
	disappear OAKSLAB_EEVEE_DOLL
	setevent EVENT_DECO_EEVEE_DOLL
	writetext EeveeDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext EeveeDollSentText
	waitbutton
	jumpthisopenedtext

	text "Prof. Oak: Ponlo"
	line "en un lugar donde"
	cont "puedas apreciarlo."
	done

OakWelcomeKantoText:
	text "Oak: ¡<PLAYER>!"
	line "Me alegra que"
	cont "hayas venido hasta"
	cont "Kanto."

	para "¿Qué te parecen"
	line "los entrenadores"
	cont "de aquí? ¿Duros?"
	done

OakLabGiveStarterText:
	text "Oak: ¡Vaya, conque"
	line "la Prof. Ivy me"
	cont "manda recuerdos!"

	para "Gracias por darme"
	line "su mensaje,"
	cont "<PLAYER>."

	para "Es una muy buena"
	line "amiga mía."

	para "Si te regaló un"
	line "#mon, ¡yo te"
	cont "daré otro!"

	para "No se suele ver a"
	line "este #mon ni"
	cont "por Kanto ni"
	cont "por Johto."
	done

OakLabPartyAndBoxFullText:
	text "Mmm, no tienes"
	line "sitio en tu equipo"
	cont "y la Caja está"
	cont "llena."
	done

OakLabDexCheckText:
	text "¿Cómo va esa"
	line "#dex?"

	para "A ver…"
	done

OakLabCatchMoreText:
	text "Quiero darte las"
	line "gracias por ayudar"
	cont "con la #dex."

	para "¡Toma esto por tu"
	line "gran esfuerzo!"
	done

OakLabCatchCharmText:
	text "Llevar el Amuleto"
	line "Captura aumentará"
	cont "las opciones de"
	cont "captura crítica"

	para "¡Lanzas la #"
	line "Ball al punto"
	cont "exacto y es más"
	cont "eficaz!"
	done

OakLabSeenAllText:
	text "Has estado viendo"
	line "nuevos #mon a"
	cont "buen ritmo, ¿eh?"

	para "¡Toma esto como"
	line "recompensa por tu"
	cont "esfuerzo!"
	done

OakLabOvalCharmText:
	text "Llevar el Amuleto"
	line "Oval aumentará tus"
	cont "opciones de hallar"
	cont "un Huevo en la"
	cont "Guardería."
	done

OakLabCaughtAllText:
	text "No me equivoqué al"
	line "confiar en ti y en"
	cont "darte la #dex."

	para "Es prueba de tu"
	line "gran esfuerzo…"
	cont "y de tus amigos…"

	para "¡Y del gran lazo"
	line "que tienes con tus"
	cont "#mon!"

	para "¡Toma esto por tu"
	line "gran esfuerzo!"
	done

OakLabShinyCharmText:
	text "Llevar el Amuleto"
	line "Iris aumentará tus"
	cont "probabilidades de"
	cont "hallar un #mon"
	cont "variocolor."
	done

OakMightBeReadyText:
	text "Oak: ¡Increíble,"
	line "<PLAYER>!"

	para "¡Has vencido al"
	line "Alto Mando por"
	cont "segunda vez!"

	para "Puede que ya"
	line "estés a punto para"
	cont "subir al Mnt."
	cont "Plateado."
	done

OakChallengeText:
	text "Oak: El Monte"
	line "Plateado es una"
	cont "gran montaña donde"
	cont "viven muchos"
	cont "#mon salvajes."

	para "Es muy peligroso y"
	line "está restringido a"
	cont "la mayoría."

	para "Tendré que medir"
	line "tu nivel yo mismo."

	para "¿A punto para"
	line "un combate?"
	done

OakRefusedText:
	text "Oak: Vuelve"
	line "cuando estés a"
	cont "punto."
	done

OakSeenText:
	text "Oak: ¡Ponlo todo"
	line "en este combate!"
	done

OakWinText:
	text "¡No me equivoqué"
	line "en mi juicio sobre"
	cont "ti!"
	done

OakOpenMtSilverText:
	text "Oak: ¡Asombroso,"
	line "<PLAYER>!"

	para "Haré los trámites"
	line "para que vayas al"
	cont "Monte Plateado."

	para "Haremos una gran"
	line "excepción contigo,"
	cont "<PLAYER>."

	para "Desde la Meseta"
	line "Añil podrás llegar"
	cont "al Monte Plateado."

	para "…"

	para "Dejé que Rojo"
	line "fuera allí tras su"
	cont "derrota como"
	cont "Campeón."

	para "Pero aún no ha"
	line "regresado…"
	done

OakNoKantoBadgesText:
	text "Oak: ¿Mmm? ¿No"
	line "buscas Medallas de"
	cont "Gimnasio en Kanto?"

	para "Los Líderes de"
	line "aquí son tan duros"
	cont "como los de Johto."

	para "¡Te recomiendo que"
	line "los desafíes!"
	done

OakNoEliteFourRematchText:
	text "Oak: ¡Vaya! ¡Eso"
	line "es excelente!"

	para "Has ganado todas"
	line "las Medallas de"
	cont "Kanto. ¡Muy bien!"

	para "Ahora puedes retar"
	line "al Alto Mando con"
	cont "sus mejores"
	cont "#mon."

	para "¡Mucho ánimo,"
	line "<PLAYER>!"
	done

OakYesKantoBadgesText:
	text "Oak: Ah, ya estás"
	line "reuniendo Medallas"
	cont "de Gimnasio."

	para "Será duro, pero te"
	line "servirá de mucha"
	cont "experiencia."

	para "Con las ocho,"
	line "podrás desafíar al"
	cont "Alto Mando de"
	cont "nuevo."

	para "¡Mucho ánimo,"
	line "<PLAYER>!"
	done

OaksAssistant1Text:
	text "La Hora Oak no"
	line "se emite en la"
	cont "radio de Kanto."

	para "Es una pena… Me"
	line "gustaría oírlo."
	done

OaksAssistant2Text:
	text "Gracias a tu labor"
	line "con la #dex,"
	cont "los estudios de"
	cont "Oak viento en popa"
	done

OaksAssistant3Text:
	text "No se lo digas a"
	line "nadie, pero La"
	cont "Hora Oak no se"
	cont "emite en directo."
	done

OaksLabPoster1Text:
	text "Pulsa Start para"
	line "abrir el Menú."
	done

OaksLabPoster2Text:
	text "La opción Guardar"
	line "está en el Menú."

	para "¡Úsala a menudo!"
	done

OaksLabPCText:
	text "Hay un e-mail en"
	line "el PC."

	para "…"

	para "Prof. Oak"
	line "¿Cómo van sus"
	cont "investigaciones?"

	para "Yo sigo trabajando"
	line "duro."

	para "Dicen que <PLAYER>"
	line "se está labrando"
	cont "gran reputación."

	para "Me alegra mucho"
	line "saberlo."

	para "Elm, de Pueblo"
	line "Primavera 8-)"
	done

ProfOakEeveeDollTradeText:
	text "Oak: ¿Admiras mi"
	line "Peluche de Eevee?"

	para "Te lo cambio por"
	line "una Piedra Eterna."
	done

NoEverstoneText:
	text "Pero si no tienes"
	line "ninguna…"
	done

WantToTradeText:
	text "¿Quieres hacer el"
	line "intercambio?"
	done

NoTradeText:
	text "Seguirá aquí si"
	line "cambias de idea."
	done

EeveeDollText:
	text "¡<PLAYER> recibió"
	line "el Muñeco de"
	cont "Eevee!"
	done

EeveeDollSentText:
	text "¡El Muñeco de"
	line "Eevee se envió a"
	cont "casa!"
	done

OaksLabPokedexText:
	text "Es la #dex del"
	line "Prof. Oak."
	done