DayCare_MapScriptHeader:
	def_scene_scripts
	scene_script DayCareMeetDayCareManScene, SCENE_DAYCARE_MEET_DAYCARE_MAN
	scene_const SCENE_DAYCARE_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, DayCareEggCheckCallback

	def_warp_events
	warp_event  0,  4, ROUTE_34, 3
	warp_event  0,  5, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  0,  5, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_DAYCARE
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE

	object_const_def
	const DAYCARE_GRANNY
	const DAYCARE_LYRA

DayCareMeetDayCareManScene:
	sdefer DayCare_MeetGrandma
	end

DayCareEggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftruefwd .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	endcallback

DayCare_MeetGrandma:
	follow DAYCARE_LYRA, PLAYER
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraApproachesGrandma
	stopfollow
	turnobject PLAYER, UP
	turnobject DAYCARE_GRANNY, DOWN
	callasm .GetPlayerPronouns
	showtext DayCareLyraHelloText
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	showtext DayCareLyraProtestText
	turnobject DAYCARE_LYRA, DOWN
	showtext DayCareLyraGoodbyeText
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraStartsToLeave
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	turnobject DAYCARE_LYRA, LEFT
	turnobject PLAYER, RIGHT
	showtext DayCareLyraForgotText
	addcellnum PHONE_LYRA
	opentext
	writetext GotLyrasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	writetext DayCareLyraHasInfoText
	waitbutton
	closetext
	turnobject DAYCARE_LYRA, UP
	showtext DayCareLyraEmbarassedText
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraLeaves
	disappear DAYCARE_LYRA
	setscene SCENE_DAYCARE_NOOP
	end

.GetPlayerPronouns:
	assert PLAYER_MALE & 1 == 0
	assert PLAYER_FEMALE & 1 == 1
	assert PLAYER_ENBY & 1 == 0
	assert PLAYER_BETA & 1 == 1
	ld a, [wPlayerGender]
	and 1
	jr nz, .female
	ld de, .boy
	ld hl, wStringBuffer3
	call CopyName2
	ld de, .he
	ld hl, wStringBuffer4
	jmp CopyName2

.female
	ld de, .girl
	ld hl, wStringBuffer3
	call CopyName2
	ld de, .she
	ld hl, wStringBuffer4
	jmp CopyName2

.boy:  db "novio@"
.girl: db "novia@"
.she:  db "ella@"
.he:   db "él@"

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftruefwd .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	promptbutton
	special GiveOddEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareText_GotOddEgg
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	ifequalfwd 1, .InParty
	special Special_CurBoxFullCheck
	iffalsefwd .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	farwritetext _EggSentToPCText
	promptbutton
.InParty:
	writetext DayCareText_DescribeOddEgg
	setevent EVENT_GOT_ODD_EGG
	waitendtext

.AlreadyHaveOddEgg:
	special Special_DayCareMan
	waitendtext

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue_jumpopenedtext Text_GrampsLookingForYou
	checkevent EVENT_LYRA_GAVE_AWAY_EGG
	iffalsefwd .NoLyrasEgg
	checkevent EVENT_GOT_LYRAS_EGG
	iftruefwd .NoLyrasEgg
	writetext DayCareLadyText_GiveLyrasEgg
	promptbutton
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .GiveCyndaquilEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .GiveTotodileEgg
	giveegg CHIKORITA
	sjumpfwd .GotLyrasEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL
	sjumpfwd .GotLyrasEgg

.GiveTotodileEgg:
	giveegg TOTODILE
.GotLyrasEgg
	iffalse_jumpopenedtext DayCareText_PartyAndBoxFull
	writetext DayCareLadyText_DescribeLyrasEgg
	setevent EVENT_GOT_LYRAS_EGG
	waitendtext

.NoLyrasEgg:
	special Special_DayCareLady
	waitendtext

DayCareMovementData_LyraApproachesGrandma:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

DayCareMovementData_LyraStartsToLeave:
	step_right
	step_down
	step_end

DayCareMovementData_LyraLeaves:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

DayCareLyraHelloText:
	text "Lira: ¡Abuela!"

	para "Te presento a"
	line "mi coleguita."

	para "¡Es <PLAYER>!"

	para "Abuela: Ajá."

	para "Así que es tu..."
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ya veo. Hmm."
	done

DayCareLyraProtestText:
	text "Lira: ¡¿Qué?!"
	line "¡Abuela...!"

	para "¿De qué estás"
	line "hablando?"

	para "<PLAYER> solo"
	line "vive cerca..."

	para "Abuela: Jajaja."
	line "Lo sé, lo sé."

	para "Seguro que"
	line ""
	text_ram wStringBuffer4
	text " tiene"
	cont "mucho talento."

	para "¿Verdad, <PLAYER>?"
	line "¡Ven a vernos"
	cont "cuando quieras!"
	done

DayCareLyraGoodbyeText:
	text "Lira: Bueno, será"
	line "mejor que me"
	cont "vaya... ¡Nos vemos!"
	done

DayCareLyraForgotText:
	text "Lira: ¡Oh!"
	line "¡Casi lo olvido!"

	para "¡Toma! ¡Este es"
	line "mi número del"
	cont "#gear!"
	done

GotLyrasNumberText:
	text "<PLAYER> consiguió"
	line "el número de"
	cont "teléfono de Lira."
	done

DayCareLyraHasInfoText:
	text "¡Llámame cuando"
	line "quieras!"

	para "Mis abuelos me en-"
	line "señaron mucho so-"
	cont "bre la crianza de"

	para "los #mon, y me"
	line "gustaría compar-"
	cont "tirlo contigo."
	done

DayCareLyraEmbarassedText:
	text "Lira: ¡Abuela!"

	para "No digas"
	line "nada más."

	para "Ambos somos entre-"
	line "nadores, y debe-"

	para "mos intercambiar"
	line "números."
	cont "Eso es todo."
	done

Text_GrampsLookingForYou:
	text "El Abuelo te"
	line "estaba buscando."
	done

DayCareManText_GiveOddEgg:
	text "Soy el Encargado"
	line "de la Guardería."

	para "¿Sabes algo sobre"
	line "los Huevos?"

	para "Verás, estaba cri-"
	line "ando #mon con"
	cont "mi mujer."

	para "¡Nos sorprendió"
	line "encontrar un"
	cont "Huevo!"

	para "¿A que es"
	line "increíble?"

	para "Bueno, ¿no te gus-"
	line "taría tener este"
	cont "Huevo?"

	para "¡Pues muy bien,"
	line "puedes quedártelo!"
	done

DayCareText_GotOddEgg:
	text "¡<PLAYER> recibió"
	line "el Huevo Raro!"
	done

DayCareText_DescribeOddEgg:
	text "Lo encontré mien-"
	line "tras cuidaba el"

	para "#mon de alguien"
	line "anteriormente."

	para "Pero el entrenador"
	line "no quería el"

	para "Huevo, así que lo"
	line "he guardado."
	done

DayCareLadyText_GiveLyrasEgg:
	text "Hola, cielo."

	para "Lira me dijo que"
	line "este Huevo era un"
	cont "regalo para ti."
	cont "¡Aquí tienes!"
	done

DayCareLadyText_DescribeLyrasEgg:
	text "Ese Huevo vino de"
	line "su primer #mon."

	para "Seguro que confía"
	line "mucho en ti como"
	cont "entrenador."
	done

DayCareText_PartyAndBoxFull:
	text "No tienes sitio"
	line "para esto, ni si-"
	cont "quiera en tu Caja."
	done
