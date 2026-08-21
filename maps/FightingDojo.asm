FightingDojo_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, FightingDojoSetupRematchesCallback

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_JUMPTEXT, FightingDojoSign1Text
	bg_event  5,  0, BGEVENT_JUMPTEXT, FightingDojoSign2Text
	bg_event  9,  0, BGEVENT_READ, MapFightingDojoSignpost2Script

	def_object_events
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RematchRed0Script, EVENT_REMATCH_GYM_LEADER_1
	object_event  0,  2, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RematchGreen1Script, EVENT_REMATCH_GYM_LEADER_2
	object_event  0,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RematchBlue1Script, EVENT_REMATCH_GYM_LEADER_3
	object_event  0,  4, SPRITE_CONSOLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RematchBlue2Script, EVENT_REMATCH_GYM_LEADER_4
	object_event  0,  5, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RematchBrown1Script, EVENT_REMATCH_GYM_LEADER_5
	object_event  0,  6, SPRITE_CONSOLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RematchBrown2Script, EVENT_REMATCH_GYM_LEADER_6
	object_event  4,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1

	object_const_def
	const REMATCH_RED_1
	const REMATCH_GREEN_2
	const REMATCH_BLUE_2
	const REMATCH_BLUE_3
	const REMATCH_BROWN_2
	const REMATCH_BROWN_3

FightingDojoSetupRematchesCallback:
	disappear REMATCH_RED_1
	disappear REMATCH_GREEN_2
	disappear REMATCH_BLUE_2
	disappear REMATCH_BLUE_3
	disappear REMATCH_BROWN_2
	disappear REMATCH_BROWN_3
	checkevent EVENT_BEAT_BLUE
	iftruefwd .SetupDailyRematches
	endcallback

MACRO rematch
	; rematch person, varsprite, sprite, y, x, face, palette
	moveobject \1, \5, \4
	turnobject \1, \6
	setmapobjectpal \1, \7
	appear \1
	variablesprite \2, \3
ENDM

MACRO rematch_left
	; rematch_left person, varsprite, sprite, palette
	rematch \1, \2, \3, 6, 3, RIGHT, \4
ENDM

MACRO rematch_right
	; rematch_right person, varsprite, sprite, palette
	rematch \1, \2, \3, 6, 6, LEFT, \4
ENDM

.SetupDailyRematches:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Monday
	ifequalfwd TUESDAY, .Tuesday
	ifequalfwd WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday

.Sunday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .SundayNight
.SundayMorningAndDay
	rematch_left REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_JASMINE, PAL_NPC_RED
	rematch_right REMATCH_GREEN_2, SPRITE_COPYCAT, SPRITE_ERIKA, PAL_NPC_GREEN
	endcallback
.SundayNight
	rematch REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_SABRINA, 4, 6, DOWN, PAL_NPC_RED
	endcallback

.Monday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .MondayNight
.MondayMorningAndDay
	rematch_left REMATCH_BLUE_2, SPRITE_COPYCAT, SPRITE_FALKNER, PAL_NPC_BLUE
	rematch_right REMATCH_BLUE_3, SPRITE_CONSOLE, SPRITE_JANINE, PAL_NPC_PURPLE
	endcallback
.MondayNight
	checkevent EVENT_BEAT_WALKER
	iffalsefwd .NoWalker
	rematch REMATCH_BLUE_3, SPRITE_CONSOLE, SPRITE_WALKER, 4, 8, DOWN, PAL_NPC_BLUE
.NoWalker
	endcallback

.Tuesday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .TuesdayNight
.TuesdayMorningAndDay
	rematch_left REMATCH_BROWN_2, SPRITE_COPYCAT, SPRITE_PRYCE, PAL_NPC_BROWN
	rematch_right REMATCH_BROWN_3, SPRITE_CONSOLE, SPRITE_BLAINE, PAL_NPC_BROWN
	endcallback
.TuesdayNight
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iffalsefwd .NoLorelei
	rematch REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_LORELEI, 4, 6, DOWN, PAL_NPC_RED
.NoLorelei
	endcallback

.Wednesday
	checktime 1 << MORN
	iftruefwd .WednesdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .WednesdayNight
