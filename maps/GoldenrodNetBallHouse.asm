GoldenrodNetBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 19
	warp_event  3,  7, GOLDENROD_CITY, 19

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodNetBallHouseYoungsterScript, -1
	object_event  6,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodNetBallHouseBugCatcherText, -1

GoldenrodNetBallHouseYoungsterScript:
	checkevent EVENT_GOT_NET_BALL_FROM_GOLDENROD
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem NET_BALL
	iffalse_endtext
	setevent EVENT_GOT_NET_BALL_FROM_GOLDENROD
	jumpthisopenedtext

.Text2:
	text "A veces tienes mu-"
	line "cha suerte y atra-"
	cont "pas a un #mon"

	para "con los PS al"
	line "máximo. Me en-"
	cont "canta esa sen-"
	cont "sación."
	done

.Text1:
	text "Me abastecí de"
	line "Malla Balls para"
	cont "atrapar un Pineco,"

	para "¡pero lo conseguí"
	line "con la primera!"

	para "Ya no necesitaré"
	line "esto."
	done

GoldenrodNetBallHouseBugCatcherText:
	text "Hacen Concursos de"
	line "Captura de Bichos"

	para "en el Parque"
	line "Nacional, en la"
	cont "Ruta 35."

	para "A veces hasta"
	line "Antón compite."
	done
