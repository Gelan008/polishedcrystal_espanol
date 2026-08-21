JoeyAskNumber1Text:
	text "Oye, ¿me das tu"
	line "número de móvil?"

	para "Te llamaré para"
	line "luchar."

	para "¡Como novatos,"
	line "nos motivaremos!"
	done

JoeyAskNumber2Text:
	text "¿Me das tu número"
	line "de teléfono?"

	para "¡No quiero perder"
	line "más contra ti!"

	para "¡Hay que luchar de"
	line "nuevo, ¿vale?!"
	done

JoeyNumberAcceptedText:
	text "¡Te llamaré si me"
	line "apetece luchar!"
	done

JoeyNumberDeclinedText:
	text "Oh, vale…"

	para "¡Pero no volveré a"
	line "perder contra ti!"
	done

JoeyPhoneFullText:
	text "¿Eh? Tu teléfono"
	line "no tiene espacio."
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

	para "Bueno, lo dejamos"
	line "para otra ocasión."
	done

JoeyRematchGiftText:
	text "Y otra derrota…"

	para "No hay duda, eres"
	line "duro de pelar."

	para "¡Perder así hasta"
	line "me sienta bien!"

	para "Ten, toma esto."
	line "¡Hazte con ello"
	cont "aún más fuerte!"

	para "¡Eso me obligará a"
	line "mejorar a mí!"
	done
