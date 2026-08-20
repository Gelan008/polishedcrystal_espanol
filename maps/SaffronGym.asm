SaffronGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 14, SAFFRON_GYM, 18
	warp_event 19, 14, SAFFRON_GYM, 19
	warp_event 19, 10, SAFFRON_GYM, 20
	warp_event  0, 10, SAFFRON_GYM, 21
	warp_event  4,  2, SAFFRON_GYM, 22
	warp_event 11,  4, SAFFRON_GYM, 23
	warp_event  0, 14, SAFFRON_GYM, 24
	warp_event 19,  2, SAFFRON_GYM, 25
	warp_event 15, 16, SAFFRON_GYM, 26
	warp_event  4, 16, SAFFRON_GYM, 27
	warp_event  4,  8, SAFFRON_GYM, 28
	warp_event  8,  2, SAFFRON_GYM, 29
	warp_event 15,  8, SAFFRON_GYM, 30
	warp_event 15,  4, SAFFRON_GYM, 31
	warp_event  0,  4, SAFFRON_GYM, 32
	warp_event 19, 16, SAFFRON_GYM, 3
	warp_event 19,  8, SAFFRON_GYM, 4
	warp_event  0,  8, SAFFRON_GYM, 5
	warp_event  4,  4, SAFFRON_GYM, 6
	warp_event 11,  2, SAFFRON_GYM, 7
	warp_event  0, 16, SAFFRON_GYM, 8
	warp_event 19,  4, SAFFRON_GYM, 9
	warp_event 15, 14, SAFFRON_GYM, 10
	warp_event  4, 14, SAFFRON_GYM, 11
	warp_event  4, 10, SAFFRON_GYM, 12
	warp_event  8,  4, SAFFRON_GYM, 13
	warp_event 15, 10, SAFFRON_GYM, 14
	warp_event 15,  2, SAFFRON_GYM, 15
	warp_event  0,  2, SAFFRON_GYM, 16
	warp_event 11, 10, SAFFRON_GYM, 17
	warp_event  8, 10, SAFFRON_GYM, 3

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerMediumDoris, -1
	object_event  9,  3, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicLeon, -1
	object_event 17,  3, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicJared, -1
	object_event  2,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacLuna, -1
	object_event 17,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHexManiacNatalie, -1
	object_event  2, 15, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicFranklin, -1
	object_event 17, 15, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerMediumRebecca, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_SOULBADGE
	iftruefwd .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_LEON
	setevent EVENT_BEAT_PSYCHIC_JARED
	setevent EVENT_BEAT_HEX_MANIAC_LUNA
	setevent EVENT_BEAT_HEX_MANIAC_NATALIE
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_MEDIUM_REBECCA
	opentext
	givebadge SOULBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue_jumpopenedtext SabrinaFightDoneText
	writetext SabrinaMarshBadgeText
	promptbutton
	verbosegivetmhm TM_PSYCHIC
	setevent EVENT_GOT_TM29_PSYCHIC
	jumpthisopenedtext

	text "La MT29 es"
	line "Psíquico."

	para "Puede bajar la"
	line "Def. Esp. del"
	cont "objetivo."

	para "¡Llegarás a ser un"
	line "Campeón ilustre y"
	cont "admirado!"
	done

GenericTrainerMediumDoris:
	generictrainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText

	text "¡Ostras! Olvidé"
	line "que predije que"
	cont "perdería ante ti."
	done

GenericTrainerPsychicLeon:
	generictrainer PSYCHIC_T, LEON, EVENT_BEAT_PSYCHIC_LEON, PsychicLeonSeenText, PsychicLeonBeatenText

	text "¡El poder de"
	line "Sabrina supera"
	cont "con creces el mío!"
	done

GenericTrainerPsychicJared:
	generictrainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText

	text "El Rey del Kárate,"
	line "maestro del Dojo,"
	cont "fue arrollado por"
	cont "Sabrina."
	done

GenericTrainerHexManiacLuna:
	generictrainer HEX_MANIAC, LUNA, EVENT_BEAT_HEX_MANIAC_LUNA, HexManiacLunaSeenText, HexManiacLunaBeatenText

	text "Alakazam es muy"
	line "poderoso, así que"
	cont "las Brujas usamos"
	cont "su nombre al hacer"
	cont "grandes hechizos."
	done

