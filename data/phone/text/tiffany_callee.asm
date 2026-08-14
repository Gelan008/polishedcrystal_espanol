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

	para "Oh, <PLAYER>, bue-"
	line "nas noches."
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
	text "¿Tus #mon es-"
	line "tán bien?"

	para "Espero que los"
	line "lleves al Centro"
	cont "#mon cada día."

	para "No les exijas de-"
	line "masiado."

	para "Mi "
	text_ram wStringBuffer4
	text " es"
	line "mono y alegre"

	para "precisamente por-"
	line "que lo llevo a un"

	para "Centro #mon"
	line "todos los días."
	done
