GinaAnswerPhoneText:
	text "¿Hola? Al aparato"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Oh, <PLAYER>!"
	line "¡Buenos días!"
	done

GinaAnswerPhoneDayText:
	text "¿Hola? Al aparato"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Oh, <PLAYER>!"
	line "Hola, ¿qué tal?"
	done

GinaAnswerPhoneNiteText:
	text "¿Hola? Al aparato"
	line ""
	text_ram wStringBuffer3
	text "..."

	para "¡Oh, <PLAYER>!"
	line "¡Buenas noches!"
	done

GinaGreetText:
	text "¿<PLAYER>?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¡Buenos días!"
	done

GinaGreetDayText:
	text "¿<PLAYER>?"

	para "Soy "
	text_ram wStringBuffer3
	text ". ¿Te"
	line "viene mal ahora?"
	done

GinaGreetNiteText:
	text "¿<PLAYER>?"

	para "Soy "
	text_ram wStringBuffer3
	text "."
	line "¿Puedes charlar?"
	done

GinaGenericText:
	text "¿Tus #mon son"
	line "igual de duros?"

	para "Yo entreno cada"
	line "día con mi"
	cont ""
	text_ram wStringBuffer4
	text "."
	done
