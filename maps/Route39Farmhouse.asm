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
	jumpopenedtext FarmerMText_NoSale

.NotEnoughMoney:
	jumpopenedtext FarmerMText_NoMoney

.BagFull:
	jumpopenedtext FarmerMText_NoRoom

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    {d:ROUTE39FARMHOUSE_MILK_PRICE}¥@"
	db "×12   {d:ROUTE39FARMHOUSE_DOZEN_MILK_PRICE}¥@"
	db "Cancelar@"

.Milking:
	jumpopenedtext FarmerMText_Milking

PokefanF_AcrobaticsFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
	iftruefwd .GotAcrobatics
	checkevent EVENT_HEALED_MOOMOO
	iftruefwd .GiveAcrobatics
	jumpopenedtext FarmerFText_InTrouble

.GiveAcrobatics:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegivetmhm TM_ACROBATICS
	setevent EVENT_GOT_TM62_ACROBATICS_FROM_MOOMOO_FARM
.GotAcrobatics:
	jumpopenedtext FarmerFText_AcrobaticsSpeech

FarmerMText_SickCow:
	text "Mi Miltank ya no"
	line "me da más leche."

	para "La leche de esta"
	line "Granja es famosa,"
	cont "todos la quieren."

	para "Dará más leche si"
	line "le doy bastantes"
	cont "Bayas, creo yo."
	done

FarmerMText_BuyMilk:
	text "¿Te apetece una"
	line "rica Leche Mu-mu?"

	para "Es mi gran orgullo"
	line "y alegría."

	para "¡Dásela a tus"
	line "#mon para que"
	cont "recuperen PS!"

	para "Te la dejaré por"
	line "solo 500¥."
	done

FarmerMText_GotMilk:
	text "¡Aquí tienes!"
	line "¡A disfrutarla!"
	done

FarmerMText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

FarmerMText_NoRoom:
	text "I reckon yer"
	line "Bag's full."
	done

FarmerMText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

FarmerMText_Milking:
	text "I best go do my"
	line "milkin'."
	done

FarmerFText_InTrouble:
	text "Our milk even goes"
	line "out to Kanto."

	para "So if our own"
	line "Miltank won't give"

	para "us any milk, we're"
	line "in trouble."
	done

FarmerFText_HealedMiltank:
	text "Has curado a"
	line "nuestra Miltank."

	para "Ahora vuelve a dar"
	line "Leche Mu-mu."

	para "Toma algo por las"
	line "molestias."
	done

FarmerFText_AcrobaticsSpeech:
	text "That there's"
	line "Acrobatics."

	para "It's a move that"
	line "hurts more if'n"

	para "your #mon ain't"
	line "holdin' an item."

	para "You best think how"
	line "you ought to use"
	cont "it, hon."
	done
