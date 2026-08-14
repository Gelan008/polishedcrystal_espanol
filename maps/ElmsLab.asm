ElmsLab_MapScriptHeader:
	def_scene_scripts
	scene_script ElmsLabMeetElmScene, SCENE_ELMSLAB_MEET_ELM
	scene_script DoNothingScript, SCENE_ELMSLAB_CANT_LEAVE
	scene_script DoNothingScript, SCENE_ELMSLAB_NOOP
	scene_script DoNothingScript, SCENE_ELMSLAB_MEET_OFFICER
	scene_script DoNothingScript, SCENE_ELMSLAB_UNUSED
	scene_script DoNothingScript, SCENE_ELMSLAB_AIDE_GIVES_POTION
	scene_script DoNothingScript, SCENE_ELMSLAB_LYRA_BATTLE
	scene_script ElmsLabAideGivesPokeBallsScene, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS

	def_callbacks
	callback MAPCALLBACK_OBJECTS, ElmsLabCallback_MoveElm

	def_warp_events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	def_coord_events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotions1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotions2
	coord_event  4,  6, SCENE_ELMSLAB_LYRA_BATTLE, LyraBattleScript

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip1Text
	bg_event  1,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip2Text
	bg_event  2,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip3Text
	bg_event  3,  7, BGEVENT_JUMPTEXT, ElmsLabTravelTip4Text
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  3, BGEVENT_JUMPTEXT, ElmsLabTrashcanText
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	def_object_events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_RED, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_BLUE, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_BALL_CUT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_ENV_GREEN, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
	object_event  5, 11, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsLabLyraScript, EVENT_LYRA_IN_ELMS_LAB

	object_const_def
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER
	const ELMSLAB_LYRA

ElmsLabCallback_MoveElm:
	checkscene
	iftruefwd .Skip
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	endcallback

ElmsLabMeetElmScene:
	sdefer .Script
	end

.Script:
	follow PLAYER, ELMSLAB_LYRA
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	stopfollow
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.Loop:
	yesorno
	iftruefwd ElmsLab_ElmGetsEmail
	writetext ElmText_Refused
	sjump .Loop

ElmsLab_ElmGetsEmail:
if !DEF(DEBUG)
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	showtext ElmText_GotAnEmail
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
endc
	closetext
	applyonemovement ELMSLAB_ELM, step_up
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement
	turnobject PLAYER, RIGHT
	showtext ElmText_ChooseAPokemon
	setscene SCENE_ELMSLAB_CANT_LEAVE
	end

ElmsLabAideGivesPokeBallsScene:
	sdefer .Script
	end

.Script:
	turnobject ELMSLAB_ELMS_AIDE, DOWN
	showemote EMOTE_SHOCK, ELMSLAB_ELMS_AIDE, 15
	applymovement ELMSLAB_ELMS_AIDE, AideWalksDownMovement
	showtext AideText_ThiefReturnedMon
	applymovement ELMSLAB_ELMS_AIDE, AideWalksBackMovement
	turnobject ELMSLAB_ELMS_AIDE, DOWN
	setscene SCENE_ELMSLAB_NOOP
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftruefwd .CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
.CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftruefwd .CheckOddSouvenir
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
.CheckOddSouvenir:
	checkevent EVENT_GOT_ODD_SOUVENIR_FROM_ELM
	iftrue ElmCheckBattleScript
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveOddSouvenirScript
	checkevent EVENT_ELM_WANTS_TO_BATTLE
	iftrue ElmAskBattleScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalsefwd ElmCheckTogepiEgg
	scall ElmEggHatchedScript
	; need to reopen text boxes since ElmCheckGotEggAgain's
	; jumpopenedtext will close them.
	jumpthistext

	text "¿<PLAYER>? Creía"
	line "que el Huevo ha-"
	cont "bía eclosionado."

	para "¿Dónde está el"
	line "#mon?"
	done

