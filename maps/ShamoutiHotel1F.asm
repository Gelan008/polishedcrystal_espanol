ShamoutiHotel1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ShamoutiHotel1FRestaurantTrigger

	def_warp_events
	warp_event  8,  7, SHAMOUTI_ISLAND, 2
	warp_event  9,  7, SHAMOUTI_ISLAND, 2
	warp_event  2,  0, SHAMOUTI_HOTEL_2F, 1
	warp_event 14,  0, SHAMOUTI_HOTEL_RESTAURANT, 1

	def_coord_events

	def_bg_events
	bg_event 15,  0, BGEVENT_JUMPTEXT, ShamoutiHotelRestaurantSignText

	def_object_events
	object_event  8,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FReceptionistText, -1
	object_event  2,  4, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiHotel1FArtistScript, -1
	object_event  5,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FCooltrainermText, -1
	object_event 12,  5, SPRITE_LADY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FLadyText, -1
	object_event 14,  7, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ShamoutiHotel1FYoungsterText, -1

ShamoutiHotel1FRestaurantTrigger:
	setmapscene SHAMOUTI_HOTEL_RESTAURANT, SCENE_SHAMOUTIHOTELRESTAURANT_MEET
	endcallback

ShamoutiHotel1FReceptionistText:
	text "¡Te damos la bien-"
	line "venida al Hotel"
	cont "Shamouti!"

	para "Me temo que todas"
	line "las habitaciones"
	cont "están ocupadas,"

	para "pero puedes visi-"
	line "tar el exclusivo"
	cont "Restaurante Oasis."
	done

ShamoutiHotel1FArtistScript:
	faceplayer
	opentext
	checkflag ENGINE_CHANGED_TRENDY_PHRASE
	iftruefwd .SetTrendyPhraseToday
	writetext .Text1
	yesorno
	iftruefwd .Yes
	writetext .Text2
	promptbutton
	special SpecialTrendyPhrase
	setflag ENGINE_CHANGED_TRENDY_PHRASE
	jumpopenedtext .Text3

.SetTrendyPhraseToday
	jumpopenedtext .Text4

.Yes
	jumpopenedtext .Text5

.Text1:
	text "Vayas donde vayas,"
	line "¡<TRENDY> es"

	para "lo más guay que"
	line "hay! ¿A que sí?"
	done

.Text2:
	text "¡¿Qué?! ¿Que"
	line "<TRENDY> no"
	cont "es lo más guay?"

	para "Bueno, ¿pues qué"
	line "es lo que está de"
	cont "moda estos días?"
	done

.Text3:
	text "¡Ah, sí! ¡Ya lo"
	line "tengo!"

	para "¡<TRENDY> es"
	line "lo mejor de todo,"
	cont "sin duda!"
	done

.Text4:
	text "¡<TRENDY> es"
	line "lo que se lleva"
	cont "ahora mismo!"
	done

.Text5:
	text "¡Ya te digo!"
	line "¡Es que no me can-"
	cont "so para nada de"
	cont "<TRENDY>!"
	done

ShamoutiHotel1FCooltrainermText:
	text "¿Conque <TRENDY>"
	line "es la nueva moda?"

	para "¡Mola un montón!"
	done

ShamoutiHotel1FLadyText:
	text "¿Alguna vez has"
	line "pescado una Chapa"
	cont "Plateada?"

	para "En Alola, de donde"
	line "vengo, hay un"

	para "hombre que hace"
	line "“Entrenamiento"

	para "Extremo” a tus"
	line "#mon para sacar"

	para "su máximo poten-"
	line "cial a cambio de"
	cont "una Chapa Plateada."
	done

ShamoutiHotel1FYoungsterText:
	text "¡He oído que"
	line "<TRENDY> está"
	cont "de moda ahora!"
	done

ShamoutiHotelRestaurantSignText:
	text "Restaurante Oasis"
	done
