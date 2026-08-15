Route12SuperRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_12_SOUTH, 1
	warp_event  3,  7, ROUTE_12_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route12SuperRodHouseFishingGuruScript, -1

Route12SuperRodHouseFishingGuruScript:
	checkevent EVENT_GOT_SUPER_ROD
	iftrue_jumptextfaceplayer .GaveSuperRodText
	faceplayer
	opentext
	writetext OfferSuperRodText
	yesorno
	iffalsefwd .Refused
	writetext GiveSuperRodText
	promptbutton
	verbosegivekeyitem SUPER_ROD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_SUPER_ROD
	jumpthisopenedtext

.GaveSuperRodText:
	text "Prueba a pescar"
	line "en cualquier lugar"
	cont "donde haya agua."

	para "Recuerda: puedes"
	line "pescar diferentes"

	para "#mon con dis-"
	line "tintas Cañas."
	done

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	endtext

OfferSuperRodText:
	text "Soy el hermano pe-"
	line "queño del Gurú"
	cont "Pescador."

	para "Se nota que te"
	line "gusta la pesca."

	para "¡No me cabe la"
	line "menor duda!"

	para "¿A que sí? ¡Sé que"
	line "tengo razón!"
	done

GiveSuperRodText:
	text "¡Sí, sí! ¡Tal como"
	line "me imaginaba!"

	para "¡Toma, fan de la"
	line "pesca! ¡Quédate"
	cont "con la Supercaña!"
	done

DontWantSuperRodText:
	text "¿Cómo? ¿Me han"
	line "engañado mis pro-"
	cont "pios ojos?"
	done