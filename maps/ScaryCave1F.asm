ScaryCave1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33, 31, URAGA_CHANNEL_EAST, 1
	warp_event 11, 31, URAGA_CHANNEL_WEST, 1
	warp_event 20, 30, SCARY_CAVE_B1F, 1
	warp_event 34, 10, SCARY_CAVE_B1F, 2
	warp_event  9,  1, SCARY_CAVE_SHIPWRECK, 1

	def_coord_events

	def_bg_events
	bg_event 34,  3, BGEVENT_ITEM + MAX_ELIXIR, EVENT_SCARY_CAVE_1F_HIDDEN_MAX_ELIXIR
	bg_event 18, 28, BGEVENT_ITEM + PEARL_STRING, EVENT_SCARY_CAVE_1F_HIDDEN_PEARL_STRING
	bg_event 30, 29, BGEVENT_ITEM + PEARL, EVENT_SCARY_CAVE_1F_HIDDEN_PEARL

	def_object_events
	object_event 15,  5, SPRITE_MIRA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScaryCave1FMiraScript, EVENT_SCARY_CAVE_MIRA
	object_event  8, 24, SPRITE_BURGLAR, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, ScaryCave1FPharmacistScript, -1
	object_event 36,  2, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRuin_maniacSmilte, -1
	object_event  8, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSuper_nerdKouta, -1
	object_event 22, 20, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, TrainerCoupleJoeandjo1, -1
	object_event 23, 20, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_RED, OBJECTTYPE_TRAINER, 1, TrainerCoupleJoeandjo2, -1
	object_event 37, 16, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHex_maniacBethany, -1
	object_event 36, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerScientistPiotr, -1
	itemball_event 27,  7, X_SP_DEF, 1, EVENT_SCARY_CAVE_1F_X_SP_DEF
	itemball_event  4,  9, DUSK_STONE, 1, EVENT_SCARY_CAVE_1F_DUSK_STONE
	itemball_event 33, 19, HYPER_POTION, 1, EVENT_SCARY_CAVE_1F_HYPER_POTION
	itemball_event 28, 23, MAX_REPEL, 1, EVENT_SCARY_CAVE_1F_MAX_REPEL
	itemball_event  3, 29, REVIVE, 1, EVENT_SCARY_CAVE_1F_REVIVE

	object_const_def
	const SCARYCAVE1F_MIRA

ScaryCave1FMiraScript:
	faceplayer
	checkevent EVENT_BEAT_MIRA
	iftruefwd .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SCARYCAVE1F_MIRA
	loadtrainer MIRA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MIRA
.Beaten
	opentext
	writetext .ItemText
	promptbutton
	verbosegiveitem POWER_LENS
	iffalse_endtext
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SCARYCAVE1F_MIRA
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_MIRA
	end

.ChallengeText:
	text "Soy Maiza…"
	line "Estaba atrapando"

	para "#mon, pero esta"
	line "cueva da mucho"
	cont "miedo…"

	para "Quiero ser más"
	line "fuerte para no ser"
	cont "tan miedica."

	para "¡Por favor! ¡Lucha"
	line "conmigo!"
	done

.YesText:
	text "¡Sí! ¡Maiza te"
	line "enseñará sus"
	cont "#mon!"
	done

.NoText:
	text "Maiza está triste…"
	done

.BeatenText:
	text "¡Maiza quiere ser"
	line "mucho más fuerte,"
	cont "como <PLAYER>!"
	done

.ItemText:
	text "<PLAYER>, ¿te has"
	line "hecho tan fuerte"

	para "por estar siempre"
	line "junto a tus"
	cont "#mon?"

	para "¡Sí! ¡Tiene que"
	line "ser por eso!"

	para "¡Maiza empieza a"
	line "entenderlo!"

	para "¡Muchas gracias,"
	line "<PLAYER>!"

	para "¡Maiza quiere que"
	line "te quedes esto!"
	done

.GoodbyeText:
	text "¡Maiza se esforza-"
	line "rá como tú,"
	cont "<PLAYER>!"

	para "¡Me haré fuerte en"
	line "la Torre Batalla!"

	para "¡Adiós, <PLAYER>!"
	done

ScaryCave1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
.HeardIntro:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval SUCKER_PUNCH
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Es tu funeral."
	done

