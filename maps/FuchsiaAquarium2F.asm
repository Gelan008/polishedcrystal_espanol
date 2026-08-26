FuchsiaAquarium2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FuchsiaAquariumCheckIfWeekend

	def_warp_events
	warp_event 10,  2, FUCHSIA_AQUARIUM_1F, 3

	def_coord_events

	def_bg_events
	bg_event  1,  5, BGEVENT_READ, FuchsiaAquarium1FRemoraidSign
	bg_event  2,  5, BGEVENT_READ, FuchsiaAquarium1FMantineSign
	bg_event  6,  5, BGEVENT_READ, FuchsiaAquarium1FSquirtleOrSeelSign
	bg_event 15,  5, BGEVENT_READ, FuchsiaAquarium1FShellderOrKrabbySign
	bg_event 16,  5, BGEVENT_READ, FuchsiaAquarium1FStaryuSign
	bg_event 12,  2, BGEVENT_JUMPTEXT, FuchsiaAquarium2FPosterText

	def_object_events
	object_event  1,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_ADMIN_MEOWTH, 0, REMORAID, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1
	object_event  2,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_TOP, 0, MANTINE, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1
	object_event  6,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_BOTTOM, 0, SQUIRTLE, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_ADMIN_MEOWTH, 0, SEEL, -1, PAL_NPC_AQUA_BLUE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	object_event 15,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_BOTTOM, 0, SHELLDER, -1, PAL_NPC_AQUA_PURPLE, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event 15,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_BOTTOM, 0, KRABBY, -1, PAL_NPC_AQUA_RED, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	object_event 16,  4, SPRITE_AQUARIUM_MON, SPRITEMOVEDATA_AQUARIUM_BOTTOM, 0, STARYU, -1, PAL_NPC_AQUA_BROWN, OBJECTTYPE_DONOTHING, NO_FORM, DoNothingScript, -1
	object_event 12,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaAquarium2FPokefanMScript, -1
	object_event 16, 7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, FuchsiaAquarium2FPokefanFText, -1
	object_event  2,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaAquarium2FLassScript, -1
	object_event  3,  7, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, FuchsiaAquarium2FBattleGirlScript, -1

FuchsiaAquarium1FRemoraidSign:
	showtext .RemoraidText
	reanchormap
	pokepic REMORAID
	cry REMORAID
	waitbutton
	closepokepic
	setmonval REMORAID
	special SpecialSeenMon
	end

.RemoraidText:
	text "Nombre: Remoraid"

	para "Usa su aleta dorsal"
	line "como ventosa para"
	cont "adherirse a un"

	para "Mantine y comer"
	line "sus sobras."
	done

FuchsiaAquarium1FMantineSign:
	showtext .MantineText
	reanchormap
	pokepic MANTINE
	cry MANTINE
	waitbutton
	closepokepic
	setmonval MANTINE
	special SpecialSeenMon
	end

.MantineText:
	text "Nombre: Mantine"

	para "Puede saltar fuera"
	line "del agua y planear"

	para "sobre las olas si"
	line "coge suficiente"
	cont "velocidad."
	done

FuchsiaAquarium1FSquirtleOrSeelSign:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .weekend
	showtext .SquirtleText
	reanchormap
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	setmonval SQUIRTLE
	special SpecialSeenMon
	end

.weekend:
	showtext .SeelText
	reanchormap
	pokepic SEEL
	cry SEEL
	waitbutton
	closepokepic
	setmonval SEEL
	special SpecialSeenMon
	end

.SquirtleText:
	text "Nombre: Squirtle"

	para "El dibujo de su"
	line "concha parece una"
	cont "moneda antigua,"

	para "por lo que se han"
	line "acuñado monedas de"
	cont "100¥ con su cara."
	done

.SeelText:
	text "Nombre: Seel"

	para "Este #mon no"
	line "bebe agua:"

	para "se hidrata con la"
	line "comida que caza."
	done

FuchsiaAquarium1FShellderOrKrabbySign:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftruefwd .weekend
	showtext .ShellderText
	reanchormap
	pokepic SHELLDER
	cry SHELLDER
	waitbutton
	closepokepic
	setmonval SHELLDER
	special SpecialSeenMon
	end

.weekend:
	showtext .KrabbyText
	reanchormap
	pokepic KRABBY
	cry KRABBY
	waitbutton
	closepokepic
	setmonval KRABBY
	special SpecialSeenMon
	end

.ShellderText:
	text "Nombre: Shellder"

	para "Cambia de forma al"
	line "morder a Slowpoke"
	cont "para coevolucionar."
	done

.KrabbyText:
	text "Nombre: Krabby"

	para "Los pescadores"
	line "solían liberar"

	para "a los Krabby con"
	line "la concha en forma"
	cont "de samurái furioso"

	para "Por ello hay más"
	line "Krabby con conchas"
	cont "que parecen caras."
	done

FuchsiaAquarium1FStaryuSign:
	showtext .StaryuText
	reanchormap
	pokepic STARYU
	cry STARYU
	waitbutton
	closepokepic
	setmonval STARYU
	special SpecialSeenMon
	end

.StaryuText:
	text "Nombre: Staryu"

	para "En series de héroes"
	line "usan poderes que"
	cont "emulan su gema."
	done

FuchsiaAquarium2FPosterText:
	text "Rotamos #mon"
	line "los fines de semana"
	cont "para variar."
	done

FuchsiaAquarium2FPokefanMScript:
	checkevent EVENT_GOT_EJECT_BUTTON_FROM_FUCHSIA_AQUARIUM
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	verbosegiveitem EJECT_BUTTON
	iffalse_endtext
	setevent EVENT_GOT_EJECT_BUTTON_FROM_FUCHSIA_AQUARIUM
	jumpthisopenedtext

.Text2:
	text "Una vez le di con"
	line "una roca a un"
	cont "Chansey y huyó"

	para "como si llevara un"
	line "Botón Escape."

	para "¡Qué viejos"
	line "tiempos…!"
	done

.Text1:
	text "Ver #mon tras"
	line "el cristal sin"
	cont "lanzarles nada…"

	para "Extraño tirar cebo"
	line "y piedras en el"
	cont "Juego Safari…"

	para "Hasta que decían"
	line "tiempo y me echaban"
	cont "por megafonía."

	para "Toma esto."
	done

FuchsiaAquarium2FPokefanFText:
	text "Que se fuera el"
	line "Guarda fue una"
	cont "bendición oculta."

	para "¡Ahora tenemos"
	line "este gran acuario!"
	done

FuchsiaAquarium2FLassScript:
	turnobject LAST_TALKED, RIGHT
	showtext .Text1
	faceplayer
	showtext .Text2
	turnobject LAST_TALKED, UP
	end

.Text1:
	text "Remoraid se une a"
	line "Mantine y comparte"
	cont "su alimento…"

	para "¿No es romántico?"
	done

.Text2:
	text "¡Me aprendí datos"
	line "de la #dex para"
	cont "impresionar a mi"
	cont "cita!"
	done

FuchsiaAquarium2FBattleGirlScript:
	faceplayer
	showtext .Text
	turnobject LAST_TALKED, UP
	end

.Text:
	text "Lleva una hora"
	line "hablando sin parar"
	cont "de #mon de tipo"
	cont "agua…"

	para "¿Sería mejor"
	line "regalarle pescado"
	cont "en vez de bombones"
	cont "por San Valentín?"
	done
