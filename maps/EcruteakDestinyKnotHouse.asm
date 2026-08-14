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
	line "destino te ata a"

	para "los #mon"
	line "legendarios…"

	para "¿Eres una especie"
	line "de Elegido?"
	done

.Text1:
	text "Dos poderosos pá-"
	line "jaros #mon"
	cont "de Johto,"

	para "cada uno guarda a"
	line "un trío de #mon"
	cont "legendarios."

	para "Leyendas dentro de"
	line "leyendas…"
	done

.Text2:
	text "¿Y si un entrena-"
	line "dor los atrapara"
	cont "a todos?"

	para "¡Qué destino tan"
	line "improbable!"
	done

.Text3:
	text "¿Qué? ¿Los has"
	line "visto? ¡¿Y hasta"
	cont "los has atrapado?!"

	para "Déjame ver tu"
	line "#dex… ¡Hala!"

	para "Debía ser tu"
	line "destino."

	para "Toma, deberías te-"
	line "ner esto."
	done
