WillsRoom_MapScriptHeader:
	def_scene_scripts
	scene_script WillsRoomLockDoorScene, SCENE_WILLSROOM_LOCK_DOOR
	scene_const SCENE_WILLSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, WillsRoomDoorCallback

	def_warp_events
	warp_event  5, 17, INDIGO_PLATEAU_POKECENTER_1F, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WillScript, -1

WillsRoomLockDoorScene:
	sdefer .Script
	end

.Script:
	applymovement PLAYER, WalkIntoEliteFourRoomMovement
	reanchormap
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a
	refreshmap
	closetext
	setscene SCENE_WILLSROOM_NOOP
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

WillsRoomDoorCallback:
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_WILLS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

WillScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer WILL, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer WILL, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_WILLS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_WILL
	waitsfx
	end

.SeenText:
	text "¡Bienvenido a la"
	line "Liga #mon,"
	cont "<PLAYER>!"

	para "Permíteme que me"
	line "presente: ¡soy"
	cont "Mento!"

	para "He entrenado por"
	line "todo el mundo para"
	cont "fortalecer a mis"
	cont "#mon Psíquicos."

	para "Y, al fin, he sido"
	line "admitido en el"
	cont "Alto Mando."

	para "¡A partir de ahora"
	line "solo iré a mejor!"

	para "¡Perder no es una"
	line "opción!"
	done

.BeatenText:
	text "No… No puedo…"
	line "creérmelo…"
	done

.AfterText:
	text "Aunque haya sido"
	line "derrotado, no"
	cont "cambiaré de rumbo."

	para "¡Seguiré luchando"
	line "hasta estar por"
	cont "encima de todos"
	cont "los entrenadores!"

	para "Ahora, <PLAYER>,"
	line "avanza y conoce la"
	cont "fuerza real del"
	cont "Alto Mando."
	done

.SeenRematchText:
	text "Al fin has"
	line "aparecido."

	para "He observado bien"
	line "tu técnica de"
	cont "combate."

	para "¡Estoy listo para"
	line "ti!"

	para "Muy bien."

	para "¡Prepárate para"
	line "el combate!"
	done

.AfterRematchText:
	text "He agotado todas"
	line "mis fuerzas."

	para "No me arrepiento"
	line "de haber perdido"
	cont "así."
	done
