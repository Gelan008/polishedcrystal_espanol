GoldenrodPokecomCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, JudgeMachineScreenCallback

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  1,  6, GOLDENROD_POKECOM_CENTER_OFFICE, 2
	warp_event  0, 15, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, PokemonJournalWhitneyScript
	bg_event 24,  5, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  6, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  7, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  8, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  9, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24, 10, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 25, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 26, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 27, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 28, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 29,  5, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  6, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  7, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  8, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  9, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29, 10, BGEVENT_LEFT, JudgeMachineScript
	bg_event 24,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_GOLDENROD_POKECOM_CENTER_1F_HIDDEN_RARE_CANDY

	def_object_events
	object_event 23, 10, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, JudgeMachineEngineerScript, EVENT_JUDGE_MACHINE_ENGINEER
	object_event  7,  7, SPRITE_BOWING_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  0, 12, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FGameboyKidText, -1
	object_event  3, 11, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FLassText, -1
	object_event 12, 14, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_TEAL, OBJECTTYPE_SCRIPT, 0, WonderTradeReceptionistScript, -1
	object_event  8, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FSuperNerdText, -1
	object_event 27, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FPokefanFText_Sunflora, -1
	object_event 21,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FRockerText, -1
	object_event 18, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FGrampsText, -1
	object_event 18,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPokecenter1FLassText_PidgeyMail, -1
	object_event  3,  9, SPRITE_ICE_BOULDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_SCRIPT, 0, InfoSignScript, -1
	object_event 23,  3, SPRITE_ICE_BOULDER, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_COMMAND, end, NULL, -1

	object_const_def
	const GOLDENRODPOKECOMCENTER1F_ENGINEER

JudgeMachineScreenCallback:
	checkflag ENGINE_JUDGE_MACHINE
	iffalsefwd .Done
	changeblock 24, 0, $49
	changeblock 26, 0, $4a
	changeblock 28, 0, $4b
	changeblock 24, 2, $4c
	changeblock 26, 2, $4d
	changeblock 28, 2, $4e
.Done
	endcallback

GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMING_TO_POKECOM_CENTER
	jumpstd pokecenternurse

GoldenrodPokecenter1FGameboyKidText:
	text "El Coliseo de"
	line "arriba es para"
	cont "luchar por cable."

	para "Los récords están"
	line "en la pared, ¡así"
	cont "que no puedo"
	cont "perder!"
	done

GoldenrodPokecenter1FLassText:
	text "No siempre gana el"
	line "#mon de más"
	cont "nivel."

	para "Al fin y al cabo,"
	line "puede tener mala"
	cont "afinidad de tipos."

	para "No creo que haya"
	line "un solo #mon"
	cont "invencible."
	done

GoldenrodPokecenter1FPokefanF:
	checkevent EVENT_GOT_EVIOLITE_IN_GOLDENROD
	iftrue_jumptextfaceplayer GoldenrodPokecenter1FPokefanFGotEvioliteText
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	checkitem EON_MAIL
	iffalse_jumpopenedtext GoldenrodPokecenter1FPokefanFTooBadText
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse_jumpopenedtext GoldenrodPokecenter1FPokefanFTooBadText
	takeitem EON_MAIL
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem EVIOLITE
	iffalsefwd .NoRoomForEviolite
	setevent EVENT_GOT_EVIOLITE_IN_GOLDENROD
	jumpthisopenedtext

	text "My daughter will"
	line "be delighted!"
	done

.NoRoomForEviolite:
	giveitem EON_MAIL
	jumpthisopenedtext

	text "Oh… Well, another"
	line "time, then."
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "¡Uy, tu mochila"
	line "pesa mucho!"

	para "¡Ah! ¿No tendrás"
	line "una Carta Eón?"

	para "A mi hija le"
	line "gustaría tener"
	cont "una."

	para "¿Me darías una?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "¿Dar una Carta"
	line "Eón?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "¡Oh, es genial!"
	line "¡Gracias, cielo!"

	para "¡Toma esto a"
	line "cambio!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "¿Ah? ¿No tienes"
	line "ninguna? Qué pena."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> entregó"
	line "la Carta Eón."
	done

GoldenrodPokecenter1FPokefanFGotEvioliteText:
	text "¡Gracias por"
	line "la Carta Eón!"

	para "¡A mi hija le"
	line "hará ilusión!"
	done

WonderTradeReceptionistScript:
	opentext
	writetext WonderTradeIntroText
	waitbutton
	checkevent EVENT_INTRODUCED_TEALA
	iftruefwd .introduced
	writetext IntroduceTealaText
	waitbutton
	setevent EVENT_INTRODUCED_TEALA
.introduced
	writetext WonderTradeExplanationText
	promptbutton
	special WonderTrade
	iffalsefwd .done
	playmusic MUSIC_POKECOM_CENTER
	writetext WonderTradeCompleteText
	playsound SFX_DEX_FANFARE_80_109
	waitsfx
	ifnotequal 2, .done
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	playmusic MUSIC_SPIKY_EARED_PICHU_HGSS
	writetext WonderTradeForGSBallPichuText
	promptbutton
	verbosegivekeyitem GS_BALL
	writetext WonderTradeForGSBallPichuText2
	waitbutton
.done
	jumpopenedtext WonderTradeGoodbyeText

WonderTradeIntroText:
	text "¡Te damos la"
	line "bienvenida al"
	cont "Intercambio"
	cont "Prodigioso del"
	cont "Centro #Com!"
	done

IntroduceTealaText:
	text "Soy Teala, la"
	line "encargada de los"
	cont "intercambios."
	done

