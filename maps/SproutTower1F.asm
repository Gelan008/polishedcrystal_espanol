SproutTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, VIOLET_CITY, 7
	warp_event  8, 15, VIOLET_CITY, 7
	warp_event  4,  4, SPROUT_TOWER_2F, 1
	warp_event  0,  6, SPROUT_TOWER_2F, 2
	warp_event 15,  3, SPROUT_TOWER_2F, 3

	def_coord_events

	def_bg_events
	bg_event  5, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText
	bg_event 10, 15, BGEVENT_JUMPTEXT, SproutTower1FStatueText

	def_object_events
	object_event 11,  4, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KimonoGirlMakoScript, -1
	object_event  5,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FSage1Text, -1
	object_event  4,  7, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FSage2Text, -1
	object_event  9, 12, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SproutTower1FGrannyScript, -1
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, SproutTower1FTeacherText, -1
	object_event  1,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSageChow, -1
	itemball_event 14,  7, PARALYZEHEAL, 1, EVENT_SPROUT_TOWER1F_PARALYZEHEAL

	object_const_def
	const SPROUTTOWER1F_KIMONO_GIRL

SproutTower1FGrannyScript:
	checkunits
	iftrue_jumptextfaceplayer .MetricText
	jumpthistextfaceplayer
text "Un Bellsprout de"
	line "más de 30 metros"
	cont "de altura…"

	para "Dicen que se con-"
	line "virtió en el pilar"
	cont "central de aquí."
	done

.MetricText:
	text "Un Bellsprout de"
	line "más de 30 metros"
	cont "de altura…"

	para "Dicen que se con-"
	line "virtió en el pilar"
	cont "central de aquí."
	done

GenericTrainerSageChow:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText

	text "Todos los seres"
	line "vivos conviven en"
	cont "cooperación."

	para "Debemos estarles"
	line "siempre agradeci-"
	cont "dos por ello."
	done

SageChowSeenText:
	text "Montamos guardia"
	line "en esta torre."

	para "Aquí expresamos"
	line "nuestra gratitud"
	cont "a todos los #mon."
	done

SageChowBeatenText:
	text "¡M-muchas gracias!"
	done

SproutTower1FSage1Text:
	text "Solo si llegas"
	line "hasta arriba con-"
	cont "seguirás una MT."
	done

SproutTower1FSage2Text:
	text "Torre Bellsprout"
	line "se construyó hace"

	para "mucho como lugar"
	line "de entrenamiento"
	cont "#mon."
	done

SproutTower1FTeacherText:
	text "¿Ves cómo tiembla"
	line "el pilar?"

	para "Arriba están en-"
	line "trenando."
	done

SproutTower1FStatueText:
	text "Una estatua de un"
	line "#mon…"

	para "Tiene un aspecto"
	line "muy distinguido."
	done

KimonoGirlMakoScript:
	checkevent EVENT_GOT_RARE_CANDY_FROM_KIMONO_GIRL_MAKO
	iftrue_jumptextfaceplayer .OutroText
	faceplayer
	checkevent EVENT_BEAT_KIMONO_GIRL_MAKO
	iftruefwd .Beaten
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse_jumptext .IntroText
	showtext .SeenText
	winlosstext .BeatenText, 0
	setlasttalked SPROUTTOWER1F_KIMONO_GIRL
	loadtrainerwithpal KIMONO_GIRL, MAKO, TRAINERPAL_MAKO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_MAKO
.Beaten:
	opentext
	writetext .AfterText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_GOT_RARE_CANDY_FROM_KIMONO_GIRL_MAKO
	jumpthisopenedtext

.OutroText:
	text "Las Chicas del Ki-"
	line "mono bailamos,"
	cont "pero también com-"
	cont "batimos."
	done

.IntroText:
	text "Hola, Entrenador."

	para "Soy una Chica"
	line "Kimono."

	para "He viajado aquí"
	line "desde Ciudad"

	para "Iris, por bosques"
	line "y cuevas, para"

	para "entrenar en esta"
	line "torre."

	para "¿Has conocido a"
	line "mis cinco primas"

	para "bailarinas en Ciu-"
	line "dad Iris?"

	para "¡Vuelve a contár-"
	line "melo si las ves!"
	done

.SeenText:
	text "¡Madre mía!…"
	line "¿Has vencido a mis"

	para "cinco primas bai-"
	line "larinas?"

	para "¡Entonces permi-"
	line "te que os desafíe"
	cont "a ti y a tus"
	cont "#mon!"
	done

.BeatenText:
	text "Oh, eres fuerte de"
	line "verdad…"
	done

.AfterText:
	text "¡Excelente espíri-"
	line "tu de combate!"

	para "¡Sabrás qué hacer"
	line "con esto!"
	done
