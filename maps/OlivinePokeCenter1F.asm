OlivinePokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, OLIVINE_CITY, 1
	warp_event  6,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalJasmineScript

	def_object_events
	object_event  8,  1, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BeautyCharlotteScript, -1
	pc_nurse_event  5, 1
	object_event  2,  6, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumpstd, happinesschecknpc, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePokeCenter1FFisherText, -1
	object_event 11,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivinePokeCenter1FTeacherText, -1

	object_const_def
	const OLIVINEPOKECENTER1F_BEAUTY

PokemonJournalJasmineScript:
	setflag ENGINE_READ_JASMINE_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Jasmine!"

	para "Rumor has it that"
	line "Jasmine and Erika,"

	para "the Celadon Gym"
	line "Leader, chat about"
	cont "fashion together."
	done

BeautyCharlotteScript:
	checkevent EVENT_BEAT_BEAUTY_CHARLOTTE
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	writetext .GreetingText
	yesorno
	iffalse_jumpopenedtext .NoBattleText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked OLIVINEPOKECENTER1F_BEAUTY
	loadtrainer BEAUTY, CHARLOTTE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BEAUTY_CHARLOTTE
	jumpthistext

.AfterText:
	text "¿A que mola tener"
	line "un #mon tan"
	cont "especial?"
	done

.GreetingText:
	text "¡Anda! ¿Eres un"
	line "entrenador?"

	para "¡Llegas en el"
	line "momento justo!"

	para "Mi #mon tan"
	line "único y hermoso ya"
	cont "está curado."

	para "¿Quieres luchar y"
	line "asombrarte con él?"
	done

.NoBattleText:
	text "¿Ah, sí? ¡Pues"
	line "avísame si te"
	cont "apetece luchar!"
	done

.SeenText:
	text "¡De acuerdo!"
	line "¡Allá voy!"
	done

.BeatenText:
	text "¡Qué combate tan"
	line "increíble!"
	done

OlivinePokeCenter1FFisherText:
	text "Hay un tipo en"
	line "Ciudad Orquídea"
	cont "que parece débil,"

	para "pero enseñó Fuerza"
	line "a mi #mon."

	para "Ahora puede mover"
	line "rocas enormes."
	done

OlivinePokeCenter1FTeacherText:
	text "Hay alguien en"
	line "Ciudad Orquídea,"
	cont "cruzando el mar."

	para "Le oí presumir de"
	line "su #mon raro."
	done