Route36_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE36_NOOP
	scene_const SCENE_ROUTE36_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36ArthurCallback

	def_warp_events
	warp_event 22,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 22,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 51, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 52, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2
	warp_event 61,  8, ROUTE_36_VIOLET_GATE, 1
	warp_event 61,  9, ROUTE_36_VIOLET_GATE, 2
	warp_event 30, 12, HIDDEN_TREE_GROTTO, 1

	def_coord_events
	coord_event 24,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 26,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	def_bg_events
	bg_event 33,  1, BGEVENT_JUMPTEXT, Route36TrainerTips2Text
	bg_event 49, 11, BGEVENT_JUMPTEXT, RuinsOfAlphNorthSignText
	bg_event 59,  7, BGEVENT_JUMPTEXT, Route36SignText
	bg_event 25,  7, BGEVENT_JUMPTEXT, Route36TrainerTips1Text
	bg_event 53,  4, BGEVENT_JUMPTEXT, Route36AdvancedTips1Text
	bg_event 34,  7, BGEVENT_JUMPTEXT, Route36AdvancedTips2Text
	bg_event 30, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_36
	bg_event 31, 11, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ROUTE_36

	def_object_events
	object_event 39,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 53,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 37, 12, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	pokemon_event 25,  6, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_ON_ROUTE_36
	object_event 30,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36CooltrainerfChiaraScript, -1
	object_event 24, 13, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPsychicMark, -1
	object_event 35, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 57,  9, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 48,  9, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	fruittree_event 25,  4, FRUITTREE_ROUTE_36, RAWST_BERRY, PAL_NPC_TEAL
	object_event 50,  5, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSchoolgirlMolly, -1

	object_const_def
	const ROUTE36_WEIRD_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE
	const ROUTE36_COOLTRAINERF

Route36ArthurCallback:
	readvar VAR_WEEKDAY
	ifequalfwd THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOOP
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkkeyitem SQUIRTBOTTLE
	iftruefwd .Fight
	waitsfx
	playsound SFX_SANDSTORM
	applyonemovement ROUTE36_WEIRD_TREE, tree_shake
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse_endtext
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	showtext UsedSquirtbottleText
	waitsfx
	playsound SFX_SANDSTORM
	applyonemovement ROUTE36_WEIRD_TREE, tree_shake
	showtext SudowoodoAttackedText
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequalfwd $2, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SUDOWOODO
.nocatch
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	special RefreshSprites
	end

Route36FloriaScript:
	scall .FloriaMessage
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	readvar VAR_FACING
	ifequalfwd UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.FloriaMessage:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue_jumptextfaceplayer FloriaTextAfterSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer FloriaTextAfterSquirtBottle
	jumpthistextfaceplayer

	text "¡Soy Floria, de la"
	line "Floristería!"

	para "¡Oye, oye!"

	para "Cuando le eché"
	line "agua a ese árbol"

	para "que se menea,"
	line "¡dio un respingo!"

	para "Tiene que ser un"
	line "#mon seguro."

	para "¡Seguro que si lo"
	line "empapas bien,"

	para "saldrá de su"
	line "escondite!"

	para "¡Ya sé! ¡Se lo di-"
	line "ré a mi hermana y"

	para "le pediré la"
	line "Regadera!"
	done

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_ROCK_SMASH
	iftruefwd .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .ClearedSudowoodo
	jumpthisopenedtext

	text "¡Aaaah!"

	para "¡Iba a partir ese"
	line "árbol con mi golpe"
	cont "directo!"

	para "¡Pero no he podi-"
	line "do! ¡Soy un fraca-"
	cont "sado!"
	done

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegivetmhm TM_ROCK_SMASH
	setevent EVENT_GOT_TM50_ROCK_SMASH
.AlreadyGotRockSmash:
	jumpthisopenedtext

	text "Ese resulta ser"
if DEF(FAITHFUL)
	line "Golpe Roca."
else
	line "Demolición."
endc

	para "Puedes hacer pe-"
	line "dazos las rocas"

	para "de un solo golpe"
	line "bien dado."

	para "Si hay rocas en"
	line "tu camino,"
if DEF(FAITHFUL)
	cont "¡hazlas trizas!"
else
	cont "¡rómpelas bien!"
endc
	done