.WednesdayDay
	rematch_left REMATCH_BROWN_2, SPRITE_COPYCAT, SPRITE_BROCK, PAL_NPC_BROWN
	rematch REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_MISTY, 5, 2, RIGHT, PAL_NPC_ORANGE
	rematch_right REMATCH_BLUE_3, SPRITE_CONSOLE, SPRITE_BLUE, PAL_NPC_BLUE
	endcallback
.WednesdayMorning
	rematch_left REMATCH_BROWN_2, SPRITE_COPYCAT, SPRITE_BROCK, PAL_NPC_BROWN
	rematch_right REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_MISTY, PAL_NPC_ORANGE
	endcallback
.WednesdayNight
	rematch REMATCH_BLUE_3, SPRITE_CONSOLE, SPRITE_BLUE, 4, 8, DOWN, PAL_NPC_BLUE
	endcallback

.Thursday
	checktime 1 << MORN
	iftruefwd .ThursdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .ThursdayNight
.ThursdayDay
	checkevent EVENT_BEAT_PALMER
	iffalsefwd .NoPalmer
	rematch REMATCH_GREEN_2, SPRITE_COPYCAT, SPRITE_PALMER, 6, 3, DOWN, PAL_NPC_GREEN
.NoPalmer
	endcallback
.ThursdayMorning
	rematch REMATCH_GREEN_2, SPRITE_COPYCAT, SPRITE_BUGSY, 6, 1, DOWN, PAL_NPC_GREEN
	endcallback
.ThursdayNight
	rematch REMATCH_BROWN_3, SPRITE_CONSOLE, SPRITE_MORTY, 4, 2, DOWN, PAL_NPC_BROWN
	endcallback

.Friday
	checktime 1 << MORN
	iftruefwd .FridayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .FridayNight
.FridayDay
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd .NoYellow
	rematch REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_YELLOW, 6, 6, DOWN, PAL_NPC_ORANGE
.NoYellow
	endcallback
.FridayMorning
	rematch REMATCH_BROWN_2, SPRITE_COPYCAT, SPRITE_SURGE, 7, 6, DOWN, PAL_NPC_BROWN
	endcallback
.FridayNight
	rematch REMATCH_BLUE_2, SPRITE_COPYCAT, SPRITE_CLAIR, 6, 2, RIGHT, PAL_NPC_BLUE
	endcallback

.Saturday
	checktime 1 << MORN
	iftruefwd .SaturdayMorning
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .SaturdayNight
.SaturdayDay
	rematch_left REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_WHITNEY, PAL_NPC_RED
	rematch_right REMATCH_BROWN_2, SPRITE_COPYCAT, SPRITE_CHUCK, PAL_NPC_BROWN
	endcallback
.SaturdayMorning
	rematch_left REMATCH_RED_1, SPRITE_BIG_DOLL, SPRITE_WHITNEY, PAL_NPC_RED
	endcallback
.SaturdayNight
	checkevent EVENT_BEAT_AGATHA
	iffalsefwd .NoAgatha
	rematch REMATCH_BROWN_3, SPRITE_CONSOLE, SPRITE_AGATHA, 4, 2, DOWN, PAL_NPC_BROWN
.NoAgatha
	endcallback

FightingDojoBlackBelt:
	checkevent EVENT_BEAT_BLUE
	iftruefwd .BlackBeltExplainsRematchesScript
	jumptextfaceplayer FightingDojoBlackBeltText
.BlackBeltExplainsRematchesScript
	jumptextfaceplayer BlackBeltText_ExplainsRematches

MapFightingDojoSignpost2Script:
	opentext
	writetext FightingDojoScheduleQuestionText
	yesorno
	iffalse_endtext
.sunday
	writetext FightingDojoScheduleSundayText
	waitbutton
.monday
	checkevent EVENT_BEAT_WALKER
	iftruefwd .monday_walker
	writetext FightingDojoScheduleMondayText
	waitbutton
	sjumpfwd .tuesday
.monday_walker
	writetext FightingDojoScheduleMondayWalkerText
	waitbutton
.tuesday
	checkevent EVENT_BEAT_LORELEI_AGAIN
	iftruefwd .tuesday_lorelei
	writetext FightingDojoScheduleTuesdayText
	waitbutton
	sjumpfwd .wednesday
