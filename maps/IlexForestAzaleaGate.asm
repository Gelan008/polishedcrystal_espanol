IlexForestAzaleaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestAzaleaGateOfficerText, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, IlexForestAzaleaGateGrannyText, -1
	object_event  8,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide1Script, -1

ProfOaksAide1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXP_SHARE_FROM_PROF_OAKS_AIDE
	iftruefwd .Explain
	writetext ProfOaksAide1HiText
	waitbutton
	setval16 15
	special CountCaught
	iftruefwd .HereYouGo
.UhOh
	jumpopenedtext ProfOaksAide1UhOhText

.HereYouGo
	writetext ProfOaksAide1HereYouGoText
	waitbutton
	verbosegiveitem EXP_SHARE
	iffalsefwd .NoRoom
	setevent EVENT_GOT_EXP_SHARE_FROM_PROF_OAKS_AIDE
.Explain
	jumpthisopenedtext

	text "El Repartir Exp."
	line "da experiencia a"
	cont "un #mon sin que"
	cont "tenga que luchar."

	para "¡Úsalo para llenar"
	line "tu #dex!"
	done

.NoRoom
	jumpthisopenedtext

	text "¡Oh! Veo que no"
	line "tienes sitio para"
	cont "esto."
	done

IlexForestAzaleaGateOfficerText:
	text "El Encinar es muy"
	line "grande. ¡Cuidado"
	cont "con perderte!"
	done

IlexForestAzaleaGateGrannyText:
	text "El Encinar es"
	line "vigilado por su"
	cont "protector."

	para "¡No te metas en"
	line "líos!"
	done

ProfOaksAide1HiText:
	text "¡Hola! Ayudo al"
	line "Prof. Oak."

	para "Si atrapaste 15"
	line "especies #mon,"
	cont "te daré un regalo."

	para "Dime, <PLAYER>,"
	line "¿llevas ya 15"
	cont "especies #mon?"
	done

ProfOaksAide1UhOhText:
	text "A ver… ¡Vaya!"
	line "Solo has atrapado"
	cont ""
	text_decimal wTempDexOwn, 2, 3
	text " especies #mon."

	para "Vuelve cuando"
	line "tengas al menos 15"
	cont "especies."
	done

ProfOaksAide1HereYouGoText:
	text "A ver… ¡Genial!"
	line "Has atrapado "
	text_decimal wTempDexOwn, 2, 3
	text ""
	line "especies #mon."

	para "¡Enhorabuena!"
	line "¡Aquí tienes!"
	done
