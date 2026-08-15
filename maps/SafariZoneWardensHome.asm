SafariZoneWardensHome_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, FUCHSIA_CITY, 5
	warp_event  5,  7, FUCHSIA_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  5,  0, BGEVENT_JUMPTEXT, WardenPhotoText
	bg_event  7,  0, BGEVENT_JUMPTEXT, SafariZonePhotoText
	bg_event  8,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText
	bg_event  9,  1, BGEVENT_JUMPTEXT, WardensHouseCuriosText

	def_object_events
	object_event  2,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftruefwd .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	jumpthisopenedtext

	text "Mucha gente se"
	line "decepcionó por el"

	para "cierre de la Zona"
	line "Safari, pero mi"

	para "abuelo es muy ca-"
	line "bezota…"
	done

WardensGranddaughterText1:
	text "Mi abuelo es el"
	line "Guarda de la Zona"
	cont "Safari."

	para "Al menos lo era…"

	para "Decidió irse de"
	line "vacaciones y se"

	para "marchó al extran-"
	line "jero él solo."

	para "Dejó de dirigir la"
	line "Zona Safari así"
	cont "como si nada."
	done

WardenPhotoText:
	text "Es la foto de un"
	line "anciano sonriente"

	para "rodeado de"
	line "#mon."
	done

SafariZonePhotoText:
	text "Es la foto de una"
	line "enorme llanura de"

	para "hierba con #mon"
	line "raros retozando."
	done

WardensHouseCuriosText:
	text "Es una vitrina"
	line "llena de fósiles"

	para "y artículos anti-"
	line "guos de #mon."
	done