Route36LassScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue_jumptextfaceplayer Route36LassText_ClearedSudowoodo
	jumpthistextfaceplayer

	text "Un árbol raro cor-"
	line "ta el paso hacia"
	cont "Ciudad Trigal."

	para "Quería ir a ver el"
	line "enorme Centro"

	para "#mon que acaban"
	line "de inaugurar…"
	done

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	opentext
	checkflag ENGINE_ALAN_READY_FOR_REMATCH
	iftruefwd .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftruefwd .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftruefwd .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	callstd asknumber2m
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername SCHOOLBOY, ALAN1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChooseRematch:
	callstd rematchm
	winlosstext SchoolboyAlan1BeatenText, 0
	readmem wAlanFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 1
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 2
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 3
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 4
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.GiveFireStone:
	callstd giftm
	verbosegiveitem FIRE_STONE
	iffalsefwd .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	jumpstd numberacceptedm

.BagFull:
	jumpstd packfullm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

Route36CooltrainerfChiaraScript:
	checkevent EVENT_GOT_BINDING_BAND_FROM_ROUTE_36_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_COOLTRAINERF_CHIARA
	iftruefwd .Beaten
	checkevent EVENT_BEAT_SCHOOLBOY_ALAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_MARK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SCHOOLGIRL_MOLLY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_TWINS_ANN_AND_ANNE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_GREG
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_CALLIE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_CASSANDRA
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE36_COOLTRAINERF
	loadtrainer COOLTRAINERF, CHIARA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_CHIARA
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem BINDING_BAND
	iffalse_endtext
	setevent EVENT_GOT_BINDING_BAND_FROM_ROUTE_36_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Con tu nivel, no"
	line "seré el único en-"

	para "trenador de élite"
	line "que quiera poner-"
	cont "te a prueba."
	done

.IntroText:
	text "Vi cómo desper-"
	line "taste a Sudowoodo."

	para "¡Fue genial!"

	para "Y tienes una Me-"
	line "dalla Planicie."
	cont "¡Yo también!"

	para "¿Qué te parece"
	line "esto? Vence a los"

	para "entrenadores de"
	line "las Rutas 36 y 37."

	para "¡Y luego lucharé"
	line "contigo!"
	done

.QuestionText:
	text "Así que has ven-"
	line "cido a todos los"
	cont "demás de la zona."

	para "¡Ha llegado la ho-"
	line "ra de nuestro due-"
	cont "lo decisivo!"

	para "Uso una Banda Ata-"
	line "dura para aumen-"
	cont "tar mi ventaja."

	para "¿Crees que estás a"
	line "la altura?"
	done

.RefusedText:
	text "Bueno, ¡yo estaré"
	line "listo cuando tú lo"
	cont "estés!"
	done

.SeenText:
	text "¡No aguantarás mu-"
	line "cho contra mi"
	cont "técnica!"
	done

.BeatenText:
	text "¡¿Yo he sido quien"
	line "no ha aguantado?!"
	done

.AfterText1:
	text "Has analizado mi"
	line "técnica y la has"
	cont "contrarrestado."

	para "¿Por qué no la"
	line "pruebas tú?"

	para "¡Toma, para ti!"
	done

GenericTrainerPsychicMark:
	generictrainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText

	text "Sería muy fuerte"
	line "si pudiera saber"

	para "lo que piensa mi"
	line "rival."
	done

GenericTrainerSchoolgirlMolly:
	generictrainer SCHOOLGIRL, MOLLY, EVENT_BEAT_SCHOOLGIRL_MOLLY, SchoolgirlMollySeenText, SchoolgirlMollyBeatenText

	text "Aún me queda mu-"
	line "cho por aprender."
	done

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftruefwd .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftruefwd .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalsefwd .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	jumpthisopenedtext

	text "Juan: Si un"
	line "#mon usa"
	cont "movimientos de"

	para "tipo Roca,"
	line "debería llevarla."

	para "¡Potencia los ata-"
	line "ques de tipo Roca!"
	done

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	endtext

ArthurNotThursdayScript:
	jumpthisopenedtext

	text "Juan: Hoy no es"
	line "jueves. Qué lásti-"
	cont "ma."
	done

WeirdTreeMovement_Flee:
	fast_jump_step_up
	fast_jump_step_up
	step_end

FloriaMovement1:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

FloriaMovement2:
	step_left
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Route36SuicuneMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	step_end

UseSquirtbottleText:
	text "Es un árbol raro."
	line "¿Usar Regadera?"
	done

