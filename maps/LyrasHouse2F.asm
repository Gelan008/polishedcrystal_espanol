LyrasHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, LYRAS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_JUMPTEXT, LyrasHousePCText
	bg_event  5,  1, BGEVENT_READ, InitialRadio
	bg_event  7,  1, BGEVENT_READ, PokemonJournalProfElmScript

	def_object_events
	object_event  2,  3, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, LyrasHouseLyraText, EVENT_LYRA_IN_HER_ROOM
	pokemon_event  3,  3, PIDGEOT, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, LyrasHousePidgeotText, EVENT_LYRA_IN_HER_ROOM
	object_event  6,  2, SPRITE_N64, SPRITEMOVEDATA_STILL, 0, 0, -1, PAL_NPC_N64, OBJECTTYPE_COMMAND, jumptext, LyrasHouseN64Text, -1

LyrasHouseLyraText:
	text "Lira: ¡Hola,"
	line "<PLAYER>!"

	para "Mmm… Puede que mi"
	line "#mon esté más"
	cont "gordito…"

	para "Tendré que ponerlo"
	cont "a dieta."

	done

LyrasHousePidgeotText:
	text "Pidgeot: ¡Pijiii!"
	done

LyrasHousePCText:
	text "¡No deberías"
	line "hurgar en el PC"
	cont "de los demás!"
	done

LyrasHouseN64Text:
	text "¡Es una N64 de"
	line "Pikachu de"
	cont "edición limitada!"
	done
