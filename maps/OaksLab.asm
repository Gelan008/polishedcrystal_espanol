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

	text "Si te pásas por la"
	line "zona, espero que"
	cont "vuelvas a visitar-"
	cont "me."
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

	para "hayas venido desde"
	line "tan lejos a Kanto."

	para "¿Qué te parecen"
	line "los entrenadores"

	para "de aquí?"
	line "Son duros, ¿eh?"
	done

OakLabGiveStarterText:
	text "Oak: ¡Vaya, conque"
	line "la Prof. Ivy me"
	cont "manda recuerdos!"

	para "Gracias por trans-"
	line "mitir su mensaje,"
	cont "<PLAYER>."

	para "Es una muy buena"
	line "amiga mía."

	para "Si ella te dio un"
	line "#mon, ¡deja que"
	cont "haga lo mismo!"

	para "No se suele ver a"
	line "este #mon por"
	cont "Kanto ni Johto."
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
	line "gracias por tu"

	para "gran ayuda al com-"
	line "pletar la #dex."

	para "¡Toma esto como"
	line "recompensa por tu"
	cont "esfuerzo!"
	done

OakLabCatchCharmText:
	text "Llevar el Amuleto"
	line "Captura aumentará"

	para "tus opciones de"
	line "lograr una captura"
	cont "crítica."

	para "¡Es cuando lanzas"
	line "la # Ball justo"

	para "en el punto exacto"
	line "y es más fácil que"
	cont "tenga éxito!"
	done

OakLabSeenAllText:
	text "Has estado viendo"
	line "nuevos #mon a"

	para "buen ritmo, ¿a que"
	line "sí?"

	para "¡Toma esto como"
	line "recompensa por tu"
	cont "esfuerzo!"
	done

OakLabOvalCharmText:
	text "Llevar el Amuleto"
	line "Oval aumentará tus"

	para "opciones de hallar"
	line "un Huevo en la"
	cont "Guardería."
	done

OakLabCaughtAllText:
	text "No me equivoqué"
	line "al confiar en ti"
	cont "y darte esa"
	cont "#dex."

	para "Es una prueba de"
	line "tu esfuerzo…"

	para "Y del apoyo de"
	line "todos los que te"
	cont "han ayudado…"

	para "¡Así como de los"
	line "lazos que has for-"
	cont "jado con tus"
	cont "#mon!"

	para "¡Toma esto como"
	line "recompensa por tu"
	cont "esfuerzo!"
	done

OakLabShinyCharmText:
	text "Llevar el Amuleto"
	line "Iris aumentará tus"

	para "probabilidades de"
	line "hallar un #mon"
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

	para "gran montaña donde"
	line "viven multitud de"
	cont "#mon salvajes."

	para "Es un lugar dema-"
	line "siado peligroso"

	para "para cualquier en-"
	line "trenador común, y"
	cont "está restringido."

	para "Tendré que com-"
	line "probar tu nivel"
	cont "yo mismo."

	para "¿Todo a punto para"
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
	line "necesarios para"

	para "que puedas ir al"
	line "Mnt. Plateado."

	para "Es insólito, pero"
	line "haremos una excep-"

	para "ción contigo,"
	line "<PLAYER>."

	para "Sube a la Meseta"
	line "Añil. Podrás lle-"

	para "gar al Mnt. Pla-"
	line "teado desde allí."

	para "…"

	para "Dejé que Rojo en-"
	line "trenara en el Mnt."

	para "Plateado tras su"
	line "primera derrota"
	cont "como Campeón."

	para "Pero aún no ha"
	line "regresado…"
	done

OakNoKantoBadgesText:
	text "Oak: ¿Mmm? ¿No"
	line "estás reuniendo"

	para "Medallas de Gimna-"
	line "sio de Kanto?"

	para "Los Líderes de"
	line "Gimnasio de Kanto"

	para "son tan duros como"
	line "los que combatiste"
	cont "en Johto."

	para "Te recomiendo que"
	line "los desafíes."
	done

OakNoEliteFourRematchText:
	text "Oak: ¡Vaya! ¡Eso"
	line "es excelente!"

	para "Has conseguido las"
	line "Medallas de los"

	para "Gimnasios de Kan-"
	line "to. ¡Bien hecho!"

	para "Ahora puedes desa-"
	line "fiar al Alto Mando"

	para "con sus mejores"
	line "#mon."

	para "¡Sigue esforzán-"
	line "dote, <PLAYER>!"
	done

OakYesKantoBadgesText:
	text "Oak: Ah, ya estás"
	line "reuniendo Medallas"
	cont "de Gimnasio."

	para "Imagino que será"
	line "duro, pero esa ex-"

	para "periencia te ser-"
	line "virá de ayuda."

	para "Cuando reúnas las"
	line "ocho, podrás desa-"

	para "fiar al Alto Mando"
	line "en su máximo"
	cont "esplendor."

	para "¡Sigue esforzán-"
	line "dote, <PLAYER>!"
	done

OaksAssistant1Text:
	text "El programa de ra-"
	line "dio La Hora"

	para "Oak no se emite"
	line "aquí en Kanto."

	para "Es una pena… me"
	line "gustaría oírlo."
	done

OaksAssistant2Text:
	text "Gracias a tu tra-"
	line "bajo con la #-"

	para "dex, la investiga-"
	line "ción del Profesor"
	cont "va viento en popa."
	done

OaksAssistant3Text:
	text "No se lo digas a"
	line "nadie, pero La"

	para "Hora de Oak no se"
	line "emite en directo."
	done

OaksLabPoster1Text:
	text "Pulsa Start para"
	line "abrir el Menú."
	done

OaksLabPoster2Text:
	text "La opción Guardar"
	line "está en el Menú."

	para "Úsala con frecuen-"
	line "cia."
	done

OaksLabPCText:
	text "Hay un e-mail en"
	line "el PC."

	para "…"

	para "Prof. Oak: ¿Cómo"
	line "va su investiga-"
	cont "ción?"

	para "Yo sigo trabajando"
	line "duro."

	para "Se rumorea que"
	line "<PLAYER> se está"

	para "labrando una gran"
	line "reputación."

	para "Me alegra mucho"
	line "saberlo."

	para "Elm, de Pueblo"
	line "Primavera 8-)"
	done

ProfOakEeveeDollTradeText:
	text "Oak: ¡Oh! ¿Estás"
	line "admirando mi Muñe-"
	cont "co de Eevee?"

	para "Te lo cambiaré"
	line "por una Piedra-"
	cont "eterna."
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
	line "cambias de opi-"
	cont "nión."
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