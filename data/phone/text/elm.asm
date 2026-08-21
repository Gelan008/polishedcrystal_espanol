ElmPhoneStartText:
	text "¿Hola, <PLAYER>?"

	para "No te esfuerces"
	line "demasiado."

	para "Asegúrate de curar"
	line "a tus #mon si"
	cont "están heridos."
	done

ElmPhoneSawMrPokemonText:
	text "¿Hola, <PLAYER>?"

	para "¿Conociste a Mr."
	line "#mon? ¡Genial!"
	cont "¡Vuelve a salvo!"
	done

ElmPhonePokemonStolenText:
	text "¿<PLAYER>? Estoy"
	line "muy enfadado."

	para "Nos han robado un"
	line "#mon de aquí."

	para "¿Cómo ha podido"
	line "alguien hacer eso?"
	prompt

ElmPhoneCheckingEggText:
	text "¿Hola, <PLAYER>?"

	para "Seguimos revisando"
	line "el Huevo. ¡Parece"
	cont "un Huevo #mon!"
	prompt

ElmPhoneAssistantText:
	text "¿Hola, <PLAYER>?"

	para "¿Viste a mi"
	line "ayudante?"

	para "Está en el Centro"
	line "#mon de"
	cont "Ciudad Malva."
	done

ElmPhoneEggUnhatchedText:
	text "¿Hola, <PLAYER>?"

	para "¿Cómo va el Huevo?"
	line "¿Algún cambio?"

	para "Si pasa algo,"
	line "por favor, llama."
	prompt

ElmPhoneEggHatchedText:
	text "¿Hola, <PLAYER>?"
	line "¿Cómo va el Huevo?"

	para "¿Qué? ¿Se ha"
	line "abierto? ¡Guau!"
	cont "¿Qué tipo de"
	cont "#mon es?"

	para "¡Por favor, ven y"
	line "enséñamelo ya!"
	prompt

ElmPhoneDiscovery1Text:
	text "¿Hola, <PLAYER>?"

	para "¡He hecho un nuevo"
	line "descubrimiento!"

	para "El tiempo en abrir"
	line "un Huevo depende"
	cont "de cada #mon."
	prompt

ElmPhoneDiscovery2Text:
	text "¿Hola, <PLAYER>?"

	para "Aún es un misterio"
	line "qué movimientos"
	cont "tienen las crías."

	para "¡Lo estamos"
	line "investigando!"
	prompt

ElmPhonePokerusText:
	text "¿Hola, <PLAYER>?"

	para "He descubierto"
	line "algo muy raro."

	para "Al parecer hay"
	line "algo llamado"
	cont "#rus que"
	cont "infecta #mon."

	para "Sí, es como un"
	line "virus, de ahí el"
	cont "nombre #rus."

	para "Se multiplica muy"
	line "rápido e infecta a"
	cont "otros #mon. Y"
	cont "ya está."

	para "No parece hacer"
	line "nada más y"
	cont "desaparece con"
	cont "el tiempo."

	para "Supongo que no"
	line "hay de qué"
	cont "preocuparse."
	
	para "¡Adiós!"
	done

ElmPhoneDisasterText:
	text "¿H-hola, <PLAYER>?"
	line "¡Es un desastre!"

	para "¡Ay! ¡Es"
	line "terrible!"

	para "¿Qué debería"
	line "hacer? Oh, no…"

	para "¡Por favor, vuelve"
	line "aquí cuanto antes!"
	done

ElmPhoneEggAssistantText:
	text "¿Hola, <PLAYER>?"
	line "¡Descubrimos algo"
	cont "sobre el Huevo!"

	para "Mi ayudante está"
	line "en el Centro"
	cont "#mon de"
	cont "Ciudad Malva."

	para "¿Puedes ir a"
	line "hablar con él?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, ¿cómo te"
	line "van las cosas?"

	para "Pasa algo raro con"
	line "las emisiones de"
	cont "la radio."

	para "Estaban hablando"
	line "del Team Rocket."

	para "<PLAYER>, ¿sabes"
	line "algo sobre esto?"

	para "Quizá el Team"
	line "Rocket ha vuelto…"

	para "No, no puede ser"
	line "cierto."

	para "Siento molestarte."
	line "¡Cuídate!"
	done

ElmPhoneGiftText:
	text "¿Hola, <PLAYER>?"

	para "Tengo algo para"
	line "darte."

	para "¿Podrías venir a"
	line "mi Laboratorio?"

	para "¡Nos vemos!"
	done

ElmPhoneEvolutionQuestionText:
	text "Por cierto,"
	line "<PLAYER>, ¿quieres"

	para "saber cómo"
	line "evoluciona tu"
	cont "#mon?"
	done

ElmPhoneEvoText_None:
	text "Bueno, "
	text_ram wStringBuffer3
	line "¡no evoluciona!"
	prompt

ElmPhoneEvoText_Level:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "alcanzar el"
	cont "nivel "
	text_decimal wStringBuffer4, 1, 3
	text "."
	prompt

