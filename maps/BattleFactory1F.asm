BattleFactory1F_MapScriptHeader:
	def_scene_scripts
	scene_script BattleFactory1FContinueChallenge, SCENE_BATTLEFACTORY1F_CHECKSTATE
	scene_const SCENE_BATTLEFACTORY1F_NOOP

	def_callbacks

	def_warp_events
	warp_event 12, 11, VERMILION_CITY, 15
	warp_event 13, 11, VERMILION_CITY, 15
	warp_event 12,  1, BATTLE_FACTORY_HALLWAY, 1

	def_coord_events

	def_bg_events
	bg_event 14,  5, BGEVENT_READ, BattleFactory1FRulesScript
	bg_event 10,  5, BGEVENT_JUMPTEXT, BattleFactory1FStreakText
	bg_event 25,  6, BGEVENT_READ, PokemonJournalThortonScript

	def_object_events
	object_event 12,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleFactory1FReceptionistScript, -1
	pc_nurse_event  6,  6
	object_event 18,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_1, -1
	object_event 20,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_2, -1
	object_event 22,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_BP, MART_BATTLEFACTORY_3, -1

	object_const_def
	const BATTLEFACTORY1F_RECEPTIONIST

BattleFactory1FContinueChallenge:
; Triggers (usefully) if we're in an ongoing Battle Factory run.
	; Only trigger this once.
	setscene SCENE_BATTLEFACTORY1F_NOOP

	; Check current battle status to see if we need to resume or reset winstreak
	special Special_BattleTower_GetChallengeState
	ifequalfwd BATTLETOWER_CHALLENGE_IN_PROGRESS, .LeftWithoutSaving
	ifequalfwd BATTLETOWER_SAVED_AND_LEFT, .ResumeChallenge
	ifequalfwd BATTLETOWER_LOST_CHALLENGE, .LostChallenge
	ifequalfwd BATTLETOWER_WON_CHALLENGE, .WonChallenge
	end

.ResumeChallenge:
	; We saved in-between rounds. Resume Battle Factory challenge.
	opentext
	writethistext
		text "Te hemos estado"
		line "esperando."
		prompt

	sdefer Script_ReturnToRentalChallenge
	end

.LeftWithoutSaving:
	; The player reset the game in the middle of a battle.
	; This counts as a battle loss, and will reset the winstreak.
	sdefer .LeftWithoutSaving2
	end
.LeftWithoutSaving2:
	opentext
	writethistext
		text "¡Disculpe!"
		line "No guardó la"

		para "partida antes de"
		line "salir de la Sala"
		cont "de Batalla."

		para "Lo lamento mucho,"
		line "pero su desafío se"

		para "declarará no"
		line "válido."
		done
	waitbutton
	sjumpfwd Script_CommitBattleFactoryResult

.LostChallenge:
	opentext
	sdefer Script_CommitBattleFactoryResult
	end

.WonChallenge:
	sdefer .WonChallenge2
	end
.WonChallenge2:
	opentext
	writethistext
		text "¡Felicidades!"

		para "¡Has vencido a to-"
		line "dos los entrena-"
		cont "dores!"

		para "Por eso, ¡obtienes"
		line "este gran premio!"
		prompt
	verbosegiveitem MINT_LEAF
	; fallthrough
Script_CommitBattleFactoryResult:
	special Special_BattleTower_CommitChallengeResult
	iffalsefwd .WeHopeToServeYouAgain
	setevent EVENT_BEAT_THORTON
.WeHopeToServeYouAgain:
	writethistext
		text "Esperamos volver"
		line "a verle."
		done
	waitbutton
	endtext

BattleFactory1FRulesScript:
	opentext
	writethistext
		text "Reglas de la"
		line "Fábrica Batalla."

		para "¿Leer las reglas?"
		done
	yesorno
	iffalse_endtext
	jumpthisopenedtext
		text "Te damos seis"
		line "#mon de prest-"
		cont "amo."

		para "Tres #mon"
		line "podrán combatir."

		para "Los tres deben ser"
		line "diferentes."

		para "Los objetos que"
		line "lleven también de-"
		cont "ben ser distintos."

		para "Tras ganar un"
		line "combate, puedes"
		cont "intercambiar un"
		cont "#mon con el"
		cont "rival."
		done

