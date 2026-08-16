PewterGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  7, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperJerry, -1
	object_event  7,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerHikerEdwin, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	setevent EVENT_BEAT_HIKER_EDWIN
	opentext
	givebadge BOULDERBADGE, KANTO_REGION
	callstd kantopostgymevents
.FightDone:
	checkevent EVENT_GOT_TM48_ROCK_SLIDE
	iftrue_jumpopenedtext BrockFightDoneText
	writetext BrockBoulderBadgeText
	promptbutton
	verbosegivetmhm TM_ROCK_SLIDE
	setevent EVENT_GOT_TM48_ROCK_SLIDE
	jumpthisopenedtext

	text "It can sometimes"
	line "cause your foe to"
	cont "flinch."
	done

GenericTrainerCamperJerry:
	generictrainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText

	text "¡Oye, tú! ¡Entre-"
	line "nador de Johto!"

	para "Brock es duro."
	line "Te dará una lec-"

	para "ción si no te lo"
	line "tomas en serio."
	done

GenericTrainerHikerEdwin:
	generictrainer HIKER, EDWIN, EVENT_BEAT_HIKER_EDWIN, HikerEdwinSeenText, HikerEdwinBeatenText

	text "Uf… Hecho"
	line "pedazos."
	done

PewterGymGuyScript:
	checkevent EVENT_BEAT_BROCK
	iftrue_jumptextfaceplayer PewterGymGuyWinText
	jumpthistextfaceplayer

	text "¡Hola, futuro"
	line "campeón!"

	para "¡Estás que te sa-"
	line "les! ¿Estás com-"

	para "batiendo contra"
	line "los Líderes de"
	cont "Gimnasio de Kanto?"

	para "Son fuertes y de-"
	line "dicados, igual que"

	para "los Líderes de"
	line "Johto."
	done

PewterGymStatue:
	gettrainername BROCK, 1, STRING_BUFFER_4
	checkflag ENGINE_BOULDERBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	jumpstd gymstatue2

BrockIntroText:
	text "Brock: ¡No suelo"
	line "recibir aspirantes"

	para "de Johto!"

	para "Soy Brock, Líder"
	line "de Gimnasio de"
	cont "Plateada."

	para "Soy un experto en"
	line "#mon tipo Roca."

	para "Mis #mon son"
	line "resistentes a los"

	para "ataques físicos."
	line "Te costará mucho"
	cont "hacerles daño."

	para "¡Adelante!"
	done

BrockWinLossText:
	text "Brock: Los fuertes"
	line "ataques de tus"

	para "#mon superaron"
	line "mi dura defensa de"
	cont "roca…"

	para "Eres más fuerte de"
	line "lo que esperaba…"

	para "Adelante, llévate"
	line "esta Medalla."
	done

BrockBoulderBadgeText:
	text "Brock: Gracias,"
	line "<PLAYER>. He dis-"

	para "frutado combatien-"
	line "do contigo, aunque"
	cont "esté algo picado."

	para "También te daré la"
	line "MT de Avalancha."
	done

BrockFightDoneText:
	text "Brock: El mundo es"
	line "enorme. Aún hay"

	para "muchos entrenado-"
	line "res fuertes como"
	cont "tú."

	para "Ya lo verás: yo"
	line "también me volveré"
	cont "mucho más fuerte."
	done

CamperJerrySeenText:
	text "Los entrenadores"
	line "de este Gimnasio"

	para "usan #mon de"
	line "tipo Roca."

	para "El tipo Roca tiene"
	line "mucha Defensa."

	para "Los combates pue-"
	line "den alargarse mu-"

	para "cho. ¿Estás a pun-"
	line "to para esto?"
	done

CamperJerryBeatenText:
	text "Tengo que ganar"
	line "estos combates…"
	done

HikerEdwinSeenText: ; text > text
	text "¡R-r-r… CATAPLÚM!"
	done

HikerEdwinBeatenText: ; text > text
	text "¡BOOM!"
	done

PewterGymGuyWinText:
	text "¡Hola, futuro"
	line "campeón! Este Gim-"

	para "nasio no te ha da-"
	line "do muchos proble-"
	cont "mas."

	para "Tu forma de llevar"
	line "el combate fue muy"

	para "inspiradora. Lo"
	line "digo en serio."
	done