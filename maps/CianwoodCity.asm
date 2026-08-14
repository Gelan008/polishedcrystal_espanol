CianwoodCity_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_CIANWOODCITY_NOOP
	scene_const SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

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
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_JUMPTEXT, CianwoodCitySignText
	bg_event  9, 43, BGEVENT_JUMPTEXT, CianwoodGymSignText
	bg_event 18, 47, BGEVENT_JUMPTEXT, CianwoodPharmacySignText
	bg_event 12, 31, BGEVENT_JUMPTEXT, CianwoodPhotoStudioSignText
	bg_event  6, 26, BGEVENT_JUMPTEXT, CianwoodCliffEdgeGateSignText
	bg_event  7, 21, BGEVENT_JUMPTEXT, CianwoodMoveManiacSignText
	bg_event 11, 37, BGEVENT_JUMPTEXT, CianwoodAdvancedTipsSignText
	bg_event  4, 19, BGEVENT_ITEM + REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE
	bg_event  5, 29, BGEVENT_ITEM + MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

	def_object_events
	object_event 11, 21, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	pokemon_event 10, 14, SUICUNE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, ClearText, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	object_event 21, 37, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityYoungsterText, -1
	object_event 16, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityPokefanMText, -1
	object_event 14, 42, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CianwoodCityLassText, -1
	smashrock_event  8, 16
	smashrock_event  9, 17
	smashrock_event  6, 24
	smashrock_event  5, 29
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
	setscene SCENE_CIANWOODCITY_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	checkevent EVENT_GOT_HM05_WHIRLPOOL
	iftruefwd .NoLyra
	setmapscene ROUTE_42, SCENE_ROUTE42_LYRA
	sjumpfwd .Continue
.NoLyra
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
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
	jumpthistextfaceplayer

	text "¿Cruzaste el mar"
	line "para llegar aquí?"

	para "Debe de haber"
	line "sido difícil."

	para "Sería mucho más"
	line "fácil si tus #-"

	para "mon supieran"
	line "Vuelo..."
	done

CianwoodCitySuicuneApproachMovement:
	fix_facing
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	step_end

CianwoodCitySuicuneDepartMovement:
	fix_facing
	fast_jump_step_right
	fast_jump_step_down
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


ChucksWifeChubbyText:
	text "¡Esa es la Medalla"
	line "Gimnasio Orquídea!"

	para "Mi marido perdió"
	line "contra ti, así que"
	cont "debe entrenar más."

	para "Eso es bueno, ya"
	line "que se estaba po-"
	cont "niendo gordito."

	para "Las cascadas de la"
	line "Ruta 47, al norte,"

	para "son un buen lugar"
	line "para entrenar."
	done

CianwoodCityYoungsterText:
	text "Si usas Vuelo,"
	line "puedes volver"

	para "a Olivo al"
	line "instante."
	done

CianwoodCityPokefanMText:
	text "Las rocas al norte"
	line "del pueblo pueden"
	cont "ser aplastadas."

	para "Podrían ocultar"
	line "algo."

	para "Tus #mon po-"
if DEF(FAITHFUL)
	line "drían usar Golpe"
	cont "Roca con ellas."
else
	line "drían usar Demoli-"
	cont "ción con ellas."
endc
	done

CianwoodCityLassText:
	text "Aníbal, el Líder"
	line "del Gimnasio, pe-"

	para "lea con sus #-"
	line "mon de lucha."
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
	text "La Farmacia Orquí-"
	line "dea lleva abierta"
	cont "durante más de"
	cont "500 años."

	para "Eso debe ser al-"
	line "gún tipo de ré-"
	cont "cord, ¿verdad?"
	done

EusineSuicuneText:
	text "Eusine: Eh,"
	line "<PLAYER>."

	para "¿Ese de ahí no"
	line "era Suicune?"

	para "Solo le he echado"
	line "un vistazo rápido,"

	para "pero creí ver a"
	line "Suicune corriendo"
	cont "sobre las olas."

	para "Suicune es"
	line "hermoso y magno."

	para "Y corre a través"
	line "de pueblos y ru-"

	para "tas a velocidades"
	line "asombrosas."

	para "Es maravilloso..."

	para "Quiero ver a"
	line "Suicune de cerca.."

	para "Lo he decidido."

	para "¡Lucharé contigo"
	line "para lograr el"
	cont "respeto de"
	cont "Suicune!"
	
	para "¡Vamos, <PLAYER>!"
	line "¡Luchemos ahora!"
	done

EusineBeatenText:
	text "Odio admitirlo,"
	line "pero tú ganas."
	done

EusineLossText:
	text "¡Sí!"

	para "¡Seguro que"
	line "Suicune reconoce-"
	cont "rá mi grandeza"
	cont "ahora!"
	done

EusineAfterText:
	text "¡Eres increíble,"
	line "<PLAYER>!"

	para "Con razón los"
	line "#mon se"
	cont "acercan a ti."

	para "Ahora lo entiendo."

	para "Voy a seguir"
	line "buscando a"
	cont "Suicune."

	para "Estoy seguro de"
	line "que nos volvere-"
	cont "mos a ver."

	para "¡Nos vemos!"
	done

CianwoodCitySignText:
	text "Ciudad Orquídea"

	para "Un puerto rodeado"
	line "de mares agita-"
	cont "dos"
	done

CianwoodGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Orquídea: Aníbal"

	para "Sus puños rugien-"
	line "tes hablan por él"
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
	text "Estudio Fotográ-"
	line "fico de Ciudad"
	cont "Orquídea"

	para "¡Sácate una foto"
	line "de recuerdo!"
	done

CianwoodCliffEdgeGateSignText:
	text "Puerta del Acanti-"
	line "lado"

	para "¡El Bosq. Amarillo"
	line "está justo delan-"
	cont "te!"
	done

CianwoodMoveManiacSignText:
	text "El Maniaco de los"
	line "Mov. delante"
	done

CianwoodAdvancedTipsSignText:
	text "¡Pistas Entren.!"

	para "¡Puedes usar una"
	line "# Ball en un"

	para "#mon que hayas"
	line "atrapado para"
	cont "cambiar su Ball!"

	para "¡Pero no recupe-"
	line "rarás la # Ball"
	cont "original!"
	done
