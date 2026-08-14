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
	object_event 12,  3, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PEARL, OBJECTTYPE_COMMAND, jumptext, GoldenrodMuseum1FBigPearlText, -1
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
	text "Bienvenido al"
	line "Museo de Ciudad"
	cont "Trigal."

	para "Para celebrar"
	line "nuestra inaugu-"
	cont "ración, la"
	cont "entrada es gratis."

	para "Por favor, sién-"
	line "tete libre de"
	cont "echar un vistazo,"

	para "y esperamos que"
	line "disfrutes de la"
	cont "visita."
	done

GoldenrodMuseumOfficerText:
	text "¡Te estoy vigilan-"
	line "do, chaval!"

	para "¡Jajaja! ¡Sólo es-"
	line "toy bromeando!"

	para "Vigilo a todo el"
	line "mundo…"
	done


GoldenrodMuseum1FDrillText:
	text "Es un gran tala-"
	line "dro usado para"

	para "atravesar roca"
	line "muy densa."
	done

GoldenrodMuseum1FHikerText:
	text "Escuché que tuvie-"
	line "ron que usar equi-"

	para "po como este ta-"
	line "ladro para exca-"

	para "var el túnel del"
	line "Magnetotrén."
	done

GoldenrodMuseum1FRadioDishText:
	text "Un plato metálico"
	line "usado para trans-"

	para "mitir ondas de"
	line "radio."
	done

GoldenrodMuseum1FHarborText:
	text "¡Un acuario lleno"
	line "de Magikarp!"
	done

GoldenrodMuseum1FBigPearlText:
	text "Es una perla enor-"
	line "me pescada en el"
	cont "Puerto de Trigal."
	done

GoldenrodMuseum1FRocketScoutText1:
	text "Mmm… Esto"
	line "alcanzaría un pre-"
	cont "cio bastante alto."

	para "Ahora… ¿cómo lo"
	line "saco de aquí"

	para "sin que me"
	line "pillen?"
	done

GoldenrodMuseum1FRocketScoutText2:
	text "¿No sabes que es"
	line "de mala educación"
	cont "mirar? ¡Lárgate!"
	done
