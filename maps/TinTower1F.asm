TinTower1F_MapScriptHeader:
	def_scene_scripts
	scene_script TinTower1FSuicuneBattleScene, SCENE_TINTOWER1F_SUICUNE_BATTLE
	scene_const SCENE_TINTOWER1F_NOOP

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
	pokemon_event  7,  9, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_TIN_TOWER_1F_SUICUNE
	pokemon_event  5,  9, RAIKOU, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, ClearText, EVENT_TIN_TOWER_1F_RAIKOU
	pokemon_event 10,  9, ENTEI, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, ClearText, EVENT_TIN_TOWER_1F_ENTEI
	object_event  6,  3, SPRITE_EUSINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FEusineAfterHoOhScript, EVENT_TIN_TOWER_1F_EUSINE
	object_event  3,  9, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage1Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage2Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 12,  6, SPRITE_ELDER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, TinTower1FSage3Text, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  2,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  7,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 12,  2, SPRITE_ELDER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2

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
	setmapscene ROUTE_42, SCENE_ROUTE42_NOOP
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOOP
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOOP
	setscene SCENE_TINTOWER1F_NOOP
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
	jumpthistextfaceplayer

	text "¡Parece que Ho-Oh"
	line "ha descendido"

	para "sobre esta, la"
	line "Torre Hojalata!"
	done

.FoughtHoOh:
	jumpthistextfaceplayer

	text "Dicen que los #-"
	line "mon legendarios"

	para "encarnan tres po-"
	line "deres…"

	para "El rayo que cayó"
	line "sobre la torre."

	para "El fuego que que-"
	line "mó la torre."

	para "Y la lluvia que"
	line "apagó el fuego…"
	done

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
	jumpthisopenedtext

	text "Ahora, ve."
	done

.FoughtHoOh:
	jumpthisopenedtext

	text "Al aparecer los"
	line "#mon legenda-"
	cont "rios…"

	para "sembraron el te-"
	line "rror entre quienes"
	cont "los contemplaban."

	para "Y…"

	para "hubo quienes ata-"
	line "caron en vano."

	para "Los #mon legen-"
	line "darios, sabiendo"

	para "el poder que po-"
	line "seían, huyeron sin"

	para "hacer daño a la"
	line "gente asustada."
	done

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftruefwd .FoughtHoOh
	jumpthistextfaceplayer

	text "Creo que te están"
	line "poniendo a prueba."

	para "Despeja tu mente"
	line "de dudas y sigue"
	cont "adelante."
	done

.FoughtHoOh:
	jumpthistextfaceplayer

	text "De los #mon le-"
	line "gendarios, dicen"

	para "que Suicune es el"
	line "más cercano a"
	cont "Ho-Oh."

	para "He oído que tam-"
	line "bién podría tener"

	para "un vínculo con los"
	line "#mon Unown."

	para "Los #mon Unown"
	line "deben de compartir"

	para "un lazo de coope-"
	line "ración con"
	cont "Suicune."
	done

TinTower1FEusineAfterHoOhScript:
	faceplayer
	showtext TinTowerEusineHoOhText
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
	text "Eusine: ¡Increí-"
	line "ble! ¡Ha sido de-"
	cont "masiado increíble!"

	para "Jamás había visto"
	line "un combate igual."

	para "Ha sido muy emo-"
	line "cionante de ver."

	para "Suicune era fuer-"
	line "te, pero tú has"

	para "estado aún más in-"
	line "creíble, <PLAYER>."

	para "He oído que el po-"
	line "der místico de"
	cont "Suicune"

	para "invoca a un #mon"
	line "del color del"
	cont "arcoíris."

	para "Puede que lo que"
	line "ha pasado hoy"

	para "haga que ese #-"
	line "mon aparezca."

	para "Voy a estudiar más"
	line "las leyendas."

	para "Gracias por mos-"
	line "trarme este com-"
	cont "bate tan genial."

	para "¡Hasta luego,"
	line "<PLAYER>!"
	done

TinTower1FSage1Text:
	text "Según cuenta la"
	line "leyenda…"

	para "Cuando las almas"
	line "de humanos y #-"
	cont "mon se unen,"

	para "baja del cielo un"
	line "#mon del color"
	cont "del arcoíris…"

	para "¿Querrá decir que"
	line "los #mon legen-"

	para "darios nos están"
	line "poniendo a prueba?"
	done

TinTower1FSage2Text:
if DEF(FAITHFUL)
	text "Cuando ardió la"
	line "Torre Latón,"
else
	text "Cuando ardió la"
	line "Torre Gong,"
endc

	para "se dice que tres"
	line "#mon sin nombre"

	para "perecieron allí."
	line "Fue una tragedia."

	para "Sin embargo…"

	para "Un #mon del co-"
	line "lor del arcoíris…"

	para "En otras pala-"
	line "bras…"

	para "Ho-Oh descendió"
	line "del cielo y dio"

	para "nueva vida a esos"
	line "tres #mon."

	para "Ellos son…"

	para "Suicune, Entei y"
	line "Raikou."

	para "Eso es lo que se"
	line "cuenta."
	done

TinTower1FSage3Text:
	text "Dicen que las dos"
	line "torres fueron eri-"

	para "gidas para fomen-"
	line "tar la amistad y"

	para "la esperanza entre"
	line "humanos y #mon."

	para "Eso fue hace 700"
	line "años, pero ese"

	para "ideal sigue siendo"
	line "importante hoy."
	done

TinTower1FSage5Text1:
	text "Esto te protege-"
	line "rá. Tómalo."
	done

TinTowerEusineHoOhText:
	text "Lo sabía."

	para "Sabía que consegui-"
	line "rías ver al #mon"

	para "del color del"
	line "arcoíris, <PLAYER>."

	para "Ha pasado justo"
	line "como imaginaba."

	para "Mis investigacio-"
	line "nes no van mal,"
	cont "que digamos."

	para "Seguiré estudian-"
	line "do a los #mon"

	para "para ser un Poké-"
	line "maníaco famoso."

	para "Si alguna vez vas"
	line "a Ciudad Azulona,"

	para "¿podrías saludar"
	line "a mi abuelo?"

	para "Seguro que le gus-"
	line "tará tener compa-"
	cont "ñía mientras falto."

	para "¡Hasta luego,"
	line "<PLAYER>!"
	done