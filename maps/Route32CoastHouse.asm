Route32CoastHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_32_COAST, 2
	warp_event  3,  7, ROUTE_32_COAST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GourmetManiacScript, -1

GourmetManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetGourmetManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	readmem wCurItem
	takeitem ITEM_FROM_MEM
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "Merci! Thank you!"

	para "With this, I can"
	line "create something"
	cont "superb."
	done

.GreetingText:
	text "¡Hola! ¡Soy un"
	line "Pastelero gourmet!"

	para "¡Preparo platos"
	line "maravillosos con"
	cont "los mejores"
	cont "ingredientes!"

	para "¿Tienes algún"
	line "ingrediente para"
	cont "venderme?"
	done

.OfferText:
	text "¡Huy, qué bien"
	line "huele!"

	para "¿Aceptarías "
	line ""
	text_decimal hMoneyTemp, 3, 7
	text "¥ por ello?"
	done

.WrongItemText:
	text "Mmm… Esto no es"
	line "exactamente lo que"
	cont "estoy buscando."
	done

.NoItemText:
	text "Vaya… Bueno, no"
	line "pasa nada."
	done
