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
	object_event  3,  9, SPRITE_BOULDER_ROCK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_SCRIPT, 0, InfoSignScript, -1
	object_event 23,  3, SPRITE_FLOATING_BALL, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, PAL_NPC_POKECOM_SIGN, OBJECTTYPE_COMMAND, end, NULL, -1

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
	line "arriba es para lu-"
	cont "chas por cable."

	para "Los récords están"
	line "en la pared, así"

	para "que no me puedo"
	line "permitir perder."
	done

GoldenrodPokecenter1FLassText:
	text "No siempre gana un"
	line "#mon con"
	cont "mayor nivel."

	para "Después de todo,"
	line "puede tener des-"
	cont "ventaja de tipo."

	para "No creo que haya"
	line "un único #mon"

	para "que sea el"
	line "más fuerte."
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

	text "¡A mi hija le ha-"
	line "rá mucha ilusión!"
	done

.NoRoomForEviolite:
	giveitem EON_MAIL
	jumpthisopenedtext

	text "Ah... Bueno, en-"
	line "tonces en otro"
	cont "momento."
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "¡Uy, tu mochila"
	line "parece muy pesa-"
	cont "da!"

	para "¡Ah! ¿No tendrás"
	line "por casualidad al-"
	cont "go llamado Carta"
	cont "Eón?"

	para "Mi hija quiere"
	line "una."

	para "Puedes despren-"
	line "derte de una, ¿no?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "¿Dar una Carta"
	line "Eón?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "¡Oh, es genial!"
	line "¡Gracias, cielo!"

	para "¡Toma, esto es pa-"
	line "ra ti a cambio!"
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

	para "¡A mi hija le ha-"
	line "rá mucha ilusión!"
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
	jumpthisopenedtext

	text "Esperamos volver"
	line "a verte."
	done

WonderTradeIntroText:
	text "¡Hola! Te damos la"
	line "bienvenida al Cen-"
	cont "tro de Intercambio"
	cont "Prodigioso del"
	cont "Centro #Com."
	done

IntroduceTealaText:
	text "Soy Teala, tu en-"
	line "cargada de los in-"
	cont "tercambios."
	done

WonderTradeExplanationText:
	text "Puedes intercam-"
	line "biar #mon con"
	cont "gente muy lejana."
	done

WonderTradeCompleteText:
	text "Es tu nuevo"
	line "compañero."

	para "Por favor, cuída-"
	line "lo mucho."
	done


WonderTradeForGSBallPichuText:
	text "...¿Pero qué es"
	line "esto? ¿Algo va mal"

	para "con la Máquina"
	line "Prodigiosa?"

	para "Parece que aca-"
	line "bas de intercam-"

	para "biar un #mon"
	line "contigo mismo."

	para "Pero eso no puede"
	line "ser... No puedes"

	para "estar en dos"
	line "sitios a la vez."

	para "Además, la máqui-"
	line "na se comunica"

	para "a través del"
	line "espacio, no del"
	cont "tiempo..."

	para "¿Y qué es esa ex-"
	line "traña Ball que"

	para "lleva? ¿Es una"
	line "Ball de Bonguri?"

	para "Toma, echa un"
	line "vistazo..."
	done

WonderTradeForGSBallPichuText2:
	text "Puede ser inusual,"
	line "pero un #mon"
	cont "es un #mon."

	para "Por favor, cuí-"
	line "dalo mucho."
	done

InfoSignScript:
	jumpthistext

	text "Información Cen-"
	line "tro #Com P1"

	para "Izquierda:"
	line "Administración"

	para "Centro:"
	line "Intercambios"
	cont "Prodigiosos"

	para "Derecha:"
	line "Máquina Juez de"
	cont "<PK><MN>"
	done

PokemonJournalWhitneyScript:
	setflag ENGINE_READ_WHITNEY_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje Espe-"
	line "cial: ¡Líder"
	cont "Blanca!"

	para "Se dice que Blanca"
	line "admira a Bruno del"
	cont "Alto Mando."
	done

JudgeMachineScript:
	opentext
	special JudgeMachine
	waitendtext

GoldenrodPokecenter1FSuperNerdText:
	text "Guau, este Centro"
	line "#mon es"
	cont "enorme."

	para "Acaban de cons-"
	line "truirlo."

	para "Y también han in-"
	line "stalado un montón"
	cont "de nuevas máqui-"
	cont "nas."
	done

GoldenrodPokecenter1FLassText_PidgeyMail:
	text "¡Se me ocurrió una"
	line "idea divertida"

	para "para el Centro de"
	line "Intercambio"
	cont "Prodigioso!"

	para "¡Le doy una Carta"
	line "a un Pidgey y"

	para "luego lo inter-"
	line "cambio por otro!"

	para "¡Si todos hicieran"
	line "eso, se podrían"

	para "intercambiar"
	line "Cartas con un"
	cont "montón de gente!"

	para "¡Lo llamo Pidgey-"
	line "Correo!"

	para "Si se vuelve"
	line "popular, ¡podría"

	para "hacer montones de"
	line "nuevos amigos!"
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
	line "de #mon..."

	para "Ha sido mi sueño"
	line "durante mucho"
	cont "tiempo."

	para "Y con el Centro"
	line "#Com finan-"
	cont "ciando mi trabajo,"
	cont "puede ser una"
	cont "realidad,"

	para "¡incluso si requie"
	line "-ere un ordenador"
	cont "del tamaño de una"
	cont "habitación!"

	para "¡Piensa en lo útil"
	line "que será para los"
	cont "Criadores que in-"
	cont "cuban muchos"
	cont "Huevos!"

	para "Ya casi he termi-"
	line "nado..."
	done

JudgeMachineEngineerFinishedText:
	text "La Máquina Juez"
	line "de #mon..."

	para "¡Por fin está lis-"
	line "ta! ¡Mi sueño se"
	cont "ha hecho reali-"
	cont "dad!"

	para "¿Que qué es? ¡Es"
	line "una máquina para"

	para "juzgar las esta-"
	line "dísticas de cual-"
	cont "quier #mon!"

	para "¡Usa la última"
	line "tecnología de IA"

	para "para evaluar el"
	line "potencial inhe-"
	cont "rente de un #-"
	cont "mon, así como el"

	para "esfuerzo que ha"
	line "puesto en hacerse"
	cont "más fuerte!"

	para "¡Es la forma per-"
	line "fecta de medir el"
	cont "poder de un #-"
	cont "mon!"

	para "Adelante, pruéba-"
	line "la. Es totalmente"
	cont "segura."

	para "¡En cuanto a mí,"
	line "me voy de vaca-"
	cont "ciones!"
	done

JudgeMachineEngineerLeavesMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

GoldenrodPokecenter1FPokefanFText_Sunflora:
	text "Una chica desco-"
	line "nocida me envió a"
	cont "su Sunflora."

	para "Deberías hacer un"
	line "intercambio por un"
	cont "#mon que"
	cont "quieras."
	done

GoldenrodPokecenter1FRockerText:
	text "Aquí aún no se"
	line "pueden usar todas"
	cont "las máquinas."

	para "Aún así, es agra-"
	line "dable venir a un"

	para "lugar de moda an-"
	line "tes que los demás."
	done

GoldenrodPokecenter1FGrampsText:
	text "¡Sólo ver todas"
	line "estas cosas nuevas"

	para "aquí me hace sen-"
	line "tir más joven!"
	done
