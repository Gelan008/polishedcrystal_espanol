RuinsOfAlphKabutoChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoChamberCheckWallScene, SCENE_RUINSOFALPHKABUTOCHAMBER_CHECK_WALL
	scene_const SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphKabutoChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost5Script

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RuinsOfAlphKabutoChamberReceptionistText, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1

RuinsOfAlphKabutoChamberCheckWallScene:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iffalsefwd .End
	sdefer RuinsofAlphKabutoChamberWallOpenScript
.End
	end

RuinsofAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftruefwd .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalsefwd .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback

RuinsofAlphKabutoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $25
	refreshmap
	earthquake 50
	setscene SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP
	endtext

MapRuinsofAlphKabutoChamberSignpost2Script:
	reanchormap
	setval $0
	special Special_UnownPuzzle
	closetext
	iftruefwd .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_J
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $14
	changeblock 4, 2, $15
	refreshmap
	playsound SFX_STRENGTH
	earthquake 80
	applyonemovement PLAYER, skyfall_top
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue_jumptextfaceplayer RuinsOfAlphKabutoChamberScientistHoleText
	faceplayer
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalsefwd .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.AllUnownCaught:
	jumptextfaceplayer RuinsOfAlphResearchCenterScientist1Text_GotAllUnown

MapRuinsofAlphKabutoChamberSignpost3Script:
	opentext
	unowntypeface
	writetext RuinsOfAlphKabutoChamberDescriptionText
	waitbutton
	closetext
	restoretypeface
	special RefreshSprites
	end

MapRuinsofAlphKabutoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue_jumptext RuinsOfAlphAerodactylChamberWallHoleText
MapRuinsofAlphKabutoChamberSignpost4Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	iftruefwd .unsolved
	writetext RuinsOfAlphChambersItsUnownText
	sjumpfwd .unownwords
.unsolved
	writetext RuinsOfAlphAerodactylChamberWallPatternLeftText
.unownwords
	setval $0
	special Special_DisplayUnownWords
	endtext

RuinsOfAlphKabutoChamberReceptionistText:
	text "Te damos la bien-"
	line "venida a esta"
	cont "cámara."

	para "Hay paneles desli-"
	line "zantes con un #-"

	para "mon dibujado por"
	line "los antiguos."

	para "Mueve los paneles"
	line "para recomponer la"
	cont "imagen."

	para "A la derecha verás"
	line "la descripción"
	cont "del #mon."

	para "Los científicos"
	line "del fondo examinan"

	para "nuevos dibujos re-"
	line "cién descubiertos."
	done

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Hace poco apare-"
	line "cieron extraños di-"
	cont "bujos crípticos."

	para "Es raro. ¡Hace un"
	line "momento no estaban"
	cont "aquí…!"

	para "Deberías echarle"
	line "un vistazo a las"
	cont "paredes."
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "¡Ah! ¡Aquí hay"
	line "otro enorme agu-"
	cont "jero!"

	para "¡Es tan grande que"
	line "se puede pasar!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "¡Ese temblor dio"
	line "mucho miedo!"

	para "Pero me preocupa"
	line "más esta pared de"
	cont "aquí…"
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "Un #mon que se"
	line "escondía en el"
	cont "fondo del mar."

	para "Vigilaba alrededor"
	line "con los ojos de su"
	cont "espalda."
	done