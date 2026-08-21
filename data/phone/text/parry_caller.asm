ParryNothingCanMatchText:
	text "Nada igualará a mi"
	line ""
	text_ram wStringBuffer4
	text " ahora."
	done

ParryDefeatedMonText:
	text "¡Sí! ¡Vencimos a"
	line "un "
	text_ram wStringBuffer4
	text ""
	cont "salvaje!"

	para "Estuvo bien, pero"
	line "quería atraparlo…"
	done

ParryLostAMonText:
	text "Ayer vimos a un"
	line ""
	text_ram wStringBuffer4
	text " salvaje"
	cont "y dudábamos si"
	cont "cazarlo o no…"

	para "¡Y vino otro chico"
	line "y lo atrapó!"
	cont "¡Vaya tela!"
	done

ParryBattleRematchText:
	text "Seguro que quieres"
	line "luchar contra mí."
	cont "¿Tengo razón o no?"

	para "¡Pues nos vemos"
	line "en "
	text_ram wStringBuffer5
	text "!"
	done

ParryHangUpText:
	text "¡Vale, llámame de"
	line "nuevo!"
	done

ParryBattleWithMeText:
	text "Lucharás conmigo"
	line "de nuevo, ¿no?"
	done

ParryHaventYouGottenToText:
	text "¿Aún no has"
	line "llegado a"
	cont ""
	text_ram wStringBuffer5
	text "?"

	para "No me importa"
	line "esperar, ¡pero"
	cont "quiero combatir!"
	done
