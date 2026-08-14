PokeCenter2F_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_POKECENTER2F_NOOP
	scene_script PokeCenter2FLeaveTradeCenterScene, SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script PokeCenter2FLeaveColosseumScene, SCENE_POKECENTER2F_LEAVE_COLOSSEUM

	def_callbacks
	callback MAPCALLBACK_TILES, PokeCenter2FTileCallback

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1

	def_coord_events

	def_bg_events
	bg_event  7,  3, BGEVENT_READ, PokeCenter2FLinkRecordSign

	def_object_events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_TimeCapsuleClosed, -1

	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST

PokeCenter2FTileCallback:
	callasm .CheckKanto
	iffalsefwd .done
	changemapblocks KantoPokeCenter2F_BlockData
.done
	endcallback

.CheckKanto:
	call RegionCheck
	dec e ; KANTO_REGION?
	ld a, TRUE
	jr z, .ok
	dec a ; FALSE
.ok
	ldh [hScriptVar], a
	ret

PokeCenter2FLeaveTradeCenterScene:
	sdefer .Script
	end

.Script:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_NOOP
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

PokeCenter2FLeaveColosseumScene:
	sdefer .Script
	end

.Script:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_NOOP
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

PokeCenter2FLinkRecordSign:
	reanchormap
	special Special_DisplayLinkRecord
	endtext

LinkReceptionistScript_Trade:
if !DEF(DEBUG)
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalsefwd Script_TradeCenterClosed
endc
	special FixPlayerEVsAndStats ; no (trivial) cheating
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse_endtext
	callasm CheckPartyForMail
	iftruefwd LinkReceptionistScript_HasMail
	special Special_SetBitsForLinkTradeRequest
	; fallthrough
LinkReceptionistScript_DoTradeOrBattle:
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	iffalsefwd .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalsefwd .DidNotSave
	special Special_TryQuickSave
	iffalsefwd .DidNotSave
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	iffalsefwd .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalsefwd .LinkedToFirstGen
	special PerformLinkChecks
	iffalsefwd .OldVersionDetected ; LINK_ERR_OLD_PC_DETECT
	ifequalfwd LINK_ERR_MISMATCH_GAME_ID, .WrongGameID
	ifequalfwd LINK_ERR_MISMATCH_VERSION, .WrongVersion
	ifequalfwd LINK_ERR_VERSION_TOO_LOW, .WrongMinVersion
	ifequalfwd LINK_ERR_OTHER_VERSION_TOO_LOW, .OtherPlayerWrongMinVersion
	ifequalfwd LINK_ERR_MISMATCH_GAME_OPTIONS, .WrongOptions
	ifequalfwd LINK_ERR_INCOMPATIBLE_ROOMS, .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall PokeCenter2F_EnterRoom
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	endtext

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	sjumpfwd .CloseLink

.OldVersionDetected:
	writetext Text_OldVersionDetected
	sjumpfwd .CloseLink

.WrongGameID
	writetext Text_WrongGameID
	sjumpfwd .CloseLink

.WrongVersion
	writetext Text_WrongVersion
	sjumpfwd .CloseLink

.WrongMinVersion
	writetext Text_WrongMinVersion
	sjumpfwd .CloseLink

.OtherPlayerWrongMinVersion
	writetext Text_OtherPlayerWrongMinVersion
	sjumpfwd .CloseLink

.WrongOptions
	writetext Text_WrongOptions
	sjumpfwd .CloseLink

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
.CloseLink:
	special Special_CloseLink
	endtext

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjumpfwd .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	endtext

LinkReceptionistScript_HasMail:
	writethistext
		text "Lo siento, pero"
		line "no es posible"

		para "intercambiar un"
		line "#mon con Carta"
		cont "ahora mismo."
		done
	waitbutton
	endtext

Script_TradeCenterClosed:
	jumpthistextfaceplayer

	text "Lo siento, la"
	line "Máquina de Interc."
	cont "se está ajustando."
	done

