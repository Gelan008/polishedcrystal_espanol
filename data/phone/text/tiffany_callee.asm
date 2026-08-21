TiffanyAnswerPhoneText:
	text "¿Sí? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Buenos días."
	done

TiffanyAnswerPhoneDayText:
	text "¿Sí? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Hola."
	done

TiffanyAnswerPhoneNiteText:
	text "¿Sí? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Buenas noches."
	done

TiffanyGreetText:
	text "¿Eres <PLAYER>?"

	para "Buenos días. Soy"
	line ""
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetDayText:
	text "¿Eres <PLAYER>?"

	para "Hola, soy "
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetNiteText:
	text "¿Eres <PLAYER>?"

	para "Buenas noches."
	line "Soy "
	text_ram wStringBuffer3
	text "."
	done

TiffanyGenericText:
	text "¿Tus #mon están"
	line "bien de salud?"

	para "Espero que los"
	line "lleves al Centro"
	cont "#mon a menudo."

	para "¡No les exijas"
	line "demasiado!"

	para "Mi "
	text_ram wStringBuffer4
	text " es"
	line "muy feliz porque"
	cont "lo llevo al Centro"
	cont "#mon a diario."
	done
