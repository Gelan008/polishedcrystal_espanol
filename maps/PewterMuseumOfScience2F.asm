PewterMuseumOfScience2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_1F, 5

	def_coord_events

	def_bg_events
	bg_event  3,  6, BGEVENT_READ, Museum2FMoonStoneSignpostScript
	bg_event 11,  2, BGEVENT_JUMPTEXT, Museum2FSpaceShuttleSignpostText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalStevenScript
	bg_event  1,  1, BGEVENT_READ, PokemonJournalStevenScript
	bg_event  4,  1, BGEVENT_READ, PokemonJournalCynthiaScript
	bg_event  5,  1, BGEVENT_READ, PokemonJournalCynthiaScript

	def_object_events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FScientistText, -1
	object_event  1,  7, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FChildText, -1
	object_event  2,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FTeacherText, -1
	object_event  2,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum2FLassText, -1
	object_event 12,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Museum2FPokefanMScript, -1

Museum2FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
	iftruefwd Museum2FTutorSeismicTossScript
	checkunits
	iftruefwd .metric
	writetext Museum2FPokefanMImperialText
	sjumpfwd .ok
.metric
	writetext Museum2FPokefanMMetricText
.ok
	waitbutton
	setevent EVENT_LISTENED_TO_SEISMIC_TOSS_INTRO
Museum2FTutorSeismicTossScript:
	writetext Text_Museum2FTutorSeismicToss
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_Museum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEISMIC_TOSS
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Como tú veas."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡No tienes ninguna"
	line "Hoja Plata!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Tu #mon ya"
	line "sabe cómo usar"
	cont "Mov. Sísmico!"
	done

Museum2FMoonStoneSignpostScript:
	reanchormap
	trainerpic METEORITE
	waitbutton
	closepokepic
	jumpthistext

	text "Meteorito caído"
	line "en el Mt. Moon."
	cont "(Piedra Lunar)"
	done

Museum2FScientistText:
	text "Unos meteoritos"
	line "cayeron junto al"
	cont "Mt. Moon."

	para "Tenemos uno aquí"
	line "en exposición."

	para "¡Parece emitir una"
	line "extraña energía!"
	done

Museum2FLassText:
	text "Los #mon que"
	line "vienen de fósiles"
	cont "son tipo Roca."

	para "¿Eran ya así, o es"
	line "por la propia"
	cont "fosilización?"
	done

Museum2FPokefanMImperialText:
	text "¡Esta nave volaba"
	line "a 250 km de la"
	cont "Tierra desafiando"
	cont "la gravedad!"

	para "¿Sabes qué más la"
	line "desafía?"

	para "¡Mov. Sísmico,"
	line "por supuesto!"
	done

Museum2FChildText:
	text "Cosas y piedras,"
	line "y piedras y cosas…"

	para "¿Nos podemos ir"
	line "ya?"
	done

Museum2FTeacherText:
	text "Uf… A mi hijo no"
	line "le gusta tanto el"
	cont "museo como a mí."

	para "¡Cosas de niños!"
	done

Museum2FPokefanMMetricText:
	text "¡Esta nave volaba"
	line "a 250 kilómetros"
	cont "desafiando la"
	cont "gravedad!"

	para "¿Sabes qué más la"
	line "desafía?"

	para "¡Mov. Sísmico,"
	line "por supuesto!"
	done

Text_Museum2FTutorSeismicToss:
	text "Puedo enseñar a"
	line "tu #mon a usar"
	cont "Mov. Sísmico por"
	cont "una Hoja Plata."
	done

Text_Museum2FTutorQuestion:
	text "¿Quieres que le"
	line "enseñe a alguíen"
	cont "Mov. Sísmico?"
	done

Museum2FSpaceShuttleSignpostText:
	text "Transbordador"
	line "Espacial"
	done

PokemonJournalStevenScript:
	setflag ENGINE_READ_STEVEN_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Campeón Máximo!"

	para "Dicen que Máximo"
	line "ayuda a su padre"
	cont "en Devon S.A.,"

	para "buscando fósiles"
	line "y minerales raros."
	done

PokemonJournalCynthiaScript: ; TODO: move to Goldenrod Museum
	setflag ENGINE_READ_CYNTHIA_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Investigadora"
	cont "Cintia!"

	para "Dicen que Cintia"
	line "aprendió mitos y"
	cont "leyendas de su"
	cont "abuela en Sinnoh."
	done
