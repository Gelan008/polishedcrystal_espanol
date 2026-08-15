SilphCo2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  0, SILPH_CO_1F, 3
	warp_event 11,  0, SILPH_CO_3F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText
	bg_event  2,  3, BGEVENT_JUMPTEXT, SilphCo2FDeptSignText
	bg_event  9,  3, BGEVENT_JUMPTEXT, SilphCo2FDeptSignText
	bg_event  1,  1, BGEVENT_JUMPTEXT, SilphCo2FPrinterText
	bg_event 14,  5, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event 15,  5, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  6,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FScientist1Text, -1
	object_event 12,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FScientist2Text, -1
	object_event  3,  6, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo2FEmployee1Script, -1
	object_event 12,  9, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo2FSilphEmployee2Text, -1

SilphCo2FEmployee1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_UPGRADE
	iftruefwd .GaveUpgrade
	writetext .Text1
	promptbutton
	verbosegiveitem UPGRADE
	iffalsefwd .NoRoomForUpgrade
	setevent EVENT_GOT_UPGRADE
.GaveUpgrade:
	writetext .Text2
	waitbutton
.NoRoomForUpgrade:
	endtext

.Text1:
	text "¿Has viajado aquí"
	line "desde Johto?"

	para "Ya que has venido"
	line "desde tan lejos,"

	para "quédate con este"
	line "bonito recuerdo."
	done

.Text2:
	text "Es el producto más"
	line "reciente de Silph."

	para "Aún no está a la"
	line "venta en ninguna"
	cont "parte."
	done

SilphCo2FSilphEmployee2Text:
	text "Antes usábamos te-"
	line "letransportadores"

	para "para movernos,"
	line "pero los desconec-"
	cont "taron."

	para "¡Menos mal que es-"
	line "toy en el primer"
	cont "piso!"
	done

SilphCo2FScientist1Text:
	text "Siempre estamos"
	line "creando nuevas MT."

	para "Algunas han sido"
	line "descatalogadas,"

	para "¡pero otras son"
	line "tan populares que"

	para "no han cambiado en"
	line "más de 30 años!"
	done

SilphCo2FScientist2Text:
	text "¡Estoy programan-"
	line "do! ¡No me descon-"
	cont "centres!"
	done

SilphCo2FDeptSignText:
	text "Silph S.A. P1"
	line "Desarrollo soft."
	done

SilphCo2FPrinterText:
	text "Es una impresora."
	done