BattleFactory1FStreakText:
	text "Racha: "
	text_decimal wBattleFactoryCurStreak, 2, 5
	text " vict."
	line "Récord: "
	text_decimal wBattleFactoryTopStreak, 2, 5
	text " vict."
	cont "Cambios actuales: "
	text_decimal wBattleFactorySwapCount, 1, 2
	done

BattleFactory1FReceptionistScript:
	opentext
	writethistext
		text "¡La Fábrica Bata-"
		line "lla te da la"
		cont "bienvenida!"

		para "Puedo acompañarte"
		line "al Piso de comba-"
		cont "tes."
		done
	promptbutton
	checkevent EVENT_BATTLE_FACTORY_INTRO
	iftruefwd .BattleFactoryMenu

	; only ask once, so set the flag regardless
	setevent EVENT_BATTLE_FACTORY_INTRO
	writethistext
		text "¿Quieres que te"
		line "hable sobre este"
		cont "recinto?"
		done
	yesorno
	iffalsefwd .BattleFactoryMenu

.Explanation:
	writethistext
		text "Fábrica Batalla es"
		line "un recinto donde"
		cont "luchas usando"
		cont "#mon de"
		cont "préstamo."

		para "Entrenadores de"
		line "#mon acuden"

		para "de todas partes a"
		line "luchar en el Piso"
		cont "de combates."

		para "Cada desafío son"
		line "7 entrenadores."

		para "Gana a todos y re-"
		line "cibe PB."

		para "Para interrumpir"
		line "la sesión, debes"

		para "guardar. Si no, no"
		line "podrás retomar"

		para "tu desafío del"
		line "Piso."
		prompt
	; fallthrough
.BattleFactoryMenu:
	; Setscene here in case the player aborted a quicksave prompted by challenge
	setscene SCENE_BATTLEFACTORY1F_NOOP
	writethistext
		text "¿Quieres entrar"
		line "al Piso de"
		cont "combates?"
		done
	loadmenu MenuDataHeader_BattleInfoCancel
	verticalmenu
	closewindow
	ifequalfwd $1, .Challenge
	ifequal $2, .Explanation
	writethistext
		text "Esperamos volver"
		line "a verle."
		prompt
	endtext

.Challenge:
	writethistext
		text "Antes de entrar al"
		line "Piso de combates,"

		para "se guardará tu"
		line "progreso."
		done
	yesorno
	iffalse .BattleFactoryMenu
	; Done here to ensure it's saved in case the player resets later.
	; The scene script running after the player saves but before the
	; challenge starts is harmless since there's no challenge prepared.
	setscene SCENE_BATTLEFACTORY1F_CHECKSTATE
	special Special_TryQuickSave
	iffalse .BattleFactoryMenu

	; Set this early in case the player leaves before picking their team.
	; This prevents them from re-rolling without forfeiting a streak.
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState
	special Special_BattleTower_SetupRentalMode

	; Initializes opponent trainers
	special Special_BattleTower_BeginChallenge
	; fallthrough
Script_ReturnToRentalChallenge:
	; From this point onwards, resetting the game should count as a streak loss
	setscene SCENE_BATTLEFACTORY1F_CHECKSTATE
	setval BATTLETOWER_CHALLENGE_IN_PROGRESS
	special Special_BattleTower_SetChallengeState

	; Everything ready to go for challenge start
	writethistext
		text "Por aquí hacia el"
		line "Piso de combates."
		done
	waitbutton
	closetext

	follow BATTLEFACTORY1F_RECEPTIONIST, PLAYER
	applymovement BATTLEFACTORY1F_RECEPTIONIST, .WalkToHallway
	stopfollow
	special Special_BattleTower_MaxVolume
	warpsound
	disappear BATTLEFACTORY1F_RECEPTIONIST
	applyonemovement PLAYER, step_up
	warpcheck
	end

.WalkToHallway:
	step_up
	step_up
	step_up
	step_up
	step_end

PokemonJournalThortonScript:
	setflag ENGINE_READ_THORTON_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Edición especial:"
	line "¡Jefe Fábrica"
	cont "Espinal!"

	para "Se dice que Espi-"
	line "nal solo cree en"

	para "lo que puede pro-"
	line "bar numéricamente"
	cont "con sus inventos."
	done
