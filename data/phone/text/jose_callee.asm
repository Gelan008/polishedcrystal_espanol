JoseAnswerPhoneText:
	text "Hola, aquí"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Ah, ¿<PLAYER>?"
	line "¡Buenos días!"
	done

JoseAnswerPhoneDayText:
	text "Hola, aquí"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Ah, <PLAYER>!"
	line "¡Hola! ¿Qué tal?"
	done

JoseAnswerPhoneNiteText:
	text "Hola, aquí"
	line ""
	text_ram wStringBuffer3
	text "…"

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
	text "¿Tus #mon dan"
	line "mucha caña?"

	para "¡Mi "
	text_ram wStringBuffer4
	text ""
	line "está que no para!"

	para "Cuando despega,"
	line "tarda un buen rato"
	cont "en volver."
	done
