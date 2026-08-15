Route38EcruteakGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route38EcruteakGateOfficerText, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide2Script, -1

ProfOaksAide2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_LINKING_CORD_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide2HiText
	waitbutton
	setval16 30
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide2UhOhText

.HereYouGo
	writetext ProfOaksAide2HereYouGoText
	waitbutton
	verbosegiveitem LINKING_CORD
	iffalsefwd .NoRoom
	setevent EVENT_GOT_LINKING_CORD_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "Ese Cable Link"
	line "da a ciertos #-"

	para "mon una sensación"
	line "de conexión que"

	para "puede ayudarles a"
	line "evolucionar."

	para "¡Úsalo para com-"
	line "pletar la #dex!"
	done

.NoRoom
	jumpthisopenedtext

	text "¡Oh! Veo que no"
	line "tienes espacio"
	cont "para esto."
	done

Route38EcruteakGateOfficerText:
	text "¿De dónde dijiste"
	line "que eras?"

	para "¿De Pueblo"
	line "Primavera?"

	para "Allí vive el Prof."
	line "Elm, ¿verdad?"

	para "Has recorrido un"
	line "buen trecho para"
	cont "llegar hasta aquí."
	done

ProfOaksAide2HiText:
	text "¡Hola! Soy el ayu-"
	line "dante del Prof."
	cont "Oak."

	para "Si has atrapado 30"
	line "clases de #mon,"

	para "debo entregarte un"
	line "objeto."

	para "Así que, <PLAYER>,"
	line "¿has atrapado al"

	para "menos 30 clases de"
	line "#mon?"
	done

ProfOaksAide2UhOhText:
	text "A ver…"
	line "¡Vaya! Solo has"

	para "atrapado "
	text_decimal wTempDexOwn, 2, 3
	line "clases de #mon."

	para "Vuelve a verme"
	line "cuando hayas atra-"
	cont "pado 30 clases."
	done

ProfOaksAide2HereYouGoText:
	text "A ver…"
	line "¡Genial! Has atra-"

	para "pado "
	text_decimal wTempDexOwn, 2, 3
	line "clases de #mon."

	para "¡Enhorabuena!"
	line "¡Aquí lo tienes!"
	done
