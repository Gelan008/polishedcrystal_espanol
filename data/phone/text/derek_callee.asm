DerekAnswerPhoneText:
	text "¿Hola, <PLAYER>?"

	para "¡Buenos días, pika!"
	line "¿Qué pasa, pika?"
	done

DerekAnswerPhoneDayText:
	text "¿Hola, <PLAYER>?"

	para "¡Buenas, pika!"
	line "¿Qué pasa, pika?"
	done

DerekAnswerPhoneNiteText:
	text "¿Hola, <PLAYER>?"

	para "¡Buenas noches,"
	line "pika! ¿Qué tal?"
	done

DerekGreetText:
	text "¡<PLAYER> pika,"
	line "buenos días!"

	para "Soy "
	text_ram wStringBuffer3
	text ", ¿cómo"
	line "pika estás?"
	done

DerekGreetDayText:
	text "¡<PLAYER> pika,"
	line "buenas pika!"

	para "Soy "
	text_ram wStringBuffer3
	text ", ¿cómo"
	line "pika estás?"
	done

DerekGreetNiteText:
	text "¡<PLAYER> pika,"
	line "buenas noches!"

	para "Soy "
	text_ram wStringBuffer3
	text ". ¿Estás"
	line "pika despierto?"
	done

DerekGenericText:
	text "¡Tienes que oír"
	line "esto! ¡Mi "
	text_ram wStringBuffer4
	text ""
	cont "me miró y sonrió!"

	para "¡Nuestros dos"
	line "corazones deben de"
	cont "latir unidos!"
	done
