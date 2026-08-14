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

	para "Estamos revisando"
	line "el Huevo. En"

	para "efecto, parece un"
	line "Huevo #mon."
	prompt

ElmPhoneAssistantText:
	text "¿Hola, <PLAYER>?"

	para "¿Viste a mi ayu-"
	line "dante? Está en el"

	para "Centro #mon de"
	line "Ciudad Malva."
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

	para "¿Qué? ¿Ha eclosio-"
	line "nado? ¡Guau! ¿Qué"
	cont "tipo de #mon"
	cont "es?"

	para "¡Por favor, ven y"
	line "enséñamelo ya!"
	prompt

ElmPhoneDiscovery1Text:
	text "¿Hola, <PLAYER>?"

	para "Acabo de hacer un"
	line "nuevo descubri-"
	cont "miento."

	para "El tiempo que"
	line "tarda un Huevo en"

	para "eclosionar depen-"
	line "de del #mon."
	prompt

ElmPhoneDiscovery2Text:
	text "¿Hola, <PLAYER>?"

	para "Aún es un miste-"
	line "rio los movimien-"

	para "tos que tienen"
	line "los recién"
	cont "nacidos."

	para "Lo estamos in-"
	line "vestigando."
	prompt

ElmPhonePokerusText:
	text "¿Hola, <PLAYER>?"

	para "He descubierto"
	line "algo muy raro."

	para "Al parecer hay"
	line "algo llamado"

	para "#rus que"
	line "infecta #mon."

	para "Sí, es como un"
	line "virus, de ahí el"
	cont "nombre #rus."

	para "Se multiplica muy"
	line "rápido e infecta a"

	para "otros #mon. Y"
	line "ya está."

	para "No parece hacer"
	line "nada más y"

	para "desaparece con"
	line "el tiempo."

	para "Supongo que no"
	line "hay de qué preocu-"
	cont "parse. ¡Adiós!"
	done

ElmPhoneDisasterText:
	text "¿H-hola, <PLAYER>?"
	line "¡Es un desastre!"

	para "¡Ay! ¡Es"
	line "terrible!"

	para "¿Qué debería"
	line "hacer? Oh, no..."

	para "¡Por favor, vuelve"
	line "aquí cuanto antes!"
	done

ElmPhoneEggAssistantText:
	text "¿Hola, <PLAYER>?"
	line "¡Hemos descubierto"

	para "algo sobre el"
	line "Huevo!"

	para "Mi ayudante está"
	line "en el Centro"

	para "#mon de"
	line "Ciudad Malva."
	cont "¿Puedes hablar"
	cont "con él?"
	done

ElmPhoneRocketText:
	text "<PLAYER>, ¿cómo te"
	line "van las cosas?"

	para "Te llamo porque"
	line "pasa algo raro con"

	para "las emisiones de"
	line "la radio."

	para "Estaban hablando"
	line "del Team Rocket."

	para "<PLAYER>, ¿sabes"
	line "algo sobre esto?"

	para "Quizás el Team"
	line "Rocket ha vuelto."

	para "No, no puede ser"
	line "cierto."

	para "Siento molestarte."
	line "¡Cuídate!"
	done

ElmPhoneGiftText:
	text "¿Hola, <PLAYER>?"

	para "Tengo algo para"
	line "ti."

	para "¿Podrías pasarte"
	line "por mi Labora-"
	cont "torio?"

	para "¡Nos vemos!"
	done

ElmPhoneEvolutionQuestionText:
	text "Por cierto,"
	line "<PLAYER>, ¿quieres"

	para "saber cómo evolu-"
	line "ciona tu #mon?"
	done

ElmPhoneEvoText_None:
	text "Bueno, "
	text_ram wStringBuffer3
	line "¡no evoluciona!"
	prompt

ElmPhoneEvoText_Level:
	text_ram wStringBuffer3
	line "evoluciona al al-"
	cont "canzar el nivel "
	text_decimal wStringBuffer4, 1, 3
	text "."
	prompt

ElmPhoneEvoText_Item:
	text_ram wStringBuffer3
	line "evoluciona cuan-"

	para "do se le da"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeNoItem:
	text_ram wStringBuffer3
	line "evoluciona"

	para "al intercambiarlo,"
	line "o dándole"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_TradeWithItem:
	text_ram wStringBuffer3
	line "evoluciona"

	para "al intercambiarlo,"
	line "o al subir de"
	cont "nivel llevando"
	cont ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "si lleva"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Holding_MornDay:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "si lleva"
	line ""
	text_ram wStringBuffer4
	text ","

	para "pero solo de ma-"
	line "ñana o de día."
	prompt

