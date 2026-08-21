TinTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTower1FNPCsCallback
	callback MAPCALLBACK_TILES, TinTower1FStairsCallback

	def_warp_events
	warp_event  7, 15, BELLCHIME_TRAIL, 3
	warp_event  8, 15, BELLCHIME_TRAIL, 3
	warp_event  8,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	pokemon_event  7,  9, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_BLUE, ClearText, EVENT_TIN_TOWER_1F_SUICUNE
	pokemon_event  5,  9, RAIKOU, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_BROWN, ClearText, EVENT_TIN_TOWER_1F_RAIKOU
	pokemon_event 10,  9, ENTEI, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_RED, ClearText, EVENT_TIN_TOWER_1F_ENTEI
	object_event  6,  3, SPRITE_EUSINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FEusineAfterHoOhScript, EVENT_TIN_TOWER_1F_EUSINE
	object_event  3,  9, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage1Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage2Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 12,  6, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage3Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  2,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  7,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 12,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2

	object_const_def
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3

TinTower1FSuicuneBattleScene:
	sdefer TinTower1FSuicuneBattleScript
	end

TinTower1FNPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalsefwd .FaceBeasts
	special SpecialBeastsCheck
	iffalsefwd .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalsefwd .Done
	appear TINTOWER1F_EUSINE
.Done:
	endcallback

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftruefwd .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjumpfwd .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .NoEntei
	appear TINTOWER1F_ENTEI
	sjumpfwd .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	endcallback

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	endcallback

TinTower1FStairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .DontHideStairs
	changeblock 8, 2, $9
.DontHideStairs:
	endcallback

TinTower1FSuicuneBattleScript:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	checkflag ENGINE_PLAYER_CAUGHT_RAIKOU
	iftruefwd .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouApproachesMovement
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTower1FRaikouLeavesMovement
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	checkflag ENGINE_PLAYER_CAUGHT_ENTEI
	iftruefwd .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiApproachesMovement
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTower1FEnteiLeavesMovement
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTower1FPlayerBacksUpMovement
	applymovement TINTOWER1F_SUICUNE, TinTower1FSuicuneApproachesMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, $0
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, $0
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, $0
	setscene $1
	clearevent EVENT_EUSINES_HOUSE_EUSINE
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUICUNE
.nocatch
	turnobject PLAYER, DOWN
	pause 20
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 8, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineEntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 7, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, TinTower1FSage1EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 7, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, TinTower1FSage2EntersMovement
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 7, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, TinTower1FSage3EntersMovement
	moveobject TINTOWER1F_SAGE1, 5, 13
	moveobject TINTOWER1F_SAGE2, 7, 13
	moveobject TINTOWER1F_SAGE3, 9, 13
	turnobject PLAYER, RIGHT
	showtext TinTowerEusineSuicuneText
	applymovement TINTOWER1F_EUSINE, TinTower1FEusineLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special Special_FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftruefwd .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegivekeyitem RAINBOW_WING
	closetext
	reanchormap
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 8, 2, $20
	refreshmap
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	jumpopenedtext TinTower1FSage5Text2

.FoughtHoOh:
	jumpopenedtext TinTower1FSage5Text3

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTower1FEusineAfterHoOhScript:
	faceplayer
	opentext
	writetext TinTowerEusineHoOhText
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal RIGHT, .PathClear
	applymovement PLAYER, .PlayerStepsAsideMovement
.PathClear:
	applymovement TINTOWER1F_EUSINE, .EusineLeavesAfterHoOhMovement
	disappear TINTOWER1F_EUSINE
	end

.PlayerStepsAsideMovement:
	step_up
	turn_head_left
	step_end

.EusineLeavesAfterHoOhMovement:
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end

TinTowerPlayerMovement1:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

TinTower1FRaikouApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FRaikouLeavesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_down
	step_end

TinTower1FEnteiApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FEnteiLeavesMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_left
	fast_jump_step_down
	step_end

TinTower1FSuicuneApproachesMovement:
	fix_facing
	fast_jump_step_down
	step_end

TinTower1FPlayerBacksUpMovement:
	fix_facing
	run_step_down
	remove_fixed_facing
	step_end

TinTower1FEusineEntersMovement:
	step_up
	step_up
	step_up
	turn_head_left
	step_end

TinTower1FEusineLeavesMovement:
	step_down
	step_down
	step_down
	step_end

TinTower1FSage1EntersMovement:
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end

TinTower1FSage2EntersMovement:
	step_up
	step_up
	step_end

