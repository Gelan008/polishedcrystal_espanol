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
	jumpopenedtext ErikaOutroText

GenericTrainerLassMichelle:
	generictrainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText

	text "I just got care-"
	line "less, that's all!"
	done

GenericTrainerPicnickerTanya:
	generictrainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText

	text "Oh, look at all"
	line "your Badges. No"

	para "wonder I couldn't"
	line "win!"
	done

GenericTrainerBeautyJulia:
	generictrainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText

	text "How do I go about"
	line "becoming ladylike"
	cont "like Erika?"
	done

GenericTrainerAroma_ladyDahlia:
	generictrainer AROMA_LADY, DAHLIA, EVENT_BEAT_AROMA_LADY_DAHLIA, Aroma_ladyDahliaSeenText, Aroma_ladyDahliaBeatenText

	text "Gloom releases a"
	line "foul fragrance,"

	para "but Erika knows"
	line "how to turn it"

	para "into a sweet"
	line "perfume."
	done

GenericTrainerTwinsJoandzoe1:
	generictrainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText

	text "Erika will get you"
	line "back for us!"
	done

GenericTrainerTwinsJoandzoe2:
	generictrainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText

	text "Erika is much,"
	line "much stronger!"
	done

CeladonGymStatue:
	gettrainername ERIKA, 1, STRING_BUFFER_4
	checkflag ENGINE_RAINBOWBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "Erika: Hola… Hace"
	line "un tiempo tan"
	cont "precioso…"

	para "…Me temo que"
	line "podría dormirme…"

	para "Me llamo Erika."
	line "Soy la Líder del"
	cont "Gimnasio Azulona."

	para "…¿Ah? ¿Vienes de"
	line "Johto? Qué bien…"

	para "Oh. Lo siento, no"
	line "me di cuenta de"
	cont "que querías"
	cont "desafiarme."

	para "Muy bien, pero no"
	line "pienso perder."
	done

ErikaBeatenText:
	text "Erika: ¡Oh!"
	line "Admito mi derrota…"

	para "Eres realmente"
	line "fuerte…"

	para "Te daré la Medalla"
	line "Arcoíris…"
	done

ErikaExplainTMText:
	text "Erika: Ha sido un"
	line "combate"
	cont "encantador."

	para "Me siento muy"
	line "inspirada. Toma"
	cont "esta MT."
	done

ErikaOutroText:
	text "It is Giga Drain."

	para "It is a wonderful"
	line "move that drains"

	para "half the damage it"
	line "inflicts to heal"
	cont "your #mon."

	para "Please use it if"
	line "it pleases you…"
	done

ErikaAfterBattleText:
	text "Erika: Perder deja"
	line "un sabor amargo…"

	para "Pero saber que hay"
	line "entrenadores tan"
	cont "fuertes me anima"
	cont "a mejorar…"
	done

LassMichelleSeenText:
	text "¿Crees que un"
	line "Gimnasio solo de"
	cont "chicas es raro?"
	done

LassMichelleBeatenText:
	text "¡Oh, puf!"
	done

PicnickerTanyaSeenText:
	text "¿Oh, un combate?"
	line "Da un poco de"
	cont "miedo, ¡pero vale!"
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
	text "Hay un olor"
	line "intrigante a tu"
	cont "alrededor…"
	done

Aroma_ladyDahliaBeatenText:
	text "El fétido olor de"
	line "la derrota…"
	done

TwinsJoandzoe1SeenText:
	text "¡Te enseñaremos"
	line "movimientos"
	cont "#mon que Erika"
	cont "nos enseñó."
	done

TwinsJoandzoe1BeatenText:
	text "Oh… Perdimos…"
	done

TwinsJoandzoe2SeenText:
	text "¡Vamos a proteger"
	line "a Erika!"
	done

TwinsJoandzoe2BeatenText:
	text "No pudimos"
	line "ganar…"
	done

