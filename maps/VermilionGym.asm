VermilionGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VermilionGymDoorsScript

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  4,  5, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_1
	object_event  5,  5, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_1
	object_event  4,  4, SPRITE_ELECTRIC_FENCE_LEFT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  4, SPRITE_ELECTRIC_FENCE_RIGHT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, VermilionGymElectricFenceText, EVENT_VERMILION_GYM_SWITCH_2
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 3, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGuitaristmVincent, -1
	object_event  0, 10, SPRITE_JUGGLER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerJugglerHorton, -1
	object_event  7, 10, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGuitaristfJanet, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1

	object_const_def
	const VERMILIONGYM_FENCE_1_LEFT
	const VERMILIONGYM_FENCE_1_RIGHT
	const VERMILIONGYM_FENCE_2_LEFT
	const VERMILIONGYM_FENCE_2_RIGHT

VermilionGymDoorsScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftruefwd .done
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iffalsefwd .resample
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
.resample
	callasm SampleVermilionGymTrashCans
.done
	endcallback

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftruefwd .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARISTM_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	setevent EVENT_BEAT_GUITARISTF_JANET
	opentext
	givebadge THUNDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM57_WILD_CHARGE
	iftrue_jumpopenedtext LtSurgeFightDoneText
	writetext LtSurgeThunderBadgeText
	promptbutton
	verbosegivetmhm TM_WILD_CHARGE
	setevent EVENT_GOT_TM57_WILD_CHARGE
	jumpthisopenedtext

	text "Esa MT contiene"
	line "Voltio Cruel."

	para "¡Úsala para ir"
	line "como el rayo!"
	done

GenericTrainerGentlemanGregory:
	generictrainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText

	text "Cuando todavía es-"
	line "taba en el ejérci-"
	cont "to, el Lt. Surge"

	para "me salvó la vida."
	done

GenericTrainerGuitaristmVincent:
	generictrainer GUITARISTM, VINCENT, EVENT_BEAT_GUITARISTM_VINCENT, GuitaristmVincentSeenText, GuitaristmVincentBeatenText

	text "El Lt. Surge se"
	line "protege con barre-"
	cont "ras eléctricas"

	para "¡para que no sub-"
	line "estimes su poder!"
	done

GenericTrainerJugglerHorton:
	generictrainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText

	text "No te confíes por"
	line "haberme ganado…"

	para "El Lt. Surge es"
	line "muy duro."
	done

GenericTrainerGuitaristfJanet:
	generictrainer GUITARISTF, JANET, EVENT_BEAT_GUITARISTF_JANET, GuitaristfJanetSeenText, GuitaristfJanetBeatenText

	text "El Lt. Surge es-"
	line "condió los dos in-"

	para "terruptores de las"
	line "barreras en las"
	cont "papeleras."
	done

VermilionGymGuyScript:
	checkevent EVENT_BEAT_LTSURGE
	iftrue_jumptextfaceplayer VermilionGymGuyWinText
	jumpthistextfaceplayer

	text "¡Hola, futuro Cam-"
	line "peón!"

	para "El Lt. Surge es"
	line "muy precavido. Ha"

	para "puesto trampas por"
	line "todo el Gimnasio."

	para "Pero ya se te dan"
	line "bien los puzles de"
	cont "Gimnasio, ¿no?"

	para "No tendrás ningún"
	line "problema para lle-"
	cont "gar hasta él."
	done

VermilionGymTrashCanScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftruefwd .trash_can
	callasm CheckVermilionGymTrashCan
	iftruefwd .open_lock
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftruefwd .reset_switches
.trash_can
	jumpstd trashcan

.open_lock
	opentext
	writetext VermilionGymFoundSwitchText
	playsound SFX_PUSH_BUTTON
	promptbutton
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftruefwd .second_switch
	writetext VermilionGymFoundFirstSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_1_LEFT
	disappear VERMILIONGYM_FENCE_1_RIGHT
	waitendtext

.second_switch
	writetext VermilionGymFoundSecondSwitchText
	playsound SFX_ENTER_DOOR
	disappear VERMILIONGYM_FENCE_2_LEFT
	disappear VERMILIONGYM_FENCE_2_RIGHT
	waitendtext

.reset_switches
	opentext
	writetext VermilionGymTrashCanText
	promptbutton
	writetext VermilionGymResetSwitchesText
	playsound SFX_WRONG
	waitbutton
	closetext
	callasm SampleVermilionGymTrashCans
	appear VERMILIONGYM_FENCE_1_LEFT
	appear VERMILIONGYM_FENCE_1_RIGHT
	end

VermilionGymStatue:
	gettrainername LT_SURGE, 1, STRING_BUFFER_4
	checkflag ENGINE_THUNDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

LtSurgeIntroText:
	text "Surge: ¡Eh, tú,"
	line "renacuajo!"

	para "Hay que admitir-"
	line "lo. Retarme puede"

	para "no ser muy inte-"
	line "ligente, ¡pero hay"
	cont "que tener agallas!"

	para "Si se trata de"
	line "#mon eléctri-"
	cont "cos, ¡soy el uno!"

	para "¡Nunca he perdido"
	line "en el campo de"
	cont "batalla!"

	para "¡Te fulminaré co-"
	line "mo a mis enemigos"
	cont "en la guerra!"
	done

LtSurgeWinLossText:
	text "Surge: ¡Arrrgh!"
	line "¡Eres fuerte!"

	para "Vale, toma la"
	line "Medalla Trueno."
	done

