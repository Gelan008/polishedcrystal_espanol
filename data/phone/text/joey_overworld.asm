JoeyAskNumber1Text:
	text "Oye, ¿me das tu"
	line "número de teléfo-"
	cont "no?"

	para "Te llamaré para"
	line "luchar."

	para "Yo también soy"
	line "novato, así que"
	cont "será motivador."
	done

JoeyAskNumber2Text:
	text "¿Me das tu núme-"
	line "ro de teléfono?"

	para "¡No quiero perder"
	line "contra ti!"

	para "Tenemos que lu-"
	line "char otra vez,"
	cont "¿vale?"
	done

JoeyNumberAcceptedText:
	text "¡Te llamaré cuan-"
	line "do tenga ganas de"
	cont "luchar!"
	done

JoeyNumberDeclinedText:
	text "Oh, vale…"

	para "¡Pero no volveré a"
	line "perder contra ti!"
	done

JoeyPhoneFullText:
	text "¿Eh, qué? Tu telé-"
	line "fono está lleno."
	done

JoeyTopPercentageText: ; TODO: use this text from HGSS
	text "Oye, ¿recuerdas a"
	line "mi súper genial"
	cont ""
	text_ram wStringBuffer4
	text "?"

	para "Mi "
	text_ram wStringBuffer4
	text " es"
	line "distinto a los"
	cont "demás "
	text_ram wStringBuffer4
	text "."

	para "¡Está entre los"
	line "mejores "
	cont ""
	text_ram wStringBuffer4
	text "!"

	para "¿Entiendes lo"
	line "que digo?"
	done

JoeyRematchText:
	text "¡Te esperaba!"
	line "¡Luchemos ya!"
	done

JoeyPackFullText:
	text "¡Eh, espera! ¡Tu"
	line "Mochila está"
	cont "llena!"

	para "Bueno, lo dejare-"
	line "mos para la próxi-"
	cont "ma vez."
	done

JoeyRematchGiftText:
	text "Y otra derrota…"

	para "No hay duda, eres"
	line "duro de pelar."

	para "¡Perder tan a"
	line "menudo ya hasta me"
	cont "sienta bien!"

	para "Ten, toma esto."
	line "Úsalo para hacerte"

	para "más fuerte. ¡Eso"
	line "me hará más fuer-"
	cont "te a mí también!"
	done
