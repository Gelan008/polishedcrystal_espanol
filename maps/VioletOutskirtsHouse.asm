VioletOutskirtsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VioletOutskirtsHouseCaretaker

	def_warp_events
	warp_event  3,  7, VIOLET_OUTSKIRTS, 2
	warp_event  4,  7, VIOLET_OUTSKIRTS, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, VioletOutskirtsGhostBattleScript
	bg_event  1,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseDustText
	bg_event  2,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseRadioText
	bg_event  6,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseDustText
	bg_event  7,  1, BGEVENT_JUMPTEXT, VioletOutskirtsHouseDustText

	def_object_events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, VioletOutskirtsHouseCaretakerScript, EVENT_VIOLET_CEMETERY_CARETAKER

	object_const_def
	const VIOLETOUTSKIRTSHOUSE_CARETAKER

VioletOutskirtsHouseCaretaker:
	checkevent EVENT_CAUGHT_HISUIAN_TYPHLOSION
	iftruefwd .endcallback
	disappear VIOLETOUTSKIRTSHOUSE_CARETAKER
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftruefwd .endcallback
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	showtext VioletOutskirtsHouseNotAloneText
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
.endcallback
	endcallback

VioletOutskirtsGhostBattleScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptext VioletOutskirtsHouseStillAPresenceText
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue_jumptext VioletOutskirtsHouseNotSafeHereText
	opentext
	writetext VioletOutskirtsHouseOldShrineText
	checkevent EVENT_CAUGHT_HISUIAN_TYPHLOSION
	iftruefwd .Done
	promptbutton
	writetext VioletOutskirtsHouseAhText
	waitbutton
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	loadwildmon TYPHLOSION, HISUIAN_FORM, 60
	startbattle
	special CheckBattleCaughtResult
	iftruefwd .CaughtHisuianTyphlosion
	reloadmapafterbattle
	opentext
	checkkeyitem SILPHSCOPE2
	iffalsefwd .NoSilphScope2
; Defeated (or ran from) Typhlosion
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext VioletOutskirtsHouseStillAPresenceText
	sjumpfwd .Done
; Didn't identify Typhlosion
.NoSilphScope2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext VioletOutskirtsHouseNotSafeHereText
.Done
	waitbutton
	endtext

.CaughtHisuianTyphlosion
	appear VIOLETOUTSKIRTSHOUSE_CARETAKER
	setevent EVENT_CAUGHT_HISUIAN_TYPHLOSION
	reloadmapafterbattle
	end

VioletOutskirtsHouseCaretakerScript:
	checkevent EVENT_TALKED_TO_VIOLET_CEMETERY_CARETAKER
	iftrue_jumptextfaceplayer VioletOutskirtsHouseCaretakerThankYouText
	setevent EVENT_TALKED_TO_VIOLET_CEMETERY_CARETAKER
	jumpthistextfaceplayer

	text "…… ……"

	para "Has encontrado a"
	line "mi amigo…"

	para "Guiaba a las almas"
	line "al más allá…"

	para "Y yo cuidaba de"
	line "sus tumbas…"

	para "…… ……"

	para "Hace tanto tiempo"
	line "de aquello…"

	para "Ya nadie visita"
	line "este lugar…"

	para "Las tumbas están"
	line "abandonadas…"

	para "Pero tú… aun así"
	line "has venido…"

	para "…… ……"

	para "Gracias…"

	para "Por favor, cuida"
	line "de mi… amigo…"
	done

VioletOutskirtsHouseOldShrineText:
	text "Es un altar muy"
	line "antiguo."
	done

VioletOutskirtsHouseAhText:
	text "…… …… ……"

	para "…… …… ……"

	para "¡Ah!"
	done

VioletOutskirtsHouseCaretakerThankYouText:
	text "…… ……"

	para "Gracias… cariño…"
	done

VioletOutskirtsHouseStillAPresenceText:
	text "El espíritu se ha"
	line "ido, pero aún se"
	cont "siente algo…"
	done

VioletOutskirtsHouseNotSafeHereText:
	text "Todavía se siente"
	line "una presencia muy"
	cont "fuerte."

	para "¡No es un lugar"
	line "seguro!"
	done

VioletOutskirtsHouseRadioText:
	text "Parece que no"
	line "funciona."
	done

VioletOutskirtsHouseDustText:
	text "Está cubierto de"
	line "una gruesa capa de"
	cont "polvo."
	done

VioletOutskirtsHouseNotAloneText:
	text "Sientes que te"
	line "están observando…"
	done
