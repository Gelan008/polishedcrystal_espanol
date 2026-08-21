LyraPhoneGreetingText_Morn:
	text "¡Oh, <PLAYER>!"
	line "¡Buenos días!"
	prompt

LyraPhoneGreetingText_Day:
	text "¡Oh, <PLAYER>!"
	line "¿Cómo estás?"
	prompt

LyraPhoneGreetingText_Eve:
	text "¡Oh, <PLAYER>!"
	line "¡Buenas tardes!"
	prompt

LyraPhoneGreetingText_Nite:
	text "¡…<PLAYER>!"
	line "¡Buenas noches!"
	cont "Qué tarde es."
	prompt

LyraPhoneLandmarkText:
	text "¿Dónde estás?"
	line "¿"
	text_ram wStringBuffer4
	text "?"
	prompt

LyraPhoneKantoText:
	text "¡Así que ya"
	line "estás en Kanto!"
	prompt

LyraPhoneIslandsText:
	text "Estás explorando"
	line "una isla tropical."

	para "¡Qué envidia,"
	line "<PLAYER>!"
	prompt

LyraPhoneJohtoText_Generic:
	text "Cuéntamelo todo"
	line "luego, ¿vale?"
	prompt

LyraPhoneNextMoveQuestionText:
	text "Bueno, <PLAYER>…"

	para "¿Quieres saber"
	line "cuándo aprende un"
	cont "ataque tu #mon?"
	done

LyraPhoneNextMoveRefusedText:
	text "¡Jaja, entonces"
	line "no haré spoilers!"
	prompt

LyraPhoneNextMoveLevelText:
	text_ram wStringBuffer3
	line "aprenderá al"
	cont "nivel "
	text_decimal hScriptVar, 1, 3
	text ":"
	cont "¡"
	text_ram wStringBuffer1
	text "!"
	prompt

LyraPhoneNoNextMoveText:
	text_ram wStringBuffer3
	line "no aprenderá más"
	cont "ataques por nivel."
	prompt

LyraPhoneNoEggMovesText:
	text "¡Los Huevos no"
	line "aprenden ataques!"
	cont "…¿O sí?"
	prompt

LyraPhoneEndText:
	text "En fin… Ha sido"
	line "genial hablar"
	cont "contigo, <PLAYER>."

	para "¡Llámame de nuevo"
	line "algún día!"
	done

LyraPhoneSpecialText_YellowForest:
	text "¡Hola, <PLAYER>!"
	line "¿Cómo estás?"

	para "¿Has ido a ver el"
	line "Bosque Amarillo?"

	para "Yo iba a ir, pero"
	line "oí que el Team"
	cont "Rocket andaba por"
	cont "allí. ¡Qué miedo!"

	para "Tú ya te has"
	line "enfrentado a ellos"
	cont "¿verdad, <PLAYER>?"

	para "¡Qué valiente!"
	line "¡Mucho ánimo con"
	cont "tu viaje!"
	done

LyraPhoneSpecialText_FirstBadge:
	text "¡<PLAYER>! ¡Hola!"

	para "¡Conseguí mi"
	line "primera Medalla!"

	para "El Pidgeot de"
	line "Pegaso es fuerte,"
	cont "¡pero le vencí!"

	para "¡Tenía que"
	line "contártelo!"

	para "¿Ya tienes tu 1a"
	line "Medalla de Kanto?"
	cont "¡Qué pasada!"

	para "¡Nos vemos en"
	line "la Liga #mon!"
	done

LyraPhoneSpecialText_LyrasEgg:
	text "¡<PLAYER>! ¡Hola!"

	para "¿Qué tal te va"
	line "con los Líderes"
	cont "de Kanto?"

	para "¡Escucha, escucha!"
	line "Dejé a mi"
	cont ""
	text_ram wStringBuffer4
	text " en la"
	cont "Guardería y han"
	cont "hallado un Huevo!"

	para "Ya tengo un equipo"
	line "entero de #mon,"
	cont "así que te lo doy."

	para "¡Lo dejé con los"
	line "ancianos por si"
	cont "quieres criarlo!"

	para "¡Cuídalo muy bien,"
	line "<PLAYER>! ¡Chao!"
	done
