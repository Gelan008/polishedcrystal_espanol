InitialOptionNames:
	table_width 2
	dw .Natures
	dw .Abilities
	dw .PSS
	dw .EVs
	dw .Experience
	dw .Affection
	dw .RTC
	dw .PerfectStats
	dw .TradedMon
	dw .EvolveInBattle
	dw .ColorVariation
	assert_table_length NUM_INITIAL_MENU_OPTIONS

.Natures:
	db "Naturalezas@"
.Abilities:
	db "Habilidades@"
.PSS:
	db "Fís/Esp.@"
.EVs:
	db "Ganancia EV@"
.Experience:
	db "Ganancia Exp.@"
.Affection:
	db "Bonus Amistad@"
.RTC:
	db "Reloj Real@"
.PerfectStats:
	db "Stats Perfectos@"
.TradedMon:
	db "Intercambio <PK><MN>@"
.EvolveInBattle:
	db "Evol. en Bat.@"
.ColorVariation:
	db "Variación Color@"
