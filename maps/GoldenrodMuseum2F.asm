GoldenrodMuseum2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, GOLDENROD_MUSEUM_1F, 3

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  2,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  4,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  5,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  7,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  8,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  1,  4, BGEVENT_READ, KabutoPuzzleScript
	bg_event  1,  5, BGEVENT_READ, KabutoPuzzleScript
	bg_event  5,  4, BGEVENT_READ, OmanytePuzzleScript
	bg_event  5,  5, BGEVENT_READ, OmanytePuzzleScript
	bg_event  1,  6, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  1,  7, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  5,  6, BGEVENT_READ, HoOhPuzzleScript
	bg_event  5,  7, BGEVENT_READ, HoOhPuzzleScript
	bg_event 10,  1, BGEVENT_JUMPTEXT, TowerRelicText
	bg_event 11,  1, BGEVENT_JUMPTEXT, TowerRelicText
	bg_event 11,  1, BGEVENT_JUMPTEXT, TowerRelicText

	def_object_events
	object_event  4,  2, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodMuseum2FSightseerMText, -1
	pokemon_event 5,  2, SMEARGLE, SPRITEMOVEDATA_POKEMON, (1 << EVE) | (1 << NITE), PAL_MON_BROWN, GoldenrodMuseum2FSmeargleText, -1
	object_event  3,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FScientistScript, -1
	object_event 11,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FTeacherScript, -1

LugiaPaintingScript:
	reanchormap
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text " El Despertar del"
	line "     Leviatán"
	done

HoOhPaintingScript:
	reanchormap
	paintingpic HO_OH_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "   El Ascenso"
	line "   del Fénix"
	done

BellTowerPaintingScript:
	reanchormap
	paintingpic BELL_TOWER_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "      Amistad"
	line "    y Esperanza"
	done

KabutoPuzzleScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic KABUTO_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel de"
	line "Kabuto completo!"
	done

OmanytePuzzleScript:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic OMANYTE_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel de"
	line "Omanyte completo!"
	done

AerodactylPuzzleScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic AERODACTYL_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel de"
	line "Aerodactyl al"
	cont "completo!"
	done

HoOhPuzzleScript:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse_jumptext EmptyPuzzleText
	showtext .Text
	paintingpic HO_OH_PUZZLE
	waitbutton
	closepokepic
	end

.Text:
	text "¡Es el panel de"
	line "Ho-Oh completo!"
	done

EmptyPuzzleText:
	text "Réplica de panel"
	line "de Ruinas Alfa"

	para "(restauración"
	line "en progreso)"
	done

TowerRelicText:
	text "Un antiguo mural"
	line "que representa a"
	cont "un misterioso"
	cont "#mon."
	done

GoldenrodMuseum2FSightseerMText:
	text "¡Estos cuadros son"
	line "hermosos!"

	para "Ojalá algún día mi"
	line "arte también esté"
	cont "en un museo."
	done

GoldenrodMuseum2FSmeargleText:
	text "Smeargle: ¡Smiir!"
	done

GoldenrodMuseum2FScientistScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iftrue_jumptextfaceplayer GoldenrodMuseum2FScientistSomeArtifactsText
	jumpthistextfaceplayer

	text "Esperaba ver más"
	line "exposiciones…"

	para "¿Dónde están las"
	line "tallas Alfa?"
	done

GoldenrodMuseum2FScientistSomeArtifactsText:
	text "¡Estos objetos son"
	line "fascinantes!"

	para "Lástima que solo"
	line "sean réplicas…"

	para "Me encantaría ver"
	line "los reales de"
	cont "cerca."
	done

GoldenrodMuseum2FTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BATON_PASS_INTRO
	iftruefwd GoldenrodMuseum2FTutorBatonPassScript
	writetext GoldenrodMuseum2FTutorIntroText
	waitbutton
	setevent EVENT_LISTENED_TO_BATON_PASS_INTRO
; fallthrough
GoldenrodMuseum2FTutorBatonPassScript:
	writetext GoldenrodMuseum2FTutorBatonPassText
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext GoldenrodMuseum2FTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval BATON_PASS
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Si tú lo dices."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡No tienes Hoja"
	line "Plata!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Ahora tu #mon"
	line "sabe usar"
	cont "Relevo!"
	done

GoldenrodMuseum2FTutorIntroText:
	text "Antes de crear la"
	line "nueva Torre Radio,"
	cont "había una torre de"
	cont "madera allí."

	para "Este mural estaba"
	line "en aquella torre."

	para "Moverlo aquí fue"
	line "clave para salvar"
	cont "la historia local."

	para "¡Hasta los #mon"
	line "entienden el valor"
	cont "de conservarlo!"
	done

GoldenrodMuseum2FTutorBatonPassText:
	text "Puedo enseñar a tu"
	line "#mon a usar"
	cont "Relevo por una"
	cont "Hoja Plata."
	done


GoldenrodMuseum2FTutorQuestion:
	text "¿Quieres que le"
	line "enseñe Relevo a"
	cont "tu #mon?"
	done
