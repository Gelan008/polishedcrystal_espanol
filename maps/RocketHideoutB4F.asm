RocketHideoutB4F_MapScriptHeader:
	def_scene_scripts
	scene_script RocketHideoutB4FMeetLeadersScene
	scene_script RocketHideoutB4FMetLeadersScene

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RocketHideoutB4FLiftKeyScript
	callback MAPCALLBACK_TILES, RocketHideoutB4FDoorScript

	def_warp_events
	warp_event 11, 10, ROCKET_HIDEOUT_B3F, 2
	warp_event 16, 15, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events
	coord_event 16, 11, 0, RocketHideoutB4FMeetLeadersLeftScript
	coord_event 17, 11, 0, RocketHideoutB4FMeetLeadersRightScript

	def_bg_events
	bg_event 17,  1, BGEVENT_ITEM + MAX_POTION, EVENT_ROCKET_HIDEOUT_B4F_HIDDEN_MAX_POTION

	def_object_events
	object_event 17,  3, SPRITE_CANDELA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FCandelaScript, -1
	object_event 16,  6, SPRITE_SPARK, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FSparkScript, -1
	object_event 19,  6, SPRITE_BLANCHE, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FBlancheScript, -1
	object_event  3,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketHideoutB4FYoungsterArdenScript, -1
	object_event 15, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, RocketHideoutB4FTeacherSerena, -1
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, RocketHideoutB4FSuperNerdNolan, -1
	keyitemball_event 2,  2, LIFT_KEY, EVENT_ROCKET_HIDEOUT_B4F_LIFT_KEY
	itemball_event 1,  4, X_SP_ATK,    1, EVENT_ROCKET_HIDEOUT_B4F_X_SP_ATK
	itemball_event 2, 12, PP_UP,        1, EVENT_ROCKET_HIDEOUT_B4F_PP_UP
	itemball_event 4, 20, DUBIOUS_DISC, 1, EVENT_ROCKET_HIDEOUT_B4F_DUBIOUS_DISC

	object_const_def
	const ROCKETHIDEOUTB4F_CANDELA
	const ROCKETHIDEOUTB4F_SPARK
	const ROCKETHIDEOUTB4F_BLANCHE
	const ROCKETHIDEOUTB4F_YOUNGSTER_ARDEN
	const ROCKETHIDEOUTB4F_TEACHER_SERENA
	const ROCKETHIDEOUTB4F_SUPER_NERD_NOLAN
	const ROCKETHIDEOUTB4F_LIFT_KEY

RocketHideoutB4FDoorScript:
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .beat_serena
	changeblock 16, 10, $69
	endcallback
.beat_serena
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .beat_theo
	changeblock 16, 10, $69
	endcallback
.beat_theo
	changeblock 16, 10, $0d
	endcallback

RocketHideoutB4FLiftKeyScript:
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .beat_arden
	disappear ROCKETHIDEOUTB4F_LIFT_KEY
.beat_arden
	endcallback

RocketHideoutB4FMeetLeadersLeftScript:
	checktime (1 << EVE) | (1 << NITE)
	iffalse TooEarly
	applymovement PLAYER, .MovePlayerUp
	sjumpfwd RocketHideoutB4FMeetLeadersScript

.MovePlayerUp:
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_up
	step_end

RocketHideoutB4FMeetLeadersRightScript:
	checktime (1 << EVE) | (1 << NITE)
	iffalse TooEarly
	applymovement PLAYER, .MovePlayerUp
	sjumpfwd RocketHideoutB4FMeetLeadersScript

.MovePlayerUp:
	step_up
	step_up
	step_up
	step_up
	step_end

RocketHideoutB4FMeetLeadersScript:
	setscene $1
	showtext .CandelaIntro1Text
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .BlancheIntro1Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, LEFT
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	pause 20
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .SparkIntro1Text
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	turnobject ROCKETHIDEOUTB4F_BLANCHE, UP
	showtext .CandelaIntro2Text
	turnobject ROCKETHIDEOUTB4F_SPARK, RIGHT
	showtext .BlancheIntro2Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, LEFT
	turnobject ROCKETHIDEOUTB4F_SPARK, UP
	showtext .SparkIntro2Text
	turnobject ROCKETHIDEOUTB4F_SPARK, DOWN
	showtext .SparkIntro3Text
	turnobject ROCKETHIDEOUTB4F_BLANCHE, DOWN
	showtext .CandelaIntro3Text
	setmapobjectmovedata ROCKETHIDEOUTB4F_SPARK, SPRITEMOVEDATA_STANDING_DOWN
	setmapobjectmovedata ROCKETHIDEOUTB4F_BLANCHE, SPRITEMOVEDATA_STANDING_DOWN
	end


.CandelaIntro1Text:
	text "Candela: ¡El poder"
	line "bruto siempre"
	cont "gana!"

	para "¡Entrenar debe"
	line "ser duro, como un"
	cont "combate!"
	done

