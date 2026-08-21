InitialOptionDescriptions:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .AffectionBonus
	dw .NextPage

	dw .RTC
	dw .PerfectIVs
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	dw EmptyString
	dw .PrevPage
	assert_table_length NUM_INITIAL_OPTIONS_PER_PAGE * 2

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
	text "510: Modo moderno"
	line "hasta {d:MODERN_MAX_EV} por stat"
	cont "y {d:MODERN_EV_LIMIT} en total."

	para "Todos: Sube todas"
	line "a {d:MODERN_MAX_EV} sin límite"
	cont "(como en Gen 1-2)."

	para "No: Sin EVs (stats"
	line "fijadas por nivel,"
	cont "IVs y naturaleza)."
	prompt

.Experience:
	text "Fórmula antigua"
	line "(Gen 1-4) fija."

	para "Fórmula nueva"
	line "(Gen 5 y 7+) da"
	cont "más Exp. al vencer"
	cont "rivales de mayor"
	cont "nivel y viceversa."

	para "Puedes desactivar"
	line "la Exp. ganada,"
	cont "pero los Caramelos"
	cont "siguen funcionando"
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
	cont "pero no ganarán"
	cont "Exp. extra."
	prompt

.EvolveInBattle:
	text "Tus #mon pueden"
	line "evolucionar en"
	cont "pleno combate."

	para "Inspirado en el"
	line "anime de #mon."
	prompt

.ColorVariation:
	text "Da un matiz de"
	line "color único a cada"
	cont "espécimen #mon."

	para "Afecta a normales"
	line "y a variocolor sin"
	cont "alterar sus stats."

	para "No quita shinies."
	line "Inspirado en"
	cont "#mon Stadium."
	prompt

.NextPage:
	text "Página siguiente."
	prompt

.PrevPage:
	text "Página anterior."
	prompt
