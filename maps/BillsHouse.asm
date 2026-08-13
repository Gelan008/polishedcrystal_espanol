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

	para "Reportaje especial:"
	line "¡Pokémaníaco Bill!"

	para "Bill inventó el"
	line "Sistema de Alma-"
	cont "cenamiento #mon"

	para "para guardar su"
	line "gran colección."

	para "Por lo visto, el"
	line "primero que atra-"

	para "pó fue un"
	line "Abra."
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

	para "de ver lo que"
	line "has atrapado."
	done

.IntroText:
	text "Bill: Eevee es un"
	line "#mon de lo más"
	cont "fascinante."

	para "Dicen que las tres"
	line "bestias legendari-"

	para "as de Johto solían"
	line "ser tres #mon"

	para "que evolucionan"
	line "de Eevee."

	para "Pero podría ser"
	line "solo un rumor."

	para "Aun así, me encan-"
	line "taría verlos..."
	done

.SeenText:
	text "¿Atrapaste a las"
	line "tres bestias le-"
	cont "gendarias?"

	para "¡Qué genial,"
	line "<PLAYER>!"

	para "¿Crees que alguna"
	line "vez estuvieron re-"
	cont "lacionadas con"
	cont "Eevee?"

	para "¡Vaya, ahora tengo"
	line "que enseñarte a"
	cont "mi equipo!"

	para "¡Puedes comparar"
	line "las tres leyendas"

	para "con las que has"
	line "luchado con mis"
	cont "propios #mon!"
	done

.BeatenText:
	text "¡Yeehaw!"
	done