ElmEggHatchedScript:
	setmonval TOGEPI
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setmonval TOGETIC
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setmonval TOGEKISS
	special Special_FindThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjumpfwd ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalsefwd ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue_jumpopenedtext ElmWaitingEggHatchText
	checkflag ENGINE_ZEPHYRBADGE
	iftrue_jumpopenedtext ElmAideHasEggText
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumpopenedtext ElmStudyingEggText
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumpopenedtext ElmDescribesMrPokemonText
	jumpthisopenedtext

	text "Si aparece un #"
	line "mon salvaje, ¡de-"
	cont "ja que tu #mon"
	cont "luché contra él!"
	done

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	showtext LabWhereGoingText
	applyonemovement PLAYER, step_up
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke CYNDAQUIL, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksChikoritaMovement
	pause 15
	disappear ELMSLAB_POKE_BALL3
	opentext
	getmonname CHIKORITA, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedChikoritaText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterChikoritaMovement
	readvar VAR_FACING
	ifequalfwd RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjumpfwd ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke TOTODILE, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksCyndaquilMovement
	pause 15
	disappear ELMSLAB_POKE_BALL1
	opentext
	getmonname CYNDAQUIL, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedCyndaquilText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterCyndaquilMovement
	applymovement PLAYER, AfterTotodileMovement
	sjumpfwd ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue_jumptext ElmPokeBallText
	turnobject ELMSLAB_ELM, DOWN
	reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse_jumpopenedtext DidntChooseStarterText
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	givepoke CHIKORITA, PLAIN_FORM, 5, ORAN_BERRY
	writetext LyraChoosesStarterText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraPicksTotodileMovement
	pause 15
	disappear ELMSLAB_POKE_BALL2
	opentext
	getmonname TOTODILE, STRING_BUFFER_3
	writetext LyraReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	writetext LyraNicknamedTotodileText
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraAfterTotodileMovement
	applymovement PLAYER, AfterChikoritaMovement
	; fallthrough

ElmDirectionsScript:
	turnobject PLAYER, UP
if !DEF(DEBUG)
	showtext ElmDirectionsText1
endc
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	showtext ElmDirectionsText2
	turnobject ELMSLAB_ELM, DOWN
	showtext ElmDirectionsText3
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_LYRA_BATTLE
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftruefwd .CanHeal
	jumpthisopenedtext

	text "¿Para que servirá?"
	done

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftruefwd ElmsLabHealingMachine_HealParty
	endtext

ElmsLabHealingMachine_HealParty:
	special HealParty
	special SaveMusic
	playmusic MUSIC_NONE
	setval 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestoreMusic
	endtext

ElmAfterTheftDoneScript:
	waitendtext

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkkeyitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takekeyitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	clearevent EVENT_LYRA_ROUTE_29
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	setscene SCENE_ELMSLAB_NOOP
	writetext ElmAfterTheftText6
	promptbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	showtext ElmAfterTheftText7
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveOddSouvenirScript:
	writetext ElmGiveOddSouvenirText1
	promptbutton
	verbosegiveitem ODD_SOUVENIR
	iffalse_endtext
	setevent EVENT_GOT_ODD_SOUVENIR_FROM_ELM
	writetext ElmGiveOddSouvenirText2
	waitbutton
	checkevent EVENT_BATTLED_PROF_ELM
	iffalsefwd ElmAlsoBattleScript
	endtext

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse_endtext
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
	checkevent EVENT_BATTLED_PROF_ELM
	iftrue_endtext
ElmAlsoBattleScript:
	writetext ElmByTheWayText
	waitbutton
	sjumpfwd ElmAskBattleScript

ElmCheckBattleScript:
	checkevent EVENT_BATTLED_PROF_ELM
	iftrue_jumpopenedtext ElmText_CallYou
	checkevent EVENT_BEAT_FALKNER
	iffalse_jumpopenedtext ElmText_CallYou
	writetext ElmBeforeBattleText
	waitbutton
ElmAskBattleScript:
	setevent EVENT_ELM_WANTS_TO_BATTLE
	writetext ElmAskBattleText
	yesorno
	iffalse_jumpopenedtext ElmRefusedBattleText
	writetext ElmSeenText
	waitbutton
	closetext
	winlosstext ElmWinText, ElmLoseText
	setlasttalked ELMSLAB_ELM
	readvar VAR_BADGES
	ifless 2, .Team1
	ifless 4, .Team2
	ifless 8, .Team3
	loadtrainer PROF_ELM, 4
	sjumpfwd .GotTeam
.Team1:
	loadtrainer PROF_ELM, 1
	sjumpfwd .GotTeam
.Team2:
	loadtrainer PROF_ELM, 2
	sjumpfwd .GotTeam
.Team3:
	loadtrainer PROF_ELM, 3
