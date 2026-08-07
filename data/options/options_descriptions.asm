OptionsDescriptions:
	table_width 2
	dw .TextSpeed
	dw .TextAutoscroll
	dw .Frame
	dw .Typeface
	dw .Keyboard
	dw .Sound
	dw .BattleEffects
	dw .BattleStyle
	dw .Nicknames
	dw .RunningShoes
	dw .TurningSpeed
	dw .ClockFormat
	dw .PokedexUnits
	assert_table_length NUM_OPTIONS

.TextSpeed:
	text "Velocidad a la que"
	line "aparece el texto."
	prompt

.TextAutoscroll:
	text "Avanzar texto"
	line "pulsando botón/es"
	prompt

.Frame:
	text "El marco alrededor"
	line "de los diálogos."
	prompt

.Typeface:
	text "La fuente usada"
	line "para los textos."
	prompt

.Keyboard:
	text "Distribución del"
	line "teclado."
	prompt

.Sound:
	text "Salida de audio:"
	line "mono (un canal)"

	para "o estéreo (dos,"
	line "izq. y derech)."
	prompt

.BattleEffects:
	text "Animaciones de"
	line "movs y estados."
	prompt

.BattleStyle:
	text "Tras debilitar a"
	line "un oponente:"

	para "Mantener: saca al"
	line "sig. rival."
	
	para "Cambio: permite"
	line "cambiar antes."
	
	para "Predecir: te dice"
	line "el sig. rival."
	prompt

.Nicknames:
	text "Decisión sobre"
	line "poner motes al"
	cont "capturar #mon."
	prompt

.RunningShoes:
	text "Con B corres si"
	line "están en no, o"
	para "andas si están"
	line "en sí (Auto-correr)."
	prompt

.TurningSpeed:
	text "Velocidad para"
	line "girar al andar"
	cont "por el mapa."
	prompt

.ClockFormat:
	text "Formato de hora:"
	line "12h muestra AM/PM."
	prompt

.PokedexUnits:
	text "Unidades de peso"
	line "y altura #dex:"

	para "Imperial: pies,"
	line "pulgadas y libras."

	para "Metric:"
	line "metros y kilos."
	prompt

OptionsDoneDescription:
	text "Guarda los cambios"
	line "y sale del menú"
	prompt
