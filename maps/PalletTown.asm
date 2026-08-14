PalletTown_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlyPoint

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE_1F, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_JUMPTEXT, PalletTownSignText
	bg_event  3,  5, BGEVENT_JUMPTEXT, RedsHouseSignText
	bg_event 13, 13, BGEVENT_JUMPTEXT, OaksLabSignText
	bg_event 11,  5, BGEVENT_JUMPTEXT, BluesHouseSignText

	def_object_events
	object_event  3,  8, SPRITE_AROMA_LADY, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PalletTownTeacherText, -1
	object_event 12, 14, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PalletTownFisherText, -1
	object_event 17,  7, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PalletTownYoungsterText, -1
	fruittree_event 12, 21, FRUITTREE_ROUTE_21, ENIGMA_BERRY, PAL_NPC_BLACK

PalletTownFlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

PalletTownTeacherText:
	text "Yo también crío"
	line "#mon."

	para "Me sirven de guar-"
	line "daespaldas."
	done

PalletTownFisherText:
	text "¡La tecnología es"
	line "increíble!"

	para "¡Ahora puedes ha-"
	line "cer juegos solo"

	para "escribiendo código"
	line "en vez de editar"
	cont "datos binarios!"
	done

PalletTownYoungsterText:
	text "¡Ahí te quedas!"

	para "… La gente empezó"
	line "a decir eso por"

	para "aquí, pero es algo"
	line "raro si lo piensas"
	cont "bien."
	done

PalletTownSignText:
	text "Pueblo Paleta"

	para "Un lugar tranquilo"
	line "de paz y pureza"
	done

RedsHouseSignText:
	text "Casa de Rojo"
	done

OaksLabSignText:
	text "Lab. #mon del"
	line "Prof. Oak"
	done

BluesHouseSignText:
	text "Casa de Azul"
	done
