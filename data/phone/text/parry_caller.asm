ParryNothingCanMatchText:
	text "Nada igualará a mi"
	line ""
	text_ram wStringBuffer4
	text " ahora."
	done

ParryDefeatedMonText:
	text "¡Sí, vencimos a un"
	line ""
	text_ram wStringBuffer4
	text " salvaje!"

	para "Estuvo bien, pero"
	line "quería cogerlo…"
	done

ParryLostAMonText:
	text "Y ayer, vimos a un"
	line "ejemplar salvaje"

	para "de "
	text_ram wStringBuffer4
	text "."
	line "Y debatíamos"

	para "sobre atraparlo o"
	line "derrotarlo."

	para "¡Cuando vino otro"
	line "chico y lo"

	para "atrapó!"
	line "¡Qué te parece!"
	done

ParryBattleRematchText:
	text "Estás pensando que"
	line "te gustaría"

	para "luchar contra mí."
	line "¿Tengo razón o no?"

	para "¡Sí! Nos veremos"
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
	text "¿Aún no has llega-"
	line "do a "
	text_ram wStringBuffer5
	text "?"

	para "Esperar no está"
	line "mal, ¡pero me gus-"
	cont "taría luchar!"
	done