.BlancheIntro1Text:
	text "Blanche: La fuerza"
	line "no sirve de nada"
	cont "sin estrategia."

	para "Pensar con calma"
	line "siempre da la"
	cont "victoria."
	done

.SparkIntro1Text:
	text "Spark: ¡Ninguno de"
	line "los dos entiende"
	cont "el asunto!"

	para "El instinto es la"
	line "clave: ¡confiad en"
	cont "la intuición!"
	done

.CandelaIntro2Text:
	text "Candela: ¿El"
	line "instinto? ¡Eso es"
	cont "ir a ciegas!"

	para "¡Los entrenadores"
	line "de verdad usan la"
	cont "fuerza!"
	done

.BlancheIntro2Text:
	text "Blanche: Candela,"
	line "Spark, ¡no es el"
	cont "momento!"

	para "¿Qué hay del"
	line "proyecto del"
	cont "Gran Arbol?"
	done

.SparkIntro2Text:
	text "Spark: ¡Cierto! El"
	line "gran cerezo…"
	done

.SparkIntro3Text:
	text "Un momento, ¿quién"
	line "es ése?"
	done

.CandelaIntro3Text:
	text "Candela: ¡Parece"
	line "que alguien tiene"
	cont "fuerza!"

	para "¡Ya que estás"
	line "aquí, a combatir!"

	para "¡Si ganas, podrás"
	line "unirte a nuestro"
	cont "gran proyecto!"
	done

RocketHideoutB4FMeetLeadersScene:
RocketHideoutB4FMetLeadersScene:
TooEarly:
	end


RocketHideoutB4FSparkScript:
	faceplayer
	checkevent EVENT_BEAT_SPARK
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer SPARK_T, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SPARK
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem MALIGN_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_CANDELA
	iffalse_endtext
	checkevent EVENT_BEAT_BLANCHE
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Spark: Hey! Ready"
	line "to trust your gut?"
	cont "In a battle?"
	done

.SeenText:
	text "Sweet! Let's see"
	line "how far your inst-"
	cont "inct takes you!"
	done

.BeatenText:
	text "Whoa, you totally"
	line "nailed it!"

	para "Guess your gut"
	line "was right!"
	done

.AfterText1:
	text "Spark: Here's the"
	line "Malign Lure."
	done

.AfterText2:
	text "The Malign Lure"
	line "draws on bold"
	cont "energy."

	para "It's my way of"
	line "sparking some"
	cont "creativity!"

	para "Use it boldly!"
	done

.RefusedText:
	text "Aw, bummer!"
	line "Don't let fear"
	cont "hold you back!"

	para "Come back when"
	line "you're feeling it."
	done

RocketHideoutB4FCandelaScript:
	faceplayer
	checkevent EVENT_BEAT_CANDELA
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer CANDELA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CANDELA
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem HARSH_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_SPARK
	iffalse_endtext
	checkevent EVENT_BEAT_BLANCHE
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Candela: Ready to"
	line "test out your"
	cont "strength?"
	done

.SeenText:
	text "That's the spirit!"
	line "Show me your"
	cont "power!"
	done

.BeatenText:
	text "Alright, you've"
	line "proven your"
	cont "strength today."

	para "I'll admit defeat."
	done

.AfterText1:
	text "Candela: Here's the"
	line "Harsh Lure."
	done

.AfterText2:
	text "Candela: The Harsh"
	line "Lure draws fierce"
	cont "power."

	para "This is my contri-"
	line "bution to our"
	cont "project."

	para "Use it wisely."
	done

.RefusedText:
	text "No? Guess your"
	line "not ready yet."

	para "Come back when you"
	line "have more fire!"
	done

RocketHideoutB4FBlancheScript:
	faceplayer
	checkevent EVENT_BEAT_BLANCHE
	iftrue_jumptext .AfterText2
	opentext
	writetext .GreetingText
	yesorno
	iffalsefwd .Refused
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer BLANCHE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLANCHE
	opentext
	writetext .AfterText1
	waitbutton
	verbosegivekeyitem POTENT_LURE
	writetext .AfterText2
	waitbutton
	checkevent EVENT_BEAT_SPARK
	iffalse_endtext
	checkevent EVENT_BEAT_CANDELA
	iffalse_endtext
	sjump RocketHideoutB4FDefeatedAllLeadersScript

.Refused:
	jumpopenedtext .RefusedText

.GreetingText:
	text "Blanche: ¿Valoras"
	line "la estrategia?"

	para "¿Ponemos a prueba"
	line "tus tácticas?"
	done

.SeenText:
	text "Very well, let's"
	line "see your"
	cont "technique!"
	done

.BeatenText:
	text "A well-executed"
	line "plan, indeed."

	para "You've bested me."
	done