ElmPhoneEvoText_Item:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "usar en él"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeNoItem:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "intercambiarlo,"
	cont "o usando"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeWithItem:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "intercambiarlo,"

	para "o al subir de"
	line "nivel si lleva"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"
	cont "si lleva"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding_MornDay:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"
	cont "si lleva"
	cont ""
	text_ram wStringBuffer4
	text ","

	para "pero solo por la"
	line "mañana o de día."
	prompt

ElmPhoneEvoText_Holding_EveNite:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"
	cont "si lleva"
	cont ""
	text_ram wStringBuffer4
	text ","

	para "pero al atardecer"
	line "o por la noche."
	prompt

ElmPhoneEvoText_Happiness:
	text_ram wStringBuffer3
	line "evoluciona cuando"
	cont "es muy feliz."
	prompt

ElmPhoneEvoText_Happiness_MornDay:
	text_ram wStringBuffer3
	line "evoluciona cuando"
	cont "es muy feliz,"

	para "pero solo por la"
	line "mañana o de día."
	prompt

ElmPhoneEvoText_Happiness_EveNite:
	text_ram wStringBuffer3
	line "evoluciona cuando"
	cont "es muy feliz,"

	para "pero al atardecer"
	line "o por la noche."
	prompt

ElmPhoneEvoText_Stat:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "nivel "
	text_decimal wStringBuffer4, 1, 3
	text ", pero"

	para "depende de sus"
	line "puntos de Ataque"
	cont "y Defensa."
	prompt

ElmPhoneEvoText_Location:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel en"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Move:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel si"
	cont "conoce el ataque"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Crit:
	text_ram wStringBuffer3
	line "evoluciona tras"
	cont "dar tres golpes"
	cont "críticos en el"
	cont "mismo combate."
	prompt

ElmPhoneEvoText_Party:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"
	cont "si tienes a"
	cont ""
	text_ram wStringBuffer4
	text " en"
	cont "tu equipo."
	prompt

ElmPhoneEvoText_Egg:
	text "¡Los Huevos no"
	line "evolucionan,"
	cont "eclosionan!"
	prompt

ElmPhoneEvoText_Pikachu:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "usar PiedraTrueno"
	cont "o Estatua Rara."
	prompt

ElmPhoneEvoText_Gloom:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "usar PiedraHoja"
	cont "o PiedraSolar."
	prompt

ElmPhoneEvoText_Poliwhirl:
	text_ram wStringBuffer3
	line "evoluciona con"
	cont "una PiedraAgua,"

	para "o llevando una"
	line "Roca del Rey al"
	cont "intercambiarlo"
	cont "o subir de nivel."
	prompt

ElmPhoneEvoText_SlowpokePlain:
ElmPhoneEvoText_SlowpokeGalarian:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "nivel 37, o bien"

	para "con Roca del Rey"
	line "al intercambiarlo"
	cont "o subir de nivel."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "usar PiedraTrueno,"

	para "o al subir de"
	line "nivel en un campo"
	cont "magnético."

	para "Dicen que hay uno"
	line "en Magnetotrén y"
	cont "en Cueva Tenue."
	prompt

ElmPhoneEvoText_Exeggcute:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "usar PiedraHoja"
	cont "o Estatua Rara."
	prompt

ElmPhoneEvoText_Koffing:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "nivel 35, o si"

	para "lleva Carbón"
	line "al intercambiar"
	cont "o subir de nivel."
	prompt

ElmPhoneEvoText_Cubone:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "nivel 28 o con"
	cont "una Estatua Rara."
	prompt

ElmPhoneEvoText_Scyther:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "llevando un"
	line "RevMetálico o una"
	cont "Piedra Dura."

	para "El RevMetálico"
	line "también vale con"
	cont "intercambios."
	prompt

ElmPhoneEvoText_Eevee:
	text_ram wStringBuffer3
	line "evoluciona de"
	cont "muchas formas."

	para "Con 8 Piedras"
	line "distintas, o"
	cont "junto a RocaMusgo"
	cont "o RocaHielo."

	para "He oído que están"
	line "en el Encinar y en"
	cont "la Ruta Helada."

	para "Además, Eevee"
	line "evolucionará con"
	cont "el sol o la luna"
	cont "si es muy feliz."
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "usar PiedraHielo,"

	para "o al subir de"
	line "nivel junto a"
	cont "una RocaHielo."

	para "Hay una de ellas"
	line "en Ruta Helada."
	prompt

ElmPhoneEvoText_Stantler:
	text_ram wStringBuffer3
	line "evoluciona si se"
	cont "expone a granizo"
	cont "o arena extremos."

	para "Dicen que en"
	line "Cam Pedregoso y en"
	cont "Cumbre Nevada"
	cont "tienen ese clima."
	prompt

ElmPhoneEvoText_AncientSinnoh:
	text "Por sus ancestros,"
	line "puede evolucionar"
	cont "si rememora la"
	cont "antigua Sinnoh…"
	prompt

ElmPhoneEvoText_DunsparceSegments:
	text "Algunos acaban"
	line "siendo más largos"
	cont "que otros."

	para "Está en sus"
	line "genes."
	prompt

ElmPhoneEvolutionRefusedText:
	text "Siento molestarte"
	line "entonces."
	prompt

ElmPhoneEndText:
	text "¡Cuídate!"
	done
