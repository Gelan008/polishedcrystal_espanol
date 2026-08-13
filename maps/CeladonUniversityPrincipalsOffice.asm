CeladonUniversityPrincipalsOffice_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_UNIVERSITY_1F, 5
	warp_event  3,  7, CELADON_UNIVERSITY_1F, 5

	def_coord_events

	def_bg_events
	bg_event  2,  0, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeSignpost1Text
	bg_event  3,  0, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeSignpost2Text
	bg_event  5,  4, BGEVENT_RIGHT, CeladonUniversityPrincipalsOfficeComputer
	bg_event  1,  1, BGEVENT_JUMPTEXT, CeladonUniversityPrincipalsOfficeBookshelfText

	def_object_events
	object_event  2,  2, SPRITE_MATSUMOTO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonUniversityPrincipalsOfficeMatsumotoScript, -1

CeladonUniversityPrincipalsOfficeMatsumotoScript:
	checkevent EVENT_GOT_RARE_CANDY_IN_UNIVERSITY
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_GOT_RARE_CANDY_IN_UNIVERSITY
	jumpthisopenedtext

.Text2:
	text "Trabajo duro para"
	line "que este lugar"
	cont "funcione bien,"

	para "así que me rela-"
	line "jo tomando ca-"
	cont "ramelos de vez"
	cont "en cuando."
	done

.Text1:
	text "¡Hola, joven"
	line "entrenador!"

	para "Soy el Profesor"
	line "Matsumoto."

	para "Soy el director"
	line "de la Univ."
	cont "de Azulona."

	para "¡Pero puedes lla-"
	line "marme tu amigo!"

	para "Toma algo de mi"
	line "reserva de ca-"
	cont "ramelos del escri-"
	cont "torio."
	done

CeladonUniversityPrincipalsOfficeSignpost1Text:
	text "Es el título del"
	line "Prof. Matsumoto"
	cont "en Educación."
	done

CeladonUniversityPrincipalsOfficeSignpost2Text:
	text "Es una foto del"
	line "Prof. Matsumoto"

	para "frente a una cla-"
	line "se graduándose."
	done

CeladonUniversityPrincipalsOfficeComputer:
	jumpthistext

	text "Hay un borrador"
	line "de e-mail pi-"

	para "diendo donacio-"
	line "nes a los alum-"
	cont "nos."
	done

CeladonUniversityPrincipalsOfficeBookshelfText:
	text "Es un conjunto co-"
	line "mpleto de los li-"
	cont "bros de la"

	para "Enciclopedia"
	line "#mónica."
	done