.GotTeam:
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	clearevent EVENT_ELM_WANTS_TO_BATTLE
	setevent EVENT_BATTLED_PROF_ELM
	startbattle
	reloadmap
	special HealParty
	jumpthistextfaceplayer

	text "Elm: ¡Estoy muy"
	line "orgulloso de ti,"
	cont "<PLAYER>!"

	para "¡Hice bien en con-"
	line "fiarte un #mon!"
	done

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegivekeyitem S_S_TICKET
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	special Special_FadeOutMusic
	pause 10
	readvar VAR_FACING
	ifequalfwd UP, .Shortest
	ifequalfwd DOWN, .Longest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 4, 7
	scall .LyraEntryShort
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, RIGHT
	sjumpfwd .Continue

.Longest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 4, 6
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMoreMovement
	turnobject ELMSLAB_ELM, UP
	turnobject ELMSLAB_LYRA, RIGHT
	turnobject PLAYER, LEFT
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, DOWN
	sjumpfwd .Continue

.Shortest
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 5, 8
	scall .LyraEntryShort
	scall .LyraAnnouncesGymChallenge
	turnobject PLAYER, UP

.Continue
	faceplayer
	playmusic MUSIC_PROF_ELM
	showtext ElmAfterTicketText
	setevent EVENT_LYRA_IN_HER_ROOM
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	end

.LyraAnnouncesGymChallenge
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext LyraAnnouncesGymChallengeText
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	pause 10
	end

.LyraEntryShort
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMovement
	turnobject ELMSLAB_ELM, DOWN
	turnobject ELMSLAB_LYRA, UP
	turnobject PLAYER, DOWN
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	scalltable .JumpBackScript1Table
	end
.JumpBackScript1Table
	dw ElmJumpDownScript
	dw ElmJumpUpScript
	dw ElmJumpLeftScript
	dw ElmJumpRightScript

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	scalltable .JumpBackScript2Table
	end
.JumpBackScript2Table
	dw ElmJumpUpScript
	dw ElmJumpDownScript
	dw ElmJumpRightScript
	dw ElmJumpLeftScript

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

LyraBattleScript:
	turnobject ELMSLAB_LYRA, DOWN
	playmusic MUSIC_LYRA_ENCOUNTER_HGSS
	showtext ElmsLabLyraChallengeText
	applymovement ELMSLAB_LYRA, LyraBattleMovement
	turnobject PLAYER, RIGHT
	winlosstext ElmsLabLyraWinText, ElmsLabLyraLossText
	setlasttalked ELMSLAB_LYRA
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	loadtrainer LYRA1, LYRA1_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterYourDefeat
	sjumpfwd .AfterVictorious

.Totodile:
	loadtrainer LYRA1, LYRA1_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterVictorious
	sjumpfwd .AfterYourDefeat

.Chikorita:
	loadtrainer LYRA1, LYRA1_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_LYRA_DEPARTURE_HGSS
	iftruefwd .AfterVictorious
	sjumpfwd .AfterYourDefeat

.AfterVictorious:
	showtext ElmsLabLyraText_YouWon
	sjumpfwd .FinishLyra

.AfterYourDefeat:
	showtext ElmsLabLyraText_YouLost
.FinishLyra:
	turnobject ELMSLAB_LYRA, UP
	opentext
	writetext ElmsLabLyraThankYouText
	waitbutton
	turnobject ELMSLAB_LYRA, LEFT
	writetext ElmsLabLyraSeeYouText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	special HealParty
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	playmapmusic
	end

AideScript_WalkPotions1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotions:
	opentext
	writetext AideText_GiveYouPotions
	promptbutton
	verbosegiveitem POTION
	setscene SCENE_ELMSLAB_NOOP
	jumpopenedtext AideText_AlwaysBusy

ElmsAideScript:
	checkevent EVENT_GOT_RIVALS_EGG
	iftrue_jumptextfaceplayer AideText_AlwaysBusy
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue_jumptextfaceplayer AideText_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue_jumptextfaceplayer AideText_AlwaysBusy
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue_jumptextfaceplayer AideText_TheftTestimony
	jumptextfaceplayer AideText_AlwaysBusy

MeetCopScript2:
	applyonemovement PLAYER, step_left
MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	showtext ElmsLabOfficerText1
	disappear ELMSLAB_LYRA
	moveobject ELMSLAB_LYRA, 5, 8
	appear ELMSLAB_LYRA
	applymovement ELMSLAB_LYRA, LyraRunsInMovement
	turnobject ELMSLAB_OFFICER, DOWN
	showtext ElmsLabLyraTheftInnocentText
	pause 10
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText2
	promptbutton
	special SpecialNameRival
	writetext ElmsLabOfficerText3
	waitbutton
	closetext
	applymovement ELMSLAB_LYRA, LyraStepsAsideMovement
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	pause 10
	turnobject ELMSLAB_LYRA, UP
	turnobject PLAYER, DOWN
	showtext ElmsLabLyraTheftGoodbyeText
	applymovement ELMSLAB_LYRA, LyraLeavesMovement
	disappear ELMSLAB_LYRA
	setscene SCENE_ELMSLAB_NOOP
	pause 10
	applymovement PLAYER, MeetCopScript_GiveEgg
	opentext
	sjump ElmAfterTheftScript

ElmsLabLyraScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iffalse_jumptextfaceplayer ElmsLabLyraWhichPokemonText
	jumpthistextfaceplayer

	text "!Tu #mon"
	line "también es mono!"
	done

ElmsLabWindow:
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue_jumptext ElmsLabWindowText1
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue_jumptext ElmsLabWindowText2
	jumptext ElmsLabWindowText1

ElmsLabPC:
	jumpthistext

	text "Observaciones de"
	line "Ev. de #mon"

	para "…Pone eso en"
	line "la pantalla…"
	done

ElmsLab_WalkUpToElmMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

LyraPicksChikoritaMovement:
	step_right
LyraPicksTotodileMovement:
	step_right
LyraPicksCyndaquilMovement:
	step_right
	step_right
	step_up
	step_end

LyraAfterChikoritaMovement:
	step_down
	step_left
	step_left
	step_left
	turn_head_up
	step_end

LyraAfterTotodileMovement:
	step_down
	step_left
	step_left
	turn_head_up
	step_end

LyraAfterCyndaquilMovement:
	step_down
	step_left
	turn_head_up
	step_end

LyraBattleMovement:
	step_down
	turn_head_left
	step_end

LyraLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

LyraRunsInMoreMovement:
	step_up
LyraRunsInMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

LyraStepsAsideMovement:
	step_left
	turn_head_right
	step_end

MeetCopScript_WalkUp:
	step_up
	step_up
	turn_head_right
	step_end

MeetCopScript_GiveEgg:
	step_right
	turn_head_up
	step_end

OfficerLeavesMovement:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AideWalksRight1:
	step_right
	step_right
	turn_head_up
	step_end

AideWalksRight2:
	step_right
	step_right
	step_right
	turn_head_up
	step_end

AideWalksLeft1:
	step_left
	step_left
	turn_head_down
	step_end

AideWalksLeft2:
	step_left
	step_left
	step_left
	turn_head_down
	step_end

AideWalksDownMovement:
	step_right
	step_right
	step_down
	step_end

AideWalksBackMovement:
	step_up
	step_left
	step_left
	step_end

ElmJumpUpMovement:
	fix_facing
	run_step_up
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	run_step_down
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	run_step_left
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	run_step_right
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement:
	step_right
	step_right
	step_up
	turn_head_down
	step_end

AfterCyndaquilMovement:
	step_left
	step_up
	turn_head_up
	step_end

AfterTotodileMovement:
	step_left
	step_left
	step_up
	turn_head_up
	step_end

AfterChikoritaMovement:
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end

ElmText_Intro:
	text "Elm: ¡<PLAYER>!"
	line "¡Ahí estás!"

if !DEF(DEBUG)
	para "Hola a ti"
	line "también, Lira."

	para "Necesitaba pediros"
	line "un favor a los dos"

	para "Veréis…"

	para "Estoy escribiendo"
	line "un artículo que"

	para "quiero presentar"
	line "en una conferencia"

	para "Pero aún hay"
	line "cosas que no"

	para "entiendo del todo."

	para "¡Así que!"

	para "Me gustaría que"
	line "ambos criaseis un"

	para "#mon que atrapé"
	line "hace poco."
endc
	done

ElmText_Accepted:
	text "¡Gracias <PLAYER>!"

	para "¡Nos sirve de"
	line "gran ayuda!"
	done

ElmText_Refused:
	text "Pero… ¡Por favor,"
	line "necesito vuestra"
	cont "ayuda!"
	done

ElmText_ResearchAmbitions:
	text "Cuando anuncie mis"
	line "hallazgos, seguro"

	para "que sabremos más"
	line "sobre los muchos"

	para "muchos misterios"
	line "de los #mon."

	para "¡Podéis darlo por"
	line "hecho!"
	done

