AlanAnswerPhoneText:
	text "Sí, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Eres tú, <PLAYER>?"
	line "¡Buenos días!"
	done

AlanAnswerPhoneDayText:
	text "Sí, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Eres tú, <PLAYER>?"
	done

AlanAnswerPhoneNiteText:
	text "Sí, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Eres tú, <PLAYER>?"
	line "¡Buenas noches!"
	done

AlanGreetText:
	text "¡Hola! Soy yo,"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AlanGreetDayText:
	text "¡Hola! Soy yo,"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AlanGreetNiteText:
	text "¡Hola! Soy yo,"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AlanGenericText:
	text "<PLAYER>, ¿estás"
	line "criando bien a"
	cont "tus #mon?"

	para "Leí en un libro"
	line "que deberías"

	para "criar tus #mon"
	line "atrapados con"
	cont "amor y cuidado."
	done
