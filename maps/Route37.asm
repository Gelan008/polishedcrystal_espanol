Route37_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, SunnyCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_JUMPTEXT, Route37SignText
	bg_event  4,  2, BGEVENT_ITEM + ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

	def_object_events
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event  6, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil1, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsToriandtil2, -1
	object_event 14, 11, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicGreg, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCallie, -1
	object_event  9,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyCassandra, -1
	fruittree_event 13,  5, FRUITTREE_ROUTE_37_1, RED_APRICORN, PAL_NPC_RED
	fruittree_event 16,  5, FRUITTREE_ROUTE_37_2, BLU_APRICORN, PAL_NPC_BLUE
	fruittree_event 15,  7, FRUITTREE_ROUTE_37_3, BLK_APRICORN, PAL_NPC_BLACK

	object_const_def
	const ROUTE37_SUNNY

SunnyCallback:
	readvar VAR_WEEKDAY
	ifequalfwd SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

GenericTrainerTwinsToriandtil1:
	generictrainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil1SeenText, TwinsToriandtil1BeatenText

	text "Til: I can tell"
	line "what my sister and"

	para "my #mon are"
	line "thinking."
	done

GenericTrainerTwinsToriandtil2:
	generictrainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsToriandtil2SeenText, TwinsToriandtil2BeatenText

	text "Tori: We share the"
	line "same feelings as"
	cont "our #mon."
	done

GenericTrainerPsychicGreg:
	generictrainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText

	text "Putting #mon to"
	line "sleep or paralyz-"
	cont "ing them are good"
	cont "battle techniques."
	done

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftruefwd SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftruefwd .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	writetext SunnyGivesGiftText
	promptbutton
	verbosegiveitem MAGNET
	iffalsefwd SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	jumpopenedtext SunnyGaveGiftText

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	endtext

SunnyNotSundayScript:
	jumpopenedtext SunnyNotSundayText

GenericTrainerBeautyCallie:
	generictrainer BEAUTY, CALLIE, EVENT_BEAT_BEAUTY_CALLIE, BeautyCallieSeenText, BeautyCallieBeatenText

	text "Wow, you're cute"
	line "and skilled too!"
	done

GenericTrainerBeautyCassandra:
	generictrainer BEAUTY, CASSANDRA, EVENT_BEAT_BEAUTY_CASSANDRA, BeautyCassandraSeenText, BeautyCassandraBeatenText

	text "People like you"
	line "are skilled even"

	para "though they're"
	line "young…"
	done

TwinsToriandtil1SeenText:
	text "Til: ¡Tori y yo"
	line "luchamos juntas!"
	done

TwinsToriandtil1BeatenText:
TwinsToriandtil2BeatenText:
	text "Til y Tori: Mmm…"
	line "Demasiado fuerte."
	done

TwinsToriandtil2SeenText:
	text "Tori: ¡Til y yo"
	line "luchamos juntas!"
	done

PsychicGregSeenText:
	text "Los #mon no"
	line "pueden hacer nada"
	cont "si están dormidos."

	para "¡Te mostraré lo"
	line "temible que es!"
	done

PsychicGregBeatenText:
	text "He perdido. Qué"
	line "tristeza…"
	done

MeetSunnyText:
	text "Dominga: ¡Hola!"

	para "¡Soy Dominga, la"
	line "del domingo!"

	para "¡O sea que hoy es"
	line "domingo!"
	done

SunnyGivesGiftText:
	text "¡Me dijeron que te"
	line "diera esto si te"
	cont "veía!"
	done

SunnyGaveGiftText:
	text "Sunny: That thing…"

	para "Um…"

	para "…What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #mon that"
	line "knows Electric"

	para "moves should hold"
	line "it."

	para "My sis Monica said"
	line "it powers up"
	cont "Electric moves!"
	done

SunnySundayText:
	text "Dominga: Mis seis"
	line "hermanos son Lune,"
	cont "Marta, Merlín,"
	cont "Juan, Vero y"
	cont "Sabino."

	para "Todos ellos son"
	line "mayores que yo."
	done

SunnyNotSundayText:
	text "Sunny: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

BeautyCallieSeenText:
	text "¡Oh! ¡Qué chico"
	line "tan mono!"

	para "¿Por qué no"
	line "luchas conmigo?"
	done

BeautyCallieBeatenText:
	text "Qué nivel…"
	done

BeautyCassandraSeenText:
	text "¡Eh, tú! ¡Joven"
	line "entrenador!"

	para "¿No quieres luchar"
	line "conmigo?"
	done

BeautyCassandraBeatenText:
	text "Vaya, qué fuerza…"
	done

Route37SignText:
	text "Ruta 37"
	done
