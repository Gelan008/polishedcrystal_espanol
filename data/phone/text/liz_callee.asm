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

	para "Y bueno, ¿cómo es-"
	line "tán tus #mon?"

	para "Yo llevo a mi"
	line ""
	text_ram wStringBuffer4
	text " al"

	para "Centro #mon de"
	line "Malva cada día,"

	para "¡así que está"
	line "fantástico!"

	para "¡Soy amiga de la"
	line "recepcionista!"
	done