ElmText_GotAnEmail:
	text "¡Ah, mirad! ¡Me ha"
	line "llegado un e-mail!"

	para "………………"
	line "Hum… Ajá…"

	para "Vale…"
	done

ElmText_MissionFromMrPokemon:
	text "Oye, escucha."

	para "Tengo un conocido"
	line "al que llaman Sr."
	cont "#mon."

	para "Siempre está con"
	line "cosas raras y se"

	para "entusiasma con sus"
	line "descubrimientos."

	para "En fin, acaba de"
	line "mandar un e-mail"

	para "diciendo que esta"
	line "vez es de verdad."

	para "Es intrigante,"
	line "pero estamos muy"

	para "liados con nuestra"
	line "investigación…"

	para "¡Espera!"

	para "¡Ya sé!"

	para "<PLAYER>, ¿puedes"
	line "ir en nuestro"
	cont "lugar?"
	done

ElmText_ChooseAPokemon:
	text "Quiero que cries a"
	line "uno de los #mon"

	para "de estas Balls."

	para "¡Serás su primer"
	line "compañero,"
	cont "<PLAYER>!"

	para "Adelante elige uno"
	done


LabWhereGoingText:
	text "Elm: ¡Espera!"
	line "¿Adónde vas?"
	done

TakeCyndaquilText:
	text "Elm: ¿Te llevas a"
	line "Cyndaquil, el #"
	cont "mon de fuego?"
	done

TakeTotodileText:
	text "Elm: ¿Quieres a"
	line "Totodile, el #"
	cont "mon de agua?"
	done

TakeChikoritaText:
	text "Elm: Así que, ¿te"
	line "gusta Chikorita?"
	cont "#mon de planta"
	done

DidntChooseStarterText:
	text "Elm: Piénsalo con"
	line "cuidado."

	para "Tu compañero es"
	line "importante."
	done

ChoseStarterText:
	text "Elm: ¡Creo que"
	line "también es un gran"
	cont "#mon!"
	done

ElmDirectionsText1:
	text "El Sr. #mon"
	line "vive un poco más"

	para "allá de Ciudad"
	line "Cerezo, la"
	cont "siguiente ciudad."

	para "El camino es casi"
	line "directo,"

	para "así que no tiene"
	line "pérdida."

	para "Pero por si acaso,"
	line "aquí tienes mi nú-"

	para "mero. ¡Llámame si"
	line "pasa algo!"
	done

ElmDirectionsText2:
	text "Si tu #mon está"
	line "herido, deberías"

	para "curarlo con esta"
	line "máquina."

	para "Siéntete libre de"
	line "usarla en cual-"
	cont "quier momento."
	done

ElmDirectionsText3:
	text "¡<PLAYER>, cuento"
	line "contigo!"
	done

GotElmsNumberText:
	text "<PLAYER> consiguió"
	line "el número de te-"
	cont "léfono de Elm."
	done

ElmDescribesMrPokemonText:
	text "El Sr. #mon va"
	line "a todas partes y"
	cont "encuentra rarezas."

	para "Lástima que sólo"
	line "sean raras y no"
	cont "muy útiles…"
	done

ElmPokeBallText:
	text "Contiene un #"
	line "mon capturado por"
	cont "el Prof. Elm."
	done


ElmsLabHealingMachineText2:
	text "¿Quieres curar a"
	line "tus #mon?"
	done

ElmAfterTheftText1:
	text "Elm: <PLAYER>,"
	line "esto es terri-"
	cont "ble…"

	para "Ah, sí, ¿cuál fue"
	line "el gran descu-"
	cont "brimiento del Sr."
	cont "#mon?"
	done

ElmAfterTheftText2:
	text "<PLAYER> entregó"
	line "el Huevo Misterio"
	cont "al Prof. Elm."
	done

ElmAfterTheftText3:
	text "Elm: ¿Esto?"
	done

ElmAfterTheftText4:
	text "Pero… ¿Es un"
	line "Huevo #mon?"

	para "Si lo es, ¡es un"
	line "gran descubri-"
	cont "miento!"
	done

ElmAfterTheftText5:
	text "Elm: ¡¿Qué?!"

