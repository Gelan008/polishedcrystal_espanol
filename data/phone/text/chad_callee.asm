ChadAnswerPhoneText:
	text "Hola, habla"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Hola, <PLAYER>!"
	line "¡Buenos días!"
	done

ChadAnswerPhoneDayText:
	text "Hola, habla"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Hola, <PLAYER>!"
	line "¡Buenas!"
	done

ChadAnswerPhoneNiteText:
	text "Hola, habla"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Hola, <PLAYER>!"
	line "¡Buenas noches!"
	done

ChadGreetText:
	text "¡Hola, <PLAYER>!"
	line "¡Buenos días!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo estás?"
	done

ChadGreetDayText:
	text "¡Hola, <PLAYER>!"
	line "¡Buenas!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo estás?"
	done

ChadGreetNiteText:
	text "¡Hola, <PLAYER>!"
	line "¡Buenas noches!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo estás?"
	done

ChadGenericText:
	text "¿Cómo están"
	line "tus #mon?"

	para "Conoces al"
	line "Prof.Oak, así que"
	cont "¡deben estar bien!"

	para "Mis #mon también"
	line "están bien."

	para "Pero claro, estoy"
	line "intentando ser un"

	para "profesor #mon,"
	line "así que eso no"
	cont "debería"
	cont "sorprenderte."
	done
