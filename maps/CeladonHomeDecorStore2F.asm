CeladonHomeDecorStore2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9,  0, CELADON_HOME_DECOR_STORE_1F, 3
	warp_event  6,  0, CELADON_HOME_DECOR_STORE_3F, 1

	def_coord_events

	def_bg_events
	bg_event  8,  0, BGEVENT_JUMPTEXT, CeladonHomeDecorStore2FDirectoryText

	def_object_events
	object_event  9,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHomeDecorStore2FClerkScript, -1
	object_event  3,  1, SPRITE_MATRON, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHomeDecorStore2FPokefanfText, -1

CeladonHomeDecorStore2FClerkScript:
	faceplayer
	opentext
	writetext CeladonHomeDecorStore2FClerkText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .PinkBed
	ifequalfwd $2, .PolkaDotBed
	ifequalfwd $3, .PikachuBed
	endtext

.PinkBed:
	checkmoney YOUR_MONEY, 62000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BED_2
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 62000
	setevent EVENT_DECO_BED_2
	writetext BoughtPinkBedText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PinkBedSentText
	waitbutton
	sjump .Start

.PolkaDotBed:
	checkmoney YOUR_MONEY, 94000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BED_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 94000
	setevent EVENT_DECO_BED_3
	writetext BoughtPolkaDotBedText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PolkaDotBedSentText
	waitbutton
	sjump .Start

.PikachuBed:
	checkmoney YOUR_MONEY, 126000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_BED_4
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 126000
	setevent EVENT_DECO_BED_4
	writetext BoughtPikachuBedText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext PikachuBedSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext CeladonHomeDecorStore2FNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext CeladonHomeDecorStore2FAlreadyBoughtText
	waitbutton
	sjump .Start

.MenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 19, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Pink      ¥62000@"
	db "PolkaDot  ¥94000@"
	db "Pikachu  ¥126000@"
	db "Salir@"

CeladonHomeDecorStore2FClerkText:
	text "¡Hola! ¿Estás de"
	line "compras buscando"
	cont "una cama nueva?"
	done

BoughtPinkBedText:
	text "<PLAYER> compró la"
	line "Cama Rosa."
	done

PinkBedSentText:
	text "La Cama Rosa"
	line "fue a casa."
	done

BoughtPolkaDotBedText:
	text "<PLAYER> compró la"
	line "Cama Lunares."
	done

PolkaDotBedSentText:
	text "La Cama Lunares"
	line "fue a casa."
	done

BoughtPikachuBedText:
	text "<PLAYER> compró la"
	line "Cama Pikachu."
	done

PikachuBedSentText:
	text "La Cama Pikachu"
	line "fue a casa."
	done

CeladonHomeDecorStore2FNoMoneyText:
	text "¡No te lo puedes"
	line "permitir!"
	done

CeladonHomeDecorStore2FAlreadyBoughtText:
	text "¡Ya tienes eso!"
	done

CeladonHomeDecorStore2FPokefanfText:
	text "Las cosas de mar-"
	line "ca cuestan más que"
	cont "las normales."

	para "Pero la Cama de"
	line "Pikachu es tan li-"
	cont "nda…"
	done

CeladonHomeDecorStore2FDirectoryText:
	text "¡Suave y"
	line "esponjosa!"

	para "P1: Camas"
	done
