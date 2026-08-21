WadeAnswerPhoneText:
	text "¿Hola? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah. ¡Hola,"
	line "<PLAYER>!"
	cont "¡Buenos días!"
	done

WadeAnswerPhoneDayText:
	text "¿Hola? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "¡Ah, hola,"
	line "<PLAYER>!"
	done

WadeAnswerPhoneNiteText:
	text "¿Hola? Al habla"
	line ""
	text_ram wStringBuffer3
	text "."

	para "Ah. ¡Hola,"
	line "<PLAYER>!"
	cont "¡Buenas noches!"
	done

WadeGreetText:
	text "¡Buenos días,"
	line "<PLAYER>!"

	para "¡Soy yo, "
	text_ram wStringBuffer3
	text "!"
	line "¿Hace buen día?"
	done

WadeGreetDayText:
	text "¡Hola, <PLAYER>!"

	para "¡Soy yo, "
	text_ram wStringBuffer3
	text "!"
	line "¿Hace buen día?"
	done

WadeGreetNiteText:
	text "¡Buenas noches,"
	line "<PLAYER>!"

	para "¡Soy yo, "
	text_ram wStringBuffer3
	text "!"
	line "¿Aún despierto?"
	done

WadeGenericText:
	text "¿Cómo están tus"
	line "#mon?"

	para "Los míos tienen"
	line "tanta energía que"
	cont "es un problema."

	para "Sobre todo mi"
	line ""
	text_ram wStringBuffer4
	text ", que"
	cont "es muy rebelde."

	para "¡Entrenarlo es"
	line "agotador!"
	done
