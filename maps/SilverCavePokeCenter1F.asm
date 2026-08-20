SilverCavePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  6,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLanceScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  9,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokeCenterGrampsScript, -1
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 1, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SilverCavePokeCenter1FGrannyText, -1

PokemonJournalLanceScript:
	setflag ENGINE_READ_LANCE_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición especial:"
	line "¡Lance, Campeón"
	cont "de la Liga!"

	para "Han visto a Lance"
	line "comprando capas en"
	cont "Ciudad Azulona."
	done

SilverCavePokeCenterGrampsScript:
	checkevent EVENT_GOT_EXPERT_BELT
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writetext .GreetingText
	waitbutton
	readvar VAR_PKMN_JOURNALS
	ifequalfwd 0, .ReadNone
	ifequalfwd NUM_POKEMON_JOURNALS, .ReadThemAll
	jumpthisopenedtext

	text "¡Vaya! ¿Te has"
	line "leído "
	text_decimal hScriptVar, 1, 2
	text " números?"

	para "No está nada mal,"
	line "¡pero yo he leído"
	cont "los {d:NUM_POKEMON_JOURNALS} que hay!"
	done

.ReadNone:
	jumpthisopenedtext

	text "¿No has leído"
	line "ninguno? Qué pena."

	para "La mayoría están"
	line "en estanterías de"
	cont "los Centros"
	cont "#mon,"

	para "pero los grandes"
	line "fans buscamos las"
	cont "ediciones raras."
	done

.ReadThemAll:
	writetext .ReadAllText
	promptbutton
	verbosegiveitem EXPERT_BELT
	iffalse_endtext
	setevent EVENT_GOT_EXPERT_BELT
	jumpthisopenedtext

.AfterText:
	text "Ese Cinturón no"
	line "es solo de adorno."

	para "Hará más fuertes a"
	line "tus #mon si lo"
	cont "llevan equipado."
	done

.GreetingText:
	text "De joven yo era un"
	line "gran entrenador."

	para "Ahora solo leo"
	line "sobre otros en la"
	cont "Revista #mon."

	para "¿Tú también lees"
	line "la revista?"
	done

.ReadAllText:
	text "¿Te has leído"
	line "todos los números?"
	cont "¡Eres un experto"
	cont "igual que yo!"

	para "¡Toma esto para"
	line "demostrar lo fan"
	cont "que eres!"
	done

SilverCavePokeCenter1FGrannyText:
	text "Los que buscan más"
	line "poder suben al"
	cont "Monte Plateado a"
	cont "pesar de todo…"

	para "Con sus #mon"
	line "más queridos,"
	cont "sienten que pueden"
	cont "ir donde sea…"
	done
