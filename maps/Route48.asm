Route48_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE48_JESSIE_AND_JAMES
	scene_const SCENE_ROUTE48_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route48JessieJamesCallback

	def_warp_events
	warp_event 11,  5, YELLOW_FOREST_GATE, 3

	def_coord_events
	coord_event 20, 12, SCENE_ROUTE48_JESSIE_AND_JAMES, Route48JessieJamesScript1
	coord_event 20, 13, SCENE_ROUTE48_JESSIE_AND_JAMES, Route48JessieJamesScript2

	def_bg_events
	bg_event 27, 11, BGEVENT_JUMPTEXT, Route48YellowForestSignText

	def_object_events
	object_event 11,  6, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerArcher2, EVENT_CLEARED_YELLOW_FOREST
	object_event 15, 12, SPRITE_JESSIE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_JESSIE
	object_event 26, 12, SPRITE_JAMES, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_JAMES
	object_event 11,  5, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_48_NURSE
	itemball_event  4, 13, NUGGET, 1, EVENT_ROUTE_48_NUGGET

	object_const_def
	const ROUTE48_ARCHER
	const ROUTE48_JESSIE
	const ROUTE48_JAMES
	const ROUTE48_NURSE

Route48JessieJamesCallback:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	endcallback

Route48JessieJamesScript2:
	moveobject ROUTE48_JESSIE, 15, 13
	moveobject ROUTE48_JAMES, 26, 13
Route48JessieJamesScript1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear ROUTE48_JESSIE
	appear ROUTE48_JAMES
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	applyonemovement ROUTE48_JAMES, step_left
	follow ROUTE48_JESSIE, ROUTE48_JAMES
	applymovement ROUTE48_JESSIE, JessieEnterMovementData
	stopfollow
	showtext Route48JessieJamesSeenText
	setevent EVENT_ROUTE_48_JESSIE
	setevent EVENT_ROUTE_48_JAMES
	winlosstext Route48JessieJamesBeatenText, 0
	setlasttalked ROUTE48_JESSIE
	loadtrainer JESSIE_JAMES, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setscene SCENE_ROUTE48_NOOP
	special DeleteSavedMusic
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	showtext Route48JessieJamesAfterText
	follow ROUTE48_JESSIE, ROUTE48_JAMES
	loadmem wFollowMovementQueue, movement_teleport_from
	applyonemovement ROUTE48_JESSIE, teleport_from
	stopfollow
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	playmapmusic
	end

JessieEnterMovementData:
	paired_step_right
	paired_step_right
	paired_step_right
	paired_step_right
	step_end

TrainerArcher2:
	trainer ARCHER, ARCHER2, EVENT_BEAT_ARCHER_2, Archer2SeenText, Archer2BeatenText, 0, Archer2Script

Archer2Script:
	showtext Archer2AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE48_ARCHER
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_CLEARED_YELLOW_FOREST
	clearevent EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	playsound SFX_ENTER_DOOR
	appear ROUTE48_NURSE
	waitsfx
	applyonemovement ROUTE48_NURSE, step_down
	setlasttalked ROUTE48_NURSE
	faceplayer
	showtext Route48NurseText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	showtext Route48NurseText2
	applyonemovement ROUTE48_NURSE, step_up
	playsound SFX_EXIT_BUILDING
	disappear ROUTE48_NURSE
	end

Route48JessieJamesSeenText:
	text "¡Alto ahí,"
	line "mocoso!"

	para "¿Sabes qué #mon"
	line "vive en ese bos-"
	cont "que? ¡Pikachu!"

	para "¡Al jefe le encan-"
	line "tará si atrapamos"
	cont "uno poderoso!"

	para "¡Ríndete ahora o"
	line "prepárate para"
	cont "luchar!"
	done

Route48JessieJamesBeatenText:
	text "¿Nos ha vencido"
	line "este renacuajo?"
	done

Route48JessieJamesAfterText:
	text "¡El Team Rocket"
	line "despega de nuevo!"
	done

Archer2SeenText:
	text "Así que quieres"
	line "volver a entrome-"

	para "terte en los pla-"
	line "nes del Team"
	cont "Rocket."

	para "Siempre metiendo"
	line "las narices donde"
	cont "no te llaman."

	para "¡Vamos a vender"
	line "esos #mon,"

	para "y no hay nada que"
	line "puedas hacer para"
	cont "evitarlo!"
	done

Archer2BeatenText:
	text "¡Qué frustrante es"
	line "esto…!"
	done

Archer2AfterText:
	text "… Como quieras."

	para "El Team Rocket se"
	line "retirará por aho-"
	cont "ra."

	para "De todos modos,"
	line "nuestro otro plan"

	para "va viento en"
	line "popa…"
	done

Route48NurseText1:
	text "¡He visto tu com-"
	line "bate desde la ven-"
	cont "tana!"

	para "¡Ahuyentaste al"
	line "Team Rocket y sal-"
	cont "vaste al Pikachu!"

	para "¡Muchísimas"
	line "gracias!"

	para "Tus #mon se me-"
	line "recen descansar"
	cont "tras todo esto."
	done

Route48NurseText2:
	text "Me gusta relajarme"
	line "aquí junto al bos-"

	para "que y ver jugar a"
	line "los #mon."

	para "¡Curaré a tus"
	line "#mon siempre"
	cont "que lo necesites!"

	para "¡Gracias de nuevo!"
	done

Route48YellowForestSignText:
	text "Ruta 48"

	para "Al norte hacia el"
	line "Bosque Amarillo"
	done
