YellowForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, YellowForestFlyPoint
	callback MAPCALLBACK_TILES, YellowForestTileScript

	def_warp_events
	warp_event 28, 47, YELLOW_FOREST_GATE, 1
	warp_event 29, 47, YELLOW_FOREST_GATE, 2
	warp_event 19, 12, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 32, 16, 1, YellowForestBridgeOverheadTrigger
	coord_event 32, 17, 1, YellowForestBridgeOverheadTrigger
	coord_event 39, 16, 1, YellowForestBridgeOverheadTrigger
	coord_event 39, 17, 1, YellowForestBridgeOverheadTrigger
	coord_event 33, 16, 0, YellowForestBridgeUnderfootTrigger
	coord_event 33, 17, 0, YellowForestBridgeUnderfootTrigger
	coord_event 38, 16, 0, YellowForestBridgeUnderfootTrigger
	coord_event 38, 17, 0, YellowForestBridgeUnderfootTrigger

	def_bg_events
	bg_event 39, 14, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BIG_MUSHROOM
	bg_event 43, 36, BGEVENT_ITEM + BALMMUSHROOM, EVENT_YELLOW_FOREST_HIDDEN_BALM_MUSHROOM
	bg_event 32, 11, BGEVENT_ITEM + GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF_1
	bg_event  9, 40, BGEVENT_ITEM + GOLD_LEAF, EVENT_YELLOW_FOREST_HIDDEN_GOLD_LEAF_2
	bg_event 19, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_YELLOW_FOREST
	bg_event 20, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_YELLOW_FOREST

	def_object_events
	object_event  7, 24, SPRITE_WALKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 1, YellowForestWalkerScript, EVENT_YELLOW_FOREST_WALKER
	pokemon_event  8, 24, SKARMORY, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_GRAY, ClearText, EVENT_YELLOW_FOREST_SKARMORY
	object_event 47,  6, SPRITE_YELLOW, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, YellowForestYellowScript, -1
	object_event 49, 26, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DECO_ITEM, OBJECTTYPE_SCRIPT, 0, YellowForestSurfPikachuDoll, EVENT_DECO_SURFING_PIKACHU_DOLL
	object_event 31,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, YellowForestSuperNerdText, -1
	object_event 19, 41, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlSarah, -1
	object_event 13, 34, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlIsabel, -1
	object_event  4, 38, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerTeacherKathryn, -1
	object_event 43, 42, SPRITE_BREEDER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBreederSophie, -1
	object_event 15, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, YellowForestCooltrainerMScript, -1
	tmhmball_event 25, 18, TM_LEECH_LIFE, EVENT_YELLOW_FOREST_TM_LEECH_LIFE
	itemball_event 32, 26, MIRACLE_SEED, 1, EVENT_YELLOW_FOREST_MIRACLE_SEED
	itemball_event 11, 23, BIG_ROOT, 1, EVENT_YELLOW_FOREST_BIG_ROOT
	itemball_event 50, 13, LEMONADE, 1, EVENT_YELLOW_FOREST_LEMONADE

	object_const_def
	const YELLOWFOREST_WALKER
	const YELLOWFOREST_SKARMORY
	const YELLOWFOREST_YELLOW
	const YELLOWFOREST_POKE_BALL5

YellowForestFlyPoint:
	setflag ENGINE_FLYPOINT_YELLOW_FOREST
	endcallback

YellowForestTileScript:
	checkscene
	iftruefwd .underfoot
	callasm YellowForest_OverheadBridgeAsm
	endcallback

.underfoot:
	callasm YellowForest_UnderfootBridgeAsm
	endcallback

YellowForest_OverheadBridgeAsm:
	changebridgeblock 32, 16, $9d, YELLOW_FOREST
	changebridgeblock 34, 16, $9e, YELLOW_FOREST
	changebridgeblock 36, 16, $9e, YELLOW_FOREST
	changebridgeblock 38, 16, $9f, YELLOW_FOREST
	jmp BufferScreen

YellowForest_UnderfootBridgeAsm:
	changebridgeblock 32, 16, $86, YELLOW_FOREST
	changebridgeblock 34, 16, $97, YELLOW_FOREST
	changebridgeblock 36, 16, $97, YELLOW_FOREST
	changebridgeblock 38, 16, $87, YELLOW_FOREST
	jmp BufferScreen

YellowForestBridgeOverheadTrigger:
	callasm YellowForest_OverheadBridgeAsm
	callthisasm
	xor a
	jr YellowForest_FinishBridge

YellowForestBridgeUnderfootTrigger:
	callasm YellowForest_UnderfootBridgeAsm
	callthisasm
	ld a, $1
YellowForest_FinishBridge:
	ld [wWalkingOnBridge], a
	ld [wYellowForestSceneID], a ; setscene a
	jmp GenericFinishBridge