if !DEF(DEBUG)
	para "¿El Prof. Oak te"
	line "dio una #dex?"

	para "<PLAYER>, ¿es eso"
	line "cierto? ¡E-eso es"
	cont "increíble!"

	para "Tiene un ojo clí-"
	line "nico para ver el"
	cont "potencial de la"
	cont "gente."

	para "Guau, <PLAYER>."
	line "Puede que tengas"

	para "lo que hay que te-"
	line "ner para conver-"
	cont "tirse en Campeón."

	para "Parece que tam-"
	line "bién te llevas"
	cont "muy bien con los"
	cont "#mon."

	para "Deberías acep-"
	line "tar el reto del"
	cont "Gimnasio #mon."

	para "¡El Gimnasio más"
	line "cercano sería el"
	cont "de Ciudad Malva!"
endc
	done

ElmAfterTheftText6:
	text "…El camino es"
	line "largo, así que"
	cont "cuidado."

	para "Antes de irte,"
	line "asegúrate de"
	cont "hablar con tu"
	cont "madre."
	done

ElmAfterTheftText7:
	text "Y llámame de"
	line "vez en cuando."

	para "Si quieres saber"
	line "cómo podría evo-"
	cont "lucionar tu"
	cont "#mon,"

	para "¡mi investigación"
	line "será de gran"
	cont "ayuda!"
	done

ElmStudyingEggText:
	text "Elm: ¡No te rin-"
	line "das! ¡Te llamaré"
	cont "si descubro algo"
	cont "sobre el Huevo!"
	done

ElmAideHasEggText:
	text "Elm: ¿<PLAYER>?"
	line "¿No viste a mi"
	cont "ayudante?"

	para "Debería haberse"
	line "reunido contigo"
	cont "con el Huevo en"

	para "el Centro #mon"
	line "de Ciudad Malva."

	para "Te lo debiste per-"
	line "der. Ve a buscar-"
	cont "lo allí."
	done

ElmWaitingEggHatchText:
	text "Elm: Oye, ¿ha cam-"
	line "biado el Huevo?"
	done


ShowElmTogepiText1:
	text "Elm: ¡Oh <PLAYER>!"
	line "¡Ese #mon es de"
	cont "ese Huevo!"
	done

ShowElmTogepiText2:
	text "¿Qué?"
	line "¡¿Ese #mon?!"
	done

ShowElmTogepiText3:
	text "¡El Huevo eclosio-"
	line "nó! Así que los"
	cont "#mon nacen de"
	cont "Huevos…"

	para "No, puede que no"
	line "todos los #mon"
	cont "lo hagan."

	para "Guau, aún queda"
	line "mucha investiga-"
	cont "ción por hacer."
	done

ElmGiveOddSouvenirText1:
	text "¡Gracias <PLAYER>!"
	line "¡Nos ayudas a"

	para "desvelar los mis-"
	line "terios de #mon!"

	para "Quiero que tengas"
	line "esto como muestra"
	cont "de mi agradeci-"
	cont "miento."
	done

ElmGiveOddSouvenirText2:
	text "Esa rareza me la"
	line "dio el Sr. #mon."

	para "Me dijo que es un"
	line "recuerdo de su"

	para "viaje a una isla"
	line "tropical."

	para "Se supone que hay"
	line "unas pocas espe-"

	para "cies de #mon"
	line "a las que les gus-"
	cont "ta llevarla."
	done

ElmText_CallYou:
	text "Elm: <PLAYER>, te"
	line "llamaré si surge"
	cont "algo."
	done

AideText_AfterTheft:
	text "…ay… Ese #"
	line "mon robado."

	para "Me pregunto cómo"
	line "estará."

	para "Dicen que un #"
	line "mon criado por"

	para "una mala persona"
	line "se vuelve malo"
	cont "también."
	done

AideText_ThiefReturnedMon:
	text "¡<PLAYER>!"
	line "¡Adivina qué!"

	para "El chico que robó"
	line "el #mon del"
	cont "Profesor…"

	para "¡...vino a"
	line "devolverlo!"

	para "Pero el Prof. Elm"
	line "le dijo…"

	para "Parece que al #"
	line "mon le gustas"
	cont "mucho."

	para "Los #mon dan lo"
	line "mejor de sí con"
	cont "alguien que"
	cont "quieren."

	para "Creo que debería"
	line "quedarse contigo."

	para "¿No es conmovedor?"
	line "¡Me hizo llorar!"

	para "Vi la cara del"
	line "chico al irse."

	para "¡Parecía muy"
	line "feliz!"
	done

