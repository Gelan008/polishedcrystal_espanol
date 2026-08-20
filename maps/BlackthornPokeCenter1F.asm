BlackthornPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, BLACKTHORN_CITY, 5
	warp_event  6,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalClairScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ProfOaksAide4Script, -1
	object_event 11,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FGentlemanText, -1
	object_event  1,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornPokeCenter1FTwinText, -1

PokemonJournalClairScript:
	setflag ENGINE_READ_CLAIR_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Líder Débora!"

	para "El traje y la capa"
	line "azul brillante de"
	cont "Débora la han"
	cont "convertido en la"
	cont "última moda."
	done

ProfOaksAide4Script:
	checkevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	iftrue_jumptextfaceplayer .ExplainText
	faceplayer
	opentext
	writetext .HiText
	waitbutton
	setval16 60
	special CountCaught
	iftruefwd .HereYouGo
	jumpthisopenedtext

	text "Veamos…"
	line "¡Vaya! Solo has"

	para "atrapado "
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "Vuelve a verme"
	line "cuando atrapes a"
	cont "60 tipos."
	done

.HereYouGo
	writetext .HereYouGoText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse_jumpopenedtext .NoRoomText
	setevent EVENT_GOT_LUCKY_EGG_FROM_PROF_OAKS_AIDE
	jumpthisopenedtext

.ExplainText:
	text "Ese Huevo Suerte"
	line "ayuda a un #mon"
	cont "a ganar más"
	cont "experiencia de"
	cont "lo normal."

	para "¡Úsalo para"
	line "completar la"
	cont "#dex!"
	done

.HiText:
	text "¡Hola! Soy el"
	line "ayudante del"
	cont "Profesor Oak."

	para "Si atrapas 60"
	line "tipos de #mon,"
	cont "debo darte un"
	cont "objeto."

	para "Así que, <PLAYER>,"
	line "¿has atrapado al"
	cont "menos 60 tipos de"
	cont "#mon?"
	done

.HereYouGoText:
	text "Veamos…"
	line "¡Buen trabajo! Has"

	para "atrapado "
	text_decimal wTempDexOwn, 2, 3
	text " tipos"
	line "de #mon."

	para "¡Felicidades!"
	line "¡Toma!"
	done

.NoRoomText:
	text "¡Oh! Veo que no"
	line "tienes espacio"
	cont "para esto."
	done

BlackthornPokeCenter1FGentlemanText:
	text "En lo más profundo"
	line "de la lejana"
	cont "Meseta Añil está"
	cont "la Liga #mon."

	para "Dicen que los"
	line "mejores"
	cont "entrenadores del"
	cont "país se reúnen"
	cont "allí."
	done

BlackthornPokeCenter1FTwinText:
	text "Había un"
	line "movimiento que"
	cont "quería enseñarle"
	cont "a mi #mon."

	para "Así que fui al"
	line "Quitamovimientos"
	cont "para que olvidara"
	cont "un movimiento MO."
	done
