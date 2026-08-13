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
	text "Aquí no hay Super"
	line "Balls. Las #"

	para "Balls tendrán que"
	line "bastar."

	para "Ojalá César me"
	line "hiciera algunas"
	cont "Balls a medida."
	done

AzaleaMartBugCatcherText:
	text "Una Super Ball es"
	line "mejor para atra-"
	cont "par #mon que"
	cont "una # Ball."

	para "Pero a veces las"
	line "de César pueden"
	cont "ser mejores."
	done

AzaleaMartLadyText:
	text "Puedo comprar mu-"
	line "chos objetos en"
	cont "Ciudad Trigal,"

	para "¡pero para forta-"
	line "lecer el Fuego,"

	para "nada supera al"
	line "Carbón de Pueblo"
	cont "Azalea!"
	done

AzaleaMartRockerText:
	text "Los prototipos de"
	line "las Balls de"

	para "César tenían al-"
	line "gunos problemas."

	para "Las Amor Ball a-"
	line "trapaban #mon"
	cont "del mismo sexo,"

	para "y las Rapid Ball"
	line "solo funcionaban"

	para "para tres espe-"
	line "cies de #mon."

	para "¡Menos mal que a-"
	line "rreglaron esos"
	cont "problemas!"
	done
