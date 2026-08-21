EcruteakDestinyKnotHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 17
	warp_event  4,  7, ECRUTEAK_CITY, 17

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  5,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakDestinyKnotHouseCooltrainerFScript, -1
	object_event  2,  3, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_HARI, -1

EcruteakDestinyKnotHouseCooltrainerFScript:
	checkevent EVENT_GOT_DESTINY_KNOT_FROM_ECRUTEAK
	iftrue_jumptextfaceplayer .Text4
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	special SpecialBeastsCheck
	iffalse_jumpopenedtext .Text2
	special SpecialBirdsCheck
	iffalse_jumpopenedtext .Text2
	special SpecialDuoCheck
	iffalse_jumpopenedtext .Text2
	writetext .Text3
	verbosegiveitem DESTINY_KNOT
	iffalse_endtext
	setevent EVENT_GOT_DESTINY_KNOT_FROM_ECRUTEAK
	jumpthisopenedtext

.Text4:
	text "El hilo rojo del"
	line "destino te une a"
	cont "los #mon"
	cont "legendarios…"

	para "¿Serás tú el gran"
	line "Elegido?"
	done

.Text1:
	text "Dos grandes aves"
	line "#mon de Johto,"
	cont "cada una guía a un"
	cont "trío legendario."

	para "Leyendas dentro de"
	line "leyendas…"
	done

.Text2:
	text "¿Y si alguien los"
	line "atrapase a todos?"

	para "¡Qué destino tan"
	line "improbable!"
	done

.Text3:
	text "¿Qué? ¿Los has"
	line "visto y hasta los"
	cont "has atrapado?!"

	para "¡A ver tu #dex!"
	line "¡Increíble!"

	para "Era tu destino."

	para "Toma, quédate con"
	line "este objeto."
	done
