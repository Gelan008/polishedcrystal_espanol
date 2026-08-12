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
	text " y"
	line "yo tenemos energía"

	para "de sobra. Subimos"
	line "montañas todos los"

	para "días para quemar"
	line "toda esa energía."
	done