.tuesday_lorelei
	writetext FightingDojoScheduleTuesdayLoreleiText
	waitbutton
.wednesday
	writetext FightingDojoScheduleWednesdayText
	waitbutton
.thursday
	checkevent EVENT_BEAT_PALMER
	iftruefwd .thursday_palmer
	writetext FightingDojoScheduleThursdayText
	waitbutton
	sjumpfwd .friday
.thursday_palmer
	writetext FightingDojoScheduleThursdayPalmerText
	waitbutton
.friday
	checkevent EVENT_BEAT_YELLOW
	iftruefwd .friday_yellow
	writetext FightingDojoScheduleFridayText
	waitbutton
	sjumpfwd .saturday
.friday_yellow
	writetext FightingDojoScheduleFridayYellowText
	waitbutton
.saturday
	checkevent EVENT_BEAT_AGATHA
	iftruefwd .saturday_agatha
	jumpopenedtext FightingDojoScheduleSaturdayText
.saturday_agatha
	jumpopenedtext FightingDojoScheduleSaturdayAgathaText

RematchRed0Script:
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .Red0TuesdayNight
	ifequalfwd WEDNESDAY, .Red0Wednesday
	ifequalfwd FRIDAY, .Red0Friday
	ifequalfwd SATURDAY, .Red0Saturday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Red0SundayNight
	sjump RematchJasmineScript
.Red0SundayNight
	sjump RematchSabrinaScript
.Red0TuesdayNight
	sjump RematchLoreleiScript
.Red0Wednesday
	sjump RematchMistyScript
.Red0Friday
	sjump RematchYellowScript
.Red0Saturday
	sjump RematchWhitneyScript

RematchGreen1Script:
	readvar VAR_WEEKDAY
	ifequalfwd THURSDAY, .Green1Thursday
.Green1Sunday
	sjump RematchErikaScript
.Green1Thursday
	checktime 1 << MORN
	iftruefwd .Green1ThursdayMorning
.Green1ThursdayDay
	sjump RematchPalmerScript
.Green1ThursdayMorning
	sjump RematchBugsyScript

RematchBlue1Script:
	readvar VAR_WEEKDAY
	ifequalfwd FRIDAY, .Blue1Friday
.Blue1Monday
	sjump RematchFalknerScript
.Blue1Friday
	sjump RematchClairScript

RematchBlue2Script:
	readvar VAR_WEEKDAY
	ifequalfwd MONDAY, .Blue2Monday
.Blue2Wednesday
	sjump RematchBlueScript
.Blue2Monday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Blue2MondayNight
.Blue2MondayMorningDay
	sjump RematchJanineScript
.Blue2MondayNight
	sjump RematchWalkerScript

RematchBrown1Script:
	readvar VAR_WEEKDAY
	ifequalfwd WEDNESDAY, .Brown1Wednesday
	ifequalfwd FRIDAY, .Brown1Friday
	ifequalfwd SATURDAY, .Brown1Saturday
.Brown1Tuesday
	sjump RematchPryceScript
.Brown1Wednesday
	sjumpfwd RematchBrockScript
.Brown1Friday
	sjumpfwd RematchSurgeScript
.Brown1Saturday
	sjump RematchChuckScript

RematchBrown2Script:
	readvar VAR_WEEKDAY
	ifequalfwd THURSDAY, .Brown2Thursday
	ifequalfwd SATURDAY, .Brown2SaturdayNight
.Brown2Tuesday
	sjump RematchBlaineScript
.Brown2Thursday
	sjump RematchMortyScript
.Brown2SaturdayNight
	sjump RematchAgathaScript

FightingDojoBlackBeltText:
	text "Hello!"

	para "Karate King, the"
	line "Fighting Dojo's"

	para "master, is in a"
	line "cave in Johto for"
	cont "training."
	done

BlackBeltText_ExplainsRematches:
	text "Líderes de Kanto y"
	line "Johto vienen aquí"
	cont "a este Dojo."

	para "¡Deberías unirte"
	line "a ellos!"
	done

FightingDojoSign1Text:
	text "¡Lo que siembras,"
	line "recoges!"
	done

