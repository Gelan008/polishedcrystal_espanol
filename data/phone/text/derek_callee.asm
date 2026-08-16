DerekAnswerPhoneText:
	text "¿Hola, <PLAYER>?"

	para "Buenos días pika."
	line "¿Qué pasa pika?"
	done

DerekAnswerPhoneDayText:
	text "¿Hola, <PLAYER>?"

	para "Buenas pika,"
	line "¿qué pasa pika?"
	done

DerekAnswerPhoneNiteText:
	text "¿Hola, <PLAYER>?"

	para "Buenas noches pika"
	line "¿qué pasa pika?"
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
	line "esto! ¡Mi amable"

	para ""
	text_ram wStringBuffer4
	text " me miró"
	line "y me sonrió!"

	para "¡Debe ser porque"
	line "nuestros corazones"
	cont "laten unidos!"
	done
