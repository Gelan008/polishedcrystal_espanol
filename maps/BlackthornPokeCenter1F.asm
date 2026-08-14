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

	text "Diario #mon"

	para "Edición especial:"
	line "¡Líder Débora!"

	para "El traje y la capa"
	line "azul brillante de"
	cont "Débora"

	para "la han convertido"
	line "en la última moda."
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

	para "a ganar más expe-"
	line "riencia de lo nor-"
	cont "mal."

	para "¡Úsalo para com-"
	line "pletar la #dex!"
	done

.HiText:
	text "¡Hola! Soy el ayu-"
	line "dante del Prof."
	cont "Oak."

	para "Si atrapas a 60"
	line "tipos de #mon,"

	para "debo darte un"
	line "objeto."

	para "Así que, <PLAYER>,"
	line "¿has atrapado al"

	para "menos 60 tipos de"
	line "#mon?"
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
	text "En lo más profun-"
	line "do de la lejana"
	cont "Meseta Añil"

	para "está la Liga"
	line "#mon."

	para "Escuché que los"
	line "mejores entrena-"

	para "dores se reúnen"
	line "ahí de todo el"
	cont "país."
	done

BlackthornPokeCenter1FTwinText:
	text "Había este movi-"
	line "miento que tenía"

	para "que enseñarle a mi"
	line "#mon."

	para "Así que fui al"
	line "Quita-movimientos"
	cont "para que olvide un"
	cont "movimiento MO."
	done