FightingDojoSign2Text:
	text "¡Enemigos por"
	line "todas partes!"
	done

MACRO rematch_script
	; rematch_script name, trainer, flag
	faceplayer
	opentext
	checkflag \3
	iftruefwd .RematchDone
	writetext \1Text_Greeting
	waitbutton
	closetext
	winlosstext \1Text_WinLoss, 0
	loadtrainer \2, 2
	startbattle
	reloadmapafterbattle
	setflag \3
	end
.RematchDone
	jumpopenedtext \1Text_Done
ENDM

RematchBrockScript:
	rematch_script Brock, BROCK, ENGINE_GYM_LEADER_REMATCH_1

RematchMistyScript:
	rematch_script Misty, MISTY, ENGINE_GYM_LEADER_REMATCH_2

RematchSurgeScript:
	rematch_script Surge, LT_SURGE, ENGINE_GYM_LEADER_REMATCH_1

RematchErikaScript:
	rematch_script Erika, ERIKA, ENGINE_GYM_LEADER_REMATCH_2

RematchJanineScript:
	rematch_script Janine, JANINE, ENGINE_GYM_LEADER_REMATCH_2

RematchSabrinaScript:
	rematch_script Sabrina, SABRINA, ENGINE_GYM_LEADER_REMATCH_3

RematchBlaineScript:
	rematch_script Blaine, BLAINE, ENGINE_GYM_LEADER_REMATCH_2

RematchBlueScript:
	rematch_script Blue, BLUE, ENGINE_GYM_LEADER_REMATCH_3

RematchFalknerScript:
	rematch_script Falkner, FALKNER, ENGINE_GYM_LEADER_REMATCH_1

RematchBugsyScript:
	rematch_script Bugsy, BUGSY, ENGINE_GYM_LEADER_REMATCH_1

RematchWhitneyScript:
	rematch_script Whitney, WHITNEY, ENGINE_GYM_LEADER_REMATCH_1

RematchMortyScript:
	rematch_script Morty, MORTY, ENGINE_GYM_LEADER_REMATCH_2

RematchChuckScript:
	rematch_script Chuck, CHUCK, ENGINE_GYM_LEADER_REMATCH_2

RematchJasmineScript:
	rematch_script Jasmine, JASMINE, ENGINE_GYM_LEADER_REMATCH_1

RematchPryceScript:
	rematch_script Pryce, PRYCE, ENGINE_GYM_LEADER_REMATCH_1

RematchClairScript:
	rematch_script Clair, CLAIR, ENGINE_GYM_LEADER_REMATCH_2

RematchPalmerScript:
	rematch_script Palmer, TOWERTYCOON, ENGINE_GYM_LEADER_REMATCH_3

RematchLoreleiScript:
	rematch_script Lorelei, LORELEI, ENGINE_GYM_LEADER_REMATCH_3

RematchAgathaScript:
	rematch_script Agatha, AGATHA, ENGINE_GYM_LEADER_REMATCH_3

RematchWalkerScript:
	rematch_script Walker, WALKER, ENGINE_GYM_LEADER_REMATCH_3

RematchYellowScript:
	rematch_script Yellow, YELLOW, ENGINE_GYM_LEADER_REMATCH_3

BrockText_Greeting:
	text "Me gustan los"
	line "#mon tipo Roca."

	para "Son sólidos y"
	line "duros y a la vez"
	cont "muy quebradizos."

	para "¡Verás lo fuertes"
	line "que son ahora mis"
	cont "#mon tipo Roca!"
	done

MistyText_Greeting:
	text "Oí cosas buenas de"
	line "ti desde nuestro"
	cont "último combate."

	para "¡Déjame ver lo"
	line "bueno que eres!"
	done

SurgeText_Greeting:
	text "¡Siento la energía"
	line "del Magnetotrén!"

	para "¡Estoy listo para"
	line "un gran combate"
	cont "electrizante!"
	done

ErikaText_Greeting:
	text "¡Me alegra verte"
	line "de nuevo!"

	para "¿Cómo estás?"

	para "Este lugar no me"
	line "pega mucho, pero…"
	cont "¡vamos a luchar!"
	done

