DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500
DEF ROUTE39FARMHOUSE_DOZEN_MILK_PRICE EQU 6000

Route39Farmhouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_AcrobaticsFarmer, -1

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkflag ENGINE_BOUGHT_MOOMOO_MILK
	iftruefwd .Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy12
	sjumpfwd .Cancel

.Buy1:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MOOMOO_MILK
	iffalsefwd .BagFull
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	sjumpfwd .Done

.Buy12:
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MOOMOO_MILK, 12
	iffalsefwd .BagFull
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE

.Done:
	setflag ENGINE_BOUGHT_MOOMOO_MILK
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	endtext

.Cancel:
	jumpthisopenedtext

	text "¿No quieres?"
	line "¡Vuelve cuando"
	cont "quieras!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Lo siento, amigo."
	line "¡Sin dinero no hay"
	cont "trato!"
	done

.BagFull:
	jumpthisopenedtext

	text "Me parece que lle-"
	line "vas la Mochila"
	cont "llena."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}@"
	db "×12   ¥{d:ROUTE39FARMHOUSE_DOZEN_MILK_PRICE}@"
	db "Cancelar@"

.Milking:
	jumpthisopenedtext

	text "Será mejor que me"
	line "vaya a ordeñar."
	done

PokefanF_AcrobaticsFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
	iftruefwd .GotAcrobatics
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .GiveAcrobatics
	jumpthisopenedtext

	text "Nuestra leche lle-"
	line "ga hasta Kanto."

	para "Si nuestras Mil-"
	line "tank no nos dan"

	para "leche, tenemos un"
	line "gran problema."
	done

.GiveAcrobatics:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegivetmhm TM_ACROBATICS
	setevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
.GotAcrobatics:
	jumpthisopenedtext

	text "¡Ese movimiento es"
	line "Acróbata!"

	para "Hace más daño si"
	line "tu #mon no tie-"
	cont "ne ningún objeto."

	para "Será mejor que"
	line "pienses bien cómo"
	cont "usarlo, cielo."
	done

FarmerMText_SickCow:
	text "Mi Miltank ya no"
	line "me da más leche."

	para "La leche de esta"
	line "Granja es famosa."

	para "Casi todo el mundo"
	line "quiere probarla."

	para "Dará un montón de"
	line "leche si le doy"

	para "muchas Bayas, me"
	line "parece a mí."
	done

FarmerMText_BuyMilk:
	text "¿Qué tal te ven-"
	line "dría mi Leche"
	cont "Mu-mu?"

	para "Es mi mayor orgu-"
	line "llo y alegría."

	para "¡Dásela a tus"
	line "#mon para"
	cont "recuperar PS!"

	para "Te la dejaré por"
	line "solo ¥500."
	done

FarmerMText_GotMilk:
	text "¡Aquí tienes!"
	line "¡A disfrutarla!"
	done






FarmerFText_HealedMiltank:
	text "Has curado a"
	line "nuestra Miltank."

	para "Ahora vuelve a dar"
	line "Leche Mu-mu."

	para "Toma algo por las"
	line "molestias."
	done
