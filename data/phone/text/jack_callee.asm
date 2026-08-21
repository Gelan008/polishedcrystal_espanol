JackAnswerPhoneText:
	text "Hola. Soy "
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Buenos días,"
	line "<PLAYER>!"
	done

JackAnswerPhoneDayText:
	text "Hola. Soy "
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¿Cómo te va,"
	line "<PLAYER>?"
	done

JackAnswerPhoneNiteText:
	text "Hola. Soy "
	line ""
	text_ram wStringBuffer3
	text "…"

	para "¡Buenas noches,"
	line "<PLAYER>!"
	done

JackGreetText:
	text "¡<PLAYER>,"
	line "buenos días!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo te va?"
	done

JackGreetDayText:
	text "¡<PLAYER>, hola!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Hace buen día?"
	done

JackGreetNiteText:
	text "¡<PLAYER>,"
	line "buenas noches!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Tienes un minuto?"
	done

JackGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " es"
	line "tan curioso que es"
	cont "un problema."
	cont "¡Igual que yo!"
	done
