ViridianSchoolHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  9, VIRIDIAN_CITY, 8
	warp_event  3,  9, VIRIDIAN_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, ViridianSchoolHouseBlackboardText
	bg_event  6,  1, BGEVENT_READ, PokemonJournalKiyoScript
	bg_event  7,  1, BGEVENT_READ, PokemonJournalKiyoScript

	def_object_events
	object_event  4,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseTeacherText, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, ViridianSchoolHouseNotesText, -1
	object_event  3,  4, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseLass1Text, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseYoungsterScript, -1
	object_event  2,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, ViridianSchoolHouseLass2Text, -1
	object_event  3,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianSchoolHouseGameBoyKidScript, -1

ViridianSchoolHouseTeacherText:
	text "Sé que es mucha"
	line "materia, ¡pero por"

	para "favor, prestad"
	line "atención!"
	done

ViridianSchoolHouseNotesText:
	text "La página está"
	line "con garabatos."

	para "Un laberinto, flo-"
	line "res, la letra S…"
	done

ViridianSchoolHouseLass1Text:
	text "¡Un momento! ¿No"
	line "eran especiales,"

	para "en plan, todos los"
	line "ataques de Fuego?"
	done

ViridianSchoolHouseYoungsterScript:
	checkevent EVENT_GOT_WEAK_POLICY_FROM_VIRIDIAN
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem WEAK_POLICY
	iffalse_endtext
	setevent EVENT_GOT_WEAK_POLICY_FROM_VIRIDIAN
	jumpthisopenedtext

.Text2:
	text "“Lo que no debili-"
	line "ta a un #mon lo"
	cont "hace más fuerte”."

	para "Ese es el efecto"
	line "del Seguro De-"
	cont "bilidad."
	done

.Text1:
	text "La profe me dio"
	line "copias de sobra"

	para "de esto. ¡Toma,"
	line "quédate una!"
	done

ViridianSchoolHouseGameBoyKidScript:
	showtextfaceplayer ViridianSchoolHouseGameBoyKidText
	turnobject LAST_TALKED, DOWN
	end

ViridianSchoolHouseGameBoyKidText:
	text "¡Estoy tomando no-"
	line "tas en el móvil!"

	para "¡No estoy jugando!"
	line "¡De verdad!"
	done

ViridianSchoolHouseLass2Text:
	text "¡Estoy sentada en"
	line "el sitio del pro-"
	cont "tagonista!"

	para "Entonces, ¿por qué"
	line "mi vida es tan"
	cont "aburrida?"
	done

ViridianSchoolHouseBlackboardText:
	text "Los movimientos"
	line "físicos usan el"
	cont "Ataque y la De-"
	cont "fensa."

	para "Los especiales"
	line "usan el At. Esp."
	cont "y la Def. Esp."

	para "Los de estado no"
	line "causan daño de"
	cont "forma directa."
	done

PokemonJournalKiyoScript:
	setflag ENGINE_READ_KIYO_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Rey Kárate Kiyo!"

	para "Dicen que Kiyo es-"
	line "tudió con Aníbal,"

	para "de Ciudad Orquí-"
	line "dea. Se rumorea"

	para "que sigue entre-"
	line "nando en algún lu-"
	cont "gar de Johto."
	done
