AzaleaMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_AZALEA
	object_event  2,  5, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartCooltrainermText, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartBugCatcherText, -1
	object_event  8,  6, SPRITE_LADY, SPRITEMOVEDATA_STANDING_UP, 0, 0, (1 << MORN) | (1 << DAY), PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartLadyText, -1
	object_event  8,  6, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, (1 << EVE) | (1 << NITE), PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaMartRockerText, -1

AzaleaMartCooltrainermText:
	text "Aquí no hay"
	line "Super Balls. Las"
	cont "# Balls"
	cont "tendrán que bastar"

	para "Ojalá César me"
	line "hiciera algunas"
	cont "Balls a medida."
	done

AzaleaMartBugCatcherText:
	text "Una Super Ball es"
	line "mejor para"
	cont "atrapar #mon"
	cont "que una # Ball"

	para "Pero a veces las"
	line "de César pueden"
	cont "ser mejores."
	done

AzaleaMartLadyText:
	text "Puedo comprar"
	line "muchos objetos en"
	cont "Ciudad Trigal,"

	para "¡pero para"
	line "fortalecer el"
	cont "Fuego, nada"
	cont "supera al Carbón"
	cont "de Pueblo Azalea!"
	done

AzaleaMartRockerText:
	text "Los prototipos de"
	line "las Balls de César"
	cont "tenían algunos"
	cont "problemas."

	para "Las Amor Ball"
	line "atrapaban #mon"
	cont "del mismo sexo,"

	para "y las Rapid Ball"
	line "solo funcionaban"
	cont "para tres especies"
	cont "de #mon."

	para "¡Menos mal que"
	line "arreglaron esos"
	cont "problemas!"
	done
