VioletGym_MapScriptHeader:
	def_scene_scripts
	scene_script VioletGymFalknerAwayScene, SCENE_VIOLETGYM_FALKNER_AWAY
	scene_const SCENE_VIOLETGYM_NOOP

	def_callbacks

	def_warp_events
	warp_event  4, 17, VIOLET_CITY, 2
	warp_event  5, 17, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, VioletGymStatue
	bg_event  6, 15, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  4, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DARK_CAVE_FALKNER
	object_event  5,  2, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, EVENT_VIOLET_GYM_FALKNER
	object_event  7,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperRod, EVENT_VIOLET_GYM_FALKNER
	object_event  2, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperAbe, EVENT_VIOLET_GYM_FALKNER
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, EVENT_VIOLET_GYM_FALKNER

	object_const_def
	const VIOLETGYM_GYM_GUY2

VioletGymFalknerAwayScene:
	sdefer .Script
	end

.Script:
	showemote EMOTE_SHOCK, VIOLETGYM_GYM_GUY2, 15
	applyonemovement VIOLETGYM_GYM_GUY2, step_down
	showtext VioletGymGuyFalknerAwayText
	turnobject PLAYER, DOWN
	warpcheck
	warpsound
	newloadmap MAPSETUP_DOOR
	end

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftruefwd .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	givebadge ZEPHYRBADGE, JOHTO_REGION
.FightDone:
	checkevent EVENT_GOT_TM31_ROOST
	iftrue_jumpopenedtext FalknerFightDoneText
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegivetmhm TM_ROOST
	setevent EVENT_GOT_TM31_ROOST
	jumpthisopenedtext

	text "Al usar una MT, el"
	line "#mon aprende"

	para "un movimiento al"
	line "instante."

	para "¡Puedes usar las"
	line "MT tantas veces"
	cont "como quieras!"

	para "La MT51 contiene"
	line "Respiro."

	para "Aterriza en el"
	line "suelo para recu-"

	para "perar la mitad de"
	line "los PS máximos."
	done

GenericTrainerBird_keeperRod:
	generictrainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, Bird_keeperRodSeenText, Bird_keeperRodBeatenText

	text "¡La destreza de"
	line "Pegaso es real!"

	para "¡No te crezcas"
	line "solo por haberme"
	cont "vencido a mí!"
	done

GenericTrainerBird_keeperAbe:
	generictrainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText

	text "Qué patético,"
	line "perder contra un"

	para "entrenador nova-"
	line "to…"
	done

VioletGymGuyScript:
	checkevent EVENT_BEAT_FALKNER
	iftrue_jumptextfaceplayer VioletGymGuyWinText
	jumpthistextfaceplayer

	text "¡Hola! No soy en-"
	line "trenador, ¡pero sé"
	cont "dar buenos conse-"
	cont "jos!"

	para "¡Créeme! Si crees"
	line "en ti, el sueño"

	para "de ser Campeón se"
	line "puede cumplir."

	para "¿Tú crees en ti?"
	line "Pues escucha."

	para "El tipo Planta es"
	line "débil contra el"

	para "tipo Volador."
	line "Recuérdalo bien."
	done

VioletGymStatue:
	gettrainername FALKNER, 1, STRING_BUFFER_4
	checkflag ENGINE_ZEPHYRBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 8, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

FalknerIntroText:
	text "¡Soy Pegaso, Líder"
	line "del Gimnasio"
	cont "#mon de Malva!"

	para "Dicen que se pue-"
	line "den cortar las"

	para "alas a los #mon"
	line "tipo Volador con"
	cont "un ataq electrico…"

	para "¡No toleraré tales"
	line "insultos a los"
	cont "#mon pájaro!"

	para "¡Te mostraré el"
	line "auténtico poder de"

	para "los magníficos"
	line "#mon pájaro!"
	done

FalknerWinLossText:
	text "…¡Rayos! Los"
	line "#mon pájaro"
	cont "de mi padre…"

	para "De acuerdo."
	line "Toma esto."

	para "Es la Medalla"
	line "Céfiro oficial de"
	cont "la Liga #mon."
	done

FalknerZephyrBadgeText:
	text "La Medalla Céfiro"
	line "te permite"

	para "dar órdenes a los"
	line "#mon, intercam-"
	cont "biados inclusive,"
	cont "hasta el <LV>20."

	para "Oye, ¡toma esto"
	line "también!"
	done

FalknerFightDoneText:
	text "Hay Gimnasios"
	line "#mon en otras"
	cont "ciudades y pueblos"

	para "Deberías poner a"
	line "prueba tu talento"
	cont "en ellos."

	para "¡Entrenaré más du-"
	line "ro para ser el me-"

	para "jor maestro de"
	line "#mon pájaro!"
	done

Bird_keeperRodSeenText:
	text "¡La clave son las"
	line "agallas!"

	para "¡Los de aquí en-"
	line "trenan noche y día"

	para "para ser maestros"
	line "de #mon pájaro!"

	para "¡Vamos allá!"
	done

Bird_keeperRodBeatenText:
	text "¡Gaaah!"
	done

Bird_keeperAbeSeenText:
	text "¡A ver si tienes"
	line "nivel para luchar"
	cont "contra Pegaso!"
	done

Bird_keeperAbeBeatenText:
	text "¡Esto no puede"
	line "ser verdad!"
	done

VioletGymGuyWinText:
	text "¡Buen combate!"
	line "¡Sigue así y serás"

	para "Campeón en un san-"
	line "tiamén!"
	done

VioletGymGuyFalknerAwayText:
	text "¡Oye! No puedes"
	line "retar a Pegaso"
	cont "ahora mismo."

	para "Está en Cueva Os-"
	line "cura amansando a"

	para "un Ursaring que"
	line "atacó a un joven"
	cont "entrenador."

	para "Vuelve más tarde."
	done
