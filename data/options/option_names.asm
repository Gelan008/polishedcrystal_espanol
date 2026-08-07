OptionNames:
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
	db "Veloc. Texto@"
.TextAutoscroll:
	db "Texto Auto.@"
.Frame:
	db "Marco@"
.Typeface:
	db "Fuente@"
.Keyboard:
	db "Teclado@"
.Sound:
	db "Sonido@"
.BattleEffects:
	db "Efectos Batallas@"
.BattleStyle:
	db "Estilo Batalla@"
.Nicknames:
	db "Motes@"
.RunningShoes:
	db "Deportivas@"
.TurningSpeed:
	db "Velocidad Giro@"
.ClockFormat:
	db "Formato Reloj@"
.PokedexUnits:
	db "#dex Unidades@"
