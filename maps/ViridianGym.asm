ViridianGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6, 43, VIRIDIAN_CITY, 1
	warp_event  7, 43, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4, 41, BGEVENT_READ, ViridianGymStatue
	bg_event  9, 41, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  7,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  8, 41, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 33, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoAraandbela1, -1
	object_event  6, 33, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoAraandbela2, -1
	object_event  3, 32, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfSalma, -1
	object_event  3, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfBonita, -1
	object_event  6,  8, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoElanandida1, -1
	object_event  7,  8, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerAceDuoElanandida2, -1

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftruefwd .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ACE_DUO_ARA_AND_BELA
	setevent EVENT_BEAT_COOLTRAINERF_SALMA
	setevent EVENT_BEAT_COOLTRAINERF_BONITA
	setevent EVENT_BEAT_ACE_DUO_ELAN_AND_IDA
	opentext
	givebadge EARTHBADGE, KANTO_REGION
	setevent EVENT_FINAL_BATTLE_WITH_LYRA
.FightDone:
	checkevent EVENT_GOT_TM71_STONE_EDGE
	iftrue_jumpopenedtext LeaderBlueEpilogueText
	writetext LeaderBlueAfterText
	promptbutton
	verbosegivetmhm TM_STONE_EDGE
	setevent EVENT_GOT_TM71_STONE_EDGE
	jumpthisopenedtext

	text "Contiene Roca"
	line "Afilada. No solo"
	cont "sirve para #mon"
	cont "de tipo Roca, ¿eh?"

	para "…"

	para "Vale, me confundí."
	line "Eres muy fuerte."
	cont "Un gran rival."

	para "Con ocho Medallas"
	line "de Kanto, puedes"
	cont "ir al Alto Mando."

	para "No tendrán piedad"
	line "con quien venció"
	cont "en dos regiones."

	para "Puedes practicar"
	line "conmigo en el Dojo"
	cont "Kárate de Azafrán"
	cont "los lunes."

	para "Todos los Líderes"
	line "de Gimnasio van"
	cont "allí a entrenar."

	para "Pienso ganarte"
	line "algún día."

	para "¡Que no se te"
	line "olvide!"
	done

ViridianGymGuyScript:
	checkevent EVENT_BEAT_BLUE
	iftrue_jumptextfaceplayer ViridianGymGuyWinText
	jumpthistextfaceplayer

	text "¡Hola, futuro"
	line "Campeón!"

	para "¿Cómo va eso?"
	line "Parece que estás"
	cont "en racha."

	para "El Líder luchó"
	line "contra el Campeón"
	cont "hace tres años."

	para "¡No es un rival"
	line "nada fácil!"

	para "¡Da todo lo que"
	line "tengas!"
	done

GenericTrainerAceDuoAraandbela1:
	generictrainer ACE_DUO, ARAANDBELA1, EVENT_BEAT_ACE_DUO_ARA_AND_BELA, AceDuoAraandbela1SeenText, AceDuoAraandbela1BeatenText

	text "Ara: Debería ser"
	line "buena compañera de"
	cont "práctica…"
	done

GenericTrainerAceDuoAraandbela2:
	generictrainer ACE_DUO, ARAANDBELA2, EVENT_BEAT_ACE_DUO_ARA_AND_BELA, AceDuoAraandbela2SeenText, AceDuoAraandbela2BeatenText

	text "Bela: Entrenar no"
	line "nos preparó para"
	cont "esto."
	done

GenericTrainerCooltrainerfSalma:
	generictrainer COOLTRAINERF, SALMA, EVENT_BEAT_COOLTRAINERF_SALMA, CooltrainerfSalmaSeenText, CooltrainerfSalmaBeatenText

	text "¡Hay muchos"
	line "Gimnasios por el"
	cont "mundo, este es"
	cont "mi favorito!"
	done

GenericTrainerCooltrainerfBonita:
	generictrainer COOLTRAINERF, BONITA, EVENT_BEAT_COOLTRAINERF_BONITA, CooltrainerfBonitaSeenText, CooltrainerfBonitaBeatenText

	text "Parece que aún"
	line "te queda algo"
	cont "de energía."
	done