ElmGiveMasterBallText1:
	text "Elm: ¡<PLAYER>!"
	line "¡Gracias a ti, mi"

	para "investigación va"
	line "genial!"

	para "Toma esto como"
	line "muestra de mi"
	cont "agradecimiento."
	done

ElmGiveMasterBallText2:
	text "¡La Master Ball es"
	line "la mejor!"

	para "¡Es la Ball defi-"
	line "nitiva! Atrapa a"

	para "cualquier #mon"
	line "sin fallar."

	para "Solo se entrega a"
	line "investigadores de"
	cont "#mon de"
	cont "renombre."

	para "¡Creo que puedes"
	line "darle un uso mucho"

	para "mejor que yo,"
	line "<PLAYER>!"
	done

ElmGiveTicketText1:
	text "Elm: ¡<PLAYER>!"
	line "¡Ahí estás!"

	para "Te he llamado"
	line "porque tengo algo"
	cont "para ti."

	para "¿Ves? Es un"
	line "S.S. Ticket."

	para "Ahora puedes atra-"
	line "par #mon en la"
	cont "región de Kanto."

	para "También puedes"
	line "desafiar nuevos"
	cont "Gimnasios."

	para "Si consigues ocho"
	line "Medallas más,"

	para "el Alto Mando"
	line "luchará contra ti"

	para "con todas sus"
	line "fuerzas."
	done

ElmGiveTicketText2:
	text "El barco sale"
	line "desde C. Olivo."

	para "Pero seguro que"
	line "eso ya lo sabías,"
	cont "<PLAYER>."

	para "Al fin y al cabo,"
	line "has viajado por"
	cont "todas partes con"
	cont "tus #mon."

	para "¡Ah, eso me re-"
	line "cuerda algo!"

	para "La Torre Batalla"
	line "acaba de abrir"
	cont "cerca de Olivo."

	para "¡Un as como tú"
	line "lo hará genial"
	cont "compitiendo ahí!"
	done

LyraAnnouncesGymChallengeText:
	text "Lira: ¡Ahí estás,"
	line "<PLAYER>!"

	para "Vi tu combate"
	line "con el Campeón"
	cont "por la tele."

	para "¡Estuviste"
	line "increíble!"

	para "Me ha inspirado,"
	line "<PLAYER>."

	para "Aunque no pueda"
	line "llegar a ese"
	cont "nivel… Quiero"
	cont "intentarlo."

	para "Quiero ver de lo"
	line "que soy capaz."

	para "Prof.Elm, lo sien-"
	line "to, no puedo se-"
	cont "guir ayudando."

	para "¡Voy a desafiar"
	line "a los Gimnasios y"
	cont "llegar a la"
	cont "Liga #mon!"

	para "¡Deseadme suerte!"
	line "¡Hasta luego!"
	done

ElmAfterTicketText:
	text "Elm: Bueno,"
	line "<PLAYER>, los dos"

	para "tenéis vuestros"
	line "propios viajes."

	para "Me pregunto si"
	line "ella llegará pri-"
	cont "mero a la Liga."

	para "¡Dale saludos al"
	line "Prof. Oak en"
	cont "Kanto!"
	done

ElmBeforeBattleText:
	text "Elm: ¡<PLAYER>!"
	line "¿Cómo va tu viaje"
	cont "#mon?"
	done

ElmByTheWayText:
	text "Ya que estás"
	line "aquí, <PLAYER>…"
	done

ElmAskBattleText:
	text "Me vendría bien"
	line "practicar comba-"

	para "tiendo con un en-"
	line "trenador de talen-"
	cont "to como tú."

	para "¿Qué te parece,"
	line "<PLAYER>?"
	done

ElmSeenText:
	text "¡Enséñame cuánto"
	line "has crecido desde"

	para "que te fuiste de"
	line "Pueblo Primavera!"
	done

ElmWinText:
	text "¡Asombroso!"
	done

ElmLoseText:
	text "¿Me has dejado"
	line "ganar?"
	done

ElmRefusedBattleText:
	text "Si tus #mon ne-"
	line "cesitan curarse,"

	para "usa la máquina de"
	line "aquí."
	done


AideText_GiveYouPotions:
	text "<PLAYER>, quiero"
	line "que tengas esto"
	cont "para tu encargo."
	done

AideText_AlwaysBusy:
	text "Solo somos dos,"
	line "así que siempre"
	cont "estamos ocupados."
	done

