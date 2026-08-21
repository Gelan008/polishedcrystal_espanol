GoldenrodMuseum1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  7, GOLDENROD_CITY, 18
	warp_event  7,  7, GOLDENROD_CITY, 25
	warp_event 13,  7, GOLDENROD_MUSEUM_2F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, GoldenrodMuseum1FLodestoneSignpostScript
	bg_event  8,  1, BGEVENT_JUMPTEXT, GoldenrodMuseum1FRadioDishText
	bg_event  9,  1, BGEVENT_JUMPTEXT, GoldenrodMuseum1FRadioDishText
	bg_event 12,  1, BGEVENT_JUMPTEXT, GoldenrodMuseum1FHarborText
	bg_event 13,  1, BGEVENT_JUMPTEXT, GoldenrodMuseum1FHarborText
	bg_event  1,  4, BGEVENT_JUMPTEXT, GoldenrodMuseum1FDrillText
	bg_event  2,  4, BGEVENT_JUMPTEXT, GoldenrodMuseum1FDrillText

	def_object_events
	object_event  1,  2, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_MUSEUM_DRILL_DOWN, 0, 0, -1, PAL_NPC_DRILL, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event  2,  2, SPRITE_SLOWPOKETAIL, SPRITEMOVEDATA_MUSEUM_DRILL_UP, 0, 0, -1, PAL_NPC_DRILL, OBJECTTYPE_COMMAND, end, NULL, -1
	object_event  7,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMuseumReceptionistText, -1
	object_event 13,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMuseumOfficerText, -1
	object_event  1,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMuseum1FHikerText, -1
	object_event 12,  3, SPRITE_PEARL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PEARL, OBJECTTYPE_COMMAND, jumptext, GoldenrodMuseum1FBigPearlText, -1
	object_event 13,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum1FRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT


GoldenrodMuseum1FLodestoneSignpostScript:
	reanchormap
	trainerpic METEORITE
	waitbutton
	closepokepic
	jumpthistext

	text "Piedra imán de"
	line "la construcción"
	cont "del Magnetotúnel."
	done

GoldenrodMuseum1FRocketScoutScript:
	opentext
	writetext GoldenrodMuseum1FRocketScoutText1
	promptbutton
	faceplayer
	writetext GoldenrodMuseum1FRocketScoutText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodMuseumReceptionistText:
	text "Te damos la"
	line "bienvenida al"
	cont "Museo de Trigal."

	para "Por inauguración,"
	line "la entrada es"
	cont "gratuita."

	para "¡Pasa y disfruta"
	line "de la visita!"
	done

GoldenrodMuseumOfficerText:
	text "¡Te tengo bien"
	line "vigilado, chaval!"

	para "¡Jajaja! ¡Es una"
	line "broma!"

	para "Vigilo a todo el"
	line "mundo…"
	done


GoldenrodMuseum1FDrillText:
	text "Un gran taladro"
	line "empleado para"
	cont "perforar roca"
	cont "muy densa."
	done

GoldenrodMuseum1FHikerText:
	text "Dicen que usaron"
	line "taladros como este"
	cont "para excavar el"
	cont "Magnetotúnel."
	done

GoldenrodMuseum1FRadioDishText:
	text "Una antena para"
	line "emitir ondas de"
	cont "radio."
	done

GoldenrodMuseum1FHarborText:
	text "¡Un acuario lleno"
	line "de Magikarp!"
	done

GoldenrodMuseum1FBigPearlText:
	text "Una perla gigante"
	line "hallada en el"
	cont "Puerto de Trigal."
	done

GoldenrodMuseum1FRocketScoutText1:
	text "Mmm… Esto se"
	line "vendería a muy"
	cont "buen precio."

	para "¿Cómo lo saco de"
	line "aquí sin que nadie"
	cont "se dé cuenta…?"
	done

GoldenrodMuseum1FRocketScoutText2:
	text "¿No sabes que es"
	line "de mala educación"
	cont "mirar? ¡Lárgate!"
	done
