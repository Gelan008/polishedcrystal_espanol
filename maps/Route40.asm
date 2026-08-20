Route40_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, MonicaCallback

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_JUMPTEXT, Route40SignText
	bg_event  7,  8, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

	def_object_events
	object_event  7, 11, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event 13, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermSimon, -1
	object_event 18, 33, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfElaine, -1
	object_event  9, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfPaula, -1
	object_event 11, 13, SPRITE_BEACH_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40BeachGirlText, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40PicnickerText, -1
	object_event 14,  8, SPRITE_BEACH_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40BeachGuyScript, -1
	object_event 16, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40FisherScript, -1
	smashrock_event  8, 10
	smashrock_event  6, 9
	smashrock_event  7, 8

	object_const_def
	const ROUTE40_MONICA

MonicaCallback:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

GenericTrainerSwimmerfElaine:
	generictrainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText

	text "¡Yo diría que nado"
	line "mucho mejor que"
	cont "tú! ¡Pues sí!"
	done

GenericTrainerSwimmerfPaula:
	generictrainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText

	text "Mientras floto de"
	line "esta manera, las"
	cont "olas me llevan."
	done

GenericTrainerSwimmermSimon:
	generictrainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText

	text "Ciudad Orquídea"
	line "queda bastante"
	cont "lejos de aquí."
	done

GenericTrainerSwimmermRandall:
	generictrainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText

	text "Nadar ejercita"
	line "todo el cuerpo."
	cont "¡Es muy sano!"
	done

Route40PokefanMScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer Route40PokefanMText2
	jumpthistextfaceplayer

	text "¡Mmm! Hay un gran"
	line "edificio delante."

	para "¿Qué será?"
	done

Route40BeachGuyScript:
	checkevent EVENT_BATTLE_TOWER_OPEN
	iftrue_jumptextfaceplayer Route40BeachGuyText2
	jumpthistextfaceplayer

	text "¡La Torre Batalla"
	line "está casi lista!"

	para "Vendrá gente de"
	line "todo el mundo a"
	cont "probar su fuerza."
	done

Route40FisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_KNOCK_OFF_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_KNOCK_OFF_INTRO
.HeardIntro:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval KNOCK_OFF
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Ya buscaré otra"
	line "cosa que hacer…"
	done

.IntroText:
	text "Estaba pescando y"
	line "un #mon saltó"
	cont "y me tiró la Caña"
	cont "al agua."

	para "¿Cómo voy a pescar"
	line "algo ahora?"

	para "… En fin, si no"
	line "puedo pescar,"
	cont "¡enseñaré!"
	done

.QuestionText:
	text "Dame una Hoja"
	line "Plata y enseñaré"
	cont "Desarme a tu"
	cont "#mon."

	para "¿Qué te parece?"
	done

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "Sin Hoja, no hay"
	line "movimiento. Mi"
	cont "tiempo vale oro."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Desarme tira el"
	line "objeto equipado"
	cont "para inutilizarlo"
	cont "en el combate."

	para "¡Es de lo más"
	line "frustrante!"
	done

MonicaScript:
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue_jumptextfaceplayer MonicaMondayText
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, MonicaNotMondayScript
	faceplayer
	opentext
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftruefwd .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalsefwd MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	jumpthisopenedtext

	text "Lune: Este objeto"
	line "potencia ataques"
	cont "de tipo Volador."

	para "¡Dáselo a un"
	line "#mon pájaro!"
	done

MonicaNotMondayScript:
	jumpthistextfaceplayer

	text "Lune: No creo que"
	line "hoy sea lunes."
	cont "Qué pena…"
	done

MonicaDoneScript:
	end

SwimmermSimonSeenText:
	text "Hay que calentar"
	line "antes de entrar"
	cont "al agua."

	para "Es lo básico."
	done

SwimmermSimonBeatenText:
	text "¡Vale! ¡Me rindo!"
	done

SwimmermRandallSeenText:
	text "¡Oye, eres joven y"
	line "estás en forma!"

	para "¡No vayas sobre tu"
	line "#mon! ¡Nada!"
	done

SwimmermRandallBeatenText:
	text "¡Vaya derrota…!"
	done

SwimmerfElaineSeenText:
	text "¿Vas hacia Ciudad"
	line "Orquídea?"

	para "¿Luchamos antes"
	line "un combate rápido?"
	done

SwimmerfElaineBeatenText:
	text "¡He perdido!"
	done

SwimmerfPaulaSeenText:
	text "Paso del flotador."

	para "¡Yo me agarro a un"
	line "#mon marino!"
	done

SwimmerfPaulaBeatenText:
	text "¡Uf, qué mareo!"
	done

Route40BeachGirlText:
	text "Acabo de comer en"
	line "el Bar de Olivo,"

	para "así que descanso"
	line "antes de nadar."
	done


Route40PokefanMText2:
	text "¡Mmm! Mira cuántos"
	line "entrenadores tan"
	cont "serios entran."

	para "¿Qué pasará?"
	done

Route40PicnickerText:
	text "Vine a Olivo en"
	line "barco para hacer"
	cont "turismo."

	para "Al ser un puerto,"
	line "el ambiente es muy"
	cont "diferente."
	done


Route40BeachGuyText2:
	text "¿Has ido a la"
	line "Torre Batalla?"

	para "Hay muchos rivales"
	line "fuertes reunidos."

	para "Pero con tantas"
	line "Medallas, ¡seguro"
	cont "que lo bordas!"
	done

MeetMonicaText:
	text "Lune: Encantada."
	line "Soy Lune, la del"
	cont "lunes."
	done

MonicaGivesGiftText:
	text "¡Como muestra de"
	line "nuestra amistad,"
	cont "tengo un regalo!"
	done


MonicaMondayText:
	text "Lune: Mis hermanos"
	line "están repartidos"
	cont "por todas partes."

	para "¡A ver si puedes"
	line "encontrarlos a"
	cont "todos!"
	done


Route40SignText:
	text "Ruta 40"

	para "Ciudad Orquídea -"
	line "Ciudad Olivo"
	done
