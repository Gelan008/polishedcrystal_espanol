; These are in the same order as InitialOptions_CallOptionRoutine.Pointers,
; not the *_OPT bit order.
InitialOptionDescriptions:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .AffectionBonus
	dw .RTC
	dw .PerfectIVs
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	assert_table_length NUM_INITIAL_MENU_OPTIONS

.Natures:
	text "Naturalezas suben"
	line "un stat y bajan"
	cont "otro un 10%."

	para "Introducidas en"
	line "3 Generación."
	prompt

.Abilities:
	text "Las Habilidades"
	line "tienen efectos"

	para "dentro y fuera"
	line "del combate."

	para "Introducidas en"
	line "3 Generación."
	prompt

.PSS:
	text "Ataques Físicos o"
	line "Especiales según"
	cont "el movimiento."

	para "Introducido en"
	line "4 Generación."
	prompt

.EVs:
	assert MODERN_MAX_EV % 4 == 0
	text "Los EVs suben los"
	line STRFMT("stats hasta %d pts,", MODERN_MAX_EV / 4) ; 252 / 4 == 63
	cont "1 por cada 4 EVs."

	para "Puedes maximizar"
	line "cada stat a"

	para "{d:MODERN_MAX_EV} EVs como antes,"
	line "o limitarlos a un"

	para "total de {d:MODERN_EV_LIMIT}."

	para "Sustituyeron a la"
	line "Exp.Stat en Gen 3."
	prompt

.Experience:
	text "Fórmula antigua"
	line "(Gen 1-4) fija."

	para "Fórmula nueva"
	line "(Gen 5 y 7+) da"

	para "más Exp. al vencer"
	line "rivales de mayor"
	cont "nivel y viceversa."

	para "Puedes desactivar"
	line "la Exp. ganada,"

	para "pero los Caramelos"
	line "seguirán usando."
	prompt

.AffectionBonus:
	text "Tu #mon tendrá"
	line "ventajas si tu"
	cont "amistad es alta."

	para "Introducido en"
	line "6 Generación."
	prompt

.RTC:
	text "Usa el Reloj en"
	line "Tiempo Real para"
	cont "seguir la hora."

	para "Si tu emulador o"
	line "cartucho no usa"
	cont "RTC, desactívalo"

	assert 24 % NO_RTC_SPEEDUP == 0
	para "para que cada día"
	line STRFMT("dure %d horas.", 24 / NO_RTC_SPEEDUP) ; 24 / 6 == 4
	prompt

.PerfectIVs:
	text "Stats calculados"
	line "como si los IVs"

	para "fuesen perfectos"
	line "para todos los"
	cont "#mon."
	prompt

.TradedMon:
	text "#mon de trueque"
	line "te obedecerán y"
	cont "tendrán mote,"

	para "pero no ganarán"
	line "Exp. extra."
	prompt

.EvolveInBattle:
	text "Tus #mon pueden"
	line "evolucionar en"
	cont "pleno combate."

	para "Inspirado en el"
	line "anime de #mon."
	prompt

.ColorVariation:
	text "#mon normales"
	line "y variocolor"
	cont "tendrán tonos de"

	para "color sutilmente"
	line "distintos."

	para "Variación al azar"
	line "que no afecta a"

	para "sus características"
	line "o calidad."

	para "Inspirado en"
	line "#mon Stadium."
	prompt

InitialOptionsDoneDescription:
	text "¡Guarda tus ajustes"
	line "y empieza a jugar!"
	prompt
