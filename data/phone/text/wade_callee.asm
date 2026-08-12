WadeAnswerPhoneText:
	text "¿Hola? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah. ¡Hola,"
	line "<PLAYER>!"
	cont "¡Buenos días!"
	done

WadeAnswerPhoneDayText:
	text "¿Hola? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Ah, hola,"
	line "<PLAYER>!"
	done

WadeAnswerPhoneNiteText:
	text "¿Hola? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah. ¡Hola,"
	line "<PLAYER>!"
	cont "¡Buenas noches!"
	done

WadeGreetText:
	text "¡<PLAYER>, bue-"
	line "nos días!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿A que hace bue-"
	cont "no?"
	done

WadeGreetDayText:
	text "¡<PLAYER>, hola!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿A que hace bue-"
	cont "no?"
	done

WadeGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Estabas despier-"
	cont "to?"
	done

WadeGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mis #mon tie-"
	line "nen demasiada"

	para "energía. Y llega a"
	line "ser un problema."

	para "De todos ellos,"
	line ""
	text_ram wStringBuffer4
	text " es el más"
	cont "difícil de tratar."

	para "Trabajar con él"
	line "es agotador."
	done
