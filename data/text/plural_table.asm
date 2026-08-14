	; use rawchars so `plural` can reverse strings
	setcharmap no_ngrams

MACRO plural
	for i, CHARLEN(\1)
		db STRCHAR(\1, CHARLEN(\1) - 1 - i)
	endr
	db "@", \2, "@"
ENDM

PluralTable:
	; Nota: El orden importa (las reglas más específicas van primero)

	; Invariables que terminan en s o X (Restos, Gafas, BotasGruesas, Más PS, Ataque X...)
	plural "s",             "s"
	plural "X",             "X"
	plural "iel",           "iel"            ; Miel

	; Terminación ón -> ones (Poción, Carbón, PolvCuración, Precisión X...)
	plural "ón",            "ones"

	; Extranjerismos
	plural "all",           "alls"           ; Poké Ball -> Poké Balls

	; Regla general por defecto (añade "s" a palabras terminadas en vocal)
	plural "",              "s"

	setcharmap default
