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
	text "¡...<PLAYER>!"
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
	text "Bueno, <PLAYER>..."

	para "¿Quieres que te"
	line "diga cuándo tu"

	para "#mon aprende-"
	line "rá otro ataque?"
	done

LyraPhoneNextMoveRefusedText:
	text "¡Jaja, entonces"
	line "no haré spoilers!"
	prompt

LyraPhoneNextMoveLevelText:
	text_ram wStringBuffer3
	line "aprenderá su"
	cont "ataque al niv. "
	text_decimal hScriptVar, 1, 3
	text ":"
	cont "¡"
	text_ram wStringBuffer1
	text "!"
	prompt

LyraPhoneNoNextMoveText:
	text_ram wStringBuffer3
	line "no aprenderá"

	para "más movimientos"
	line "subiendo de nivel."
	prompt

LyraPhoneNoEggMovesText:
	text "¡Los Huevos no a-"
	line "prenden ataques!"
	cont "... ¿A que no?"
	prompt

LyraPhoneEndText:
	text "En fin... Ha sido"
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
	line "he oído que el"

	para "Team Rocket an-"
	line "daba por allí."

	para "¡No me quiero"
	line "involucrar en eso!"

	para "Tú ya te has"
	line "enfrentado al Team"

	para "Rocket antes,"
	line "¿verdad, <PLAYER>?"

	para "¡Qué valiente"
	line "eres!"

	para "En fin, ¡suerte"
	line "con tu viaje!"
	done

LyraPhoneSpecialText_FirstBadge:
	text "¡<PLAYER>! ¡Hola!"

	para "¡Conseguí mi pri-"
	line "mera Medalla!"

	para "El Pidgeot de"
	line "Pegaso es fuerte,"
	cont "¡pero le vencí!"

	para "Tenía que decír-"
	line "telo, <PLAYER>."

	para "¿Oh, ganaste tu"
	line "primera Medalla"
	cont "en Kanto? ¡Genial!"

	para "Sigamos ganando"
	line "más Medallas."

	para "¡Nos vemos en"
	line "la Liga!"
	done

LyraPhoneSpecialText_LyrasEgg:
	text "¡<PLAYER>! ¡Hola!"

	para "¿Qué tal te va"
	line "contra los Líde-"
	cont "res de Kanto?"

	para "¡Seguro que bien!"

	para "¡Escucha, escucha!"

	para "Dejé a mi "
	text_ram wStringBuffer4
	line "en la Guardería"

	para "con los Abuelos,"
	line "¡y han encontra-"
	cont "do un Huevo!"

	para "¿No es genial?"

	para "Ya estoy criando"
	line "a un equipo ente-"
	cont "ro de #mon,"

	para "así que, um, si"
	line "te gustaría te-"
	cont "nerlo..."

	para "Eso es... En fin,"
	line "¡dejé el Huevo"

	para "en la Guardería"
	line "por si lo quieres!"

	para "Sé que lo cuida-"
	line "rás muy bien,"
	cont "<PLAYER>."

	para "¡Chao!"
	done
