Route26DayofWeekSiblingsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_26, 4
	warp_event  3,  7, ROUTE_26, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalsefwd .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	endtext

DayOfWeekSiblingsHousePokedexText1:
	text "Hay algo escrito"
	line "aquí."

	para "¿Quieres leerlo?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Para mis hermanos"
	line "y hermanas:"

	para "Es un orgullo"
	line "ayudar a los"
	cont "entrenadores"
	cont "#mon."

	para "Cuando hablen con"
	line "vosotros, dadles"
	cont "algo útil."

	para "Con cariño,"
	line "Lune"

	para "¿Seguir leyendo?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Lunes, Lune"
	line "Ruta 40"

	para "Martes, Marta"
	line "Ruta 29"

	para "Miércoles, Merlín"
	line "Lago de la Furia"

	para "Jueves, Juan"
	line "Ruta 36"

	para "Viernes, Vero"
	line "Ruta 32"

	para "Sábado, Sabino"
	line "Ciudad Olivo"

	para "Domingo, Dominga"
	line "Ruta 37"
	done