.IntroText:
	text "Los Fantasmas son"
	line "expertos en golpes"
	cont "bajos."

	para "¡La única forma"
	line "de vencerlos es"
	cont "golpear primero!"

	para "¡Dales una buena"
	line "sorpresa con un"
	cont "Golpe Bajo!"
	done

.QuestionText:
	text "Te enseñaré Golpe"
	line "Bajo, pero quiero"

	para "una Hoja Plateada"
	line "a cambio."
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "¿No tienes Hoja"
	line "Plateada? Pues"
	cont "olvídalo entonces."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Ahora ya puedes"
	line "usar Golpe Bajo!"

	para "¡Si un rival va a"
	line "atacarte, tú le"
	cont "golpeas primero!"
	done

GenericTrainerRuin_maniacSmilte:
	generictrainer RUIN_MANIAC, SMILTE, EVENT_BEAT_RUIN_MANIAC_SMILTE, .SeenText, .BeatenText

	text "Oigo un eco. ¡Hay"
	line "una cueva más pro-"
	cont "funda cerca!"

	para "¿Será allí donde"
	line "haré mi gran"
	cont "descubrimiento…?"
	done

.SeenText:
	text "¡Estoy a punto de"
	line "hacer un gran des-"
	cont "cubrimiento!"

	para "¡Puedo sentirlo!"
	done

.BeatenText:
	text "¡¿Vas detrás de mi"
	line "descubrimiento?!"
	done

GenericTrainerSuper_nerdKouta:
	generictrainer SUPER_NERD, KOUTA, EVENT_BEAT_SUPER_NERD_KOUTA, .SeenText, .BeatenText

	text "Supongo que hasta"
	line "el mejor plan"
	cont "puede torcerse."
	done

.SeenText:
	text "¡No me vencerás!"
	line "¡Tengo el plan"
	cont "perfecto!"
	done

.BeatenText:
	text "¡¿Falló mi plan?!"

	para "Toca volver a em-"
	line "pezar de cero…"
	done

TrainerCoupleJoeandjo1:
	trainer COUPLE, JOEANDJO1, EVENT_BEAT_COUPLE_JOE_AND_JO, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_COUPLE
.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Joe: Cazamos fan-"
	line "tasmas, pero no te-"

	para "mo nada mientras"
	line "tenga a mi Jo al"
	cont "lado."
	done

.SeenText:
	text "Joe: ¡Un fantasma!"
	line "¡No te alejes, mi"
	cont "querida Jo!"
	done

.BeatenText:
	text "Joe: Ah. Solo era"
	line "un entrenador."
	done

TrainerCoupleJoeandjo2:
	trainer COUPLE, JOEANDJO2, EVENT_BEAT_COUPLE_JOE_AND_JO, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_COUPLE

.Script:
	endifjustbattled
	jumpthistextfaceplayer
text "Jo: ¡Qué suerte"
	line "tengo de contar"

	para "con mi maravilloso"
	line "Joe para ahuyentar"

	para "a cualquier fan-"
	line "tasma siniestro!"
	done

.SeenText:
	text "Jo: ¡Aaah! ¡Abrá-"
	line "zame fuerte, Joe!"
	done

.BeatenText:
	text "Jo: ¿No te da"
	line "miedo?"
	done

GenericTrainerHex_maniacBethany:
	generictrainer HEX_MANIAC, BETHANY, EVENT_BEAT_HEX_MANIAC_BETHANY, .SeenText, .BeatenText

	text "El aura de miedo"
	line "de esta cueva es"
	cont "maravillosa…"
	cont "Fufufufu…"
	done

.SeenText: ; text > text
	text "¡BUU!"
	done

.BeatenText:
	text "¿Te he asustado?"
	done

GenericTrainerScientistPiotr:
	generictrainer SCIENTIST, PIOTR, EVENT_BEAT_SCIENTIST_PIOTR, .SeenText, .BeatenText

	text "Aquí crecen algas"
	line "que desprenden un"

	para "pigmento turbio"
	line "en el agua."

	para "¡No hay nada de"
	line "qué asustarse!"
	cont "… ¿Verdad?"
	done

.SeenText:
	text "¿Sabes por qué el"
	line "agua está tan os-"
	cont "cura por aquí?"
	done

.BeatenText:
	text "¡Vale, te lo con-"
	line "taré!"
	done