ElmPhoneEvoText_Holding_EveNite:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "si lleva"
	line ""
	text_ram wStringBuffer4
	text ","

	para "pero solo al a-"
	line "tardecer o noche."
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

	para "pero solo de ma-"
	line "ñana o de día."
	prompt

ElmPhoneEvoText_Happiness_EveNite:
	text_ram wStringBuffer3
	line "evoluciona cuando"
	cont "es muy feliz,"

	para "pero solo al a-"
	line "tardecer o noche."
	prompt

ElmPhoneEvoText_Stat:
	text_ram wStringBuffer3
	line "evoluciona al ni-"
	cont "vel "
	text_decimal wStringBuffer4, 1, 3
	text ", pero la"

	para "evolución depen-"
	line "de de sus stats"

	para "de Ataque y"
	line "Defensa."
	prompt

ElmPhoneEvoText_Location:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "subir de nivel en"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Move:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "subir de nivel"
	line "mientras sabe"

	para "cómo usar"
	line ""
	text_ram wStringBuffer4
	text "."
	prompt

ElmPhoneEvoText_Crit:
	text_ram wStringBuffer3
	line "evoluciona tras"

	para "dar tres golpes"
	line "críticos en el"
	cont "mismo combate."
	prompt

ElmPhoneEvoText_Party:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "subir de nivel"

	para "mientras tienes"
	line "a "
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

	para "exponerse a una"
	line "PiedraTrueno o"
	cont "una Estatua Rara."
	prompt

ElmPhoneEvoText_Gloom:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a una"
	line "PiedraHoja o una"
	cont "PiedraSolar."
	prompt

ElmPhoneEvoText_Poliwhirl:
	text_ram wStringBuffer3
	line "evoluciona con"

	para "una PiedraAgua,"
	line "o si lleva una"

	para "Roca del Rey al"
	line "intercambiarlo"

	para "o al subir de"
	line "nivel."
	prompt

ElmPhoneEvoText_SlowpokePlain:
ElmPhoneEvoText_SlowpokeGalarian:
	text_ram wStringBuffer3
	line "evoluciona al"
	cont "nivel 37, o si"

	para "lleva Roca del Rey"
	line "al ser intercam-"
	cont "biado o al subir."
	prompt

ElmPhoneEvoText_Magneton:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "usar PiedraTrueno,"
	line "o cuando sube de"

	para "nivel en un cam-"
	line "po magnético."

	para "He oído que el"
	line "Magnetotrén y"
	cont "Cueva¯Tenue lo son"
	prompt

ElmPhoneEvoText_Exeggcute:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "exponerse a una"
	line "PiedraHoja o una"
	cont "Estatua Rara."
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
	line "evoluciona al ni-"
	cont "vel 28 o usando"

	para "una Estatua Rara."
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

	para "Puede exponerse"
	line "a 8 Piedras"
	cont "diferentes, o"

	para "subir de nivel"
	line "junto a RocaMusgo"
	cont "o Rocahielo."

	para "He oído que en"
	line "Encinar y en Ruta"
	cont "Helada las tienen."

	para "Además, Eevee"
	line "evolucionará con"

	para "el sol o la luna"
	line "si es muy feliz."
	prompt

ElmPhoneEvoText_MimeJr:
	text_ram wStringBuffer3
	line "evoluciona al"

	para "usar una"
	line "PiedraHielo, o"

	para "al subir de"
	line "nivel junto a un"
	cont "RocaHielo."

	para "He oído que hay"
	line "una en Ruta Helada"
	prompt

ElmPhoneEvoText_Stantler:
	text_ram wStringBuffer3
	line "evoluciona si se"

	para "expone a granizo"
	line "o arena extremos."

	para "Dicen que en"
	line "Cam Pedregoso y en"

	para "Cumbre Nevada"
	line "tienen ese clima."
	prompt

ElmPhoneEvoText_AncientSinnoh:
	text "Pero, por sus"
	line "antepasados,"

	para "podría evolucionar"
	line "si recuerda"

	para "la antigua Sinnoh…"
	line "de algún modo…"
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
