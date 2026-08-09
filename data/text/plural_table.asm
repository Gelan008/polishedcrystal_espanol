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

	; Objetos invariables (no cambian en plural)
	plural "Miel",          "Miel"           ; Miel
	plural "Restos",        "Restos"         ; Restos
	plural "Gafas",         "Gafas"          ; Gafas de Sol, Gafas Espec., Gafas Elecc., Gafa Protec.

	; Excepciones de objetos compuestos
	plural "Botón Escape",  "Botones Escape" ; Botón Escape -> Botones Escape

	; Terminaciones en consonante o vocal acentuada (añaden "es" o cambian sufijo)
	plural "Poción",        "Pociones"       ; Poción, Super Poción, Hiperpoción, Max Poción
	plural "Éter",          "Éteres"         ; Éter, Max Éter
	plural "Elixir",        "Elixires"       ; Elixir, Max Elixir
	plural "Imán",          "Imanes"         ; Imán
	plural "Carbón",        "Carbones"       ; Carbón
	plural "Fósil",         "Fósiles"        ; Fósil Hélix, Fósil Domo
	plural "Refleluz",      "Refleluces"     ; Refleluz
	plural "Repel",         "Repels"        ; Repelente, Super Repel, Max. Repel

	; Conservar sufijos en inglés adoptados en español
	plural "Ball",          "Balls"          ; Poké Ball, Super Ball, Ultra Ball, etc. -> Poké Balls, etc.

	; Regla general por defecto (añade "s" a palabras terminadas en vocal)
	plural "",              "s"              ; Bayas, Piedras, Pepitas, Cuerdas, Cartas, etc.

	setcharmap default