GenericTrainerHexManiacNatalie:
	generictrainer HEX_MANIAC, NATALIE, EVENT_BEAT_HEX_MANIAC_NATALIE, HexManiacNatalieSeenText, HexManiacNatalieBeatenText

	text "Quizá no sirva"
	line "para ser Bruja…"
	done

GenericTrainerPsychicFranklin:
	generictrainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText

	text "No solo mejoraste"
	line "tu técnica, sino"
	cont "también tu alma."
	done

GenericTrainerMediumRebecca:
	generictrainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText

	text "¿De dónde procede"
	line "tu fuerza?"
	done

SaffronGymGuyScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue_jumptextfaceplayer SaffronGymGuyWinText
	jumpthistextfaceplayer

	text "¡Hola, futuro"
	line "Campeón!"

	para "A alguien tan"
	line "hábil como tú no"
	cont "hace falta decirle"
	cont "cómo luchar"

	para "contra el tipo"
	line "Psíquico, ¿no?"

	para "¡Espero grandes"
	line "cosas de ti!"

	para "¡Buena suerte!"
	done

SaffronGymStatue:
	gettrainername SABRINA, 1, STRING_BUFFER_4
	checkflag ENGINE_SOULBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

SabrinaIntroText:
	text "Sabrina: Sabía que"
	line "vendrías…"

	para "Hace tres años"
	line "tuve una visión de"
	cont "tu llegada."

	para "Vienes a por mi"
	line "Medalla."

	para "No me agrada"
	line "combatir, pero"
	cont "como Líder te daré"
	cont "la Medalla si eres"
	cont "digno."

	para "¡Ya que lo deseas,"
	line "te mostraré mis"
	cont "poderes psíquicos!"
	done

SabrinaWinLossText:
	text "Sabrina: Tu poder…"

	para "Supera con creces"
	line "lo que preví…"

	para "Quizá no se pueda"
	line "predecir el futuro"
	cont "con exactitud…"

	para "Bien, tú ganas."
	line "Te has ganado la"
if DEF(FAITHFUL)
	cont "Medalla Pantano."
else
	cont "Medalla Alma."
endc
	done

SabrinaMarshBadgeText:
	text "Sabrina: No logré"
	line "predecir del todo"
	cont "tu gran fuerza."

	para "Eso significa que"
	line "tu poder supera mi"
	cont "poder psíquico."

	para "¡También mereces"
	line "esta MT!"
	done

SabrinaFightDoneText:
	text "Sabrina: El amor"
	line "por tus #mon"
	cont "ha superado a mi"
	cont "poder psíquico…"

	para "Creo que el poder"
	line "del amor también"
	cont "es una forma de"
	cont "poder psíquico…"
	done

MediumDorisSeenText:
	text "Fufufufu…"
	line "Lo veo con gran"
	cont "claridad."

	para "¡Puedo ver dentro"
	line "de tu alma!"
	done

MediumDorisBeatenText:
	text "Aunque te leí la"
	line "mente, caí en la"
	cont "derrota…"
	done

PsychicLeonSeenText:
	text "¡No podrás hacer"
	line "frente a mi poder"
	cont "psíquico!"
	done

PsychicLeonBeatenText:
	text "Mi predicción no"
	line "fue acertada…"
	done

PsychicJaredSeenText:
	text "El Dojo Kárate de"
	line "al lado fue una"

	para "vez el Gimnasio de"
	line "esta ciudad."
	done

PsychicJaredBeatenText:
	text "No fui rival…"
	done

HexManiacLunaSeenText:
	text "¡Abra, Kadabra,"
	line "Alakazam!"
	done

HexManiacLunaBeatenText:
	text "¿Ha fallado mi"
	line "maldición?"
	done

HexManiacNatalieSeenText:
	text "¡Vamos a luchar!"
	line "¡Juajuajua!"
	done

HexManiacNatalieBeatenText:
	text "Juajua… ¡Cof!"
	done

PsychicFranklinSeenText:
	text "El poder psíquico"
	line "es la fuerza de tu"
	cont "propia alma."
	done

PsychicFranklinBeatenText:
	text "¡Tu alma tiene más"
	line "fuerza que la mía!"
	done

MediumRebeccaSeenText:
	text "¡La fuerza de los"
	line "que has vencido"
	cont "pasa ahora a mí!"
	done

MediumRebeccaBeatenText:
	text "Fuerte…"
	line "Demasiado fuerte…"
	done

SaffronGymGuyWinText:
	text "¡Ha sido un gran"
	line "combate!"
	done
