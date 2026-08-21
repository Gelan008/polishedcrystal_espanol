FuchsiaSafariBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 11
	warp_event  3,  7, FUCHSIA_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaSafariBallHouseOfficerScript, -1

FuchsiaSafariBallHouseOfficerScript:
	faceplayer
	opentext
	writetext .IntroText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext ; cancel

	text "What will I do"
	line "with them all?"
	done

.Buy1:
	checkmoney YOUR_MONEY, 2000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SAFARI_BALL
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 2000
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 20000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem SAFARI_BALL, 10
	iffalse_jumpopenedtext .BagFullText
	takemoney YOUR_MONEY, 20000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext .GoodbyeText
	promptbutton
	itemnotify
	endtext

.NotEnoughMoney:
	jumpthisopenedtext

	text "You don't have"
	line "enough money."
	done

.IntroText:
	text "Yo administraba el"
	line "Juego Safari."

	para "Al estar cerrado,"
	line "debo ganar dinero"
	cont "de alguna forma."

	para "¿Quieres comprar"
	line "Safari Balls que"
	cont "me sobraron?"

	para "¡Son un artículo"
	line "de coleccionista!"
	done

.GoodbyeText:
	text "¡Gracias, colega!"
	done

.BagFullText:
	text "¡No puedes llevar"
	line "tantas!"
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1   2000¥@"
	db "×10  20000¥@"
	db "Salir@"
