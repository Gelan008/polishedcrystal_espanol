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
	line "les da los #mon"
	cont "una sensación de"
	cont "conexión que los"
	cont "hace evolucionar."

	para "¡Úsalo para llenar"
	line "toda la #dex!"
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
	text "¡Hola! Ayudo al"
	line "Profesor Oak."

	para "Si has atrapado 30"
	line "tipos de #mon,"
	cont "te daré un regalo."

	para "Dime, <PLAYER>,"
	line "¿has atrapado ya"
	cont "30 o más #mon?"
	done

ProfOaksAide2UhOhText:
	text "A ver… ¡Vaya!"
	line "Solo llevas "
	text_decimal wTempDexOwn, 2, 3
	cont "tipos de #mon."

	para "¡Vuelve a verme"
	line "cuando tengas 30!"
	done

ProfOaksAide2HereYouGoText:
	text "A ver… ¡Genial!"
	line "¡Ya tienes "
	text_decimal wTempDexOwn, 2, 3
	cont "tipos de #mon!"

	para "¡Enhorabuena!"
	line "¡Aquí lo tienes!"
	done
