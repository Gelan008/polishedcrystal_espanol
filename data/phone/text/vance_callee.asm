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

	para "¿Vuelan alto tus"
	line "#mon pájaro?"
	done

VanceAnswerPhoneNiteText:
	text "¿Sí, hola?"
	line "¡Aquí "
	text_ram wStringBuffer3
	text "!"

	para "¡Buenas noches,"
	line "<PLAYER>!"

	para "¿Haces volar a tus"
	line "#mon pájaro?"
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

	para "¡Mi "
	text_ram wStringBuffer4
	text ""
	line "podría vencer a"
	cont "las mismas aves"
	cont "legendarias!"
	done
