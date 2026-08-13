GoldenrodGym_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_GOLDENRODGYM_NOOP
	scene_const SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  9,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath1, -1
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCathy, -1
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
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CATHY
	setevent EVENT_BEAT_SR_AND_JR_JO_AND_CATH
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalsefwd .StoppedCrying
	jumpthisopenedtext

	text "¡Buuuuaaaah!"

	para "¡Buuuuaaaah!"

	para "...Snif, hip..."
	line "¡...Eres malo!"
	done

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

	text "¡Es Atracción!"
	line "Saca todo el pro-"

	para "vecho del encanto"
	line "de un #mon."

	para "¿No es simplemen-"
	line "te perfecto para"
	cont "una ricura como"
	cont "yo? ♥"
	done

TrainerLassCathy:
	trainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathySeenText, LassCathyBeatenText, 0, .Script, TRAINERPAL_DARK_LASS

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¿Creen mis #-"
	line "mon que soy"
	cont "mona?"
	done

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, JoWalksUpMovement
	turnobject PLAYER, DOWN
	showtext JoWhitneyCriesText
	applymovement GOLDENRODGYM_LASS2, JoWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

GenericTrainerSrandjrJoandcath1:
	generictrainer SR_AND_JR, JOANDCATH1, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath1SeenText, SrandjrJoandcath1BeatenText

	text "Jo: Ayudo a mi"
	line "junior Cath a"

	para "ganar una Medalla"
	line "de Blanca."

	para "Poco a poco va"
	line "mejorando."
	done

GenericTrainerSrandjrJoandcath2:
	generictrainer SR_AND_JR, JOANDCATH2, EVENT_BEAT_SR_AND_JR_JO_AND_CATH, SrandjrJoandcath2SeenText, SrandjrJoandcath2BeatenText

	text "Cath: No dejo de"
	line "perder contra"
	cont "Blanca. Es muy"
	cont "deprimente."

	para "¡Pero bueno! ¡Si"
	line "pierdo me esforza-"
	cont "ré más a la"
	cont "próxima!"
	done

GenericTrainerBeautyVictoria:
	generictrainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText

	text "¡Vaya, debes ser"
	line "bueno para haber-"
	cont "me ganado!"
	cont "¡Sigue así!"
	done

GenericTrainerBeautySamantha:
	generictrainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText

	text "Le enseñé a Meowth"
	line "movimientos para"
	cont "enfrentar a cual-"
	cont "quier tipo..."
	done

GoldenrodGymGuyScript:
	checkevent EVENT_BEAT_WHITNEY
	iftrue_jumptextfaceplayer GoldenrodGymGuyWinText
	jumpthistextfaceplayer

	text "¡Eh! ¡Futuro"
	line "Campeón!"

	para "Este Gimnasio re-"
	line "úne a entrenadores"
	cont "de tipo Normal."

	para "Te recomiendo usar"
	line "#mon de tipo"
	cont "Lucha."

	para "Pero ten cuida-"
	line "do... Los #mon"

	para "de tipo Hada re-"
	line "sisten los ataques"
	cont "de tipo Lucha,"

	para "¡y aquí también"
	line "los usan!"
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

	para "A todos les gusta-"
	line "ban los #mon,"
	cont "¡así que a mí"
	cont "también!"

	para "¡Los #mon son"
	line "supermonos!"

	para "¿Quieres un"
	line "combate? Te lo"
	cont "advierto..."
	cont "¡soy muy buena!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Snif..."

	para "¡...Buuuuaaaah!"
	line "¡Eres malo!"

	para "¡No deberías"
	line "habértelo tomado"
	cont "en serio! ¡Eres"
	cont "un niñato!"
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

	para "¡Vuelve a visitar-"
	line "nos! ¡Chao!"
	done

LassCathySeenText:
	text "Que el aspec-"
	line "to adorable de"

	para "mis #mon no te"
	line "engañe."
	cont "¡Te darán una pa-"
	cont "liza!"
	done

LassCathyBeatenText:
	text "Jolín... Creí que"
	line "eras débil..."
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
	text "Cath: Intento ga-"
	line "nar a Blanca,"
	cont "¡pero mi sénior y"

	para "yo podemos ganar-"
	line "te a ti primero!"
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

	para "llora cuando"
	line "pierde."
	done

BeautyVictoriaSeenText:
	text "¡Oh, eres un en-"
	line "trenador muy"
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
	text "¿Has ganado?"
	line "¡Genial! Yo esta-"
	cont "ba ocupado admi-"
	cont "rando a las chicas"
	cont "de aquí."
	done
