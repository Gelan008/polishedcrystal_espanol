Route41_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13, 17, WHIRL_ISLAND_NW, 1
	warp_event 37, 19, WHIRL_ISLAND_NE, 1
	warp_event 13, 37, WHIRL_ISLAND_SW, 1
	warp_event 37, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

	def_object_events
	object_event 57, 14, SPRITE_MARLON, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route41MarlonScript, -1
	object_event 32,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermMathew, -1
	object_event 57, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLewis, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfWendy, -1
	itemball_event 56, 12, SILVER_LEAF, 1, EVENT_ROUTE_41_SILVER_LEAF

	object_const_def
	const ROUTE41_MARLON

Route41MarlonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MARLON_AGAIN
	iftruefwd .Beaten
	checkevent EVENT_BEAT_MARLON
	iffalsefwd .NotYetBattled
	writetext .RematchText
	sjumpfwd .Battle
.NotYetBattled
	checkevent EVENT_INTRODUCED_MARLON
	iftruefwd .Introduced1
	writetext .IntroText
	waitbutton
	setevent EVENT_INTRODUCED_MARLON
.Introduced1
	writetext .ChallengeText
.Battle
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE41_MARLON
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Rematch2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Rematch1
	loadtrainer MARLON, 1
	sjumpfwd .StartBattle
.Rematch1
	loadtrainer MARLON, 2
	sjumpfwd .StartBattle
.Rematch2
	loadtrainer MARLON, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	opentext
.Beaten:
	writetext .AfterText
	waitbutton
	closetext
	setevent EVENT_BEAT_MARLON
	setevent EVENT_BEAT_MARLON_AGAIN
	end

.IntroText:
	text "Ciprián: ¡Uijaaa!"

	para "¿Qué tal? ¡Así que"
	line "tú eres <PLAYER>!"

	para "¡Me llamo Ciprián,"
	line "un hombre del mar!"

	para "¡Mis #mon y yo"
	line "vinimos a nado"
	cont "desde Teselia!"
	done

.ChallengeText:
	text "¡Se te ve fuerte!"
	line "¡Mola!"

	para "¡Deberíamos echar"
	line "un combate ya!"
	done

.RematchText:
	text "¡Ajajá! ¿Qué tal,"
	line "<PLAYER>?"

	para "¡Así que volvemos"
	line "a enfrentarnos!"

	para "¡Te va a arrastrar"
	line "la marea, fijo!"
	done

.RefusedText:
	text "¡Vaya, qué corte!"
	done

.SeenText:
	text "¡Eso es, vamos con"
	line "todo!"
	done

.BeatenText:
	text "¡Fue alucinante"
	line "lo bien que lo has"
	cont "hecho!"

	para "¡Dominas esto de"
	line "ser entrenador!"
	done

.AfterText:
	text "No solo pareces de"
	line "lo más fuerte,"

	para "¡es que lo eres de"
	line "verdad!"

	para "¡Caray, a mí la"
	line "corriente también"
	cont "me ha arrastrado!"
	done

GenericTrainerSwimmerfKaylee:
	generictrainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText

	text "Dicen que hay un"
	line "gran #mon en el"
	cont "fondo de las"
	cont "Islas Remolino."

	para "¿Cuál podrá ser?"
	done

GenericTrainerSwimmerfSusie:
	generictrainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText

	text "¿Había una famosa"
	line "canción sobre un"
	cont "chico a lomos"
	cont "de un Lapras?"
	done

GenericTrainerSwimmerfDenise:
	generictrainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText

	text "Quemarse con el"
	line "sol es muy malo"
	cont "para la piel."

	para "Pero no uso crema"
	line "solar para no"
	cont "ensuciar el agua."
	done

GenericTrainerSwimmerfKara:
	generictrainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText

	text "He oído rugidos"
	line "desde el interior"
	cont "de las Islas."
	done

GenericTrainerSwimmerfWendy:
	generictrainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText

	text "Bandadas de Staryu"
	line "brillan a la vez."

	para "Es tan hermoso que"
	line "hasta da miedo."
	done

