Route32PokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ROUTE_32, 1
	warp_event  6,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalKurtScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  3,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  8,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route32Pokecenter1FCooltrainerFText, -1
	object_event  0,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route32PokeCenter1FPokefanMScript, -1

PokemonJournalKurtScript:
	setflag ENGINE_READ_KURT_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡El artesano"
	cont "César!"

	para "César no deja que"
	line "nadie se acerque"

	para "mientras fabrica"
	line "# Balls, salvo"

	para "su nieta"
	line "Millie."
	done

Route32Pokecenter1FFishingGuruScript:
	checkevent EVENT_GOT_OLD_ROD
	iftrue_jumptextfaceplayer .DoneText
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	promptbutton
	verbosegivekeyitem OLD_ROD
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.IntroText:
	text "Este es un gran"
	line "sitio para pescar."

	para "¿Has visto a gente"
	line "pescando? ¿Y a ti"
	cont "te gustaría?"

	para "¿Quieres una de"
	line "mis Cañas?"
	done

.YesText:
	text "¡Je! Me alegro de"
	line "oír eso."

	para "¡Ahora tú también"
	line "eres pescador!"
	done

.AfterText:
	text "¡La pesca es"
	line "genial!"

	para "Si hay agua, ya"
	line "sea el mar o un"

	para "riachuelo, prueba"
	line "tu Caña."
	done

.NoText:
	text "Vaya. Es una pena…"
	done

.DoneText:
	text "Hola, chaval."
	line "¿Pican o no pican?"
	done

Route32PokeCenter1FPokefanMScript:
	checkevent EVENT_GOT_LURE_BALL_FROM_FRENCHMAN
	iftrue_jumptextfaceplayer .Text5
	faceplayer
	opentext
	writetext .Text1
	yesorno
	iftruefwd .Yes
	writetext .Text2
	sjumpfwd .Continue
.Yes:
	writetext .Text3
.Continue
	promptbutton
	verbosegiveitem LURE_BALL
	iffalsefwd .NoRoom
	setevent EVENT_GOT_LURE_BALL_FROM_FRENCHMAN
	jumpthisopenedtext

	text "¡Esta Ball atrapa"
	line "fácilmente a los"

	para "#mon que pican"
	line "en una Caña!"

	para "César, de Pueblo"
	line "Azalea, la fabricó"
	cont "con un Bonguri."

	para "¡Vivan los"
	line "Bonguris!"
	done

.NoRoom
	endtext

.Text1:
	text "Bonjour! ¿Qué tal?"
	line "¿Conoces los Bon-"
	cont "guris?"
	done

.Text2:
	text "¿Non? ¡Lástima!"
	line "¡Te enseñaré lo"

	para "fantásticos que"
	line "son los Bonguris!"
	done

.Text3:
	text "¡Youpi! ¡Así se"
	line "hace! Estoy tan"

	para "contento que quie-"
	line "ro darte esto!"
	done

.Text5:
	text "César es el héroe"
	line "de todo coleccio-"
	cont "nista de Bonguris."

	para "¡Vivan los"
	line "Bonguris!"
	done

Route32Pokecenter1FCooltrainerFText:
	text "¿Qué objeto le"
	line "doy a mi #mon?"

	para "Quizá uno que au-"
	line "mente su Ataque…"
	done
