SaffronPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SAFFRON_CITY, 4
	warp_event  6,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalSabrinaScript

	def_object_events
	pc_nurse_event  5, 1
	object_event 11,  5, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokeCenter1FFisherScript, -1
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronPokeCenter1FTeacherText, -1
	object_event  8,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SaffronPokeCenter1FYoungsterText, -1

PokemonJournalSabrinaScript:
	setflag ENGINE_READ_SABRINA_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Edición Especial:"
	line "¡Líder Sabrina!"

	para "Dicen que Sabrina"
	line "se comunica con"
	cont "sus #mon en"
	cont "combate sin decir"
	cont "una sola palabra."
	done

SaffronPokeCenter1FFisherScript:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Acabo de cruzar"
	line "el Túnel Roca."

	para "Había revuelo"
	line "cerca de la"
	cont "Central Energía."
	done

.Text2:
	text "Las cuevas suelen"
	line "derrumbarse con"
	cont "facilidad."

	para "En estos años"
	line "han desaparecido"
	cont "varias cuevas,"

	para "como la que había"
	line "a las afueras de"
	cont "Ciudad Celeste."

	para "Un buen Montañero"
	line "lo sabe bien."
	done

SaffronPokeCenter1FTeacherText:
	text "¿Cómo son los"
	line "Centros #mon"
	cont "de Johto?"

	para "… Ah, ya veo. No"
	line "son muy distintos"
	cont "de los de Kanto."

	para "¡Podré viajar a"
	line "Johto sin temor!"
	done

SaffronPokeCenter1FYoungsterText:
	text "La sede central de"
	line "Silph S.A. y la"
	cont "estación del tren"
	cont "son lo más famoso"
	cont "de Azafrán."
	done