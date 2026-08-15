SilphCo3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11,  0, SILPH_CO_2F, 2

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, SilphCoElevatorText
	bg_event  4,  3, BGEVENT_JUMPTEXT, SilphCo3FDeptSignText
	bg_event 10,  3, BGEVENT_JUMPTEXT, SilphCo3FDeptSignText
	bg_event  0,  5, BGEVENT_JUMPTEXT, SilphCo3FPhotoText
	bg_event  1,  5, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  5,  0, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event 10,  7, SPRITE_SILPH_EMPLOYEE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo3FSilphEmployeeScript, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FScientist1Text, -1
	object_event  9,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FScientist2Text, -1
	object_event 14,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_SILPH, MART_SILPH_CO, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FOfficerText, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilphCo3FGentlemanText, -1

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
	line "# Ball muy raro."

	para "¡No la malgastes!"
	done

.Text1:
	text "Vengo de una fa-"
	line "milia de creado-"
	cont "res de # Balls."

	para "Mi padre, César,"
	line "le enseña a mi hi-"
	cont "ja cómo fabricar"

	para "Balls con Bonguri"
	line "mientras yo traba-"
	cont "jo duro aquí."

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
	line "licencias de algu-"
	cont "nos productos."
	done

SilphCo3FScientist2Text:
	text "Las # Balls fun-"
	line "cionan con el mis-"
	cont "mo principio que"

	para "el Sistema de Al-"
	line "macenamiento del"
	cont "PC."

	para "Los #mon se con-"
	line "vierten en datos"
	cont "digitales y"

	para "se recomponen en"
	line "otra ubicación."
	done

SilphCo3FOfficerText:
	text "No puedo dejarte"
	line "subir a las plan-"
	cont "tas superiores,"

	para "aunque parezcas de"
	line "fiar."

	para "Lo siento, pero"
	line "son las normas."
	done

SilphCo3FGentlemanText:
	text "Vengo de visita de"
	line "Corporación Devon."

	para "¡Estamos colabo-"
	line "rando para hacer"

	para "avanzar la tecno-"
	line "logía de las"
	cont "# Balls aún más!"
	done

SilphCo3FDeptSignText:
	text "Silph S.A. P2"
	line "Tecnol. # Ball"
	done

SilphCo3FPhotoText:
	text "Es una foto del"
	line "presidente de"
	cont "Silph."

	para "Parece molesto"
	line "por algo."
	done