LtSurgeThunderBadgeText:
	text "Surge: Guárdala"
	line "como prueba de"
	cont "tu victoria."

	para "Queda muy bien en"
	line "tu Ficha de Entre-"
	cont "nador, ¿a que sí?"

	para "¡Llévala con orgu-"
	line "llo, ¿me oyes?!"

	para "¡Y toma una gran"
	line "MT para ti!"
	done

LtSurgeFightDoneText:
	text "Surge: ¡Eh, peque!"
	line "¿Sigues dándolo to-"
	cont "do ahí fuera?"

	para "¡Mis #mon y yo"
	line "seguimos al pie"
	cont "del cañón!"
	done

GentlemanGregorySeenText:
	text "¿Vienes a derrotar"
	line "al Lt. Surge?"

	para "¡No si puedo evi-"
	line "tarlo!"
	done

GentlemanGregoryBeatenText:
	text "¡Siento haberle"
	line "fallado, Lt."
	cont "Surge, señor!"
	done

GuitaristmVincentSeenText:
	text "El Lt. Surge vio"
	line "mi potencial con"

	para "los #mon eléc-"
	line "tricos."

	para "¿Crees que puedes"
	line "vencerme?"
	done

GuitaristmVincentBeatenText:
	text "¡Uuuh, qué shock!"
	done

JugglerHortonSeenText:
	text "¡Pienso acabar"
	line "contigo! ¡Prepara-"
	cont "te a recibir una"
	cont "descarga!"
	done

JugglerHortonBeatenText:
	text "¡Gwaaah! Me has"
	line "superado por com-"
	cont "pleto…"
	done

GuitaristfJanetSeenText:
	text "Parezco poca cosa,"
	line "¡pero controlo de"
	cont "electricidad!"
	done

GuitaristfJanetBeatenText:
	text "¡Frita!"
	done

VermilionGymGuyWinText:
	text "¡Uf! ¡Vaya combate"
	line "más electrizante!"

	para "La verdad es que"
	line "me puso de los"
	cont "nervios."
	done

VermilionGymFoundSwitchText:
	text "¿Un interruptor se-"
	line "creto bajo la ba-"
	cont "sura?"

	para "Mejor pulsarlo."
	done

VermilionGymFoundFirstSwitchText:
	text "¡La primera barre-"
	line "ra eléctrica se ha"
	cont "desbloqueado!"
	done

VermilionGymFoundSecondSwitchText:
	text "¡La segunda barre-"
	line "ra eléctrica se ha"

	para "desbloqueado! ¡El"
	line "camino está libre!"
	done

VermilionGymResetSwitchesText:
	text "¡Oh, no! ¡La ba-"
	line "rrera eléctrica se"

	para "ha bloqueado de"
	line "nuevo!"
	done

VermilionGymTrashCanText:
	text "¡Nada! Solo hay"
	line "basura."
	done

VermilionGymElectricFenceText:
	text "¡Una barrera eléc-"
	line "trica! ¡No la to-"
	cont "ques!"
	done

SampleVermilionGymTrashCans:
	ldh a, [rWBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rWBK], a
.loop
	call Random
	ld e, a
	swap e
	and $f
	jr z, .loop
	dec a
	ld [wVermilionGymTrashCan1], a
	call .GetSecondTrashCan
	ld [wVermilionGymTrashCan2], a
	pop af
	ldh [rWBK], a
	ret

.GetSecondTrashCan:
	ld hl, .AdjacencyTable
	add a
	add a
	ld c, a
	ld a, e
	and %11
	add c
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

.AdjacencyTable:
	; left, right, up, down
	db  1,  1,  5,  5 ;  0 ( 1, 7)
	db  0,  2,  6,  6 ;  1 ( 3, 7)
	db  1,  3,  7,  7 ;  2 ( 5, 7)
	db  2,  4,  8,  8 ;  3 ( 7, 7)
	db  3,  3,  9,  9 ;  4 ( 9, 7)
	db  6,  6,  0, 10 ;  5 ( 1, 9)
	db  5,  7,  1, 11 ;  6 ( 3, 9)
	db  6,  8,  2, 12 ;  7 ( 5, 9)
	db  7,  9,  3, 13 ;  8 ( 7, 9)
	db  8,  8,  4, 14 ;  9 ( 9, 9)
	db 11, 11,  5,  5 ; 10 ( 1,11)
	db 10, 12,  6,  6 ; 11 ( 3,11)
	db 11, 13,  7,  7 ; 12 ( 5,11)
	db 12, 14,  8,  8 ; 13 ( 7,11)
	db 13, 13,  9,  9 ; 14 ( 9,11)

CheckVermilionGymTrashCan:
	ldh a, [rWBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rWBK], a
	eventflagcheck EVENT_VERMILION_GYM_SWITCH_1
	jr z, .first
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, TRUE
	jr z, .done
	dec a ; FALSE
.done
	ldh [hScriptVar], a
	pop af
	ldh [rWBK], a
	ret

.first:
	ld a, [wVermilionGymTrashCan1]
	call .CheckTrashCan
	jr z, .yes
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, FALSE ; no-optimize a = 0
	jr nz, .done
	ld a, [wVermilionGymTrashCan1]
	ld [wVermilionGymTrashCan2], a
.yes
	ld a, TRUE
	jr .done

.CheckTrashCan:
	ld c, a
	call GetFacingTileCoord
	call .ConvertCoordsToTrashCan
	cp c
	ret

.ConvertCoordsToTrashCan:
	ld a, d
	sub 5
	srl a
	ld d, a
	ld a, e
	sub 11
	srl a
	ld e, a
	add a
	add a
	add e
	add d
	ret
