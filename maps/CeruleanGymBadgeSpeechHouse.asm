CeruleanGymBadgeSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 1
	warp_event  3,  7, CERULEAN_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanGymBadgeSpeechHouseGentlemanScript, -1

CeruleanGymBadgeSpeechHouseGentlemanScript:
	checkevent EVENT_INTRODUCED_TO_CERULEAN_MAN
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	setevent EVENT_INTRODUCED_TO_CERULEAN_MAN
	jumpthisopenedtext

.Text2:
	text "¿Coleccionas las"
	line "Medallas de Gim-"
	cont "nasio de Kanto?"
	cont "¡Buena suerte!"
	done

.Text1:
	text "Tuvimos una ola de"
	line "robos hace unos"

	para "años, así que aho-"
	line "ra todo el mundo"
	cont "es supercauto."

	para "¿Quién eres tú?"
	done
