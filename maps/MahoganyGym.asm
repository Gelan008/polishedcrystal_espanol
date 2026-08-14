MahoganyGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_BOARDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftruefwd .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	givebadge GLACIERBADGE, JOHTO_REGION
	; Begin Team Rocket takeover of Radio Tower
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	setmapscene MAHOGANY_TOWN, SCENE_MAHOGANYTOWN_NOOP
.FightDone:
	checkevent EVENT_GOT_TM67_AVALANCHE
	iftrue_jumpopenedtext PryceText_CherishYourPokemon
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegivetmhm TM_AVALANCHE
	setevent EVENT_GOT_TM67_AVALANCHE
	jumpthisopenedtext

	text "Esa MT contiene"
	line "Alud."

	para "Hace más daño si"
	line "el usuario es he-"
	cont "rido primero."

	para "Demuestra la"
	line "dureza del invier-"
	cont "no."
	done

GenericTrainerSkierRoxanne:
	generictrainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText

	text "Si no patinas"
	line "con precisión,"

	para "no llegarás muy"
	line "lejos aquí."
	done

GenericTrainerSkierClarissa:
	generictrainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText

	text "No debí haber"
	line "alardeado sobre"
	cont "cómo esquío..."
	done

GenericTrainerBoarderRonald:
	generictrainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText

	text "Creo que hay un"
	line "ataque que un"
	cont "#mon"

	para "puede usar mien-"
	line "tras está"
	cont "congelado."
	done

GenericTrainerBoarderBrad:
	generictrainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText

	text "Este Gimnasio mola"
	line "¡Me gusta patinar"
	cont "con mis #mon!"
	done

GenericTrainerBoarderDouglas:
	generictrainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText

	text "El secreto tras el"
	line "poder de Fredo..."

	para "Medita a diario"
	line "bajo una cascada"

	para "para fortalecer"
	line "cuerpo y mente."
	done

MahoganyGymGuyScript:
	checkevent EVENT_BEAT_PRYCE
	iftrue_jumptextfaceplayer MahoganyGymGuyWinText
	jumpthistextfaceplayer

	text "Fredo es un vete-"
	line "rano que ha en-"

	para "trenado #mon"
	line "durante 50 años."

	para "Dicen que es muy"
	line "bueno congelando"

	para "a sus rivales con"
	line "ataques de Hielo."

	para "¡Eso significa"
	line "que debes fun-"

	para "dirlo con tu ar-"
	line "diente ambición!"
	done

MahoganyGymStatue:
	gettrainername PRYCE, 1, STRING_BUFFER_4
	checkflag ENGINE_GLACIERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 14, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

PryceText_Intro:
	text "Los #mon tienen"
	line "muchas experien-"

	para "cias en la vida,"
	line "igual que no-"
	cont "sotros."

	para "Yo también he"
	line "visto y sufrido"
	cont "mucho."

	para "Como soy mayor,"
	line "deja que te ense-"
	cont "ñe a qué me refie-"
	cont "ro."

	para "Llevo con los"
	line "#mon desde"

	para "antes de que tú"
	line "nacieras."

	para "No pierdo tan fá-"
	line "cilmente."

	para "¡Yo, Fredo, el En-"
	line "trenador del In-"

	para "vierno, te mos-"
	line "traré mi poder!"
	done

PryceText_Impressed:
	text "Ah, me impresiona"
	line "tu destreza."

	para "Con esa voluntad,"
	line "sé que superarás"

	para "todos los obstácu-"
	line "los de la vida."

	para "¡Eres digno de es-"
	line "ta Medalla!"
	done

PryceText_GlacierBadgeSpeech:
	text "Esa Medalla permi-"
	line "tirá a tus #mon"

	para "usar Torbellino"
	line "para cruzar los"
	cont "remolinos."

	para "Y esto... ¡Es un"
	line "regalo de mi par-"
	cont "te!"
	done

PryceText_CherishYourPokemon:
	text "Al fundirse hielo"
	line "y nieve, llega la"
	cont "primavera."

	para "Tú y tus #mon"
	line "estaréis juntos"

	para "por muchos años."

	para "¡Atesora vuestro"
	line "tiempo juntos!"
	done

BoarderRonaldSeenText:
	text "¡Congelaré a tus"
	line "#mon, no po-"
	cont "drás hacer nada!"
	done

BoarderRonaldBeatenText:
	text "Maldición. No pu-"
	line "de hacer nada."
	done

BoarderBradSeenText:
	text "Este Gimnasio tie-"
	line "ne el suelo"
	cont "resbaladizo."

	para "Es divertido, ¿a"
	line "que sí?"

	para "Pero oye, ¡aquí"
	line "no estamos para"
	cont "jugar!"
	done

BoarderBradBeatenText:
	text "¿Ves lo en serio"
	line "que vamos?"
	done

BoarderDouglasSeenText:
	text "Conozco el secre-"
	line "to de Fredo."
	done

BoarderDouglasBeatenText:
	text "Vale. Te contaré"
	line "el secreto."
	done

SkierRoxanneSeenText:
	text "Para llegar hasta"
	line "Fredo, nuestro Lí-"
	cont "der,"

	para "debes pensar"
	line "antes de patinar."
	done

SkierRoxanneBeatenText:
	text "¡No perdería con-"
	line "tra ti esquiando!"
	done

SkierClarissaSeenText:
	text "¡Mira mis giros"
	line "en paralelo!"
	done

SkierClarissaBeatenText:
	text "¡No! ¡Me hiciste"
	line "caer!"
	done


MahoganyGymGuyWinText:
	text "Fredo es increí-"
	line "ble, ¡pero tú eres"
	cont "de otro nivel!"

	para "¡Fue un combate"
	line "tan ardiente que"

	para "cerró la brecha"
	line "generacional!"
	done
