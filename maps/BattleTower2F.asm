BattleTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  1, BATTLE_TOWER_1F, 4

	def_coord_events

	def_bg_events
	bg_event  4,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event  5,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event 16,  3, BGEVENT_UP, BattleTower2FTVScript
	bg_event 17,  3, BGEVENT_UP, BattleTower2FTVScript

	def_object_events
	object_event  4,  6, SPRITE_CHERYL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FCherylScript, EVENT_BATTLE_TOWER_CHERYL
	object_event  7,  7, SPRITE_RILEY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FRileyScript, EVENT_BATTLE_TOWER_RILEY
	object_event  9,  4, SPRITE_BUCK, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FBuckScript, EVENT_BATTLE_TOWER_BUCK
	object_event 17,  8, SPRITE_MARLEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FMarleyScript, EVENT_BATTLE_TOWER_MARLEY
	object_event 12,  7, SPRITE_MIRA, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FMiraScript, EVENT_BATTLE_TOWER_MIRA
	object_event 15,  6, SPRITE_ANABEL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FAnabelScript, EVENT_BATTLE_TOWER_ANABEL
	object_event  4,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FCooltrainermText, EVENT_MURKY_SWAMP_CHERYL
	object_event  7,  7, SPRITE_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FLadyText, EVENT_DIM_CAVE_RILEY
	object_event  9,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FTwinText, EVENT_CINNABAR_VOLCANO_BUCK
	object_event 17,  8, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FSuperNerdText, EVENT_QUIET_CAVE_MARLEY
	pokemon_event 18,  8, PIKACHU, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_RED, BattleTower2FPikachuText, EVENT_QUIET_CAVE_MARLEY
	object_event 12,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FYoungsterText, EVENT_SCARY_CAVE_MIRA
	object_event 15,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BattleTower2FBlackbeltText, EVENT_BATTLE_TOWER_OUTSIDE_ANABEL

	object_const_def
	const BATTLETOWER2F_CHERYL
	const BATTLETOWER2F_RILEY
	const BATTLETOWER2F_BUCK
	const BATTLETOWER2F_MARLEY
	const BATTLETOWER2F_MIRA
	const BATTLETOWER2F_ANABEL

BattleTower2FTVScript:
	jumpthistext

	text "Se ve un intenso"
	line "combate en la TV."
	done

BattleTower2FCherylScript:
	checkflag ENGINE_CHERYL_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Oh, hola,"
		line "<PLAYER>."

		para "Ha pasado mucho"
		line "tiempo… ¿Verdad?"

		para "¿Te apetecería"
		line "echar un combate"
		cont "conmigo?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_CHERYL_DONE_TODAY
	writethistext
		text "Te lo advierto,"
		line "mis #mon pueden"
		cont "llegar a ser muy"
		cont "exaltados."
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_CHERYL
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Team2
	loadtrainer CHERYL, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer CHERYL, 2
	sjumpfwd .StartBattle
.Team3
	loadtrainer CHERYL, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Ser entrenador"
	line "no es fácil."

	para "Cuanto más luchas,"
	line "más descubres."

	para "Pero, ¿sabes?"
	line "¡Amo a los #mon"
	cont "por eso también!"
	done

.BeatenText:
	text "Lograr el equili-"
	line "brio adecuado"
	cont "entre el ataque"
	cont "y la defensa…"

	para "No es nada"
	line "fácil."
	done

.RefuseText:
	text "Jeje…"

	para "Los #mon acaba-"
	line "rían agotados si"

	para "luchásemos todo"
	line "el rato, ¿no"
	cont "crees?"
	done

BattleTower2FRileyScript:
	checkflag ENGINE_RILEY_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "Hola. Cuánto tiem-"
		line "po sin vernos."

		para "Esa mirada tuya…"
		line "Supongo que estás"

		para "¿listo para un"
		line "combate?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_RILEY_DONE_TODAY
	writethistext
		text "¡Luchar es nuestra"
		line "forma de saludo!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_RILEY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer RILEY, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer RILEY, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Si no hubiera es-"
	line "tado en la Cueva"
	cont "Oscura entonces…"

	para "Si tú no hubieras"
	line "estado allí…"

	para "Quizá nunca nos"
	line "habríamos conoci-"
	cont "do."

	para "O, ¿nos habríamos"
	line "visto en otra"
	cont "parte?"
	done

.BeatenText:
	text "A veces luchamos,"
	line "y a veces formamos"
	cont "equipo."

	para "Es genial cómo"
	line "los entrenadores"
	cont "interactúan."
	done

.RefuseText:
	text "Oh, está bien."
	line "Entonces espere-"
	cont "mos a que estés"
	cont "listo."
	done

BattleTower2FBuckScript:
	checkflag ENGINE_BUCK_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "¡Jejeje! ¡Al fin"
		line "estás aquí!"

		para "¿Así que vamos"
		line "a combatir?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_BUCK_DONE_TODAY
	writethistext
		text "¡Siento que mis"
		line "#mon tiemblan"

		para "dentro de sus"
		line "# Balls de"
		cont "anticipación!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_BUCK
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer BUCK, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer BUCK, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "¡Fiuu! ¡Demasiado!"

	para "Supongo que segui-"
	line "ré mejorando a mi"
	cont "equipo."
	done

