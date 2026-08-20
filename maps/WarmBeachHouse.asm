WarmBeachHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, WARM_BEACH, 3
	warp_event  3,  7, WARM_BEACH, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachHouseGrampsText, -1
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, WarmBeachHouseGrannyText, -1
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WarmBeachHouseBookScript, -1

WarmBeachHouseGrampsText:
	text "TODO"
	done

WarmBeachHouseGrannyText:
	text "TODO"
	done

WarmBeachHouseBookScript:
	opentext
	writetext .Text0
	yesorno
	iffalse_endtext
	writetext .Text1
	yesorno
	iffalse_endtext
	writetext .Text2
	yesorno
	iffalse_endtext
	jumpthisopenedtext

	text "De las tres islas,"
	line "las tres esferas"
	cont "has de tomar."

	para "Pues entre la vida"
	line "y la muerte, todo"
	cont "lo cambiarás."

	para "Sube al santuario"
	line "para enmendar el"
	cont "error,"

	para "y el mundo sanará"
	line "con el canto del"
	cont "guardián…"
	done

.Text0:
	text "La Profecía de"
	line "Shamouti"

	para "¿Quieres leerla?"
	done

.Text1:
	text "No perturbes la"
	line "armonía del fuego,"
	cont "hielo o rayo,"

	para "no sea que estos"
	line "titanes causen la"
	cont "destrucción del"
	cont "mundo en pugna."

	para "Aunque el gran"
	line "guardián del agua"
	cont "se alce a calmar"
	cont "la lucha,"

	para "su canto a solas"
	line "fallará, y la"
	cont "tierra en cenizas"
	cont "se tornará."

	para "¿Seguir leyendo?"
	done

.Text2:
	text "¡Oh, Elegido! En"
	line "tus manos reúne"
	cont "a los tres."

	para "Sus tres tesoros"
	line "amansarán a la"
	cont "bestia del mar."

	para "¿Seguir leyendo?"
	done
