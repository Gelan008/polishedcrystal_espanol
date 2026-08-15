RocketHideoutB4F_MapScriptHeader:
	def_scene_scripts
	scene_script RocketHideoutB4FMeetLeadersScene, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS
	scene_script RocketHideoutB4FMetLeadersScene, SCENE_ROCKETHIDEOUTB4F_MET_LEADERS
	scene_const SCENE_ROCKETHIDEOUTB4F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RocketHideoutB4FLiftKeyScript
	callback MAPCALLBACK_TILES, RocketHideoutB4FDoorScript

	def_warp_events
	warp_event 11, 10, ROCKET_HIDEOUT_B3F, 2
	warp_event 16, 15, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, ROCKET_HIDEOUT_ELEVATOR, 1

	def_coord_events
	coord_event 16, 11, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS, RocketHideoutB4FMeetLeadersLeftScript
	coord_event 17, 11, SCENE_ROCKETHIDEOUTB4F_MEET_LEADERS, RocketHideoutB4FMeetLeadersRightScript

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
	changeblock 16, 10, $07
	endcallback
.beat_serena
	checkevent EVENT_BEAT_SUPER_NERD_NOLAN
	iftruefwd .beat_theo
	changeblock 16, 10, $07
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
	setscene SCENE_ROCKETHIDEOUTB4F_MET_LEADERS
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

	para "Planear con inte-"
	line "ligencia siempre"
	cont "da la victoria."
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
	text "Candela: ¿El ins-"
	line "tinto? ¡Eso solo"
	cont "es dar palos"
	cont "de ciego!"

	para "¡Los entrenadores"
	line "de verdad usan la"
	cont "fuerza!"
	done

.BlancheIntro2Text:
	text "Blanche: Candela,"
	line "Spark, ¡no es el"
	cont "momento!"

	para "¿Qué hay del pro-"
	line "yecto del Gran"
	cont "Arbol?"
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

	para "¡Si ganas, te de-"
	line "jaremos unirte a"

	para "nuestro gran pro-"
	line "yecto!"
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
	text "Spark: ¡Ey! ¿Te a-"
	line "treves a confiar"
	cont "en tu instinto?"

	para "¿En un combate?"
	done

.SeenText:
	text "¡Genial! ¡A ver"
	line "adónde te lleva"
	cont "tu intuición!"
	done

.BeatenText:
	text "¡Hala, lo has cla-"
	line "vado por completo!"

	para "¡Tu intuición te"
	line "ha guiado bien!"
	done

.AfterText1:
	text "Spark: ¡Toma el"
	line "Cebo Maligno!"
	done

.AfterText2:
	text "El Cebo Maligno"
	line "atrae la energía"
	cont "audaz."

	para "¡Es mi forma de"
	line "dar una chispa de"
	cont "creatividad!"

	para "¡Úsalo con deci-"
	line "sión!"
	done

.RefusedText:
	text "¡Vaya, qué pena!"
	line "¡No dejes que el"
	cont "miedo te frene!"

	para "¡Vuelve cuando lo"
	line "sientas dentro!"
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
	text "Candela: ¿A punto"
	line "para poner a prue-"
	cont "ba tu fuerza?"
	done

.SeenText:
	text "¡Ese es el espíri-"
	line "tu! ¡Demuéstrame"
	cont "tu poder!"
	done

.BeatenText:
	text "De acuerdo, hoy"
	line "has demostrado tu"
	cont "fuerza."

	para "Admito mi derrota."
	done

.AfterText1:
	text "Candela: ¡Toma el"
	line "Cebo Cruel!"
	done

.AfterText2:
	text "Candela: El Cebo"
	line "Cruel atrae un po-"
	cont "der feroz."

	para "Esta es mi aporta-"
	line "ción a nuestro"
	cont "proyecto."

	para "Úsalo con cabeza."
	done

.RefusedText:
	text "¿No? Se ve que aún"
	line "no estás a punto."

	para "¡Vuelve cuando"
	line "tengas más chispa!"
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
	text "Muy bien, ¡veamos"
	line "tu técnica!"
	done

.BeatenText:
	text "Un plan bien eje-"
	line "cutado, sin duda."

	para "Me has superado."
	done

.AfterText1:
	text "Blanche: Aquí tie-"
	line "nes el Cebo"
	cont "Potente."
	done

.AfterText2:
	text "El Cebo Potente"
	line "amplifica su pre-"
	cont "cisión."

	para "Es mi contribución"
	line "para asegurar"
	cont "nuestro éxito."

	para "Úsalo con cuidado."
	done

.RefusedText:
	text "Hum, ¿no tienes"
	line "seguridad?"

	para "Vuelve cuando ten-"
	line "gas una estrate-"
	cont "gia pensada."
	done

RocketHideoutB4FYoungsterArdenScript:
	faceplayer
	checkevent EVENT_BEAT_YOUNGSTER_ARDEN
	iftruefwd .AfterBattle
	showtext .GreetingText
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
	text "El Equipo Valor"
	line "es…"

	para "¡Espera, no!"

	para "O sea… ¡creo que"
	line "me he perdido!"
	done

.BeatenText:
	text "¿Por dónde que-"
	line "daba el ascensor?"
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
	text "Los líderes solo"
	line "están aquí por"
	cont "la noche."

	para "De día trabajan"
	line "en la universidad."
	done

.SeenText:
	text "¡A ver si tienes"
	line "la agudeza para"

	para "enfrentarte a los"
	line "líderes!"
	done

.BeatenText:
	text "¡Fin de la clase!"
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
	text "Los líderes discu-"
	line "ten mucho, pero"
	cont "son buenos amigos."
	done

.SeenText:
	text "¿Vienes a desafiar"
	line "a los líderes?"

	para "¡Tendrás que ven-"
	line "cerme primero!"
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
	line "contiene la esen-"
	cont "cia de un pájaro"

	para "legendario #mon."

	para "Se crearon para"
	line "atraer a otros de"
	cont "su misma especie."

	para "Spark: Pero solo"
	line "sirven en el lugar"
	cont "adecuado."

	para "Por eso es impor-"
	line "tante el Gran"
	cont "Arbol."

	para "Candela: El árbol"
	line "es antiquísimo,"

	para "un lugar sagrado"
	line "para anidar."

	para "Está conectado a"
	line "la energía de la"
	cont "región."

	para "Blanche: Pájaros"
	line "de gran poder se"

	para "han reunido allí"
	line "por generaciones."

	para "El árbol amplifi-"
	line "ca la llamada de"
	cont "los cebos."

	para "Spark: Así que, si"
	line "los usas allí…"

	para "¡quién sabe lo que"
	line "podría aparecer!"
	done
