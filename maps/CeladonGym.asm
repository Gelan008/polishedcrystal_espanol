CeladonGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	def_object_events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerLassMichelle, -1
	object_event  2,  8, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautyJulia, -1
	object_event  6,  5, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerAroma_ladyDahlia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsJoandzoe2, -1

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_AROMA_LADY_DAHLIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	givebadge RAINBOWBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue_jumpopenedtext ErikaAfterBattleText
	writetext ErikaExplainTMText
	promptbutton
	verbosegivetmhm TM_GIGA_DRAIN
	setevent EVENT_GOT_TM19_GIGA_DRAIN
	jumpthisopenedtext

	text "Es Gigadrenado."

	para "Es un gran movi-"
	line "miento que drena"

	para "la mitad del daño"
	line "que inflige para"
	cont "curar a tu #mon."

	para "Por favor, úsala"
	line "si es de tu agra-"
	cont "do…"
	done

GenericTrainerLassMichelle:
	generictrainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText

	text "¡Solo he sido des-"
	line "cuidada, eso es"
	cont "todo!"
	done

GenericTrainerPicnickerTanya:
	generictrainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText

	text "Oh, mira tus"
	line "Medallas. ¡No me"

	para "extraña que no"
	line "haya podido ganar!"
	done

GenericTrainerBeautyJulia:
	generictrainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText

	text "¿Cómo puedo lle-"
	line "gar a ser tan de-"
	cont "licada como Erika?"
	done

GenericTrainerAroma_ladyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, Aroma_ladyDahliaSeenText, Aroma_ladyDahliaBeatenText

	text "Gloom emite una"
	line "fragancia fétida,"

	para "pero Erika sabe"
	line "convertirla en"

	para "un perfume muy"
	line "dulce."
	done

GenericTrainerTwinsJoandzoe1:
	generictrainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText

	text "¡Erika nos ven-"
	line "gará!"
	done

GenericTrainerTwinsJoandzoe2:
	generictrainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText

	text "¡Erika es muuuucho"
	line "más fuerte!"
	done

CeladonGymStatue:
	gettrainername ERIKA, 1, STRING_BUFFER_4
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "Erika: Hola…"
	line "Hace un tiempo"

	para "precioso, ¿verdad?"
	line "Es tan agradable…"

	para "…Me temo que po-"
	line "dría dormirme…"

	para "Me llamo Erika."
	line "Soy la Líder del"
	cont "Gimnasio Azulona."

	para "…¿Ah? ¿Vienes"
	line "desde Johto? Qué"
	cont "bien…"

	para "Oh. Lo siento, no"
	line "me di cuenta"

	para "de que querías"
	line "desafiarme."

	para "Muy bien, pero no"
	line "pienso perder."
	done

ErikaBeatenText:
	text "Erika: ¡Oh!"
	line "Admito la derro-"
	cont "ta…"

	para "Eres realmente"
	line "fuerte…"

	para "Te daré la Meda-"
	line "lla Arcoíris…"
	done

ErikaExplainTMText:
	text "Erika: Ha sido un"
	line "combate encanta-"
	cont "dor."

	para "Me siento inspira-"
	line "da. Por favor,"
	cont "toma esta MT."
	done


ErikaAfterBattleText:
	text "Erika: Perder deja"
	line "un sabor amargo…"

	para "Pero saber que hay"
	line "entrenadores fuer-"

	para "tes me anima a"
	line "hacerlo mejor…"
	done

LassMichelleSeenText:
	text "¿Crees que un Gim-"
	line "nasio solo de"
	cont "chicas es raro?"
	done

LassMichelleBeatenText:
	text "¡Oh, puf!"
	done

PicnickerTanyaSeenText:
	text "¿Oh, un combate?"
	line "Da un poco de mie-"
	cont "do, ¡pero vale!"
	done

PicnickerTanyaBeatenText:
	text "¿Oh, eso es todo?"
	done

BeautyJuliaSeenText:
	text "¿Mirabas a estas"
	line "flores o a mí?"
	done

BeautyJuliaBeatenText:
	text "¡Qué molesto!"
	done

Aroma_ladyDahliaSeenText:
	text "Hay un olor intri-"
	line "gante a tu alrede-"
	cont "dor…"
	done

Aroma_ladyDahliaBeatenText:
	text "El fétido olor de"
	line "la derrota…"
	done

TwinsJoandzoe1SeenText:
	text "¡Te enseñaremos"
	line "movimientos #mon"
	cont "que Erika nos en-"
	cont "señó!"
	done

TwinsJoandzoe1BeatenText:
	text "Oh… Perdimos…"
	done

TwinsJoandzoe2SeenText:
	text "¡Vamos a proteger"
	line "a Erika!"
	done

TwinsJoandzoe2BeatenText:
	text "No pudimos ga-"
	line "nar…"
	done
