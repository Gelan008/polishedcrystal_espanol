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

	; Invariables específicos
	plural "iel",           "iel"            ; Miel
	plural "afa",           "afa"            ; Gafa Protec.
	plural "zal",           "zal"            ; Brazal
	plural "eno",           "eno"            ; FlechaVeneno
	plural "Tor",           "Tor"            ; Cuchara Tor
	plural "tir",           "tir"            ; Antiderretir
	plural "rag",           "rag"            ; Colmillodrag
	plural "dad",           "dad"            ; SegDebilidad, CpsHabilidad, PchHabilidad
	plural "p.",            "p."             ; Camp.
	plural "h.",            "h."             ; Moch.
	plural "gro",           "gro"            ; Lodo Negro
	plural "lla",           "lla"            ; Tr. Estrella
	plural "Exp",           "Exp"            ; Repartir Exp
	plural "liz",           "liz"            ; Antiparaliz

	; Excepciones de objetos compuestos
	plural "ape",           "apes"           ; Botón Escape -> Botones Escape
	plural "sca",           "scas"           ; Agua Fresca -> Aguas Frescas
	plural "llo",           "llos"           ; Polvo Brillo -> Polvos Brillo
	plural "ida",           "idas"           ; Cuerda Huida -> Cuerdas Huida
	plural "v Metálico",    "vs Metálicos"   ; Rev Metálico -> Revs Metálicos
	plural "aro",           "aros"           ; Caramel Raro -> Caramelos Raros
	plural "ria",           "rias"           ; Carmel Furia -> Caramelos Furia
	plural "tal",           "tales"          ; Cura Total -> Curas Totales

	; Terminaciones en consonante o vocal acentuada (añaden "es")
	plural "ón",            "ones"           ; Poción, Imán, Carbón, PolvCuración, Precisión X
	plural "ar",            "ares"           ; Despertar, Antiquemar
	plural "er",            "eres"           ; Éter, Elixir
	plural "il",            "iles"           ; Fósil
	plural "uz",            "uces"           ; Refleluz
	plural "el",            "els"            ; Repel -> Repels
	plural "íz",            "íces"           ; Raíz
	plural "or",            "ores"           ; Flor
	plural "ir",            "ires"           ; HierbRevivir, Revivir
	
	; Extranjerismos
	plural "all",           "alls"           ; Poké Ball -> Poké Balls

	; Regla general por defecto (añade "s" a palabras terminadas en vocal)
	plural "",              "s"

	setcharmap default