UsedSquirtbottleText:
	text "¡<PLAYER> usó la"
	line "Regadera!"
	done

SudowoodoAttackedText:
	text "¡Al árbol raro no"
	line "le gusta nada la"
	cont "Regadera!"

	para "¡El árbol raro"
	line "atacó!"
	done


FloriaTextAfterSquirtBottle:
	text "¡Soy Floria, de la"
	line "Floristería!"

	para "Cuando le hablé a"
	line "mi hermana del ár-"

	para "bol que se menea,"
	line "me dijo que era"
	cont "peligroso."

	para "¡Anda, te ha pres-"
	line "tado la Regadera!"

	para "¡Debes de ser muy"
	line "buen entrenador!"

	para "Te dejo a ti lo"
	line "del árbol raro."

	para "¡Chao!"
	done

FloriaTextAfterSudowoodo:
	text "¡Sabía que ese ár-"
	line "bol que se menea"
	cont "era un #mon!"

	para "¡Iba a sacarlo de"
	line "su escondite, pero"

	para "te me has adelan-"
	line "tado!"

	para "En fin, vuelvo a"
	line "la Floristería."

	para "Por cierto, soy"
	line "Floria."

	para "¡Chao!"
	done


RockSmashGuyText2:
	text "¿Quitaste ese ár-"
	line "bol tan dichoso?"

	para "¡Me has dejado im-"
	line "presionado! Quiero"
	cont "que tengas esto."
	done



Route36LassText_ClearedSudowoodo:
	text "Ese árbol tan raro"
	line "desapareció sin"
	cont "dejar rastro."

	para "¡Ah! ¿Ese árbol"
	line "era en realidad un"
	cont "#mon?"
	done

PsychicMarkSeenText:
	text "¡Voy a leer tus"
	line "pensamientos!"
	done

PsychicMarkBeatenText:
	text "¡Te he leído mal!"
	done

SchoolgirlMollySeenText:
	text "¡El Sr. Primo me"
	line "enseñó a luchar"
	cont "con #mon!"
	done

SchoolgirlMollyBeatenText:
	text "Tanto estudiar…"
	done

SchoolboyAlan1SeenText:
	text "¡Gracias a mis es-"
	line "tudios, puedo con"
	cont "cualquier #mon!"
	done

SchoolboyAlan1BeatenText:
	text "¡Uy! ¿Un error de"
	line "cálculo?"
	done

SchoolboyAlanBooksText:
	text "Vaya. Y eso que"
	line "estudio 5 horas"
	cont "al día."

	para "Para aprender no"
	line "basta solo con"
	cont "leer libros."
	done

MeetArthurText:
	text "Juan: ¿Quién eres"
	line "tú?"

	para "Yo soy Juan, del"
	line "jueves."
	done

ArthurGivesGiftText:
	text "Toma. Quédate con"
	line "esto."
	done


ArthurThursdayText:
	text "Juan: Soy Juan,"
	line "del jueves. Soy el"

	para "segundo de siete"
	line "hermanos."
	done


Route36SignText:
	text "Ruta 36"
	done

RuinsOfAlphNorthSignText:
	text "Ruinas Alfa"
	line "Entrada Norte"
	done

Route36TrainerTips1Text:
	text "Pistas Entrenador"

	para "Las característi-"
	line "cas de los #mon"

	para "varían, incluso"
	line "dentro de la misma"
	cont "especie."

	para "Al principio pue-"
	line "den ser parecidas,"

	para "pero las diferen-"
	line "cias se notarán a"

	para "medida que los"
	line "#mon crezcan."
	done

Route36TrainerTips2Text:
	text "Pistas Entrenador"

	para "Usa Excavar para"
	line "volver a la entra-"
	cont "da de cualquier"
	cont "lugar."

	para "Es muy útil para"
	line "explorar cuevas y"

	para "otros lugares de"
	line "interés."
	done

Route36AdvancedTips1Text:
	text "¡Consejo Avanzado!"

	para "¡Puedes elegir en-"
	line "tre veinte marcos"

	para "de diálogo y ocho"
	line "tipografías en las"
	cont "Opciones!"
	done

Route36AdvancedTips2Text:
	text "¡Consejo Avanzado!"

	para "¡Si mimas a tus"
	line "#mon con cortes"

	para "de pelo, bendicio-"
	line "nes o masajes,"

	para "¡te ayudarán en el"
	line "combate gracias a"
	cont "su afecto!"
	done