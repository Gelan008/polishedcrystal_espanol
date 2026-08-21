GoldenrodPokecomCenterOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  8, GOLDENROD_POKECOM_CENTER_1F, 3
	warp_event  1,  8, GOLDENROD_POKECOM_CENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_JUMPTEXT, RangiComputerText
	bg_event  6,  2, BGEVENT_JUMPTEXT, LunaComputerText
	bg_event  9,  2, BGEVENT_JUMPTEXT, FredrikComputerText
	bg_event  9,  5, BGEVENT_JUMPTEXT, VulcanComputerText
	bg_event  6,  5, BGEVENT_JUMPTEXT, AizawaComputerText
	bg_event  4,  2, BGEVENT_READ, RangiKeyboardScript

	def_object_events
	object_event  4,  4, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_RANGI, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminRangiText, -1
	object_event  7,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminLunaText, -1
	object_event 10,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminFredrikText, -1
	object_event  7,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminAizawaText, -1
	object_event 10,  6, SPRITE_PI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AdminVulcanText, -1

	object_const_def
	const GOLDENRODPOKECOMCENTEROFFICE_RANGI

AdminRangiText:
	text "Rangi: ¡Espero que"
	line "estés disfrutando"
	cont "del juego!"

	para "Nos costó meter"
	line "todos los datos."

	para "¡Casi no queda"
	line "sitio libre para"
	cont "mi sprite!"
	done

AdminLunaText:
	text "Luna: Al hacer un"
	line "Intercambio"
	cont "Prodigioso con"
	cont "otra región,"

	para "¿no te dio una"
	line "gran emoción?"

	para "¡Yo creé todo el"
	line "sistema original"
	cont "aquí en Trigal!"
	done

AdminFredrikText:
	text "Fredrik: El PC de"
	line "Bill es abierto,"
	cont "así que pude"
	cont "reescribir y"
	cont "mejorar su base"
	cont "de datos."
	done

AdminAizawaText:
	text "Aizawa: Mapas,"
	line "diálogos, sprites,"
	cont "entrenadores…"

	para "¡Qué suerte tiene"
	line "Game Freak en"
	cont "Kanto al tener una"
	cont "empresa para esto!"
	done

AdminVulcanText:
	text "Vulcan: ¿Qué tal"
	line "el clima?"

	para "No es por hablar…"
	line "¡Fui yo quien lo"
	cont "implementó!"

	para "Creían que era"
	line "imposible, ¡y les"
	cont "demostré que no!"
	done

VulcanComputerText:
	text "A weather map"
	line "is displayed on"
	cont "the screen."

	para "It's showing"
	line "rain in Johto."
	done

RangiComputerText:
	text "“Optimizing…” is"
	line "blinking on the"
	cont "screen."

	para "It seems to be"
	line "taking a while."
	done

LunaComputerText:
	text "Network traffic"
	line "from Wonder Trades"

	para "is streaming by"
	line "on the screen."
	done

FredrikComputerText:
	text "A dozen windows"
	line "are open at once,"

	para "each related to"
	line "its own feature."
	done

AizawaComputerText:
	text "A program called"
	line "Polished Map is"
	cont "displaying a"

	para "half-drawn trop-"
	line "ical island."
	done

RangiKeyboardScript:
	turnobject GOLDENRODPOKECOMCENTEROFFICE_RANGI, UP
	showemote EMOTE_SHOCK, GOLDENRODPOKECOMCENTEROFFICE_RANGI, 10
	jumpthistext

	text "Rangi: Hey! If you"
	line "want to hack the"
	cont "game, use your"
	cont "own computer!"
	done
