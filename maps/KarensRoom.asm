KarensRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KarensRoomLockDoorScene, SCENE_KARENSROOM_LOCK_DOOR
	scene_const SCENE_KARENSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KarensRoomDoorCallback

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KarenScript, -1

KarensRoomLockDoorScene:
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
	setscene SCENE_KARENSROOM_NOOP
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarensRoomDoorCallback:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KarenScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KAREN, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KAREN, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KAREN
	waitsfx
	end

.SeenText:
	text "Soy Karen, del"
	line "Alto Mando."

	para "¿Eres <PLAYER>?"
	line "Qué divertido."

	para "Me encantan los"
	line "#mon de tipo"
	cont "Siniestro."

	para "Me atrae mucho su"
	line "imagen salvaje y"
	cont "dura."

	para "Y son muy fuertes."

	para "¿Crees que puedes"
	line "con ellos? Intenta"
	cont "entretenerme."

	para "¡Vamos!"
	done

.BeatenText:
	text "Vaya, qué bien se"
	line "te da. Me gusta"
	cont "eso en un"
	cont "Entrenador."
	done

.AfterText:
	text "#mon fuertes."

	para "#mon débiles."

	para "Esa es la visión"
	line "egoísta que tiene"
	cont "la gente."

	para "Si un Entrenador"
	line "es bueno, debería"

	para "intentar ganar con"
	line "sus favoritos."

	para "Me gusta tu es-"
	line "tilo. Tú sabes lo"
	cont "que es importan-"
	cont "te."

	para "Adelante, el Cam-"
	line "peón te espera."
	done

.SeenRematchText:
	text "Has luchado para"
	line "llegar hasta mí."
	cont "Me impresionas."

	para "Has reunido a un"
	line "equipo encantador."

	para "Nuestro combate"
	line "debería ser bueno."

	para "¡Empecemos!"
	done

.AfterRematchText:
	text "No me desviaré"
	line "del camino que he"
	cont "elegido."

	para "Lance está de-"
	line "seando volver a"
	cont "verte."
	done
