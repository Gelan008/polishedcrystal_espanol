VioletMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VIOLET_CITY, 1
	warp_event  3,  7, VIOLET_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_VIOLET
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletMartGrannyText, -1
	object_event  5,  2, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletMartCooltrainerMText, -1

VioletMartGrannyText:
	text "Al atrapar a un"
	line "#mon, puede"
	cont "que sea débil."

	para "Pero con paciencia"
	line "se volverá muy"
	cont "fuerte."

	para "Es importante dar"
	line "cariño a tus"
	cont "#mon."
	done

VioletMartCooltrainerMText:
	text "Los #mon pueden"
	line "llevar Poción o"
	cont "Antídoto."

	para "Pero parece que no"
	line "saben cómo usar"
	cont "objetos humanos."
	done
