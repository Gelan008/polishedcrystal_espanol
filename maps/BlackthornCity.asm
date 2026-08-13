BlackthornCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, BlackthornCityFlypointCallback
	callback MAPCALLBACK_OBJECTS, BlackthornCitySantosCallback

	def_warp_events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 29, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	def_coord_events

	def_bg_events
	bg_event 34, 24, BGEVENT_JUMPTEXT, BlackthornCitySignText
	bg_event 19, 11, BGEVENT_JUMPTEXT, BlackthornGymSignText
	bg_event  7, 29, BGEVENT_JUMPTEXT, MoveDeletersHouseSignText
	bg_event 21,  3, BGEVENT_JUMPTEXT, DragonDensSignText
	bg_event  9, 19, BGEVENT_JUMPTEXT, BlackthornCityTrainerTipsText

	def_object_events
	object_event 22, 20, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 18, 12, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonTamer1Script, EVENT_BLACKTHORN_CITY_DRAGON_TAMER_BLOCKS_GYM
	object_event 19, 12, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornDragonTamer1Script, EVENT_BLACKTHORN_CITY_DRAGON_TAMER_DOES_NOT_BLOCK_GYM
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornBlackbeltScript, -1
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornGramps1Text, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornGramps2Text, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event  9, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornLassText, -1
	object_event 13, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornYoungsterText, -1
	object_event 35, 19, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornCooltrainerF1Text, -1
	object_event  3, 29, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornCooltrainerF2Text, -1
	object_event 31, 26, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonTamer2Text, -1
	object_event 27, 25, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BlackthornDragonTamer3Text, -1

	object_const_def
	const BLACKTHORNCITY_SANTOS

BlackthornCityFlypointCallback:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	endcallback

BlackthornCitySantosCallback:
	readvar VAR_WEEKDAY
	ifequalfwd SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	endcallback

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	endcallback

BlackthornCitySignText:
	text "Ciudad Endrino"

	para "Un retiro"
	line "tranquilo en"
	cont "la montaña"
	done

BlackthornGymSignText:
	text "Gimnasio #mon de"
	line "Ciudad Endrino"
	cont "Líder: Débora"

	para "La maestra en el"
	line "uso de #mon"
	cont "Dragón"
	done

MoveDeletersHouseSignText:
	text "Casa del Quita-"
	line "movimientos"
	done

DragonDensSignText:
	text "Guarida Dragón"
	line "más adelante"
	done

BlackthornCityTrainerTipsText:
	text "Pistas Entrenador"

	para "Un #mon que"
	line "lleve una Baya"
	cont "Ziuela"

	para "se curará de"
	line "cualquier proble-"
	cont "ma de estado."
	done

SantosScript:
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue_jumptextfaceplayer .SaturdayText
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	faceplayer
	opentext
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftruefwd .MetSantos
	writetext .MeetText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext .GivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse_endtext
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	jumpthisopenedtext

	text "Santos: ..."

	para "Hechizo..."

	para "Los ataques tipo"
	line "Fantasma se ha-"
	cont "cen más fuertes..."

	para "Te asustará..."
	done

.NotSaturday:
	jumpthistextfaceplayer

	text "Santos: Hoy no"
	line "es sábado..."
	done

.MeetText:
	text "Santos: ..."

	para "Es sábado..."

	para "Soy Santos del"
	line "sábado..."
	done

.GivesGiftText:
	text "Puedes tener esto."
	done

.SaturdayText:
	text "Santos: ..."

	para "Nos veremos en"
	line "otro sábado..."

	para "No tendré más"
	line "regalos..."
	done

BlackthornDragonTamer1Script:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .ClairIsBeatenText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .ClairIsInText
	jumpthistextfaceplayer

	text "Lo siento."

	para "Débora, nuestra"
	line "Líder de Gimnasio,"

	para "entró en la Guari-"
	line "da Dragón, de-"
	cont "trás del Gimnasio."

	para "No tengo idea de"
	line "cuándo volverá."
	done

.ClairIsInText:
	text "Débora, la Líder,"
	line "te está esperando."

	para "Sin embargo, un"
	line "entrenador corrien"
	cont "te no ganaría."
	done

.ClairIsBeatenText:
	text "¿Venciste a"
	line "Débora?"

	para "¡Es increíble!"

	para "Nunca escuché"
	line "que perdiera con"

	para "nadie que no sea"
	line "su primo Lance."
	done

BlackthornBlackbeltScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "¿Se rompió la ra-"
	line "dio? Últimamente,"
	cont "solo capta una"
	cont "señal extraña."
	done

.Text2:
	text "¡Auuu! ¡Voces en"
	line "mi cabeza!"

	para "¿Eh? ¡Estoy escu-"
	line "chando la radio!"
	done

BlackthornGramps1Text:
	text "No. Solo los en-"
	line "trenadores elegi-"
	cont "dos pueden en-"
	cont "trenar aquí."

	para "Por favor, vete."
	done

BlackthornGramps2Text:
	text "Si Débora lo per-"
	line "mite, su abue-"
	cont "lo, nuestro Maes-"
	cont "tro, también."

	para "Puedes entrar."
	done

BlackthornLassText:
	text "¿Vas a hacer que"
	line "tus #mon olvi-"
	cont "den algún movi-"
	cont "miento?"
	done

BlackthornYoungsterText:
	text "Los maestros Dra-"
	line "gón provienen to-"
	cont "dos de la ciudad"
	cont "de Endrino."
	done

BlackthornCooltrainerF1Text:
	text "Vaya, ¿has pasado"
	line "por la Ruta"
	cont "Helada?"

	para "¡Debes de ser un"
	line "entrenador de pri-"
	cont "mera!"
	done

BlackthornCooltrainerF2Text:
	text "El tipo Hada fue"
	line "descubierto hace"
	cont "poco tiempo."

	para "Acaba totalmente"
	line "con los #mon de"
	cont "tipo Dragón."
	done

BlackthornDragonTamer2Text:
	text "Cuando nuestra Lí-"
	line "der era una joven,"

	para "solía entrenar en"
	line "la Guarida Dra-"

	para "gón sin parar."
	done

BlackthornDragonTamer3Text:
	text "Ciudad Endrino es"
	line "el hogar de muchos"

	para "domadragones famo-"
	line "sos, como Lance."

	para "Es el primo de"
	line "nuestra Líder,"
	cont "¡ya sabes!"
	done