GenericTrainerSwimmermCharlie:
	generictrainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText

	text "¿A que relaja"
	line "flotar así en"
	cont "el agua?"
	done

GenericTrainerSwimmermGeorge:
	generictrainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText

	text "Ciudad Orquídea"
	line "está lejísimos."

	para "Volver a Olivo"
	line "tampoco es fácil."

	para "¿Qué debería"
	line "hacer?"
	done

GenericTrainerSwimmermBerke:
	generictrainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText

	text "En una oscura"
	line "noche de tormenta…"

	para "vi un gran #mon"
	line "volar desde las"
	cont "islas."

	para "Soltaba plumas de"
	line "sus alas de plata."
	done

GenericTrainerSwimmermKirk:
	generictrainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText

	text "Las corrientes no"
	line "me dejan llegar a"
	cont "esa isla."
	done

GenericTrainerSwimmermMathew:
	generictrainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText

	text "Un secreto de las"
	line "Islas Remolino…"

	para "¡Dentro no se ve"
	line "nada de nada!"
	done

GenericTrainerSwimmermLewis:
	generictrainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText

	text "Hacen falta saber"
	line "y experiencia"

	para "para no perderse"
	line "en el agua."
	done

SwimmermCharlieSeenText:
	text "El agua no está"
	line "fría. Tengo el"
	cont "cuerpo a punto."

	para "¡Claro que acepto"
	line "tu reto!"
	done

SwimmermCharlieBeatenText:
	text "¡Ay! ¡Se me ha"
	line "arrugado la piel!"
	done

SwimmermGeorgeSeenText:
	text "Estoy agotado. Si"
	line "gano, ¡me dejas a"
	cont "tu #mon!"
	done

SwimmermGeorgeBeatenText:
	text "Uff, uff…"
	done

SwimmermBerkeSeenText:
	text "¿Ves esas islas"
	line "rodeadas por"
	cont "remolinos?"

	para "¡Tiene que haber"
	line "algún secreto!"
	done

SwimmermBerkeBeatenText:
	text "¿Cuál es el gran"
	line "secreto que usas?"
	done

SwimmermKirkSeenText:
	text "Aquí las olas son"
	line "muy bravas."

	para "Te cansan mucho al"
	line "nadar."
	done

SwimmermKirkBeatenText:
	text "¡Estoy agotado!"
	done

SwimmermMathewSeenText:
	text "¿Buscas los"
	line "secretos de las"
	cont "Islas Remolino?"
	done

SwimmermMathewBeatenText:
	text "¡Vaya, cuánta"
	line "resistencia!"
	done

SwimmermLewisSeenText:
	text "¡En el mar estoy"
	line "como en casa!"
	done

SwimmermLewisBeatenText:
	text "¿Derrotado en mi"
	line "propia casa?"
	done

SwimmerfKayleeSeenText:
	text "Voy de camino a"
	line "Islas Remolino."

	para "Iré a explorar con"
	line "mis amigos."
	done

SwimmerfKayleeBeatenText:
	text "¿Así es como se"
	line "hace?"
	done

SwimmerfSusieSeenText:
	text "¡Qué porte tienes"
	line "al montar a tu"
	cont "#mon!"
	done

SwimmerfSusieBeatenText:
	text "¡Qué chasco…!"
	done

SwimmerfDeniseSeenText:
	text "¡Hace tan buen"
	line "tiempo que estoy"
	cont "en las nubes!"
	done

SwimmerfDeniseBeatenText:
	text "¡Ooooh!"
	done

SwimmerfKaraSeenText:
	text "Si te cansas, haz"
	line "la bicicleta en el"
	cont "agua."

	para "Así tomarás aire"
	line "para seguir con"
	cont "fuerza."
	done

SwimmerfKaraBeatenText:
	text "¡Oh! Tienes más"
	line "energía que yo."
	done

SwimmerfWendySeenText:
	text "De noche, varios"
	line "Staryu flotan en"
	cont "la superficie."
	done

SwimmerfWendyBeatenText:
	text "Vaya, vaya…"
	done
