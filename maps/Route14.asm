Route14_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 15, 12, BGEVENT_JUMPTEXT, Route14SignText

	def_object_events
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanmTrevor, -1
	object_event 11, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmCarter, -1
	object_event 11, 29, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRoy, -1
	object_event 15, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBird_keeperJosh, -1
	object_event  4, 19, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyConnor, -1
	object_event  4, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyTorin, -1
	object_event  4, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyTravis, -1
	object_event  9, 17, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherClarice, -1
	object_event  7,  7, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_KIM, -1
	cuttree_event  4,  9, EVENT_ROUTE_14_CUT_TREE_1
	cuttree_event 10, 18, EVENT_ROUTE_14_CUT_TREE_2
	cuttree_event  3, 25, EVENT_ROUTE_14_CUT_TREE_3
	fruittree_event  5, 12, FRUITTREE_ROUTE_14, CUSTAP_BERRY, PAL_NPC_RED

GenericTrainerPokefanmTrevor:
	generictrainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText

	text "Ojalá pudiera ver"
	line "dónde atrapé a"
	cont "mis #mon…"

	para "¡Ah, si sale en"
	line "sus datos!"
	done

PokefanmTrevorSeenText:
	text "¿Sabías que…?"

	para "Los #mon se"
	line "vuelven más"
	cont "afectuosos si los"
	cont "entrenas en un"
	cont "lugar familiar."
	done

PokefanmTrevorBeatenText:
	text "¿Dónde conocí a"
	line "este Psyduck?"
	done

GenericTrainerPokefanmCarter:
	generictrainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText

	text "Bulbasaur,"
	line "Charmander y"
	cont "Squirtle son muy"
	cont "equilibrados."
	done

PokefanmCarterSeenText:
	text "Me costó mucho"
	line "atrapar a mis"
	cont "amados #mon."
	done

PokefanmCarterBeatenText:
	text "¡Auuuvaaa!"
	done

GenericTrainerBird_keeperRoy:
	generictrainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, Bird_keeperRoySeenText, Bird_keeperRoyBeatenText

	text "¿Tus #mon"
	line "saben Vuelo?"
	cont "¡Qué envidia!"
	done

Bird_keeperRoySeenText:
	text "Mi sueño es volar"
	line "junto a mis"
	cont "#mon pájaro."
	done

Bird_keeperRoyBeatenText:
	text "Puedo soñar, pero"
	line "jamás volaré…"
	done

GenericTrainerBird_keeperJosh:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JOSH, EVENT_BEAT_BIRD_KEEPER_JOSH, .SeenText, .BeatenText

	text "Quizá deba decir"
	line "que soy de peso"
	cont "pesado…"
	done

.SeenText:
	text "¡Por mi peso entro"
	line "en la categoría de"
	cont "peso pluma!"

	para "¿Eh? ¿Cómo que eso"
	line "no suena muy"
	cont "fuerte?"
	done

.BeatenText:
	text "¡He caído como"
	line "una pluma!"
	done

GenericTrainerSchoolboyConnor:
	generictrainer SCHOOLBOY, SCHOOLBOY_CONNOR, EVENT_BEAT_SCHOOLBOY_CONNOR, .SeenText, .BeatenText

	text "Avanza paso a"
	line "paso por el camino."
	cont "Es un gran consejo"
	done

.SeenText:
	text "¡Deseando estoy de"
	line "soltar la Mochila"
	cont "en casa!"
	done

.BeatenText:
	text "Iba con demasiada"
	line "prisa…"
	done

GenericTrainerSchoolboyTorin:
	generictrainer SCHOOLBOY, TORIN, EVENT_BEAT_SCHOOLBOY_TORIN, .SeenText, .BeatenText

	text "¡La próxima vez no"
	line "cometeré fallos!"
	done

.SeenText:
	text "¡Hay que poner en"
	line "práctica lo que"
	cont "aprendes!"
	done

.BeatenText:
	text "Ya veo, ya veo."
	done

GenericTrainerSchoolboyTravis:
	generictrainer SCHOOLBOY, TRAVIS, EVENT_BEAT_SCHOOLBOY_TRAVIS, .SeenText, .BeatenText

	text "¡Debería unirme a"
	line "las tardes de"
	cont "estudio!"
	done

.SeenText:
	text "¿Haces sesiones de"
	line "estudio después"
	cont "de clase?"
	done

.BeatenText:
	text "Qué fuerte eres…"
	done

GenericTrainerTeacherClarice:
	generictrainer TEACHER_F, CLARICE, EVENT_BEAT_TEACHER_CLARICE, .SeenText, .BeatenText

	text "No te confíes por"
	line "ganar. ¡Repasa la"
	cont "lección en casa!"
	done

.SeenText:
	text "¡Que empiece el"
	line "duelo #mon!"
	done

.BeatenText:
	text "¡Bien! Con esto"
	line "termina la clase."
	done

Route14SignText:
	text "Ruta 14"

	para "Ciudad Fucsia -"
	line "Pueblo Lavanda"
	done