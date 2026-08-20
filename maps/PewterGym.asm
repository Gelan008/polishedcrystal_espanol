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

	text "A veces puede"
	line "hacer retroceder"
	cont "al rival."
	done

GenericTrainerCamperJerry:
	generictrainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText

	text "¡Oye, entrenador"
	line "de Johto!"

	para "Brock es muy duro."
	line "¡Aprenderás a las"
	cont "malas si no te lo"
	cont "tomas en serio!"
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

	para "¡Vas con todo!"
	line "¿Vas a retar a los"
	cont "Líderes de Kanto?"

	para "Son fuertes y muy"
	line "dedicados, como en"
	cont "Johto."
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
	cont "de Johto!"

	para "Soy Brock, Líder"
	line "de Gimnasio de"
	cont "Plateada."

	para "Soy un experto en"
	line "#mon tipo Roca."

	para "Resisten muy bien"
	line "los ataques"
	cont "físicos."

	para "¡Te costará mucho"
	line "hacerles daño!"

	para "¡Adelante!"
	done

BrockWinLossText:
	text "Brock: Los ataques"
	line "de tus #mon"
	cont "superaron mi gran"
	cont "defensa de roca…"

	para "Eres más fuerte de"
	line "lo que esperaba…"

	para "Adelante, toma"
	line "esta Medalla."
	done

BrockBoulderBadgeText:
	text "Brock: Gracias,"
	line "<PLAYER>."

	para "Me ha encantado"
	line "este combate."

	para "¡Toma también la"
	line "MT de Avalancha!"
	done

BrockFightDoneText:
	text "Brock: El mundo es"
	line "enorme. Aún hay"
	cont "rivales fuertes"
	cont "como tú."

	para "Ya lo verás ¡Yo"
	line "también me haré"
	cont "mucho más fuerte!"
	done

CamperJerrySeenText:
	text "Aquí usamos"
	line "#mon de tipo"
	cont "Roca."

	para "Tienen una gran"
	line "Defensa física."

	para "Los combates se"
	line "hacen muy largos."

	para "¿Podrás con ello?"
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
	line "campeón!"

	para "¡Este Gimnasio no"
	line "te dio problemas!"

	para "¡Tu combate fue"
	line "muy inspirador!"
	cont "¡Lo digo en serio!"
	done