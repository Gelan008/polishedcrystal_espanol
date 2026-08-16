GoldenrodFlowerShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  6,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, FlowerShopGentlemanText, EVENT_FLORIA_AT_SUDOWOODO

	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftruefwd .SellMulch
	checkevent EVENT_FLORIA_AT_SUDOWOODO
	iftruefwd .MetFloria
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherStopMySisterText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.MetFloria:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue_jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegivekeyitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	end

.SellMulch:
	faceplayer
	opentext
	writetext WoukdYouLikeMulchText
	special PlaceMoneyTopRight
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .Buy1
	ifequalfwd $2, .Buy10
	jumpthisopenedtext

	text "¡Vuelve cuando"
	line "quieras!"
	done

.Buy1:
	checkmoney YOUR_MONEY, 200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 200
	sjumpfwd .Done

.Buy10:
	checkmoney YOUR_MONEY, 2000
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	giveitem MULCH, 10
	iffalse_jumpopenedtext NoRoomForMulchText
	takemoney YOUR_MONEY, 2000

.Done:
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	itemnotify
	jumpthisopenedtext

	text "¡Gracias!"
	line "¡Vuelve cuando"
	cont "quieras!"
	done

.NotEnoughMoney:
	jumpthisopenedtext

	text "Bueno… perdona,"
	line "pero te falta"
	cont "dinero."
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥200@"
	db "×10   ¥2000@"
	db "Salir@"

FlowerShopFloriaScript:
	checkflag ENGINE_PLAINBADGE
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	checkevent EVENT_FOUGHT_SUDOWOODO
	iffalse_jumptextfaceplayer GoldenrodFlowerShopFloriaYouBeatWhitneyText
	checkitem MULCH
	iftrue_jumptextfaceplayer DescribeMulchText
	jumpthistextfaceplayer

	text "¡Así que ese árbol"
	line "que se movía de"
	cont "verdad era un"
	cont "#mon!"
	done

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "¿Has visto ese ár-"
	line "bol raro que ha"

	para "crecido en la"
	line "Ruta 36?"

	para "Mi hermana pequeña"
	line "se emocionó mucho"

	para "y ha ido a verlo.."

	para "Estoy preocupada.."
	line "¿No es peligroso?"
	done

GoldenrodFlowerShopTeacherStopMySisterText:
	text "Mi hermana pequeña"
	line "se emocionó mucho"

	para "y ha ido a ver el"
	line "árbol raro…"

	para "Estoy preocupada.."
	line "¿Puedes por favor"

	para "evitar que se haga"
	line "daño?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "¿También quieres"
	line "pedir prestada la"
	cont "Squirgadera?"

	para "No quiero que ha-"
	line "gas nada peli-"
	cont "groso con ella."
	done

GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Oh, eres mejor que"
	line "Blanca."

	para "¿Sabes lo del"
	line "árbol raro?"

	para "Si lo mojas con"
	line "una Squirgadera,"
	cont "te atacará."

	para "Pero como tienes"
	line "Medallas, seguro"
	cont "que estarás bien."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, eres mejor"
	line "que Blanca…"

	para "Entonces, estarás"
	line "bien. ¡Aquí tienes"
	cont "mi Squirgadera!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "¡No hagas ningu-"
	line "na locura!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Cuando le hablé a"
	line "mi hermana del"

	para "árbol raro, me"
	line "dijo que era peli-"
	cont "groso."

	para "Si derroto a"
	line "Blanca, igual me"

	para "presta su"
	line "Squirgadera…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Vaya, ¿has derro-"
	line "tado a Blanca?"
	cont "¡Qué guay!"

	para "A lo mejor tú pue-"
	line "des con ese árbol"
	cont "raro."

	para "Solo necesitas una"
	line "Squirgadera como"
	cont "la de mi hermana."
	done

WoukdYouLikeMulchText:
	text "¿Quieres comprar"
	line "Abono?"

	para "¡Hace que las Ba-"
	line "yas crezcan más"
	cont "rápido!"
	done




NoRoomForMulchText:
	text "¡Oh no, tu Mochila"
	line "está llena!"
	done

DescribeMulchText:
	text "Nuestro Abono es"
	line "una mezcla de "

	para "tierra de calidad"
	line "y de… em… ya"
	cont "sabes de los"
	cont "#mon."

	para "¡Está lleno de"
	line "nutrientes!"
	done

FlowerShopGentlemanText:
	text "He estado traba-"
	line "jando hasta tarde"
	cont "últimamente,"

	para "así que voy a"
	line "comprar flores"
	cont "para mi mujer."
	done
