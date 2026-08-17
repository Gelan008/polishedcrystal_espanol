CeladonUniversityWestwoodsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, CELADON_UNIVERSITY_2F, 5
	warp_event  4,  5, CELADON_UNIVERSITY_2F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeSignpost1Text
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeSignpost2Text
	bg_event  4,  1, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeBookshelfText
	bg_event  5,  1, BGEVENT_JUMPTEXT, CeladonUniversityWestwoodsOfficeBookshelfText

	def_object_events
	object_event  4,  3, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonUniversityWestwoodsOfficeChildScript, -1
	object_event  1,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, CeladonUniversityWestwoodsOfficeBookText, -1

CeladonUniversityWestwoodsOfficeChildScript:
	checkevent EVENT_GOT_RAGECANDYBAR_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem RAGECANDYBAR
	iffalse_endtext
	setevent EVENT_GOT_RAGECANDYBAR_IN_UNIVERSITY
	jumpthisopenedtext

.Text2:
	text "Mejor me compro un"
	line "ramen en la"
	cont "cafetería."
	done

.Text1:
	text "¡Me dijeron que"
	line "había pizza gratis"

	para "¿Dónde está?"

	para "¡Estoy FURIOSO!"

	para "…Quizás deba dejar"
	line "de comer"
if DEF(FAITHFUL)
	cont "Caramelos Furia."
else
	cont "Pasteles Furia."
endc

	para "Quédate con esto."
	done

CeladonUniversityWestwoodsOfficeBookText:
	text "Querido diario:"

	para "Mi recopilación de"
	line "datos de la"
	cont "#dex sigue"
	cont "teniendo muy buena"
	cont "acogida."

	para "¡Demuestra que no"
	line "hace falta salir"
	cont "del despacho para"
	cont "tener gran éxito!"

	para "¡Usar informes de"
	line "otros funciona"
	cont "igual de bien!"
	done

CeladonUniversityWestwoodsOfficeSignpost1Text:
	text "Es un retrato de"
	line "Westwood I."
	done

CeladonUniversityWestwoodsOfficeSignpost2Text:
	text "Es un retrato de"
	line "Westwood III."
	done

CeladonUniversityWestwoodsOfficeBookshelfText:
	text "Obras Completas"
	line "del Prof.Westwood."

	para "…Mejor me las"
	line "salto."
	done
