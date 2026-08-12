JoseAnswerPhoneText:
	text "Hola, aquí"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "Ah, ¿<PLAYER>?"
	line "¡Buenos días!"
	done

JoseAnswerPhoneDayText:
	text "Hola, aquí"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "Ah, ¿<PLAYER>? ¡Hola!"
	done

JoseAnswerPhoneNiteText:
	text "Hola, aquí"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "Ah, ¿<PLAYER>?"
	line "¡Buenas noches!"
	done

JoseGreetText:
	text "Ah, ¿<PLAYER>?"

	para "¡Pío! Sí, soy"
	line "yo, "
	text_ram wStringBuffer3
	text "."
	done

JoseGreetDayText:
	text "Ah, ¿<PLAYER>?"

	para "¡Pío! Sí, soy"
	line "yo, "
	text_ram wStringBuffer3
	text "."
	done

JoseGreetNiteText:
	text "Ah, ¿<PLAYER>?"

	para "¡Pío! Sí, soy"
	line "yo, "
	text_ram wStringBuffer3
	text "."
	done

JoseGenericText:
	text "¿Tus #mon si-"
	line "guen dando caña?"

	para "Mi "
	text_ram wStringBuffer4
	text " tiene"
	line "demasiada energía."

	para "Cuando despega,"
	line "tarda un rato en"
	cont "volver."
	done
