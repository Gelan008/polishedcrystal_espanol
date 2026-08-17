BillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CAPE, 1
	warp_event  3,  7, CERULEAN_CAPE, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, PokemonJournalBillScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalBillScript
	bg_event  5,  1, BGEVENT_JUMPTEXT, BillsHousePCText

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsHouseBillScript, EVENT_NEVER_MET_BILL

PokemonJournalBillScript:
	setflag ENGINE_READ_BILL_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Edición especial:"
	line "¡Pokémaníaco Bill!"

	para "Bill inventó el"
	line "Sistema de"
	cont "Almacenamiento"
	cont "#mon para"
	cont "guardar su gran"
	cont "colección."

	para "Por lo visto, el"
	line "primer #mon que"
	cont "atrapó fue un Abra"
	done

BillsHousePCText:
	text "Hay un modelo en"
	line "3D de un Porygon"
	cont "girando."
	done

BillsHouseBillScript:
	checkevent EVENT_BEAT_POKEMANIAC_BILL
	iftrue_jumptextfaceplayer .AfterText
	special SpecialBeastsCheck
	iffalse_jumptextfaceplayer .IntroText
	faceplayer
	opentext
	writetext .IntroText
	waitbutton
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer BILL_T, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEMANIAC_BILL
	jumpthistext

.AfterText:
	text "¡Fue un combate"
	line "increíble!"

	para "Cualquier"
	line "Pokémaníaco"
	cont "estaría encantado"
	cont "de ver lo que has"
	cont "atrapado."
	done

.IntroText:
	text "Bill: Eevee es un"
	line "#mon de lo más"
	cont "fascinante."

	para "Dicen que los tres"
	line "perros de Johto"
	cont "solían ser tres"
	cont "#mon que"
	cont "evolucionan de"
	cont "Eevee."

	para "Pero podría ser"
	line "solo un rumor."

	para "Aun así, me"
	line "encantaría verlos…"
	done

.SeenText:
	text "¿Atrapaste a los"
	line "tres perros"
	cont "legendarios?"

	para "¡Qué genial,"
	line "<PLAYER>!"

	para "¿Crees que alguna"
	line "vez estuvieron"
	cont "relacionados con"
	cont "Eevee?"

	para "¡Vaya, ahora tengo"
	line "que enseñarte a"
	cont "mi equipo!"

	para "¡Puedes comparar"
	line "las tres leyendas"
	cont "con las que has"
	cont "luchado con mis"
	cont "propios #mon!"
	done

.BeatenText:
	text "¡Yeehaw!"
	done