TinTower1FSage3EntersMovement:
	step_up
	step_right
	step_right
	step_up
	step_end

TinTowerEusineSuicuneText:
	text "Eusine: ¡Vaya!"
	line "¡Ha sido algo"
	cont "impresionante!"

	para "Jamás había visto"
	line "un combate igual."
	cont "¡Qué emoción!"

	para "Suicune era muy"
	line "fuerte, pero tú"
	cont "lo hiciste genial,"
	cont "<PLAYER>."

	para "Dicen que el poder"
	line "de Suicune invoca"
	cont "a un #mon del"
	cont "arcoíris."

	para "Tal vez lo de hoy"
	line "haga que ese"
	cont "#mon aparezca."

	para "Voy a estudiar más"
	line "las leyendas."

	para "¡Gracias por darme"
	line "este combate tan"
	cont "espectacular!"

	para "¡Hasta luego,"
	line "<PLAYER>!"
	done

TinTower1FSage1Text:
	text "Según cuenta la"
	line "leyenda…"

	para "Cuando las almas"
	line "de personas y de"
	cont "#mon se unen,"

	para "baja del cielo un"
	line "#mon de color"
	cont "arcoíris…"

	para "¿Querrá decir que"
	line "las leyendas nos"
	cont "ponen a prueba?"
	done

TinTower1FSage2Text:
if DEF(FAITHFUL)
	text "When the Brass"
else
	text "When the Gong"
endc
	line "Tower burned down,"

	para "three nameless"
	line "#mon were said"

	para "to have perished."
	line "It was tragic."

	para "However…"

	para "A rainbow-colored"
	line "#mon…"

	para "In other words…"

	para "Ho-Oh descended"
	line "from the sky and"

	para "gave new life to"
	line "the three #mon."

	para "They are…"

	para "Suicune, Entei and"
	line "Raikou."

	para "That is what they"
	line "say."
	done

TinTower1FSage3Text:
	text "Dicen que ambas"
	line "torres se alzaron"
	cont "para fomentar la"
	cont "amistad sincera"

	para "y la esperanza"
	line "entre humanos y"
	cont "los #mon."

	para "Fue hace 700 años,"
	line "pero ese ideal"
	cont "sigue vivo hoy."
	done

TinTower1FSage4Text1:
	text "Ho-Oh appears to"
	line "have descended"

	para "upon this, the"
	line "Bell Tower!"
	done

TinTower1FSage5Text1:
	text "Esto te dará"
	line "protección. Toma."
	done

TinTower1FSage5Text2:
	text "Now, go."
	done

TinTower1FSage6Text1:
	text "I believe you are"
	line "being tested."

	para "Free your mind"
	line "from uncertainty,"
	cont "and advance."
	done

TinTowerEusineHoOhText:
	text "Lo sabía."

	para "Sabía que tú"
	line "verías al #mon"
	cont "arcoíris,"
	cont "<PLAYER>."

	para "¡Ha pasado tal"
	line "como imaginaba!"

	para "Mis estudios no"
	line "iban nada mal,"
	cont "que digamos."

	para "Seguiré mi labor"
	line "con los #mon"
	cont "para ser un gran"
	cont "Pokémaníaco."

	para "Si alguna vez vas"
	line "a Ciudad Azulona,"
	cont "¿podrías visitar"
	cont "a mi abuelo?"

	para "Le agradará tener"
	line "compañía en mi"
	cont "ausencia."

	para "¡Hasta luego,"
	line "<PLAYER>!"
	done
TinTower1FSage4Text2:
	text "The legendary"
	line "#mon are said"

	para "to embody three"
	line "powers…"

	para "The lightning that"
	line "struck the tower."

	para "The fire that"
	line "burned the tower."

	para "And the rain that"
	line "put out the fire…"
	done

TinTower1FSage5Text3:
	text "When the legendary"
	line "#mon appeared…"

	para "They struck terror"
	line "in those who saw"
	cont "their rise."

	para "And…"

	para "Some even took to"
	line "futile attacks."

	para "The legendary"
	line "#mon, knowing"

	para "their own power,"
	line "fled, ignoring the"
	cont "frightened people."
	done

TinTower1FSage6Text2:
	text "Of the legendary"
	line "#mon, Suicune"

	para "is said to be the"
	line "closest to Ho-Oh."

	para "I hear there may"
	line "also be a link to"

	para "#mon known as"
	line "Unown."

	para "The #mon Unown"
	line "must be sharing a"

	para "cooperative bond"
	line "with Suicune."
	done
