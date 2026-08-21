RuinsOfAlphOutside_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphOutsideTrigger0

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphOutsideTileScript
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphOutsideScientistCallback

	def_warp_events
	warp_event  4, 23, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 16, 13, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  4, 35, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 18, 39, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 12, 19, RUINS_OF_ALPH_ENTRANCE_CHAMBER, 1
	warp_event 19, 17, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  8, 25, UNION_CAVE_B1F_NORTH, 1
	warp_event  8, 33, UNION_CAVE_B1F_NORTH, 2
	warp_event  3,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 15, 26, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 15, 27, ROUTE_32_RUINS_OF_ALPH_GATE, 2
	warp_event 10,  9, RUINS_OF_ALPH_SINJOH_CHAMBER, 1
	warp_event 11, 36, HIDDEN_CAVE_GROTTO, 1

	def_coord_events
	coord_event 13, 20, 1, RuinsOfAlphOutsideScientistScene1
	coord_event 12, 21, 1, RuinsOfAlphOutsideScientistScene1

	def_bg_events
	bg_event 18, 14, BGEVENT_JUMPTEXT, RuinsOfAlphOutsideMysteryChamberSignText
	bg_event 14, 22, BGEVENT_JUMPTEXT, RuinsOfAlphSignText
	bg_event 20, 18, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterSignText
	bg_event  3,  9, BGEVENT_JUMPTEXT, RuinsOfAlphAdvancedTipsSignText
	bg_event 10,  9, BGEVENT_IFNOTSET, MapRuinsofAlphOutsideSealedCaveSign
	bg_event  4, 13, BGEVENT_ITEM + RARE_CANDY, EVENT_RUINS_OF_ALPH_OUTSIDE_HIDDEN_RARE_CANDY
	bg_event 11, 35, BGEVENT_JUMPSTD, cavegrotto, HIDDENGROTTO_RUINS_OF_ALPH

	def_object_events
	object_event 13, 21, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 18, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	object_event  6, 26, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicNathan, -1
	object_event  5, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSuperNerdStan, -1
	object_event 15, 23, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 14, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 16, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	smashrock_event  7, 10
	smashrock_event  8, 10
	smashrock_event  4, 12
	smashrock_event  5, 13
	smashrock_event  7, 13
	smashrock_event  8, 15

	object_const_def
	const RUINSOFALPHOUTSIDE_SCIENTIST1
	const RUINSOFALPHOUTSIDE_SCIENTIST2

RuinsofAlphOutsideTrigger0:
	checkevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	iffalsefwd .End
	showtext RuinsofAlphScientistClimax1Text
	follow RUINSOFALPHOUTSIDE_SCIENTIST2, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST2, RuinsofAlphScientistClimaxApproachMovementData
	stopfollow
	showemote EMOTE_SHOCK, RUINSOFALPHOUTSIDE_SCIENTIST2, 15
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST2, DOWN
	showtext RuinsofAlphScientistClimax2Text
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST2, RuinsofAlphScientistClimaxLeaveMovementData
	disappear RUINSOFALPHOUTSIDE_SCIENTIST2
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	setevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
.End
	end

RuinsofAlphOutsideTileScript:
	checkevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	iffalsefwd .locked
	changeblock 10, 8, $9f
.locked
	endcallback

RuinsOfAlphOutsideScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .MaybeScientist
	sjumpfwd .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater $0, .YesScientist
	sjumpfwd .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST1
	setscene $1
	endcallback

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST1
	setscene $0
	endcallback

RuinsOfAlphOutsideScientistScene1:
RuinsOfAlphOutsideScientistScript:
	faceobject RUINSOFALPHOUTSIDE_SCIENTIST1, PLAYER
	faceobject PLAYER, RUINSOFALPHOUTSIDE_SCIENTIST1
	showtext RuinsOfAlphOutsideScientistText
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST1, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST1, RuinsOfAlphOutsideScientistWalkToLabMovement
	disappear RUINSOFALPHOUTSIDE_SCIENTIST1
	stopfollow
	applyonemovement PLAYER, step_up
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, $1
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue_jumpopenedtext RuinsOfAlphOutsideFisherText2
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	promptbutton
	jumpthisopenedtext