GenericTrainerSchoolgirlSarah:
	generictrainer SCHOOLGIRL, SARAH, EVENT_BEAT_SCHOOLGIRL_SARAH, SchoolgirlSarahSeenText, SchoolgirlSarahBeatenText

	text "If we were at my"
	line "school, I'd have"
	cont "beaten you!"
	done

GenericTrainerSchoolgirlIsabel:
	generictrainer SCHOOLGIRL, ISABEL, EVENT_BEAT_SCHOOLGIRL_ISABEL, SchoolgirlIsabelSeenText, SchoolgirlIsabelBeatenText

	text "We're learning"
	line "about how #mon"

	para "thrive together"
	line "in the wild."
	done

GenericTrainerTeacherKathryn:
	generictrainer TEACHER_F, KATHRYN, EVENT_BEAT_TEACHER_KATHRYN, TeacherKathrynSeenText, TeacherKathrynBeatenText

	text "Keeping an eye on"
	line "everyone during a"

	para "field trip is"
	line "hard work."
	done

GenericTrainerBreederSophie:
	generictrainer BREEDER, SOPHIE, EVENT_BEAT_BREEDER_SOPHIE, BreederSophieSeenText, BreederSophieBeatenText

	text "Sometimes Pikachu"
	line "use their electric"

	para "shocks to revive"
	line "fainted ones."

	para "That's just the"
	line "cutest!"
	done

YellowForestWalkerScript:
	showtextfaceplayer YellowForestWalkerSeenText
	winlosstext YellowForestWalkerBeatenText, 0
	setlasttalked YELLOWFOREST_WALKER
	loadtrainer WALKER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WALKER
	opentext
	writetext YellowForestWalkerAfterText
	promptbutton
	verbosegivetmhm HM_FLY
	setevent EVENT_GOT_HM02_FLY
	writetext YellowForestWalkerFinalText
	waitbutton
	closetext
	appear YELLOWFOREST_SKARMORY
	playsound SFX_BALL_POOF
	turnobject YELLOWFOREST_WALKER, RIGHT
	waitsfx
	pause 15
	cry SKARMORY
	waitsfx
	turnobject YELLOWFOREST_WALKER, DOWN
	showtext YellowForestWalkerFlyText
	playsound SFX_FLY
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear YELLOWFOREST_WALKER
	disappear YELLOWFOREST_SKARMORY
	waitsfx
	pause 15
	special Special_FadeInQuickly
	end

YellowForestYellowScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd YellowForestYellowBattleScript
	checkevent EVENT_GOT_LIGHT_BALL_FROM_YELLOW
	iffalsefwd YellowBattleAfterBallScript
	jumpopenedtext YellowForestYellowGoodbyeText

YellowForestYellowBattleScript:
	writetext YellowForestYellowGreetingText
	waitbutton
	closetext
	winlosstext YellowForestYellowWinLossText, 0
	setlasttalked YELLOWFOREST_YELLOW
	loadtrainer YELLOW, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_YELLOW
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iffalsefwd .skip
	clearevent EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
.skip
	opentext
	writetext YellowForestYellowAfterText
	scall YellowTryGiveLightBallScript
	end

YellowBattleAfterBallScript:
	faceplayer
	opentext
	writetext YellowForestYellowAfterText
YellowTryGiveLightBallScript:
	promptbutton
	verbosegiveitem LIGHT_BALL
	iffalsefwd NoRoomForLightBallScript
	setevent EVENT_GOT_LIGHT_BALL_FROM_YELLOW
	writetext YellowForestYellowGoodbyeText
	waitbutton
NoRoomForLightBallScript:
	endtext

YellowForestCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
	iftruefwd YellowForestTutorSeedBombScript
	writetext YellowForestCooltrainerMText
	waitbutton
	setevent EVENT_LISTENED_TO_SEED_BOMB_INTRO
YellowForestTutorSeedBombScript:
	writetext Text_YellowForestTutorSeedBomb
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_YellowForestTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval SEED_BOMB
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_YellowForestTutorRefused

.NoSilverLeaf
	jumpopenedtext Text_YellowForestTutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_YellowForestTutorTaught

YellowForestSurfPikachuDoll:
	disappear YELLOWFOREST_POKE_BALL5
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	opentext
	writetext YellowForestSurfPikachuDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	jumpopenedtext YellowForestSurfPikachuDollSentText

SchoolgirlSarahSeenText:
	text "¡Hala, alguien con"
	line "quien combatir!"
	done

SchoolgirlSarahBeatenText:
	text "Snif…"
	line "¡Me has ganado!"
	done

SchoolgirlIsabelSeenText:
	text "¿Tienes #mon"
	line "tan monos como los"
	cont "que hay por aquí?"
	done

SchoolgirlIsabelBeatenText:
	text "¡Tus #mon son"
	line "muy fuertes!"
	done

