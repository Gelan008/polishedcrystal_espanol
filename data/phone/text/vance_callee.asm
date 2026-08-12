VanceAnswerPhoneText:
	text "¿Sí, hola?"
	line "¡Aquí "
	text_ram wStringBuffer3
	text "!"

	para "¡Buenos días,"
	line "<PLAYER>!"

	para "¿Estás usando"
	line "#mon pájaro?"
	done

VanceAnswerPhoneDayText:
	text "¿Sí, hola?"
	line "¡Aquí "
	text_ram wStringBuffer3
	text "!"

	para "¡Hola, <PLAYER>!"

	para "¿Tus #mon pá-"
	line "jaro están vo-"
	cont "lando?"
	done

VanceAnswerPhoneNiteText:
	text "¿Sí, hola?"
	line "¡Aquí "
	text_ram wStringBuffer3
	text "!"

	para "¡Buenas noches,"
	line "<PLAYER>! ¿Estás"

	para "dejando volar un"
	line "poco a tus"
	cont "#mon pájaro?"
	done

VanceGreetText:
	text "¡Buenos días,"
	line "<PLAYER>!"

	para "¡Soy "
	text_ram wStringBuffer3
	text "!"
	line "¡Buenos días!"
	done

VanceGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "¡Soy "
	text_ram wStringBuffer3
	text "!"
	line "¿Me recuerdas?"
	done

VanceGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "¡Soy "
	text_ram wStringBuffer3
	text "!"
	line "¿Estás libre?"
	done

VanceGenericText:
	text "¿Estáis bien tus"
	line "#mon y tú?"

	para "Parece que mi"
	line ""
	text_ram wStringBuffer4
	text " "
	cont "se volverá lo"

	para "bastante fuerte"
	line "como para plantar"

	para "cara a las #mon"
	line "aves legendarias"
	done
