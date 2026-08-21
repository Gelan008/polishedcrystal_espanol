InitialOptionDescriptions:
	table_width 2
	dw .InitialOptionDesc_Natures
	dw .InitialOptionDesc_Abilities
	dw .InitialOptionDesc_PSS
	dw .InitialOptionDesc_EVs
	dw .InitialOptionDesc_Experience
	dw .InitialOptionDesc_AffectionBonus
	dw .InitialOptionDesc_NextPage

	dw .InitialOptionDesc_RTC
	dw .InitialOptionDesc_PerfectIVs
	dw .InitialOptionDesc_TradedMon
	dw .InitialOptionDesc_EvolveInBattle
	dw .InitialOptionDesc_ColorVariation
	dw EmptyString
	dw .InitialOptionDesc_PrevPage
	assert_table_length NUM_INITIAL_OPTIONS_PER_PAGE * 2

.InitialOptionDesc_Natures:
	text "Las naturalezas"
	line "suben una estadís-"
	cont "tica y bajan otra"
	cont "un 10%."

	para "Añadido en Gen 3."
	prompt

.InitialOptionDesc_Abilities:
	text "Las habilidades"
	line "tienen efectos"
	cont "dentro y fuera de"
	cont "los combates."

	para "Añadido en Gen 3."
	prompt

.InitialOptionDesc_PSS:
	text "Los movimientos"
	line "son físicos o"
	cont "especiales según"
	cont "su naturaleza."

	para "Añadido en Gen 4."
	prompt

.InitialOptionDesc_EVs:
	text "Los PE aumentan"
	line "estadísticas hasta"
	cont "en 63 puntos,"
	cont "uno por 4 PE."

	para "Puedes elegir el"
	line "máximo en cada"
	cont "estadística o el"
	cont "límite moderno."
	prompt

.InitialOptionDesc_Experience:
	text "La experiencia"
	line "puede ser según la"
	cont "diferencia de"
	cont "nivel o fija."

	para "La opción 'No' no"
	line "da experiencia."
	prompt

.InitialOptionDesc_AffectionBonus:
	text "El afecto alto da"
	line "ventajas en combate"
	cont "como curación o"
	cont "más críticos."

	para "Añadido en Gen 6."
	prompt

.InitialOptionDesc_RTC:
	text "Puedes cambiar la"
	line "hora pulsando"
	cont "Abajo + B en el"
	cont "menú de inicio."
	prompt

.InitialOptionDesc_PerfectIVs:
	text "Todos los #mon"
	line "tienen IVs perfec-"
	cont "tos de 31."
	prompt

.InitialOptionDesc_TradedMon:
	text "Los #mon inter-"
	line "cambiados te obe-"
	cont "decen sin medallas"
	cont "y no ganan exp. +"
	prompt

.InitialOptionDesc_EvolveInBattle:
	text "Los #mon pueden"
	line "evolucionar nada"
	cont "más subir de nivel"
	cont "en combate."
	prompt

.InitialOptionDesc_ColorVariation:
	text "Variación sutil"
	line "de color en cada"
	cont "#mon según sus"
	cont "IVs y género."
	prompt

.InitialOptionDesc_NextPage:
	text "Página siguiente."
	prompt

.InitialOptionDesc_PrevPage:
	text "Página anterior."
	prompt
