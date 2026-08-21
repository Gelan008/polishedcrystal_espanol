BrentAnswerPhoneText:
	text "¿Sí? Al habla"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>."
	line "¿Qué necesitas?"
	done

BrentAnswerPhoneDayText:
	text "¿Sí? Al habla"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>."
	line "¿Qué necesitas?"
	done

BrentAnswerPhoneNiteText:
	text "¿Sí? Al habla"
	line ""
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>."
	line "¿Qué necesitas?"
	done

BrentGreetText:
	text "Hola, <PLAYER>."
	line "¿Cómo te va?"

	para "¡Ey! Soy yo,"
	line ""
	text_ram wStringBuffer3
	text "."
	done

BrentGreetDayText:
	text "Hola, <PLAYER>."
	line "¿Cómo te va?"

	para "¡Ey! Soy yo,"
	line ""
	text_ram wStringBuffer3
	text "."
	done

BrentGreetNiteText:
	text "Hola, <PLAYER>."
	line "¿Cómo te va?"

	para "¡Ey! Soy yo,"
	line ""
	text_ram wStringBuffer3
	text "."
	done

BrentGenericText:
	text "El otro día te vi"
	line "salir del Centro"
	cont "#mon."

	para "Curas mucho a tus"
	line "#mon, ¿eh?"
	cont "¡Qué dedicado!"

	para "Je, mi "
	text_ram wStringBuffer4
	text ""
	line "es tan fuerte que"
	cont "casi ni va por el"
	cont "Centro. ¡Jejeje!"
	done