JanineText_Greeting:
	text "No puedo usar mi"
	line "técnica ninja,"

	para "¡pero no te dejaré"
	line "ganar!"
	done

SabrinaText_Greeting:
	text "Sabía que vendrías"
	line "a luchar conmigo"
	cont "de nuevo."

	para "Tuve esa visión."
	done

BlaineText_Greeting:
	text "Mi Gimnasio sigue"
	line "destruido…"

	para "¡Tengamos nuestra"
	line "revancha aquí!"
	done

BlueText_Greeting:
	text "¡Bien! Tú también"
	line "estás aquí."

	para "¡Gracias por venir"
	line "a perder contra"
	cont "mí!"
	done

FalknerText_Greeting:
	text "Hoy estoy en plena"
	line "forma."

	para "¡Es un placer"
	line "luchar contra ti"
	cont "de nuevo!"
	done

BugsyText_Greeting:
	text "¡Me alegra verte"
	line "de nuevo! ¡Observa"
	cont "mi investigación"
	cont "sobre bichos!"
	done

WhitneyText_Greeting:
	text "¡Hola, <PLAYER>!"
	line "Ya que estamos"
	cont "aquí los dos,"
	cont "¡a combatir!"

	para "¿Todo listo?"
	done

MortyText_Greeting:
	text "Los #mon"
	line "legendarios no me"
	cont "eligieron…"

	para "Pero eso no"
	line "significa que haya"
	cont "perdido mi futuro."

	para "¡A luchar!"
	done

ChuckText_Greeting:
	text "¡Ahí estás!"

	para "¡Prueba mi duro"
	line "entrenamiento de"
	cont "24 horas!"
	done

JasmineText_Greeting:
	text "Hola, <PLAYER>…"
	line "¿Cómo estás?"
	cont "Yo estoy bien…"

	para "En fin, ¿te has"
	line "preparado para"
	cont "luchar otra vez?"
	done

PryceText_Greeting:
	text "Sobran las"
	line "palabras."

	para "Un combate #mon"
	line "es nuestra forma"
	cont "de comunicarnos."
	done

ClairText_Greeting:
	text "…Así que estás"
	line "aquí."

	para "¡Ahora a luchar!"
	done

PalmerText_Greeting:
	text "¡Has llegado muy"
	line "lejos!"

	para "Como Amo de la"
	line "Torre, daré todo"
	cont "mi esfuerzo."

	para "Así se muestran"
	line "respeto los"
	cont "grandes rivales."

	para "¡Luchando a tope"
	line "por amor a los"
	cont "#mon!"
	done

LoreleiText_Greeting:
	text "Hola de nuevo,"
	line "<PLAYER>."

	para "Ahora estamos en"
	line "mi terreno."
	cont "¡No perderé!"
	done

AgathaText_Greeting:
	text "Hola, criatura."

	para "¿Aún completas la"
	line "#dex para ese"
	cont "vejestorio de Oak?"

	para "¡Los #mon son"
	line "para luchar!"

	para "¡Demuéstrame tu"
	line "talento real como"
	cont "entrenador!"
	done

WalkerText_Greeting:
	text "¡Hola, <PLAYER>!"

	para "Me crucé con mi"
	line "hijo Pegaso antes…"

	para "¿Luchamos en su"
	line "lugar?"
	done

YellowText_Greeting:
	text "¡Hola, <PLAYER>!"

	para "Déjame ver…"

	para "¡Sí! ¡Aún cuidas"
	line "muy bien de tus"
	cont "#mon!"

	para "Te has vuelto más"
	line "fuerte, ¡pero yo"
	cont "también!"
	done

BrockText_WinLoss:
	text "Volví a perder…"

	para "¡Tu gran viaje no"
	line "ha sido en vano!"
	done

MistyText_WinLoss:
	text "¡Guau! ¡Te vuelves"
	line "más fuerte con"
	cont "cada combate!"
	done

SurgeText_WinLoss:
	text "¡Eres muy fuerte!"

	para "¡Pero algún día me"
	line "las pagarás!"
	done

ErikaText_WinLoss:
	text "Te has vuelto aún"
	line "más fuerte…"
	done

