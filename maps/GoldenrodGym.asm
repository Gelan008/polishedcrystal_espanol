GoldenrodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, 1, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  9,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath1, -1
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerLassCathy, -1
	object_event  9,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath2, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1

	object_const_def
	const GOLDENRODGYM_LASS2

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftruefwd .FightDone
	showtext WhitneyBeforeText
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene $1
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CATHY
	setevent EVENT_BEAT_SR_AND_JR_JO_AND_CATH
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalsefwd .StoppedCrying
	jumpopenedtext WhitneyYouMeanieText

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue_jumpopenedtext WhitneyGoodCryText
	checkflag ENGINE_PLAINBADGE
	iftruefwd .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	givebadge PLAINBADGE, JOHTO_REGION
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegivetmhm TM_ATTRACT
	setevent EVENT_GOT_TM45_ATTRACT
	jumpthisopenedtext

	text "It's Attract!"
	line "It makes full use"

	para "of a #mon's"
	line "charm."

	para "Isn't it just per-"
	line "fect for a cutie"
	cont "like me? ♥"
	done

GenericTrainerLassCathy:
	generictrainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathySeenText, LassCathyBeatenText

	text "Do my #mon"
	line "think I'm cute?"
	done

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, JoWalksUpMovement
	turnobject PLAYER, DOWN
	showtext JoWhitneyCriesText
	applymovement GOLDENRODGYM_LASS2, JoWalksAwayMovement
	setscene $0
	clearevent EVENT_MADE_WHITNEY_CRY
	end

GenericTrainerSrandjrJoandcath1:
	generictrainer SR_AND_JR, JOANDCATH1, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath1SeenText, SrandjrJoandcath1BeatenText

	text "Jo: I'm helping my"
	line "junior Cath to"

	para "earn a Badge"
	line "from Whitney."

	para "She's improving"
	line "gradually."
	done

GenericTrainerSrandjrJoandcath2:
	generictrainer SR_AND_JR, JOANDCATH2, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath2SeenText, SrandjrJoandcath2BeatenText

	text "Cath: I keep on"
	line "losing to Whitney."
	cont "It's depressing."

	para "I'm OK! If I lose,"
	line "I'll just try"
	cont "harder next time!"
	done

GenericTrainerBeautyVictoria:
	generictrainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText

	text "Wow, you must be"
	line "good to beat me!"
	cont "Keep it up!"
	done

GenericTrainerBeautySamantha:
	generictrainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText

	text "I taught Meowth"
	line "moves for taking"
	cont "on any type…"
	done

GoldenrodGymGuyScript:
	checkevent EVENT_BEAT_WHITNEY
	iftrue_jumptextfaceplayer GoldenrodGymGuyWinText
	jumpthistextfaceplayer

	text "Yo! Champ in"
	line "making!"

	para "This Gym is home"
	line "to Normal-type"
	cont "#mon trainers."

	para "I recommend you"
	line "use Fighting-type"
	cont "#mon."

	para "But be careful--"
	line "Fairy #mon"

	para "resist Fighting-"
	line "type moves,"

	para "and they're used"
	line "here too!"
	done

GoldenrodGymStatue:
	gettrainername WHITNEY, 1, STRING_BUFFER_4
	checkflag ENGINE_PLAINBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 10, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

JoWalksUpMovement:
	step_left
	turn_head_up
	step_end

JoWalksAwayMovement:
	step_right
	turn_head_left
	step_end

WhitneyBeforeText:
	text "¡Hola! ¡Soy"
	line "Blanca!"

	para "A todos les mola"
	line "los #mon, ¡así"
	cont "que a mí también!"

	para "¡Los #mon son"
	line "supermonos!"

	para "¿Quieres luchar?"
	line "¡Te advierto que"
	cont "soy muy buena!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Snif…"

	para "¡...Buuuuaaaah!"
	line "¡Eres malo!"

	para "¡No deberías"
	line "habértelo tomado"
	cont "en serio! ¡Eres"
	cont "un niñato!"
	done

WhitneyYouMeanieText:
	text "Waaaaah!"

	para "Waaaaah!"

	para "…Snivel, hic…"
	line "…You meanie!"
	done

WhitneyWhatDoYouWantText:
	text "…Snif…"

	para "¿Qué quieres?"
	line "¿Una Medalla?"

	para "Ah, claro."
	line "Se me olvidaba."
	cont "Toma la Medalla"
	cont "Planicie."
	done

WhitneyPlainBadgeText:
	text "La Medalla"
	line "Planicie te "
	cont "permite usar"

	para "Fuerza fuera del"
	line "combate a tus"
	cont "#mon."

	para "¡Ah, toma esto"
	line "también!"
	done

WhitneyGoodCryText:
	text "¡Ah, qué a gusto"
	line "me he quedado"
	cont "llorando!"

	para "¡Ven a visitarnos"
	line "otra vez! ¡Chao!"
	done

LassCathySeenText:
	text "¡Que lo monos que"
	line "son mis #mon no"
	cont "te engañe!"

	para "¡Te darán una gran"
	line "paliza!"
	done

LassCathyBeatenText:
	text "Jolín… Creí que"
	line "eras débil…"
	done

SrandjrJoandcath1SeenText:
	text "Jo: ¡Si quieres"
	line "enfrentarte a"
	cont "Blanca,"

	para "tendrás que pasar"
	line "por encima de mí!"

	para "Cath, ¿ha sonado"
	line "guay?"
	done

SrandjrJoandcath1BeatenText:
	text "Jo: ¡Perder no es"
	line "nada guay!"
	done

SrandjrJoandcath2SeenText:
	text "Cath: Intento"
	line "vencer a Blanca,"
	cont "¡pero podemos"
	cont "ganarte a ti!"
	done

SrandjrJoandcath2BeatenText:
	text "Cath: ¡Oh, no,"
	line "no, no!"
	done

JoWhitneyCriesText:
	text "Oh, no. Has hecho"
	line "llorar a Blanca."

	para "Tranquilo. Parará"
	line "pronto. Siempre"
	cont "llora al perder."
	done

BeautyVictoriaSeenText:
	text "¡Oh, eres un"
	line "entrenador muy"
	cont "mono! ♥"

	para "Me gustas, ¡pero"
	line "no me contendré!"
	done

BeautyVictoriaBeatenText:
	text "Veamos... Uy,"
	line "¿ya se acabó?"
	done

BeautySamanthaSeenText:
	text "¡Da lo mejor de ti"
	line "o te hundiré!"
	done

BeautySamanthaBeatenText:
	text "¡No! ¡Oh, Meowth,"
	line "lo siento mucho!"
	done

GoldenrodGymGuyWinText:
	text "¿Ganaste? ¡Genial!"
	line "Yo estaba ocupado"
	cont "mirando a las"
	cont "chicas de aquí."
	done
