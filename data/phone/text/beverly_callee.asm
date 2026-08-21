BeverlyAnswerPhoneText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "."

	para "¡Oh! Buenos días,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "."

	para "¡Oh! Buen día,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText:
	text "Hola, soy "
	text_ram wStringBuffer3
	text "."

	para "¡Oh! Buenas"
	line "noches, <PLAYER>."
	done

BeverlyGreetText:
	text "Hola, <PLAYER>."
	line "Buenos días."

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Estabas"
	cont "durmiendo?"
	done

BeverlyGreetDayText:
	text "Hola, <PLAYER>."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Cómo te va?"
	done

BeverlyGreetNiteText:
	text "Hola, <PLAYER>."
	line "Soy "
	text_ram wStringBuffer3
	text "."

	para "¿Estabas"
	line "despierto?"
	done

BeverlyGenericText:
	text "¿Tus #mon están"
	line "felices?"

	para "Mi "
	text_ram wStringBuffer4
	text " está"
	line "muy sano. Come"
	cont "mucho cada día."
	done
