AnthonyAnswerPhoneText:
	text "Sí, aquí el"
	line "Montañero "
	text_ram wStringBuffer3
	text "."

	para "¡Ah, <PLAYER>!"
	done

AnthonyAnswerPhoneDayText:
	text "Sí, aquí el"
	line "Montañero "
	text_ram wStringBuffer3
	text "."

	para "Ah, eres <PLAYER>,"
	line "¿verdad?"
	done

AnthonyAnswerPhoneNiteText:
	text "Sí, aquí el"
	line "Montañero "
	text_ram wStringBuffer3
	text "."

	para "Ah, eres <PLAYER>,"
	line "¿no?"
	done

AnthonyGreetText:
	text "¿Eh, <PLAYER>?"

	para "¡Soy el Montañero"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AnthonyGreetDayText:
	text "Ey, ¿eres tú,"
	line "<PLAYER>?"

	para "¡Soy el Montañero"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AnthonyGreetNiteText:
	text "<PLAYER>, ¿sigues"
	line "despierto?"

	para "¡Soy el Montañero"
	line ""
	text_ram wStringBuffer3
	text "!"
	done

AnthonyGenericText:
	text "¿Tus #mon"
	line "siguen tan"
	cont "peleones?"

	para "Mi "
	text_ram wStringBuffer4
	text " y yo"
	line "tenemos energía"
	cont "de sobra."

	para "¡Subimos montañas"
	line "cada día para"
	cont "gastarla toda!"
	done