LinkReceptionistScript_Battle:
if !DEF(DEBUG)
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalsefwd .BattleRoomClosed
endc
	special FixPlayerEVsAndStats ; no (trivial) cheating
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse_endtext
	special Special_SetBitsForBattleRequest
	sjump LinkReceptionistScript_DoTradeOrBattle

.BattleRoomClosed:
	jumpthistextfaceplayer

	text "Lo siento, la"
	line "Máquina de Batalla"
	cont "se está ajustando."
	done

PokeCenter2F_EnterRoom:
	applymovementlasttalked PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, PokeCenter2FMovementData_PlayerTakesThreeStepsUp
	readmem wLinkOtherPlayerGender
	scalltable .LinkTrainerTable
	end

.LinkTrainerTable:
	table_width 2
	dw .Male
	dw .Female
	dw .Enby
	dw .Beta
	assert_table_length NUM_PLAYER_GENDERS
.Male:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_CHRIS
	end
.Female:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_KRIS
	end
.Enby:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_CRYS
	end
.Beta:
	variablesprite SPRITE_LINK_TRAINER, SPRITE_BETA
	end

PokeCenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step_up
	slow_step_left
	turn_head_right
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsUp:
	step_up
	step_up
	step_up
	step_end

PokeCenter2FMovementData_PlayerTakesThreeStepsDown:
	step_down
	step_down
	step_down
	step_end

PokeCenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step_right
	slow_step_down
	step_end

Text_BattleReceptionistIntro:
	text "Te damos la bien-"
	line "venida al Coliseo"
	cont "del Club del Cable."

	para "Aquí puedes luchar"
	line "contra un amigo."

	para "¿Te gustaría"
	line "luchar?"
	done

Text_TradeReceptionistIntro:
	text "Te damos la bien-"
	line "venida al Centro"
	cont "de Cambio."

	para "Aquí puedes inter-"
	line "cambiar #mon"
	cont "con un amigo."

	para "¿Te gustaría ha-"
	line "cer un cambio?"
	done

Text_FriendNotReady:
	text "Tu amigo no está"
	line "listo."
	prompt

Text_MustSaveGame:
	text "Antes de abrir la"
	line "conexión debes"
	cont "guardar partida."
	done

Text_PleaseWait:
	text "Espera, por favor."
	done

Text_LinkTimedOut:
	text "Se ha cerrado la"
	line "conexión por inac-"
	cont "tividad."

	para "Habla con tu ami-"
	line "go y vuelve a in-"
	cont "tentarlo."
	prompt

Text_PleaseComeAgain:
	text "¡Vuelve cuando"
	line "quieras!"
	prompt

Text_PleaseComeIn:
	text "Pasa, por favor."
	prompt

Text_CantLinkToThePast:
	text "Aquí no puedes"
	line "conectar con el"
	cont "pasado."
	prompt

Text_OldVersionDetected:
	text "Te has conectado"
	line "a una versión"

	para "antigua de"
	line "Polished Crystal."
	prompt

Text_WrongGameID:
	text "Tu juego no es"
	line "compatible con el"
	cont "otro juego."
	prompt

Text_WrongVersion:
	text "Las versiones del"
	line "juego no coinciden."

	para "Para jugar en el"
	line "Coliseo de Enla-"

	para "ce, las versiones"
	line "deben coincidir."
	prompt

Text_WrongMinVersion:
	text "Tu juego no cum-"
	line "ple el requisito"

	para "de versión mínima"
	line "del otro juego."
	prompt

Text_OtherPlayerWrongMinVersion:
	text "El otro sistema de"
	line "juego no cumple el"

	para "requisito de ver-"
	line "sión mínima."
	prompt

Text_WrongOptions:
	text "Tus opciones de"
	line "juego no son com-"

	para "patibles con las"
	line "del otro jugador."
	prompt

Text_IncompatibleRooms:
	text "Se eligieron salas"
	line "incompatibles."
	prompt

Text_TimeCapsuleClosed:
	text "Lo siento, la Cáp-"
	line "sula del Tiempo no"
	cont "está operativa."
	done