.AfterText1:
	text "Blanche: Toma el"
	line "Cebo Potente."
	done

.AfterText2:
	text "El Cebo Potente"
	line "mejora toda la"
	cont "precisión."

	para "Es mi aportación"
	line "para asegurar"
	cont "nuestro éxito."

	para "Úsalo con cuidado."
	done

.RefusedText:
	text "Hum, ¿no tienes"
	line "seguridad?"

	para "Vuelve cuando ya"
	line "tengas un plan"
	cont "preparado."
	done

RocketHideoutB4FYoungsterArdenScript:
	faceplayer
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .AfterBattle
	opentext
	writetext .GreetingText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer YOUNGSTER, ARDEN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_YOUNGSTER_ARDEN
	readvar VAR_FACING
	ifnotequal RIGHT, .NotLeftOfArden
	moveobject ROCKETHIDEOUTB4F_LIFT_KEY, 4, 2
.NotLeftOfArden
	appear ROCKETHIDEOUTB4F_LIFT_KEY
.AfterBattle
	showtext .AfterText
	end

.GreetingText
	text "Team Valor is…"

	para "Wait--no!"

	para "I mean, I think"
	line "I'm lost!"
	done

.BeatenText:
	text "Which way was"
	line "the elevator?"
	done

.AfterText:
	text "¡Vaya, se me cayó"
	line "la Llave Ascensor!"

	para "¡Candela se va a"
	line "poner furiosa!"
	done

RocketHideoutB4FTeacherSerena:
	trainer TEACHER_F, SERENA, EVENT_BEAT_TEACHER_SERENA, .SeenText, .AfterText, 0, .Script

.Script
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.AfterScript
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .DoorScript
	endifjustbattled
	jumptextfaceplayer .AfterText
	end

.DoorScript
	checkjustbattled
	iffalsefwd .skip_open
	changeblock 16, 10, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end
.skip_open
	jumptextfaceplayer .AfterText
	end

.AfterText
	text "The leaders are"
	line "only here at"
	cont "night."

	para "They work at"
	line "the university"
	cont "during the day."
	done

.SeenText:
	text "Let me see if you"
	line "are smart enough"

	para "to take on the"
	line "leaders!"
	done

.BeatenText:
	text "Class dismissed!"
	done

RocketHideoutB4FSuperNerdNolan:
	trainer TEACHER_M, NOLAN, EVENT_BEAT_SUPER_NERD_NOLAN, .SeenText, .AfterText, 0, .Script

.Script
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .AfterScript
	jumpthistextfaceplayer

.AfterScript
	checkevent EVENT_BEAT_TEACHER_SERENA
	iftruefwd .DoorScript
	endifjustbattled
	jumptextfaceplayer .AfterText
	end

.DoorScript
	checkjustbattled
	iffalsefwd .skip_open
	changeblock 16, 10, $0d
	playsound SFX_ENTER_DOOR
	waitsfx
	refreshmap
	special RestartMapMusic
	end
.skip_open
	jumptextfaceplayer .AfterText
	end

.AfterText
	text "The leaders argue"
	line "a lot, but they"
	cont "are good friends."
	done

.SeenText:
	text "¿Vienes a retar a"
	line "los líderes?"

	para "¡Derrótame a mí"
	line "primero!"
	done

.BeatenText:
	text "¡Me he bloqueado!"
	done

RocketHideoutB4FDefeatedAllLeadersScript:
	closetext
	special FadeOutPalettes
	warpfacing UP, ROCKET_HIDEOUT_B4F, 17, 7
	turnobject ROCKETHIDEOUTB4F_SPARK, DOWN
	turnobject ROCKETHIDEOUTB4F_BLANCHE, DOWN
	special LoadMapPalettes
	special FadeInPalettes_EnableDynNoApply
	showtext .FinalText
	end

.FinalText:
	text "Candela: Eres más"
	line "fuerte de lo que"
	cont "me esperaba."

	para "Los espráis que te"
	line "dimos son más de"
	cont "lo que parecen."

	para "Blanche: Cada cebo"
	line "guarda el alma de"
	cont "un ave legendaria."

	para "Se hicieron para"
	line "atraer a otros de"
	cont "su misma especie."

	para "Spark: Pero solo"
	line "sirven en el lugar"
	cont "adecuado."

	para "Por eso es"
	line "importante el"
	cont "Gran Arbol."

	para "Candela: El árbol"
	line "es muy antiguo,"
	cont "un nido sagrado."

	para "Está ligado a la"
	line "energía natural."

	para "Blanche: Pájaros"
	line "de gran poder se"
	cont "reúnen allí desde"
	cont "hace siglos."

	para "El árbol potencia"
	line "el gran influjo de"
	cont "los cebos."

	para "Spark: Si los usas"
	line "allí, ¡a saber qué"
	cont "aparecerá!"
	done