TeacherKathrynSeenText:
	text "¡Eh, tú! ¿Eres un"
	line "entrenador?"

	para "¡Más te vale no"
	line "hacer llorar a mis"
	cont "alumnos!"
	done

TeacherKathrynBeatenText:
	text "No voy a dejar"
	line "que esto me haga"
	cont "llorar…"
	done

BreederSophieSeenText:
	text "¿Sabías que"
	line "Pikachu ya está"
	cont "evolucionado?"
	done

BreederSophieBeatenText:
	text "¡Ya me lo parecía!"
	done

YellowForestWalkerSeenText:
	text "¡Hola! Me llamo"
	line "Wayne."

	para "Fui Líder en"
	line "Ciudad Malva,"

	para "le cedí el puesto"
	line "a mi hijo."

	para "Ahora viajo por"
	line "Johto mirando los"
	cont "paisajes."

	para "Wayne: ¿Reúnes"
	line "las Medallas de"
	cont "Gimnasio?"

	para "¡Así que mi hijo"
	line "perdió contra ti!"

	para "¡Pues quiero poner"
	line "a prueba tu gran"
	cont "habilidad!"

	para "No tengo Medallas,"
	line "¡pero te daré un"
	cont "regalo si ganas!"
	done

YellowForestWalkerBeatenText:
	text "¡Mis aves #mon…"
	line "derrotadas!"
	done

YellowForestWalkerAfterText:
	text "Wayne: Ya veo por"
	line "qué le ganaste a"
	cont "Pegaso."

	para "¡Conoces a fondo"
	line "a tus #mon!"

	para "¡Te has ganado"
	line "esta MO!"
	done

YellowForestWalkerFinalText:
	text "Wayne: Los #mon"
	line "pájaro vuelan alto"
	cont "porque lo desean"
	cont "de corazón."

	para "Si deseas algo con"
	line "tanta fuerza, sé"
	cont "que lo lograrás."

	para "Lo que yo quiero"
	line "es viajar más."

	para "¡Hasta luego!"
	done

YellowForestWalkerFlyText:
	text "¡Skarmory, usa"
	line "Vuelo!"
	done

YellowForestYellowGreetingText:
	text "Amarillo: ¡Hola!"
	line "¡Soy Amarillo!"

	para "Este bosque lleno"
	line "de Pikachu…"

	para "Me recuerda a mi"
	line "hogar en Kanto,"
	cont "donde atrapé a mi"
	cont "primer #mon."

	para "El entrenador que"
	line "me ayudó a cazarlo"
	cont "me dijo algo:"

	para "¡si los cuidas con"
	line "todo tu corazón,"
	cont "serán tus amigos!"

	para "Noto que cuidas"
	line "bien a tus #mon"

	para "¡Veamos qué pueden"
	line "hacer tus amigos!"
	done

YellowForestYellowWinLossText:
	text "¡Jaja! ¡Menudo"
	line "combate!"
	done

YellowForestYellowAfterText:
	text "Amarillo: ¡Vaya!"
	line "Eres un entrenador"
	cont "excelente."

	para "¡Toma algo que tus"
	line "amigos sabrán"
	cont "agradecer!"
	done

YellowForestYellowGoodbyeText:
	text "Amarillo: Dásela"
	line "a un Pikachu para"
	cont "aumentar su poder."
	done

YellowForestCooltrainerMText:
	text "Las semillas son"
	line "sorprendentemente"
	cont "poderosas."

	para "Con los años, una"
	line "pequeña semilla se"
	cont "vuelve un gran"
	cont "árbol."

	para "¡Y una semilla"
	line "grande puede"
	cont "caer y golpearte!"
	done

Text_YellowForestTutorSeedBomb:
	text "Puedo enseñarle"
	line "Bomba Germen a tu"
	cont "#mon por una"
	cont "Hoja Plata."
	done

Text_YellowForestTutorNoSilverLeaf:
	text "Aw, you don't have"
	line "a Silver Leaf."
	done

Text_YellowForestTutorQuestion:
	text "¿Le enseño Bomba"
	line "Germen a tu"
	cont "#mon?"
	done

Text_YellowForestTutorRefused:
	text "Talk to me if you"
	line "change your mind!"
	done

Text_YellowForestTutorTaught:
	text "Now your #mon"
	line "knows how to use"
	cont "Seed Bomb!"
	done

YellowForestSuperNerdText:
	text "El cuerpo tiene"
	line "una proteína dicha"
	cont "pikachurina."

	para "¿Qué inspiró ese"
	line "nombre?"

	para "¡Pues Pikachu, sin"
	line "duda alguna!"
	done

YellowForestSurfPikachuDollText:
	text "<PLAYER> encontró"
	line "Muñeco Pikachu"
	cont "Surfista."
	done

YellowForestSurfPikachuDollSentText:
	text "Surf Pikachu Doll"
	line "was sent home."
	done