.BeatenText:
	text "¡Jejeje!"
	line "¡Qué ardiente!"
	done

.RefuseText:
	text "Eh, ¿qué? Eso"
	line "me quita todo el"
	cont "entusiasmo."
	done

BattleTower2FMarleyScript:
	checkflag ENGINE_MARLEY_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "…¿Oh? ¿Un com-"
		line "bate? ¿Conmigo?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_MARLEY_DONE_TODAY
	writethistext
		text "…Vale. Yo…"
		line "¡no perderé...!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_MARLEY
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Team2
	loadtrainer MARLEY, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer MARLEY, 2
	sjumpfwd .StartBattle
.Team3
	loadtrainer MARLEY, 3
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "…Puede que me"
	line "guste combatir"
	cont "contigo."

	para "…Solo un poco."
	line "Solo un poquitín."
	done

.BeatenText:
	text "…Ohhh."
	done

.RefuseText:
	text "…Oh, vaya. Estás"
	line "empezando a cae-"
	cont "rme un poco mal."
	done

BattleTower2FMiraScript:
	checkflag ENGINE_MIRA_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "¡<PLAYER>! ¡Mira"
		line "es más fuerte!"

		para "¡Por favor! ¡Com-"
		line "bate con Mira!"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_MIRA_DONE_TODAY
	writethistext
		text "¡Mira te de-"
		line "mostrará que ya no"

		para "se pierde,"
		line "<PLAYER>!"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_MIRA
	checkevent EVENT_BEAT_ELITE_FOUR_AGAIN
	iftruefwd .Team2
	loadtrainer MIRA, 1
	sjumpfwd .StartBattle
.Team2
	loadtrainer MIRA, 2
.StartBattle
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "<PLAYER>, siempre"
	line "estás con tus"
	cont "#mon."

	para "Así es como te"
	line "hiciste tan fuer-"
	cont "te."

	para "¡Mira empieza"
	line "a entenderlo!"
	done

.BeatenText:
	text "Mira se pregunta"
	line "si podrá llegar"

	para "muy lejos en la"
	line "Torre Batalla."
	done

.RefuseText:
	text "Mira está un po-"
	line "co triste…"
	done

BattleTower2FAnabelScript:
	checkflag ENGINE_ANABEL_DONE_TODAY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writethistext
		text "De verdad viniste"
		line "a verme…"

		para "No tendré que con-"
		line "tenerme conti-"
		cont "go…"

		para "¿Estás listo?"
		done
	yesorno
	iffalse_jumpopenedtext .RefuseText
	setflag ENGINE_ANABEL_DONE_TODAY
	writethistext
		text "Empecemos,"
		line "¿te parece?"
		done
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked BATTLETOWER2F_ANABEL
	loadtrainer ANABEL, 2
	startbattle
	reloadmapafterbattle
	jumpthistext

.AfterText:
	text "Eso fue diverti-"
	line "do…"

	para "Nunca antes había"
	line "tenido un comba-"

	para "te #mon tan"
	line "agradable…"
	done

.BeatenText:
	text "Gracias…"
	done

.RefuseText:
	text "Es muy decep-"
	line "cionante…"
	done

BattleTower2FCooltrainermText:
	text "Me tengo que ir,"
	line "¡pero no puedo"

	para "dejar de mirar es-"
	line "te combate!"
	done

BattleTower2FLadyText:
	text "¿Qué es lo que más"
	line "me gusta de ser"
	cont "entrenadora?"

	para "¡El hecho de que"
	line "los #mon me"

	para "traerán un mon-"
	line "tón de amigos!"
	done

BattleTower2FTwinText:
	text "Algunos se"
	line "sorprenden al ver"

	para "a una niña peque-"
	line "ña como yo en la"
	cont "Torre Batalla."

	para "Tampoco es que yo"
	line "tenga que luchar,"
	cont "¿sabes?"
	done

BattleTower2FSuperNerdText:
	text "¡Jeje! ¡Todos los"
	line "entrenadores que"
	cont "nos rodean pare-"
	cont "cen patéticos!"

	para "…En realidad,"
	line "¡pensar así hace"
	cont "que pierdas de"
	cont "un golpe!"

	para "¡No bajes la"
	line "guardia,"
	cont "Pikachu!"
	done

BattleTower2FPikachuText:
	text "Pikachu: ¡Pichuu!"
	done

BattleTower2FYoungsterText:
	text "Ser fuerte es ser"
	line "débil."

	para "Ser débil es ser"
	line "fuerte."

	para "Alguien me dijo"
	line "eso antes."

	para "No lo entiendo,"
	line "pero suena pro-"
	cont "fundo."
	done

BattleTower2FBlackbeltText:
	text "¡El karategi es"
	line "el uniforme de"
	cont "los luchadores!"

	para "¡No hay nada más"
	line "adecuado para la"

	para "Torre Batalla que"
	line "esto!"
	done
