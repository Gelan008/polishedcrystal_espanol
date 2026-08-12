DanaAnswerPhoneText:
	text "Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Ey! ¡Es <PLAYER>!"
	done

DanaAnswerPhoneDayText:
	text "Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Lo sé!"
	line "¡Es <PLAYER>!"
	done

DanaAnswerPhoneNiteText:
	text "Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¿<PLAYER>?"
	line "¿Qué tal?"
	done

DanaGreetText:
	text "Eh, ¿<PLAYER>?"

	para "¡Soy yo!"
	line "¡Soy "
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetDayText:
	text "Eh, ¿<PLAYER>?"

	para "¡Soy yo!"
	line "¡Soy "
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetNiteText:
	text "Eh, ¿<PLAYER>?"

	para "¡Soy yo!"
	line "¡Soy "
	text_ram wStringBuffer3
	text "!"
	done

DanaGenericText:
	text "Mi "
	text_ram wStringBuffer4
	text " tiene"
	line "tanta energía que"

	para "da un poco de"
	line "miedo."

	para "¿Cómo están"
	line "tus #mon?"
	done
