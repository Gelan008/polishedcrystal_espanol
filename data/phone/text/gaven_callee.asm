GavenAnswerPhoneText:
	text "Hola, al aparato"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Hola, <PLAYER>!"
	line "¡Buenos días!"
	done

GavenAnswerPhoneDayText:
	text "Hola, al aparato"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Hola, <PLAYER>!"
	done

GavenAnswerPhoneNiteText:
	text "Hola, al aparato"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Hola, <PLAYER>!"
	line "¡Buenas noches!"
	done

GavenGreetText:
	text "¡<PLAYER>,"
	line "buenos días!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo te va?"
	done

GavenGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo te va?"
	done

GavenGreetNiteText:
	text "¡<PLAYER>,"
	line "buenas noches!"

	para "Soy yo, "
	text_ram wStringBuffer3
	text "."
	line "¿Cómo te va?"
	done

GavenGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mi "
	text_ram wStringBuffer4
	text ""
	line "está tan genial"
	cont "como siempre."

	para "¡Sigamos así para"
	line "ser los Campeones"
	cont "de los #mon!"
	done