RuinsOfAlphOutsideFisherText2:
	text "¡Las ruinas tienen"
	line "un gran secreto!"

	para "… O eso creo…"
	done

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	jumptext RuinsOfAlphOutsideYoungster1Text

RuinsOfAlphOutsideYoungster2Script:
	showtextfaceplayer RuinsOfAlphOutsideYoungster2Text
	turnobject LAST_TALKED, UP
	end

GenericTrainerPsychicNathan:
	generictrainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText

	text "I like thinking"
	line "here."
	done

GenericTrainerSuperNerdStan:
	generictrainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText

	text "The ruins are from"
	line "about 1,500 years"
	cont "ago."

	para "Nobody knows who"
	line "built them."

	para "It's also not"
	line "known if the #-"
	cont "mon statues have"
	cont "any meaning."

	para "It's all one big"
	line "mystery…"
	done

RuinsOfAlphOutsideScientistWalkToLabMovement:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_right
	step_right
	step_up
	step_up
	step_end

RuinsofAlphScientistClimaxApproachMovementData:
	step_left
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_end

RuinsofAlphScientistClimaxLeaveMovementData:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end

RuinsOfAlphOutsideScientistText:
	text "¿Mmm? Eso es una"
	line "#dex, ¿no?"
	cont "¿Puedo verla?"

	para "Hay muchísimas"
	line "clases de #mon."

	para "¿Eh? ¿Y esto qué"
	line "es?"

	para "¿Qué #mon es"
	line "este?"

	para "Se parece a las"
	line "extrañas letras de"
	cont "las ruinas."

	para "Si esos dibujos"
	line "son #mon, debe"
	cont "de haber muchos"
	cont "más."

	para "¡Ya sé! Déjame que"
	line "actualice tu"
	cont "#dex. ¡Sígueme!"
	done

SuperNerdStanSeenText:
	text "¿Qué quieres? ¡No"
	line "me molestes, estoy"
	cont "estudiando!"
	done

SuperNerdStanBeatenText:
	text "Perdón… Me frustra"
	line "no entender bien"
	cont "todo esto…"
	done

PsychicNathanSeenText:
	text "Mmm… Este lugar es"
	line "muy extraño."
	done

PsychicNathanBeatenText: ; text > text
	text "…"
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "Cámara de paneles"
	line "de piedra"
	done

RuinsOfAlphSignText:
	text "Ruinas Alfa"
	line "Bienvenidos todos"
	done

RuinsOfAlphResearchCenterSignText:
	text "Ruinas Alfa"
	line "Centro de Inv."

	para "Especialistas en"
	line "las Ruinas Alfa"
	done

RuinsOfAlphAdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡La #dex es una"
	line "gran herramienta!"

	para "El mapa muestra un"
	line "icono amarillo si"
	cont "hay un #mon"
	cont "justo donde estás!"
	done

MapRuinsofAlphOutsideSealedCaveSign:
	dw EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	jumpthistext

	text "There's a door-"
	line "shaped groove in"
	cont "the rock."
	done

RuinsOfAlphOutsideFisherText1:
	text "Al explorar las"
	line "ruinas, sentimos"
	cont "algo muy extraño."

	para "¡Nos asustamos y"
	line "salimos huyendo!"

	para "Ten mucho cuidado"
	line "tú también."
	done

RuinsOfAlphOutsideYoungster1Text:
	text "There are many"
	line "kinds of Unown, so"

	para "we use them for"
	line "our secret codes."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "D… E… L… A… N… T…"
	line "E… Mmm…"

	para "¿Qué?"

	para "¡Estoy descifrando"
	line "este mensaje!"
	done

RuinsofAlphScientistClimax1Text:
	text "Parece que ese"
	line "ruido vino de por"
	cont "aquí…"
	done

RuinsofAlphScientistClimax2Text:
	text "¡Increíble!"

	para "¡Había otra cámara"
	line "oculta aquí todo"
	cont "este tiempo!"

	para "¡Podríamos pasar"
	line "años estudiándola!"

	para "… Aunque ese sismo"
	line "fue muy fuerte."

	para "¿Se habrá abierto"
	line "otra cámara muy"
	cont "lejos de aquí?"

	para "¡Tengo que ir a"
	line "contárselo a mis"
	cont "compañeros!"
	done
