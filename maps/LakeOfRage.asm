LakeOfRage_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlyPoint
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyAndEngineer
	callback MAPCALLBACK_TILES, LakeOfRageFloodScript

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1
	warp_event 10, 28, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_JUMPTEXT, LakeOfRageSignText
	bg_event  3, 26, BGEVENT_JUMPTEXT, LakeOfRageAdvancedTipsSignText
	bg_event 25, 31, BGEVENT_READ, LakeOfRageFishingGuruSign
	bg_event  4,  4, BGEVENT_ITEM + RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY
	bg_event 35,  5, BGEVENT_ITEM + MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION
	bg_event 11, 28, BGEVENT_ITEM + FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE
	bg_event 10, 27, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_LAKE_OF_RAGE
	bg_event 11, 27, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_LAKE_OF_RAGE

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 18, 22, SPRITE_BIG_GYARADOS, SPRITEMOVEDATA_BIG_GYARADOS, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRedGyaradosScript, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event 20, 29, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageEngineerText, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageSuperNerdText, -1
	object_event 25, 29, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LakeOfRageCooltrainerFText, -1
	itemball_event 13,  2, ELIXIR, 1, EVENT_LAKE_OF_RAGE_ELIXIR
	itemball_event  7, 10, MAX_REVIVE, 1, EVENT_LAKE_OF_RAGE_MAX_REVIVE
	tmhmball_event 35,  2, TM_SUBSTITUTE, EVENT_LAKE_OF_RAGE_TM_SUBSTITUTE
	cuttree_event 18,  9, EVENT_LAKE_OF_RAGE_CUT_TREE_1
	cuttree_event 11, 12, EVENT_LAKE_OF_RAGE_CUT_TREE_2
	cuttree_event  5, 14, EVENT_LAKE_OF_RAGE_CUT_TREE_3
	cuttree_event  6, 21, EVENT_LAKE_OF_RAGE_CUT_TREE_4
	cuttree_event 23,  4, EVENT_LAKE_OF_RAGE_CUT_TREE_5

	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_RED_GYARADOS
	const LAKEOFRAGE_WESLEY

LakeOfRageFlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyAndEngineer:
	checkevent EVENT_LAKE_OF_RAGE_CIVILIANS
	iftruefwd .NoEngineer
	moveobject LAKEOFRAGE_LANCE, 18, 29
.NoEngineer
	readvar VAR_WEEKDAY
	ifequalfwd WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageFloodScript:
	special Special_GetOvercastIndex
	ifequalfwd LAKE_OF_RAGE_OVERCAST, .flood
	changemapblocks LakeOfRage_BlockData
	endcallback

.flood
	changemapblocks LakeOfRageFlooded_BlockData
	endcallback

LakeOfRageSignText:
	text "Lago de la Furia,"
	line "también conocido"
	cont "como Lago Gyarados"
	done

LakeOfRageAdvancedTipsSignText:
	text "¡Pistas Avanzadas!"

	para "Poder Oculto pue-"
	line "de ser de cual-"
if DEF(FAITHFUL)
	cont "quier tipo, menos"
else
	cont "quier tipo, in-"
	cont "cluso del nuevo"
endc

	para "tipo Hada!"
	done

LakeOfRageFishingGuruSign:
	opentext
	writetext .Text
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftruefwd .Continue
	waitendtext

.Continue:
	promptbutton
	special Special_MagikarpHouseSign
	endtext

.Text:
	text "Casa del Gurú"
	line "Pescador"
	done

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftruefwd .AskForHelpAgain
	opentext
	writetext .OverheardText
	promptbutton
	faceplayer
	writetext .IntroText
	yesorno
	iffalsefwd .Refused
.Agreed:
	writetext .YesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applyonemovement LAKEOFRAGE_LANCE, teleport_from
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.Refused:
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	jumpthisopenedtext

	text "Oh… Bueno, si"
	line "cambias de opi-"
	cont "nión, ayúdame."
	done

.AskForHelpAgain:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalse .Refused
	sjump .Agreed

.OverheardText:
	text "Este lago está"
	line "lleno de Gyarados,"
	cont "pero nada más…"

	para "Por lo que se"
	line "está obligando a"
	cont "evolucionar a los"
	cont "Magikarp…"
	done

.IntroText:
	text "¿Estás aquí por"
	line "los rumores?"

	para "¿Eres <PLAYER>?"
	line "Soy Lance, un En-"
	cont "trenador, como tú."

	para "He oído rumores,"
	line "así que vine a in-"
	cont "vestigar…"

	para "Antes te vi"
	line "combatir,"
	cont "<PLAYER>."

	para "Puedo asegurar que"
	line "eres un Entrena-"

	para "dor con suma ha-"
	line "bilidad."

	para "Si no te importa,"
	line "¿podrías ayudarme"
	cont "a investigar?"
	done

.YesText:
	text "Lance: ¡Excelente!"

	para "Parece que a los"
	line "Magikarp del lago"

	para "se los fuerza a"
	line "evolucionar."

	para "El origen es una"
	line "misteriosa trans-"

	para "misión de radio"
	line "de Pueblo Caoba."

	para "Te estaré espe-"
	line "rando, <PLAYER>."
	done


