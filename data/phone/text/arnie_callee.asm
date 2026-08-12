ArnieAnswerPhoneText:
	text "Sí, hola."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "...¿Eh, <PLAYER>? ¡Ey!"
	done

ArnieAnswerPhoneDayText:
	text "Sí, hola, habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "...¿Eh, <PLAYER>? ¡Ey!"
	done

ArnieAnswerPhoneNiteText:
	text "Sí, hola, habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "...¿Eh, <PLAYER>? ¡Ey!"
	done

ArnieGreetText:
	text "¿Sí, hola?"
	line "Llama "
	text_ram wStringBuffer3
	text "."

	para "¿Qué estás"
	line "haciendo, <PLAYER>?"
	done

ArnieGreetDayText:
	text "¿Sí, hola?"
	line "Llama "
	text_ram wStringBuffer3
	text "."

	para "¿Dónde estás,"
	line "<PLAYER>?"
	done

ArnieGreetNiteText:
	text "¿Sí, hola?"
	line "Llama "
	text_ram wStringBuffer3
	text "."

	para "¿Estás despierto,"
	line "<PLAYER>?"
	done

ArnieGenericText:
	text "Seguro que tus"
	line "#mon son mucho"
	cont "más fuertes."
	done
