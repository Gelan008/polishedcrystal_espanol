VioletPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, VIOLET_CITY, 5
	warp_event  6,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalFalknerScript

	def_object_events
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletPokeCenter1FElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGameboyKidText, -1
	object_event  2,  3	, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FGentlemanText, -1
	object_event  0,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FSageText, -1
	object_event 11,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletPokeCenter1FYoungsterText, -1

	object_const_def
	const VIOLETPOKECENTER1F_SCIENTIST

PokemonJournalFalknerScript:
	setflag ENGINE_READ_FALKNER_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Líder Pegaso!"

	para "Dicen que Pegaso"
	line "venera a su padre,"
	cont "quien lideraba el"
	cont "Gimnasio de Malva."
	done

VioletPokeCenter1FElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftruefwd .SecondTimeAsking
	writetext .IntroText
	sjumpfwd .AskTakeEgg
.SecondTimeAsking:
	writetext .QuestionText
.AskTakeEgg:
	yesorno
	iffalsefwd .RefusedEgg
	giveegg TOGEPI
	iffalse_jumpopenedtext .PartyAndBoxFull
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_LYRA_GROTTOES
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequalfwd UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkStraightMovement
	sjumpfwd .Finish
.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkAroundMovement
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_SCIENTIST, .WalkDownMovement
.Finish:
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_SCIENTIST
	waitsfx
	end

.PartyAndBoxFull:
	text "¡Oh, no! No puedes"
	line "llevar más #mon"
	cont "en tu equipo."

	para "Tampoco te queda"
	line "sitio en tu Caja."

	para "Esperaré a que"
	line "hagas sitio para"
	cont "el Huevo."
	done

.RefusedEgg:
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	jumpthisopenedtext

	text "P-pero… el Prof."
	line "Elm te lo pidió…"
	done

.IntroText:
	text "¡Cuánto tiempo,"
	line "<PLAYER>!"

	para "Ojeaba la Revista"
	line "#mon mientras"
	cont "te esperaba."

	para "¡Son un gran"
	line "pasatiempo!"

	para "En fin, el Prof."
	line "Elm quiere pedirte"
	cont "otro favor."

	para "¿Te quedarías el"
	line "Huevo #mon?"
	done

.QuestionText:
	text "<PLAYER>, ¿te vas a"
	line "quedar el Huevo?"
	done

.GoodbyeText:
	text "Descubrimos que un"
	line "#mon no nace"
	cont "hasta que no crece"
	cont "dentro del Huevo."

	para "También necesita"
	line "estar con otros"
	cont "#mon activos"
	cont "para eclosionar."

	para "¡<PLAYER>, eres la"
	line "única persona de"
	cont "confianza!"

	para "¡Llama al Prof."
	line "Elm cuando nazca"
	cont "el Huevo!"
	done

.WalkAroundMovement:
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

.WalkStraightMovement:
	step_down
	step_left
	step_left
	step_left
	step_left
.WalkDownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

VioletPokeCenter1FGameboyKidText:
	text "Un tal Bill creó"
	line "el Sistema de"
	cont "Almacenamiento"
	cont "#mon."
	done

VioletPokeCenter1FGentlemanText:
	text "Ocurrió hace unos"
	line "tres años."

	para "El Team Rocket"
	line "hacía el mal con"
	cont "los #mon."

	para "Pero triunfó la"
	line "justicia: un joven"
	cont "los disolvió."
	done

VioletPokeCenter1FSageText:
	text "Algunos Bellsprout"
	line "llevan encima"
	cont "Hojas Doradas."

	para "Y algunos Oddish"
	line "llevan encima"
	cont "Hojas Plateadas."

	para "Cierto tipo de"
	line "persona las valora"
	cont "mucho."
	done

VioletPokeCenter1FYoungsterText:
	text "Los #mon son"
	line "muy listos."

	para "No obedecerán a un"
	line "entrenador si no"
	cont "lo respetan."

	para "Sin las Medallas"
	line "adecuadas, harán"
	cont "lo que quieran."
	done