AideText_TheftTestimony:
	text "Se oyó un ruido"
	line "fuerte fuera…"

	para "Cuando fuimos a"
	line "mirar, alguien ha-"
	cont "bía robado un"
	cont "#mon."

	para "¡Es increíble que"
	line "alguien haga eso!"

	para "…ay… Ese #"
	line "mon robado."

	para "Me pregunto cómo"
	line "estará."

	para "Dicen que un #"
	line "mon criado por"

	para "una mala persona"
	line "se vuelve malo"
	cont "también."
	done

ElmsLabOfficerText1:
	text "He oído que han"
	line "robado un #mon"
	cont "aquí."

	para "¡Regla número uno!"
	line "El criminal"

	para "siempre vuelve al"
	line "lugar del cri-"
	cont "men…"

	para "Vaya… ¿Así que"
	line "tú eres el ladrón?"
	done

ElmsLabOfficerText2:
	text "¿Qué?"

	para "¿Luchaste contra"
	line "un entrenador así?"

	para "¿Por casualidad"
	line "te enteraste de su"
	cont "nombre?"
	done

ElmsLabOfficerText3:
	text "¡Vale! Así que su"
	line "nombre era <RIVAL>"

	para "¡Gracias por ayu-"
	line "dar en mi investi-"
	cont "gación!"
	done

ElmsLabLyraWhichPokemonText:
	text "¿Qué #mon vas a"
	line "elegir, <PLAYER>?"
	done

LyraChoosesStarterText:
	text "Lira: ¡Entonces yo"
	line "elegiré a este!"
	done

LyraReceivedStarterText:
	text "Lira recibió un"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

LyraNicknamedChikoritaText:
	text "Lira: ¡Es tan lin-"
	line "do! ¡Le llamaré"
	cont "Chicory!"
	done

LyraNicknamedCyndaquilText:
	text "Lira: ¡Es tan lin-"
	line "do! ¡Le llamaré"
	cont "Cinder!"
	done

LyraNicknamedTotodileText:
	text "Lira: ¡Es tan lin-"
	line "do! ¡Le llamaré"
	cont "Toto!"
	done


ElmsLabLyraChallengeText:
	text "Lira: ¡<PLAYER>!"
	line "¡Vamos a conocer"

	para "a nuestros #mon"
	line "con un combate!"
	done

ElmsLabLyraWinText:
	text "¡Buen trabajo,"
	line "<PLAYER>!"
	done

ElmsLabLyraLossText:
	text "¡Yupi! ¡He ganado!"
	done

ElmsLabLyraText_YouWon:
ElmsLabLyraText_YouLost:
	text "¡Ha sido un com-"
	line "bate emocionante!"
	done

ElmsLabLyraThankYouText:
	text "Gracias por el"
	line "#mon, Prof."
	cont "Elm."
	done

ElmsLabLyraSeeYouText:
	text "¡<PLAYER>, te veo"
	line "luego!"

	para "¡Diviértete en tu"
	line "encargo!"
	done

ElmsLabLyraTheftInnocentText:
	text "Lira: ¡Espera!"
	line "¡<PLAYER> no tiene"
	cont "nada que ver!"

	para "¡Vi a un chico de"
	line "pelo rojo espiando"
	cont "el edificio!"
	done

ElmsLabLyraTheftGoodbyeText:
	text "Lira: <PLAYER>,"
	line "me alegra que haya"

	para "entendido que eres"
	line "inocente."

	para "Espero que haga"
	line "que el ladrón de-"
	cont "vuelva ese #mon"

	para "Bueno, ¡nos vemos"
	line "luego!"
	done

ElmsLabWindowText1:
	text "La ventana está"
	line "abierta."

	para "Entra una brisa"
	line "muy agradable."
	done

ElmsLabWindowText2:
	text "¡Entró por"
	line "aquí!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo n1:"

	para "Pulsa Start para"
	line "abrir el menú."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo n2:"

	para "¡Registra tu viaje"
	line "guardando!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo n3:"

	para "Abre la Mochila y"
	line "pulsa Select para"
	cont "mover objetos."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> abrió un"
	line "libro."

	para "Consejo n4:"

	para "Revisa los movi-"
	line "mientos #mon."

	para "Pulsa el Botón A"
	line "para cambiarlos"
	cont "de orden."
	done

ElmsLabTrashcanText:
	text "El envoltorio del"
	line "snack que se comió"
	cont "el Prof. Elm está"
	cont "ahí dentro…"
	done
