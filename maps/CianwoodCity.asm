CianwoodCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlyPointAndSuicune

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_CITY_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, MOVE_MANIACS_HOUSE, 1
	warp_event  4, 25, CLIFF_EDGE_GATE, 1

	def_coord_events
	coord_event 11, 16, 1, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_JUMPTEXT, CianwoodCitySignText
	bg_event  6, 44, BGEVENT_JUMPTEXT, CianwoodGymSignText
	bg_event 19, 47, BGEVENT_JUMPTEXT, CianwoodPharmacySignText
	bg_event  8, 32, BGEVENT_JUMPTEXT, CianwoodPhotoStudioSignText
	bg_event  6, 26, BGEVENT_JUMPTEXT, CianwoodCliffEdgeGateSignText
	bg_event  8, 22, BGEVENT_JUMPTEXT, CianwoodMoveManiacSignText
	bg_event 16, 31, BGEVENT_JUMPTEXT, CianwoodAdvancedTipsSignText
	bg_event  4, 19, BGEVENT_ITEM + REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE
	bg_event  5, 29, BGEVENT_ITEM + MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 11, 21, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	pokemon_event 10, 14, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_BLUE, ClearText, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	object_event 21, 37, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityYoungsterText, -1
	object_event 16, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityPokefanMText, -1
	object_event 14, 42, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityLassText, -1
	smashrock_event  8, 16
	smashrock_event  9, 17
	smashrock_event  6, 24
	smashrock_event  4, 29
	smashrock_event 10, 27
	smashrock_event  4, 19
	object_event 10, 46, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event  4, 26, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityRocketText, EVENT_BEAT_CHUCK
	object_event  9, 25, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCitySailorText, -1
	object_event 22, 32, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityFisherText, -1

	object_const_def
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCityFlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_BEAT_EUSINE
	iffalsefwd .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene $0
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	checkevent EVENT_GOT_HM05_WHIRLPOOL
	iftruefwd .NoLyra
	setmapscene ROUTE_42, $1
	sjumpfwd .Continue
.NoLyra
	setmapscene ROUTE_42, $2
.Continue
	checkevent EVENT_BEAT_EUSINE
	iftrue DoNothingScript
	setevent EVENT_BEAT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	showtext EusineSuicuneText
	winlosstext EusineBeatenText, EusineLossText
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	showtext EusineAfterText
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

CianwoodCityChucksWife:
	checkevent EVENT_BEAT_CHUCK
	iftrue_jumptextfaceplayer ChucksWifeChubbyText
	jumptextfaceplayer ChucksWifeEasierToFlyText

CianwoodCitySuicuneApproachMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	step_end

CianwoodCitySuicuneDepartMovement:
	fix_facing
	fast_jump_step_right
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	step_end

CianwoodCityEusineApproachMovement:
	step_up
	step_up
	step_up
	step_up
	step_end

CianwoodCityEusineDepartMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

ChucksWifeEasierToFlyText:
	text "You crossed the"
	line "sea to get here?"

	para "That must have"
	line "been hard."

	para "It would be much"
	line "easier if your"

	para "#mon knew how"
	line "to Fly…"
	done

ChucksWifeChubbyText:
	text "¡Esa es la Medalla"
	line "del Gim. Orquídea!"

	para "Mi marido perdió"
	line "contra ti, así que"
	cont "debe entrenar más."

	para "Le vendrá bien, ya"
	line "que estaba echando"
	cont "barriga."

	para "Las cascadas de la"
	line "Ruta 47 al norte"
	cont "son un buen sitio."
	done

CianwoodCityYoungsterText:
	text "Si usas Vuelo,"
	line "puedes volver a"
	cont "Olivo al instante."
	done

CianwoodCityPokefanMText:
	text "Las rocas al norte"
	line "del pueblo pueden"
	cont "romperse."

	para "Podrían ocultar"
	line "algo."

	para "Tus #mon pueden"
if DEF(FAITHFUL)
	line "usar Golpe Roca en"
	cont "ellas."
else
	line "usar Demolición en"
	cont "ellas."
endc
	done

CianwoodCityLassText:
	text "Aníbal, el Líder"
	line "del Gimnasio, usa"
	cont "#mon de tipo"
	cont "Lucha."
	done

CianwoodCityRocketText:
	text "¡Este camino está"
	line "prohibido!"

	para "¿Por qué? ¡No"
	line "es asunto tuyo!"
	done

CianwoodCitySailorText:
	text "Esa cueva es la"
	line "única forma de"
	cont "llegar a Ruta 47."
	done

CianwoodCityFisherText:
	text "La Farmacia de"
	line "Orquídea lleva"
	cont "abierta más de"
	cont "500 años."

	para "¡Debe de ser algún"
	line "récord, verdad?"
	done

EusineSuicuneText:
	text "Eusine: ¡Eh,"
	line "<PLAYER>!"

	para "¿Ese de ahí no era"
	line "Suicune?"

	para "Solo lo vi un"
	line "instante, pero me"
	cont "pareció que corría"
	cont "sobre las olas."

	para "Suicune es"
	line "hermoso y magno."

	para "Corre por pueblos"
	line "y rutas con gran"
	cont "velocidad."

	para "Es maravilloso…"

	para "Quiero ver a"
	line "Suicune de cerca…"

	para "¡Lo he decidido!"

	para "¡Lucharé contigo"
	line "para ganarme su"
	cont "respeto!"
	
	para "¡Vamos, <PLAYER>!"
	line "¡A luchar!"
	done

EusineBeatenText:
	text "Odio admitirlo,"
	line "pero tú ganas."
	done

EusineLossText:
	text "¡Sí!"

	para "¡Seguro que"
	line "Suicune sabrá ver"
	cont "mi grandeza ahora!"
	done

EusineAfterText:
	text "¡Eres increíble,"
	line "<PLAYER>!"

	para "Con razón los"
	line "#mon van a ti."

	para "Ahora lo entiendo."

	para "Seguiré buscando"
	line "a Suicune."

	para "Seguro que nos"
	line "volveremos a ver."

	para "¡Hasta luego!"
	done

CianwoodCitySignText:
	text "Ciudad Orquídea"

	para "Un puerto rodeado"
	line "de bravos mares"
	done

CianwoodGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Orquídea: Aníbal"

	para "Sus puños feroces"
	line "hablan por él"
	done

CianwoodPharmacySignText:
	text "500 Años de"
	line "Tradición"

	para "Farmacia de Ciudad"
	line "Orquídea"

	para "Esperamos sus"
	line "Consultas Médicas"
	done

CianwoodPhotoStudioSignText:
	text "Estudio de Fotos"
	line "de Ciudad Orquídea"

	para "¡Sácate una foto"
	line "de recuerdo!"
	done

CianwoodCliffEdgeGateSignText:
	text "Puerta del"
	line "Acantilado"

	para "¡El Bosque"
	line "Amarillo está"
	cont "justo delante!"
	done

CianwoodMoveManiacSignText:
	text "El Maniaco de los"
	line "Mov. delante"
	done

CianwoodAdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡Usa una # Ball"
	line "en un #mon ya"
	cont "atrapado para"
	cont "cambiar su Ball!"

	para "¡Pero perderás la"
	line "Ball original!"
	done
