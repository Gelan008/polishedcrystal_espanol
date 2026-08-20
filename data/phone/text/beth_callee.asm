BethAnswerPhoneText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "."

	para "¡Oh, <PLAYER>!"
	line "Buenos días."
	done

BethAnswerPhoneDayText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "."

	para "¡Hola, <PLAYER>!"
	done

BethAnswerPhoneNiteText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "."

	para "¡Oh, <PLAYER>!"
	line "Buenas noches."
	done

BethGreetText:
	text "¡Buenos días,"
	line "<PLAYER>!"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Estabas"
	cont "durmiendo?"
	done

BethGreetDayText:
	text "¡Hola, <PLAYER>!"
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Tienes un"
	line "momento?"
	done

BethGreetNiteText:
	text "Hola, <PLAYER>."
	line "Buenas noches."

	para "Soy "
	text_ram wStringBuffer3
	text "."

	para "Espero que no"
	line "estés durmiendo."
	done

BethGenericText:
	text "¿Vas mucho por los"
	line "Centros #mon?"

	para "Yo voy cada día."
	line "Cuidar la salud de"
	cont "tus #mon es"
	cont "fundamental para"
	cont "un entrenador."
	done
