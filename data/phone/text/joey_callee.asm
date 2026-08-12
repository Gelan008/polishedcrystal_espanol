JoeyAnswerPhoneText:
	text "¡Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "!"

	para "¡Ah, <PLAYER>!"
	line "¿Todo bien?"
	done

JoeyAnswerPhoneDayText:
	text "¡Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "!"

	para "¡Ah, <PLAYER>!"
	line "¿Todo bien?"
	done

JoeyAnswerPhoneNiteText:
	text "¡Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "!"

	para "¡Ah, <PLAYER>!"
	line "¿Todo bien?"
	done

JoeyGreetText:
	text "¡Ey, <PLAYER>!"
	line "¿Cómo te va?"

	para "Soy "
	text_ram wStringBuffer3
	text ","
	line "¿tienes un minuto?"
	done

JoeyGreetDayText:
	text "¡Ey, <PLAYER>!"
	line "¿Cómo te va?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Tienes un minuto?"
	done

JoeyGreetNiteText:
	text "¡Ey, <PLAYER>!"
	line "¿Cómo te va?"

	para "Soy "
	text_ram wStringBuffer3
	text ","
	line "¿tienes un minuto?"
	done

JoeyGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Mi "
	text_ram wStringBuffer4
	text " está"
	line "listo para luchar,"
	cont "como siempre."

	para "Es el único que"
	line "tengo. ¡Voy a ser"

	para "un gran entrena-"
	line "dor con él!"
	done
