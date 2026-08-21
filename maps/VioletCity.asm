VioletCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VioletCityFlyPoint

	def_warp_events
	warp_event  9, 17, VIOLET_MART, 2
	warp_event 18, 17, VIOLET_GYM, 1
	warp_event 30, 17, EARLS_POKEMON_ACADEMY, 1
	warp_event  3, 15, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 31, 25, VIOLET_POKECENTER_1F, 1
	warp_event 21, 29, VIOLET_ONIX_TRADE_HOUSE, 1
	warp_event 23,  1, SPROUT_TOWER_1F, 1
	warp_event 39, 24, ROUTE_31_VIOLET_GATE, 1
	warp_event 39, 25, ROUTE_31_VIOLET_GATE, 2
	warp_event  0,  8, ROUTE_36_VIOLET_GATE, 3
	warp_event  0,  9, ROUTE_36_VIOLET_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 24, 20, BGEVENT_JUMPTEXT, VioletCitySignText
	bg_event 19, 17, BGEVENT_JUMPTEXT, VioletGymSignText
	bg_event 25,  3, BGEVENT_JUMPTEXT, SproutTowerSignText
	bg_event 27, 17, BGEVENT_JUMPTEXT, EarlsPokemonAcademySignText
	bg_event 37, 14, BGEVENT_ITEM + HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION
	bg_event 21,  9, BGEVENT_ITEM + POKE_BALL, EVENT_VIOLET_CITY_HIDDEN_POKE_BALL

	def_object_events
	object_event 13, 16, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityEarlScript, EVENT_VIOLET_CITY_EARL
	object_event 28, 28, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityLassText, -1
	object_event 26, 14, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WANDER, 2, 1, (1 << MORN) | (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM1Text, -1
	object_event 26, 14, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerFText, -1
	object_event 17, 20, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityGrampsText, -1
	object_event  5, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityYoungsterText, -1
	object_event 26,  9, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityFisherText, -1
	object_event 35, 25, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM2Text, -1
	cuttree_event 36, 19, EVENT_VIOLET_CITY_CUT_TREE
	fruittree_event 14, 29, FRUITTREE_VIOLET_CITY, CHERI_BERRY, PAL_NPC_RED
	itemball_event 14,  4, PP_UP, 1, EVENT_VIOLET_CITY_PP_UP
	itemball_event 35,  8, RARE_CANDY, 1, EVENT_VIOLET_CITY_RARE_CANDY

	object_const_def
	const VIOLETCITY_EARL

VioletCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

VioletCityEarlScript:
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
	yesorno
	iffalsefwd .FollowEarl
	jumpthisopenedtext

	text "¡Ooh, la la!"
	line "¡Realmente bonito!"
	done

.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	turnobject PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	special RestartMapMusic
	opentext
	writetext Text_HereTeacherIAm
	promptbutton
	verbosegivekeyitem TYPE_CHART
	writetext Text_EarlsTypeChart
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applyonemovement VIOLETCITY_EARL, step_up
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	end

VioletCityFollowEarl_MovementData:
	run_step_down
	run_step_down
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	run_step_down
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	run_step_up
	turn_head_down
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

Text_EarlAsksIfYouBeatFalkner:
	text "¡Hola!"
	line "¿entrenador ser?"

	para "¿A Líder Gimnasio,"
	line "tú ganar hiciste?"
	done

Text_FollowEarl:
	text "¿Ah, sí? ¡Entonces"
	line "tú deber estudiar!"
	cont "¡Sígueme a mí!"
	done

Text_HereTeacherIAm:
	text "Aquí, el maestro"
	line "yo soy. ¡Bueno es"
	cont "que tú estudies!"

	para "¡Toma esto y"
	line "tú aprenderás!"
	done

Text_EarlsTypeChart:
	text "¡En combate, las"
	line "ventajas de tipo"
	cont "tú debes saber!"

	para "¡En todo momento,"
	line "esta tabla"
	cont "consultar podrás!"
	done

VioletCityLassText:
	text "Se rumorea que hay"
	line "fantasmas en la"
	cont "Torre Bellsprout."

	para "Dicen que los"
	line "ataques de tipo"
	cont "Normal no afectan"
	cont "a los fantasmas."
	done

VioletCityCooltrainerM1Text:
	text "Oye, ¿eres un buen"
	line "entrenador?"

	para "¡Si vences al"
	line "Líder del lugar,"
	cont "irás a la fama!"
	done

VioletCityCooltrainerFText:
	text "Bellsprout es muy"
	line "popular en esta"
	cont "ciudad."

	para "Pero no le va bien"
	line "contra el Líder de"
	cont "Gimnasio…"
	done

VioletCityGrampsText:
	text "¡Pegaso, del"
	line "Gimnasio de Malva,"
	cont "es un gran tipo!"

	para "Heredó el Gimnasio"
	line "de su padre y hace"
	cont "un gran trabajo."
	done

VioletCityYoungsterText:
	text "¡Vi un árbol que"
	line "se movía adelante!"

	para "¡Si lo tocas, se"
	line "retuerce y baila!"
	cont "¡Es genial!"
	done

VioletCityFisherText:
	text "¿Cómo aguanta un"
	line "edificio inestable"
	cont "un terremoto?"

	para "Algo se me debe de"
	line "escapar…"
	done

VioletCityCooltrainerM2Text:
	text "Aquí cuidamos los"
	line "edificios"
	cont "tradicionales."

	para "Tanto la Tienda"
	line "como el Centro"
	cont "#mon"

	para "usan tonos sobrios"
	line "para no desentonar"
	cont "con el entorno."
	done

VioletCitySignText:
	text "Ciudad Malva"

	para "La ciudad de los"
	line "olores nostálgicos"
	done

VioletGymSignText:
	text "Líder del Gimnasio"
	line "#mon de Ciudad"
	cont "Malva: Pegaso"

	para "El maestro de los"
	line "#mon pájaro"
	done

SproutTowerSignText:
	text "Torre Bellsprout"

	para "Experimenta el"
	line "camino #mon"
	done

EarlsPokemonAcademySignText:
	text "Academia #mon"
	line "de Primo"
	done
