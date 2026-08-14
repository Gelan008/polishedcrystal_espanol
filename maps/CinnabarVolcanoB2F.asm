CinnabarVolcanoB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CinnabarVolcanoB2FBouldersLand

	def_warp_events
	warp_event 13,  3, CINNABAR_VOLCANO_B1F, 5
	warp_event 25, 19, CINNABAR_VOLCANO_B1F, 6
	warp_event  6,  6, CINNABAR_VOLCANO_B1F, 7 ; hole

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18, 22, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MOLTRES, -1, PAL_MON_RED, OBJECTTYPE_SCRIPT, PLAIN_FORM, CinnabarVolcanoMoltres, EVENT_CINNABAR_VOLCANO_MOLTRES
	object_event 12, 24, SPRITE_LAWRENCE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAWRENCE_FINAL_BIRD
	smashrock_event 21, 19
	itemball_event 18,  3, FLAME_ORB, 1, EVENT_CINNABAR_VOLCANO_B2F_FLAME_ORB

	object_const_def
	const CINNABARVOLCANOB2F_MOLTRES
	const CINNABARVOLCANOB2F_LAWRENCE

CinnabarVolcanoB2FBouldersLand:
	checkevent EVENT_BOULDER_IN_CINNABAR_VOLCANO_B1F
	iffalsefwd .skip1
	changeblock 6, 6, $5f
.skip1
	endcallback

CinnabarVolcanoB2FLawrenceEncounterScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	readvar VAR_FACING
	ifequalfwd UP, .up
	ifequalfwd DOWN, .down
	ifequalfwd LEFT, .left
.right
	appear CINNABARVOLCANOB2F_LAWRENCE
	applymovement CINNABARVOLCANOB2F_LAWRENCE, CinnabarVolcanoB2FMovementData_LawrenceApproachLeftRight
	turnobject PLAYER, DOWN
	sjumpfwd .continue
.up
	moveobject CINNABARVOLCANOB2F_LAWRENCE, 13, 24
	appear CINNABARVOLCANOB2F_LAWRENCE
	applymovement CINNABARVOLCANOB2F_LAWRENCE, CinnabarVolcanoB2FMovementData_LawrenceApproachUp
	turnobject CINNABARVOLCANOB2F_LAWRENCE, UP
	turnobject PLAYER, DOWN
	sjumpfwd .continue
.down
	moveobject CINNABARVOLCANOB2F_LAWRENCE, 13, 24
	appear CINNABARVOLCANOB2F_LAWRENCE
	applymovement CINNABARVOLCANOB2F_LAWRENCE, CinnabarVolcanoB2FMovementData_LawrenceApproachDown
	sjumpfwd .continue
.left
	moveobject CINNABARVOLCANOB2F_LAWRENCE, 14, 24
	appear CINNABARVOLCANOB2F_LAWRENCE
	applymovement CINNABARVOLCANOB2F_LAWRENCE, CinnabarVolcanoB2FMovementData_LawrenceApproachLeftRight
	turnobject CINNABARVOLCANOB2F_LAWRENCE, UP
	turnobject PLAYER, DOWN
.continue
	playmusic MUSIC_ZINNIA_ENCOUNTER_ORAS
	showtext CinnabarVolcanoB2FLawrenceSpeechText
	turnobject CINNABARVOLCANOB2F_LAWRENCE, UP
	opentext
	writetext CinnabarVolcanoB2FLawrenceEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear CINNABARVOLCANOB2F_LAWRENCE
	waitsfx
	special Special_FadeInQuickly
	setevent EVENT_HEARD_LAWRENCES_FINAL_SPEECH
	clearevent EVENT_LAWRENCE_SHAMOUTI_SHRINE_RUINS
	special RestartMapMusic
	end

CinnabarVolcanoMoltres:
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	loadwildmon MOLTRES, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear CINNABARVOLCANOB2F_MOLTRES
	setevent EVENT_CINNABAR_VOLCANO_MOLTRES
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatch
	setflag ENGINE_PLAYER_CAUGHT_MOLTRES
.NoCatch
	checkevent EVENT_SEAFOAM_ISLANDS_ARTICUNO
	iffalsefwd .end
	checkevent EVENT_ROUTE_10_ZAPDOS
	iffalsefwd .end
	special SpecialBirdsCheck
	iffalsefwd .end
	sjump CinnabarVolcanoB2FLawrenceEncounterScript
.end
	end

MoltresText:
	text "Gyaoo!"
	done

CinnabarVolcanoB2FLawrenceSpeechText:
	text "Lawrence: Hola de"
	line "nuevo, <PLAYER>."

	para "Así que tú también"
	line "estás buscando a"
	cont "Moltres por aquí."
	cont "¿Te inspiré?"

	para "…¡¿Qué?! ¿Ya lo"
	line "has atrapado?"
	cont "Imposible."

	para "He pasado años"
	line "buscando por la"

	para "Calle Victoria y"
	line "las islas al sur"
	cont "de Kanto…"

	para "¿Por qué has"
	line "triunfado donde yo"
	cont "he fracasado?"

	para "¿Acaso aprecias la"
	line "majestuosidad de"
	cont "los espejismos"
	cont "alados?"

	para "¿Alguna vez has"
	line "oído hablar del"

	para "guardián del mar?"

	para "Esto es inacep-"
	line "table."

	para "Reúnete conmigo en"
	line "el santuario en"
	cont "ruinas de la Isla"
	cont "Shamouti."

	para "Te demostraré que"
	line "yo merezco tener"
	cont "esos #mon."
	done

CinnabarVolcanoB2FLawrenceEscapeRopeText:
	text "¡Lawrence usó una"
	line "Cuerda Huida!"
	done

CinnabarVolcanoB2FMovementData_LawrenceApproachUp:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

CinnabarVolcanoB2FMovementData_LawrenceApproachLeftRight:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

CinnabarVolcanoB2FMovementData_LawrenceApproachDown:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end
