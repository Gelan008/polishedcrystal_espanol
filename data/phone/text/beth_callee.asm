BethAnswerPhoneText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."
	para "Oh, <PLAYER>."
	line "Buenos días."
	para ""
	done

BethAnswerPhoneDayText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh. Hola, <PLAYER>."
	done

BethAnswerPhoneNiteText:
	text "Hola, soy"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
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

	para "Espero que"
	line "estuvieras"
	cont "despierto."
	done

BethGenericText:
	text "¿Eres de los que"
	line "van a los Centros"

	para "#mon a menudo?"

	para "Yo voy todos los"
	line "días. Vigilar la"

	para "salud de tus #mon"
	line "es una parte"

	para "básica de ser un"
	line "entrenador #mon."
	done
