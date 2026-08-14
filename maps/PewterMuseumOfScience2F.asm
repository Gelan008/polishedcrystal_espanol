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
	line "cayeron cerca del"

	para "Mt. Moon, junto a"
	line "Ciudad Plateada."

	para "Tenemos uno ex-"
	line "puesto."

	para "Parece emitir una"
	line "extraña energía…"
	done

Museum2FLassText:
	text "Los #mon revi-"
	line "vidos de fósiles"

	para "son todos en par-"
	line "te de tipo Roca."

	para "¿Fueron siempre"
	line "así, o se debe al"

	para "proceso de fosili-"
	line "zación?"
	done

Museum2FPokefanMImperialText:
	text "¡Este transborda-"
	line "dor espacial vola-"

	para "ba a 250 km de la"
	line "Tierra desafiando"
	cont "la gravedad!"

	para "¿Sabes qué más de-"
	line "safía la gravedad?"

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
	line "le gusta el museo"

	para "tanto como a mí me"
	line "habría gustado."

	para "Cosas de niños,"
	line "¿eh?"
	done

Museum2FPokefanMMetricText:
	text "¡Este transborda-"
	line "dor espacial vola-"

	para "ba a 250 kilóme-"
	line "tros de la Tierra,"
	cont "desafiando la"
	cont "gravedad!"

	para "¿Sabes qué más de-"
	line "safía la gravedad?"

	para "¡Mov. Sísmico,"
	line "por supuesto!"
	done

Text_Museum2FTutorSeismicToss:
	text "Puedo enseñar a"
	line "tu #mon a usar"

	para "Mov. Sísmico por"
	line "una Hoja Plata."
	done

Text_Museum2FTutorQuestion:
	text "¿Quieres que ense-"
	line "-ñe a tu #mon"
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

	para "Edición especial:"
	line "¡Campeón Máximo!"

	para "Dicen que Máximo"
	line "Peñas ayuda a"

	para "Devon S.A., la em-"
	line "presa que dirige"
	cont "su padre, el Sr."
	cont "Peñas,"

	para "buscando minera-"
	line "les raros e inclu-"
	cont "so fósiles."
	done

PokemonJournalCynthiaScript: ; TODO: move to Goldenrod Museum
	setflag ENGINE_READ_CYNTHIA_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Investigadora"
	cont "Cintia!"

	para "Dicen que Cintia"
	line "aprendió muchos"

	para "mitos y leyendas"
	line "de su abuela en"
	cont "Sinnoh."
	done