JanineText_WinLoss:
	text "Hoy he perdido,"
	line "¡pero a la próxima"
	cont "ganaré!"
	done

SabrinaText_WinLoss:
	text "Lo sé… Nos vamos"
	line "a volver a ver"
	cont "algún día."
	done

BlaineText_WinLoss:
	text "¡Buaah! ¡Me he"
	line "quemado otra vez!"
	done

BlueText_WinLoss:
	text "¡Tal y como"
	line "esperaba!"

	para "Con razón te has"
	line "convertido en el"
	cont "Campeón…"
	done

FalknerText_WinLoss:
	text "Mmm… Aún me queda"
	line "mucho para ser el"
	cont "mejor entrenador…"
	done

BugsyText_WinLoss:
	text "¡Debes de haber"
	line "estudiado mucho"
	cont "sobre #mon!"
	done

WhitneyText_WinLoss:
	text "¡Eres realmente"
	line "fuerte!"

	para "¡Pero no perderé"
	line "la próxima vez!"
	done

MortyText_WinLoss:
	text "He vuelto a caer…"

	para "Tienes algo más"
	line "que simple fuerza."
	done

ChuckText_WinLoss:
	text "¡Jajaja!"
	line "¡Luchar contigo"
	cont "nunca aburre!"
	done

JasmineText_WinLoss:
	text "Fiel a tu"
	line "reputación…"
	done

PryceText_WinLoss:
	text "Mmm… ¡Formidable!"
	done

ClairText_WinLoss:
	text "Bien hecho."
	line "…"

	para "¡Ahora dalo todo!"
	done

PalmerText_WinLoss:
	text "¡Bravo! ¡Me habéis"
	line "inspirado mucho!"
	done

LoreleiText_WinLoss:
	text "¡Cómo te atreves!"
	done

AgathaText_WinLoss:
	text "¡Uuu-huu!"
	done

WalkerText_WinLoss:
	text "¡No fui rival"
	line "para ti!"
	done

YellowText_WinLoss:
	text "¡Jajaja!"
	done

BrockText_Done:
MistyText_Done:
SurgeText_Done:
ErikaText_Done:
JanineText_Done:
SabrinaText_Done:
BlaineText_Done:
BlueText_Done:
FalknerText_Done:
BugsyText_Done:
WhitneyText_Done:
MortyText_Done:
ChuckText_Done:
JasmineText_Done:
PryceText_Done:
ClairText_Done:
PalmerText_Done:
LoreleiText_Done:
AgathaText_Done:
WalkerText_Done:
YellowText_Done:
	text "He terminado de"
	line "luchar por hoy."
	done

FightingDojoScheduleQuestionText:
	text "¡Es el horario de"
	line "entreno! ¿Leerlo?"
	done

FightingDojoScheduleSundayText:
	text "Domingo: Yasmina,"
	line "Erika, Sabrina"
	done

FightingDojoScheduleMondayText:
	text "Lunes: Pegaso,"
	line "Sachiko, ???"
	done

FightingDojoScheduleMondayWalkerText:
	text "Lunes: Pegaso,"
	line "Sachiko, Wayne"
	done

FightingDojoScheduleTuesdayText:
	text "Martes: Fredo,"
	line "Blaine, ???"
	done

FightingDojoScheduleTuesdayLoreleiText:
	text "Martes: Fredo,"
	line "Blaine, Lorelei"
	done

FightingDojoScheduleWednesdayText:
	text "Miércoles: Brock,"
	line "Misty, Azul"
	done

FightingDojoScheduleThursdayText:
	text "Jueves: Antón,"
	line "???, Morti"
	done

FightingDojoScheduleThursdayPalmerText:
	text "Jueves: Antón,"
	line "Jericor, Morti"
	done

FightingDojoScheduleFridayText:
	text "Viernes: Lt.Surge,"
	line "???, Débora"
	done

FightingDojoScheduleFridayYellowText:
	text "Viernes: Lt.Surge,"
	line "Amarillo, Débora"
	done

FightingDojoScheduleSaturdayText:
	text "Saturday: Whitney,"
	line "Chuck, ???"
	done

FightingDojoScheduleSaturdayAgathaText:
	text "Saturday: Whitney,"
	line "Chuck, Agatha"
	done
