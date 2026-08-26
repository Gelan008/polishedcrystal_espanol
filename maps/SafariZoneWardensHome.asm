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
	yesorno
	iffalse_jumpopenedtext WardensGranddaughterText2
	writetext WardensGranddaughterText3
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	jumpthisopenedtext

	text "Muchos se decep-"
	line "cionaron cuando"
	cont "cerró el Safari,"

	para "pero a mí no me"
	line "importa mucho."

	para "Solo echo de"
	line "menos a mi abuelo…"
	done

WardensGranddaughterText1:
	text "Mi abuelo es el"
	line "Guarda de la Zona"
	cont "Safari."

	para "Al menos lo era…"

	para "Si te cuento la"
	line "historia, ¿me pro-"
	cont "metes no ir con"
	cont "el chisme por ahí?"
	done

WardensGranddaughterText2:
	text "…Ya veo…"
	done

WardensGranddaughterText3:
	text "Hace tres años, se"
	line "descubrió que él"
	cont "había permitido al"
	cont "Team Rocket cazar"

	para "#mon en la Zona"
	line "Safari para"
	cont "venderlos en el"
	cont "Casino Rocket."

	para "Huyó al extranjero"
	line "para evitar ser"
	cont "arrestado."

	para "…No es justo."

	para "Dicen que el jefe"
	line "de Silph estaba"
	cont "en el ajo,"

	para "pero pagó obras"
	line "benéficas de con-"
	cont "servación #mon"
	cont "y sigue en su"
	cont "puesto."
	done
WardenPhotoText:
	text "Es la foto de un"
	line "anciano sonriente"
	cont "rodeado de"
	cont "#mon."
	done

SafariZonePhotoText:
	text "Es la foto de una"
	line "enorme llanura de"
	cont "hierba con #mon"
	cont "raros retozando."
	done

WardensHouseCuriosText:
	text "Es una vitrina con"
	line "fósiles y objetos"
	cont "antiguos de"
	cont "#mon."
	done