GenericTrainerAceDuoElanandida1:
	generictrainer ACE_DUO, ELANANDIDA1, EVENT_BEAT_ACE_DUO_ELAN_AND_IDA, AceDuoElanandida1SeenText, AceDuoElanandida1BeatenText

	text "Elan: ¡Eres más"
	line "fuerte de lo que"
	cont "esperábamos!"
	done

GenericTrainerAceDuoElanandida2:
	generictrainer ACE_DUO, ELANANDIDA2, EVENT_BEAT_ACE_DUO_ELAN_AND_IDA, AceDuoElanandida2SeenText, AceDuoElanandida2BeatenText

	text "Ida: Si solo usas"
	line "fuerza bruta, no"
	cont "llegarás lejos."

	para "¡La estrategia"
	line "también cuenta!"
	done

ViridianGymStatue:
	gettrainername BLUE, 1, STRING_BUFFER_4
	checkflag ENGINE_EARTHBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "Azul: ¡Hola! Por"
	line "fin llegas, ¿eh?"

	para "En Isla Canela no"
	line "estaba de humor,"

	para "pero ya estoy"
	line "listo para luchar."

	para "…"

	para "¿Dices que has"
	line "vencido en todos"
	cont "los Gimnasios de"
	cont "Johto?"

	para "¡Ja! Vaya birria"
	line "de Gimnasios deben"
	cont "de ser entonces."

	para "No te preocupes"
	line "por eso."

	para "Ahora mismo veré"
	line "si eres bueno o no"
	cont "al combatir."

	para "¿Listo, Campeón"
	line "de Johto?"
	done

LeaderBlueWinText:
	text "Azul: ¿Qué?"

	para "¿Cómo demonios he"
	line "podido perder?"

	para "…"

	para "Tch, de acuerdo…"
	line "Toma, quédatelo:"

	para "es la Medalla"
	line "Tierra."
	done

LeaderBlueAfterText:
	text "Azul: ¡Toma esto"
	line "también!"
	done

LeaderBlueEpilogueText:
	text "Azul: Oye, tú."

	para "Más te vale no"
	line "perder hasta que"
	cont "te gane yo, ¿eh?"
	done

ViridianGymGuyWinText:
	text "¡Vaya, qué batalla"
	line "más fiera!"

	para "Ha sido algo de lo"
	line "más inspirador."

	para "Casi se me saltan"
	line "las lágrimas."
	done

AceDuoAraandbela1SeenText:
	text "Ara: ¡Vamos, lucha"
	line "y mira lo buenos"
	cont "que somos!"
	done

AceDuoAraandbela1BeatenText:
	text "Ara: ¡Nos han"
	line "engañado!"
	done

AceDuoAraandbela2SeenText:
	text "Bela: ¡Pelea y ve"
	line "lo buenos que"
	cont "somos!"
	done

AceDuoAraandbela2BeatenText:
	text "Bela: ¡Nos han"
	line "engañado!"
	done

CooltrainerfSalmaSeenText:
	text "¿Qué te parece?"

	para "¿A que nunca has"
	line "visto un Gimnasio"
	cont "tan fantástico?"
	done

CooltrainerfSalmaBeatenText:
	text "¡Bah, da igual!"
	done

CooltrainerfBonitaSeenText:
	text "¿No te marea mirar"
	line "alrededor de esta"
	cont "sala?"
	done

CooltrainerfBonitaBeatenText:
	text "Todos mis #mon…"

	para "Están mareados y"
	line "debilitados…"
	done

AceDuoElanandida1SeenText:
	text "Elan: ¡Muy bien,"
	line "que empiece este"
	cont "combate!"
	done

AceDuoElanandida1BeatenText:
	text "Elan: Vaya, qué"
	line "gran sorpresa."
	done

AceDuoElanandida2SeenText:
	text "Ida: ¡Soy Ida! ¡Y"
	line "el de al lado es"
	cont "Elan!"

	para "¡Juntos somos la"
	line "Pareja Guay!"
	done

AceDuoElanandida2BeatenText:
	text "Ida: Vaya. No lo"
	line "haces nada mal."
	done
