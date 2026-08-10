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
	plural "Gafas",         "Gafas"          ; Gafas de Sol, Gafas Espec., Gafas Elecc.
	plural "Gafa",          "Gafa"           ; Gafa Protec.
	plural "Brazal",        "Brazal"         ; Brazal Firme, Brazal Recio
	plural "FlechaVeneno",  "FlechaVeneno"   ; FlechaVeneno -> FlechaVeneno
	plural "Cuchara Tor",   "Cuchara Tor"    ; Cuchara Tor -> Cuchara Tor
	plural "Antiderretir",  "Antiderretir"   ; Antiderretir -> Antiderretir
	plural "Colmillodrag",  "Colmillodrag"   ; Colmillodrag -> Colmillodrag
	plural "SegDebilidad",  "SegDebilidad"   ; SegDebilidad -> SegDebilidad
	plural "Camp.",         "Camp."          ; Camp. Alivio, Camp. Concha
	plural "Moch.",         "Moch."          ; Moch. Escape
	plural "BotasGruesas",  "BotasGruesas"   ; BotasGruesas
	plural "PolvMetálico",  "PolvMetálico"   ; PolvMetálico
	plural "Más PS",        "Más PS"         ; Más PS
	plural "Más PP",        "Más PP"         ; Más PP
	plural "Max. PP",       "Max. PP"        ; Max. PP
	plural "Agua Fresca",   "Aguas Frescas"  ; Agua Fresca -> Aguas Frescas
	plural "Polvo Brillo",  "Polvos Brillo"  ; Polvo Brillo -> Polvos Brillo
	plural "Lodo Negro",    "Lodo Negro"     ; Lodo Negro -> Lodo Negro
	plural "Pañ Elección",  "Pañ Elección"   ; Pañ Elección -> Pañ Elección
	plural "Tr. Estrella",  "Tr. Estrella"   ; Tr. Estrella -> Tr. Estrella

	; Excepciones de objetos compuestos
	plural "Botón Escape",  "Botones Escape" ; Botón Escape -> Botones Escape

	; Terminaciones en consonante o vocal acentuada (añaden "es" o cambian sufijo)
	plural "Poción",        "Pociones"       ; Poción, Super Poción, Hiperpoción, Max Poción
	plural "Despertar",     "Despertares"    ; Despertar -> Despertares
	plural "Éter",          "Éteres"         ; Éter, Max Éter
	plural "Elixir",        "Elixires"       ; Elixir, Max Elixir
	plural "Imán",          "Imanes"         ; Imán
	plural "Carbón",        "Carbones"       ; Carbón
	plural "Fósil",         "Fósiles"        ; Fósil Hélix, Fósil Domo
	plural "Refleluz",      "Refleluces"     ; Refleluz
	plural "Repel",         "Repels"         ; Repelente, Super Repel, Max. Repel
	plural "Proteína",      "Proteínas"      ; Proteína
	plural "Caramel Raro",  "Caramels Raros" ; Caramel Raro -> Caramelos Raros
	plural "Carmel Furia",  "Carmels Furia"  ; Carmel Furia -> Caramelos Furia
	plural "Raíz",          "Raíces"         ; Raíz Energía, Raíz Grande
	plural "Flor",          "Flores"         ; Carta Flor
	plural "Antiquemar",   "Antiquemares"   ; Antiquemar -> Antiquemares
	plural "Cura Total",   "Curas Totales"  ; Cura Total -> Curas Totales
	plural "PolvCuración",  "PolvCuraciones" ; PolvCuración -> PolvCuraciones
	plural "HierbRevivir",  "HierbRevivires" ; HierbRevivir -> HierbRevivires
	plural "Cuerda Huida",  "Cuerdas Huida"  ; Cuerda Huida -> Cuerdas Huida
	plural "Rev Metálico",  "Revs Metálicos" ; Rev Metálico -> Revs Metálicos
	plural "Ataque X",      "Ataques X"      ; Ataque X -> Ataques X
	plural "Ataq. Esp. X",  "Ataq. Esp. X"   ; Ataq. Esp. X -> Ataq. Esp. X
	plural "Precisión X",   "Precisión X"    ; Precisión X -> Precisión X
	plural "Crítico X",     "Críticos X"     ; Crítico X -> Críticos X
	plural "Protección X",  "Protección X"   ; Protección X -> Protección X
	plural "CpsHabilidad",  "CpsHabilidad"   ; CpsHabilidad -> CpsHabilidad
	plural "PchHabilidad",  "PchHabilidad"   ; PchHabilidad -> PchHabilidad
	plural "Repartir Exp",  "Repartir Exp"   ; Repartir Exp -> Repartir Exp
	plural "Revivir",       "Revivires"      ; Revivir, Max Revivir -> Revivires, Max Revivires
	plural "Antiparaliz",   "Antiparaliz"    ; Antiparaliz

	; Conservar sufijos en inglés adoptados en español
	plural "Ball",          "Balls"          ; Poké Ball, Super Ball, Ultra Ball, etc. -> Poké Balls, etc.

	; Regla general por defecto (añade "s" a palabras terminadas en vocal)
	plural "",              "s"              ; Bayas, Piedras, Pepitas, Cuerdas, Cartas, etc.

	setcharmap default
