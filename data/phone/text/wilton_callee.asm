WiltonAnswerPhoneText:
	text "Hola, estás"
	line "hablando con "
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>."
	done

WiltonAnswerPhoneDayText:
	text "Hola, estás"
	line "hablando con "
	text_ram wStringBuffer3
	text "…"

	para "Ah, eres <PLAYER>,"
	line "¿verdad?"
	done

WiltonAnswerPhoneNiteText:
	text "Hola, estás"
	line "hablando con "
	text_ram wStringBuffer3
	text "…"

	para "Ah, si es"
	line "<PLAYER>."
	done

WiltonGreetText:
	text "Ah, soy "
	text_ram wStringBuffer3
	text "…"

	para "¿Tienes un"
	line "momento?"
	done

WiltonGreetDayText:
	text "Ah, soy "
	text_ram wStringBuffer3
	text "…"

	para "¿Puedes hablar"
	line "ahora?"
	done

WiltonGreetNiteText:
	text "Ah, soy "
	text_ram wStringBuffer3
	text "…"

	para "Perdón por llamar"
	line "tan tarde."
	done

WiltonGenericText:
	text "¿Han crecido algo"
	line "tus #mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " ha cre-"
	line "cido bastante."
	done
