LizAnswerPhoneText:
	text "Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Buenos días."
	done

LizAnswerPhoneDayText:
	text "Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "¿Cómo estás?"
	done

LizAnswerPhoneNiteText:
	text "Hola, al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAYER>."
	line "Buenas noches."
	done

LizGreetText:
	text "Buenos días,"
	line "<PLAYER>."

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Dormías?"
	done

LizGreetDayText:
	text "Hola, <PLAYER>."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Cómo te van las"
	line "cosas?"
	done

LizGreetNiteText:
	text "Buenas noches,"
	line "<PLAYER>."

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Estás despierto?"
	done

LizGenericText:
	text "Tenía tiempo,"
	line "así que te llamé."

	para "Por cierto, ¿cómo"
	line "están tus #mon?"

	para "Llevo a mi"
	line ""
	text_ram wStringBuffer4
	text " al"
	cont "Centro #mon de"
	cont "Ciudad Malva."

	para "¡Está en plena"
	line "forma! ¡Me llevo"
	cont "genial con la"
	cont "recepcionista!"
	done