WonderTradeExplanationText:
	text "Puedes cambiar"
	line "#mon con gente"
	cont "muy lejana."
	done

WonderTradeCompleteText:
	text "Es tu nuevo"
	line "compañero."

	para "¡Cuídalo muy"
	line "bien!"
	done

WonderTradeGoodbyeText:
	text "We hope to see you"
	line "again."
	done

WonderTradeForGSBallPichuText:
	text "…¿Qué es esto?"
	line "¿Falla la Máquina"
	cont "Prodigiosa?"

	para "¡Parece que has"
	line "cambiado un"
	cont "#mon contigo"
	cont "mismo!"

	para "¡Pero no puedes"
	line "estar en dos"
	cont "sitios a la vez!"

	para "La máquina conecta"
	line "a través del"
	cont "espacio, ¡no del"
	cont "tiempo…!"

	para "¿Y esa rara Ball"
	line "que trae? ¿Es una"
	cont "Ball de Bonguri?"

	para "Toma, echa un"
	line "vistazo…"
	done

WonderTradeForGSBallPichuText2:
	text "Será algo inusual,"
	line "pero un #mon es"
	cont "un #mon."

	para "¡Por favor,"
	line "cuídalo mucho!"
	done

InfoSignScript:
	jumpthistext

	text "Info Centro"
	line "#Com P1"

	para "Izquierda:"
	line "Administración"

	para "Centro:"
	line "Intercambio"
	cont "Prodigioso"

	para "Derecha:"
	line "Máquina Juez"
	cont "de #mon"
	done

PokemonJournalWhitneyScript:
	setflag ENGINE_READ_WHITNEY_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Whitney!"

	para "Whitney is said to"
	line "admire Bruno of"
	cont "the Elite Four."
	done

JudgeMachineScript:
	opentext
	special JudgeMachine
	waitendtext

GoldenrodPokecenter1FSuperNerdText:
	text "¡Guau, este Centro"
	line "#mon es enorme!"

	para "Es novísimo y han"
	line "puesto muchas"
	cont "máquinas nuevas."
	done

GoldenrodPokecenter1FLassText_PidgeyMail:
	text "¡Tengo una idea"
	line "genial para el"
	cont "Intercambio"
	cont "Prodigioso!"

	para "¡Le daré una Carta"
	line "a un Pidgey y lo"
	cont "pasaré por la red!"

	para "¡Así se podrían"
	line "mandar cartas a un"
	cont "montón de gente!"

	para "¡Lo llamo el"
	line "Pidgey-Correo!"

	para "¡Haré montones de"
	line "amigos nuevos!"
	done

JudgeMachineEngineerScript:
	checkevent EVENT_BRED_AN_EGG
	iffalsefwd .NotBredYet
	showtextfaceplayer JudgeMachineEngineerFinishedText
	readvar VAR_FACING
	ifnotequal RIGHT, .GoLeft
	applyonemovement GOLDENRODPOKECOMCENTER1F_ENGINEER, step_down
	applyonemovement GOLDENRODPOKECOMCENTER1F_ENGINEER, step_left
.GoLeft
	applymovement GOLDENRODPOKECOMCENTER1F_ENGINEER, JudgeMachineEngineerLeavesMovement
	disappear GOLDENRODPOKECOMCENTER1F_ENGINEER
	setflag ENGINE_JUDGE_MACHINE
	changeblock 24, 0, $49
	changeblock 26, 0, $4a
	changeblock 28, 0, $4b
	changeblock 24, 2, $4c
	changeblock 26, 2, $4d
	changeblock 28, 2, $4e
	end

.NotBredYet:
	showtextfaceplayer JudgeMachineEngineerWorkingText
	turnobject LAST_TALKED, RIGHT
	end

JudgeMachineEngineerWorkingText:
	text "La Máquina Juez"
	line "de #mon…"

	para "Es mi gran sueño"
	line "de toda la vida."

	para "¡Y gracias al"
	line "Centro #Com se"
	cont "hará realidad!"

	para "¡Aunque requiera"
	line "un PC enorme del"
	cont "tamaño de un piso!"

	para "¡Será muy útil"
	line "para los Criadores"
	cont "que abren Huevos!"

	para "Ya casi está…"
	done

JudgeMachineEngineerFinishedText:
	text "La Máquina Juez"
	line "de #mon…"

	para "¡Por fin está"
	line "lista! ¡Mi sueño"
	cont "se ha cumplido!"

	para "¿Que qué es? ¡Pues"
	line "juzga las stats de"
	cont "cualquier #mon!"

	para "¡Usa IA puntera"
	line "para evaluar el"
	cont "potencial nato del"
	cont "#mon y su gran"
	cont "esfuerzo diario!"

	para "¡Mide a fondo todo"
	line "el poder #mon!"

	para "¡Pruébala ya!"
	line "Es muy segura."

	para "¡Yo me voy ya de"
	line "vacaciones!"
	done

JudgeMachineEngineerLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

GoldenrodPokecenter1FPokefanFText_Sunflora:
	text "Una chica me envió"
	line "a su Sunflora."

	para "¡Deberías cambiar"
	line "por un #mon que"
	cont "te guste!"
	done

GoldenrodPokecenter1FRockerText:
	text "Aún no funcionan"
	line "todas las máquinas"
	cont "de aquí."

	para "Aun así, mola ir a"
	line "un sitio de moda"
	cont "antes que nadie."
	done

GoldenrodPokecenter1FGrampsText:
	text "¡Ver tantas cosas"
	line "nuevas me hace"
	cont "sentir más joven!"
	done
