SilphCo3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  0, SILPH_CO_2F, 2

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_JUMPTEXT, SilphCo3FDeptSignText
	bg_event  9,  2, BGEVENT_JUMPTEXT, SilphCo3FDeptSignText
	bg_event  5,  0, BGEVENT_JUMPTEXT, SilphCo3FElevatorText
	bg_event  0,  3, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  6,  3, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  3, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event 12,  3, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event 13,  3, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event 10,  5, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FSilphEmployeeScript, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FScientist1Text, -1
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FScientist2Text, -1
	object_event 14,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_SILPH, MART_SILPH_CO, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FOfficerText, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FGentlemanText, -1

SilphCo3FSilphEmployeeScript:
	checkevent EVENT_GOT_CHERISH_BALL_FROM_SAFFRON
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem CHERISH_BALL
	iffalse_endtext
	setevent EVENT_GOT_CHERISH_BALL_FROM_SAFFRON
	jumpthisopenedtext

.Text2:
	text "Es un tipo de"
	line "# Ball muy"
	cont "raro."

	para "¡No la malgastes!"
	done

.Text1:
	text "Vengo de una"
	line "familia de"
	cont "artesanos de"
	cont "# Balls."

	para "Mi padre, César,"
	line "enseña a mi hija a"
	cont "crear Balls con"
	cont "Bonguri mientras"
	cont "yo trabajo aquí."

	para "¿Les ayudaste en"
	line "Pueblo Azalea?"
	cont "¡Fantástico!"

	para "Me alegra que a mi"
	line "hija Millie le"
	cont "vaya tan bien."

	para "¡Toma esto como"
	line "agradecimiento!"
	done

SilphCo3FScientist1Text:
	text "Silph acaba de"
	line "asociarse con"
	cont "Devon S.A."

	para "Nos hemos cedido"
	line "las licencias de"
	cont "varios productos."
	done

SilphCo3FScientist2Text:
	text "Las # Balls"
	line "funcionan como el"
	cont "Almacenamiento del"
	cont "Sistema del PC."

	para "Los #mon se"
	line "convierten en"
	cont "datos digitales y"
	cont "se recomponen en"
	cont "otro lugar."
	done

SilphCo3FOfficerText:
	text "No puedo dejarte"
	line "subir a los pisos"
	cont "superiores, aunque"
	cont "seas de fiar."

	para "Lo siento, pero"
	line "son las normas."
	done

SilphCo3FGentlemanText:
	text "Vengo de visita de"
	line "Corporación Devon."

	para "¡Colaboramos para"
	line "hacer avanzar aún"
	cont "más la tecnología"
	cont "de las # Balls!"
	done

SilphCo3FDeptSignText:
	text "Silph S.A. P2"
	line "Tecnol. # Ball"
	done

SilphCo3FElevatorText:
	text "Out Of Order"
	done
