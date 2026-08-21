AlanAnswerPhoneText:
	text "Sí, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Eres <PLAYER>?"
	line "¡Buenos días!"
	done

AlanAnswerPhoneDayText:
	text "Sí, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Eres <PLAYER>?"
	done

AlanAnswerPhoneNiteText:
	text "Sí, soy "
	text_ram wStringBuffer3
	text "!"

	para "¿Eres <PLAYER>?"
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
	line "que debes criar a"
	cont "todos tus #mon"
	cont "con mucho cariño."
	done