.QuestionText:
	text "Lance: ¿Mmm?"
	line "¿Vas a ayudarme?"
	done

LakeOfRageEngineerText:
	text "Soy urbanista."

	para "Tengo grandes"
	line "ideas para este"
	cont "lugar, ¡ya verás!"

	para "Es el lugar per-"
	line "fecto para mi"
	cont "próximo proyecto."
	done

LakeOfRageRedGyaradosScript:
	opentext
	writetext .GyaradosText
	cry GYARADOS
	pause 15
	closetext
	loadwildmon GYARADOS, GYARADOS_RED_FORM, 35
	loadvar VAR_BATTLETYPE, BATTLETYPE_NEVER_SHINY
	startbattle
	ifequalfwd $1, .Continue
	disappear LAKEOFRAGE_RED_GYARADOS
.Continue:
	reloadmapafterbattle
	opentext
	givekeyitem RED_SCALE
	waitsfx
	writetext .RedScaleText
	special ShowKeyItemIcon
	playsound SFX_KEY_ITEM
	waitbutton
	keyitemnotify
	closetext
	appear LAKEOFRAGE_LANCE
	end

.GyaradosText:
	text "Gyarados: Gyashaa!"
	done

.RedScaleText:
	text "<PLAYER> encontró"
	line "Escama Roja."
	done

WesleyScript:
	checkevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	iftrue_jumptextfaceplayer .WednesdayText
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	faceplayer
	opentext
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftruefwd .MetWesley
	writetext .MeetText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext .GivesGiftText
	promptbutton
	verbosegiveitem BLACK_BELT
	iffalse_endtext
	setevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	jumpthisopenedtext

	text "Merlín: El Cin-"
	line "turón Negro aumen-"
	cont "ta el poder de los"
	cont "ataques de Lucha."
	done

.NotWednesday:
	jumpthisopenedtext

	text "Merlín: Hoy"
	line "no es miércoles."
	cont "Qué pena."
	done

.MeetText:
	text "Merlín: ¿Qué"
	line "tal?"

	para "Dado que hoy"
	line "es miércoles,"

	para "soy Merlín,"
	line "la de ese día."
	done

.GivesGiftText:
	text "Encantada de cono-"
	line "certe. Ten este"
	cont "souvenir."
	done

.WednesdayText:
	text "Merlín: Puesto"
	line "que me has encon-"
	cont "trado, debes de"

	para "haberte topado"
	line "con mis hermanos."

	para "¿O fue pura"
	line "suerte?"
	done

GenericTrainerCooltrainermAaron:
	generictrainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, .SeenText, .BeatenText

	text "Los #mon y sus"
	line "entrenadores se"

	para "hacen fuertes"
	line "combatiendo mucho."
	done

.SeenText:
	text "Si un Entrenador"
	line "ve a otro,"

	para "tiene que retarle."

	para "Ese es nuestro"
	line "destino."
	done

.BeatenText:
	text "Uf…"
	line "Buen combate."
	done

GenericTrainerCooltrainerfLois:
	generictrainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, .SeenText, .BeatenText

	text "Ahora que lo"
	line "pienso, he visto"
	cont "un Butterfree"
	cont "rosa."
	done

.SeenText:
	text "¿Qué pasó con el"
	line "Gyarados rojo?"

	para "¿Ya no está?"

	para "Maldición, ¿he ve-"
	line "nido para nada?"

	para "¡Ya sé! ¡Vamos"
	line "a luchar!"
	done

.BeatenText:
	text "¡Bien hecho!"
	done

GenericTrainerFisherAndre:
	generictrainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText

	text "¡No perderé como"
	line "pescador! Atrapo"
	cont "#mon todo el día."
	done

FisherAndreSeenText:
	text "¡Déjame luchar con"
	line "los #mon que"
	cont "acabo de atrapar!"
	done

FisherAndreBeatenText:
	text "Puedo ser un pes-"
	line "cador experto, pe-"

	para "ro apesto como"
	line "entrenador #-"
	cont "mon…"
	done

GenericTrainerFisherRaymond:
	generictrainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText

	text "¿Por qué no puedo"
	line "atrapar buenos"
	cont "#mon?"
	done

FisherRaymondSeenText:
	text "Haga lo que haga,"
	line "siempre atrapo"

	para "a los mismos"
	line "#mon…"
	done

FisherRaymondBeatenText:
	text "Mi sedal está to-"
	line "do enredado…"
	done

LakeOfRageGrampsScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "¡Los Gyarados es-"
	line "tán furiosos!"

	para "¡Es un mal au-"
	line "gurio!"
	done

.Text2:
	text "¡Jaja! ¡Los Magi-"
	line "karp están pi-"
	cont "cando!"
	done

LakeOfRageSuperNerdText:
	text "Dicen que este la-"
	line "go fue creado por"
	cont "Gyarados furiosos."

	para "¿Habrá alguna"
	line "conexión"

	para "con su aparición"
	line "masiva de ahora?"
	done

LakeOfRageCooltrainerFText:
	text "¿Me han engañado"
	line "los ojos? Vi un"

	para "Gyarados rojo en"
	line "el lago…"

	para "¿Pero no se supo-"
	line "ne que los Gyara-"
	cont "dos son azules?"
	done
