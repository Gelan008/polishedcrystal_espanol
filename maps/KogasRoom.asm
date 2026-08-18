KogasRoom_MapScriptHeader:
	def_scene_scripts
	scene_script KogasRoomLockDoorScene, SCENE_KOGASROOM_LOCK_DOOR
	scene_const SCENE_KOGASROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, KogasRoomDoorCallback

	def_warp_events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, KogaScript, -1

KogasRoomLockDoorScene:
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
	setscene SCENE_KOGASROOM_NOOP
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogasRoomDoorCallback:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalsefwd .KeepDoorClosed
	changeblock 4, 14, $2a
.KeepDoorClosed:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalsefwd .OpenDoor
	changeblock 4, 2, $16
.OpenDoor:
	endcallback

KogaScript:
	readvar VAR_BADGES
	ifequalfwd 16, .Rematch
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterText
	showtextfaceplayer .SeenText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 1
	startbattle
	reloadmapafterbattle
	showtext .AfterText
	sjumpfwd .EndBattle

.Rematch:
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue_jumptextfaceplayer .AfterRematchText
	showtextfaceplayer .SeenRematchText
	winlosstext .BeatenText, 0
	loadtrainer KOGA, 2
	startbattle
	reloadmapafterbattle
	showtext .AfterRematchText
.EndBattle:
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	refreshmap
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	setevent EVENT_BEAT_ELITE_4_KOGA
	waitsfx
	end

.SeenText:
	text "¡Fwahahahaha!"

	para "Soy Koga, del"
	line "Alto Mando."

	para "¡Como buen ninja,"
	line "vivo en las"
	cont "sombras!"

	para "¡Mi estilo te va"
	line "a confundir y"
	cont "destruir!"

	para "Confusión, sueño,"
	line "veneno…"

	para "¡Caerás ante mis"
	line "técnicas ninja!"

	para "Los #mon no son"
	line "solo fuerza bruta"
	cont "¡Ya lo verás!"
	done

.BeatenText:
	text "¡Ah! ¡Has"
	line "demostrado tu"
	cont "valía!"
	done

.AfterText:
	text "Lo he intentado"
	line "todo contigo."

	para "He fallado. Debo"
	line "perfeccionar mis"
	cont "técnicas."

	para "¡Pasa a la otra"
	line "sala y pon a"
	cont "prueba tu poder!"
	done

.SeenRematchText:
	text "Tu llegada y tu"
	line "resolución son"
	cont "impresionantes."

	para "¡Fwahahahaha!"

	para "¡No superarás mis"
	line "habilidades!"

	para "¡Déjame que te lo"
	line "demuestre!"
	done

.AfterRematchText:
	text "Nunca he conocido"
	line "a nadie como tú."

	para "Debo dedicarme a"
	line "mi entrenamiento."
	done
