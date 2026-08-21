GoldenrodHarbor_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 31, 16, GOLDENROD_HARBOR_GATE, 1
	warp_event 31, 17, GOLDENROD_HARBOR_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 29, 19, BGEVENT_JUMPTEXT, GoldenrodHarborSignText
	bg_event 20, 19, BGEVENT_JUMPTEXT, GoldenrodHarborAdvancedTipsSignText
	bg_event 28, 15, BGEVENT_JUMPTEXT, GoldenrodHarborCrateSignText
	bg_event 22, 21, BGEVENT_ITEM + REVIVE, EVENT_GOLDENROD_HARBOR_HIDDEN_REVIVE

	def_object_events
	object_event 17,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborFisherScript, -1
	object_event 13,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherPaton, -1
	itemball_event 13,  3, STAR_PIECE, 1, EVENT_GOLDENROD_HARBOR_STAR_PIECE
	object_event 27, 15, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_ADVENTURER, MART_GOLDENROD_HARBOR, -1
	object_event 22, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborPokefanmScript, -1
	object_event 21, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MAGIKARP, -1, PAL_MON_ORANGE, OBJECTTYPE_SCRIPT, PLAIN_FORM, GoldenrodHarborMagikarpScript, -1
	object_event 16, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHarborYoungsterScript, -1
	object_event 16, 20, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, trade, NPC_TRADE_JACQUES, -1
	object_event 40, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event  6, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 5, TrainerSwimmerfKatie, -1
	object_event 23, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermJames, -1
	object_event 23, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHarborLass2Text, -1
	object_event  6, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT_SILENT, 0, GoldenrodHarborSailboatScript, -1
	object_event  6, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, 0, OBJECTTYPE_SCRIPT_SILENT, 0, GoldenrodHarborSailboatScript, -1

GoldenrodHarborFisherScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_HYPER_VOICE_INTRO
	iftruefwd GoldenrodHarborTutorHyperVoiceScript
	writetext GoldenrodHarborFisherText
	waitbutton
	setevent EVENT_LISTENED_TO_HYPER_VOICE_INTRO
GoldenrodHarborTutorHyperVoiceScript:
	writetext Text_GoldenrodHarborTutorHyperVoice
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_GoldenrodHarborTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval HYPER_VOICE
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "Vale."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "¡No tienes Hoja"
	line "Plata!"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "¡Ahora tu #mon"
	line "sabe usar"
	cont "Vozarrón!"
	done

GenericTrainerFisherPaton:
	generictrainer FISHER, PATON, EVENT_BEAT_FISHER_PATON, FisherPatonSeenText, FisherPatonBeatenText

	text "¿Estás trabajando"
	line "en una #dex?"
	cont "¡Mola mucho!"
	done

TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "¿Por qué el mar es"
	line "azul?"

	para "Dicen que refleja"
	line "el cielo… Pero"
	cont "¿por qué el cielo"
	cont "es azul?"
	done

GenericTrainerSwimmermJames:
	generictrainer SWIMMERM, JAMES, EVENT_BEAT_SWIMMERM_JAMES, SwimmermJamesSeenText, SwimmermJamesBeatenText

	text "¿No puede un"
	line "Nadador usar un"
	cont "bote a veces?"
	done


GoldenrodHarborMagikarpScript:
	jumpthistext

	text "¡Es un #mon"
	line "Pez! ¿Eh?"

	para "Sólo es un"
	line "muñeco…"
	done

GoldenrodHarborPokefanmScript:
	faceplayer
	opentext
	writetext GoldenrodHarborDollVendorText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MagikarpDoll
	ifequalfwd $2, .MarillDoll
	ifequalfwd $3, .OctilleryDoll
	endtext

.MagikarpDoll:
	checkmoney YOUR_MONEY, 1400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 1400
	setevent EVENT_DECO_MAGIKARP_DOLL
	writetext GoldenrodHarborMagikarpDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMagikarpDollSentText
	waitbutton
	sjump .Start

.MarillDoll:
	checkmoney YOUR_MONEY, 5600
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_MARILL_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 5600
	setevent EVENT_DECO_MARILL_DOLL
	writetext GoldenrodHarborMarillDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMarillDollSentText
	waitbutton
	sjump .Start

.OctilleryDoll:
	checkmoney YOUR_MONEY, 11200
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_OCTILLERY_DOLL
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 11200
	setevent EVENT_DECO_OCTILLERY_DOLL
	writetext GoldenrodHarborOctilleryDollText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborOctilleryDollSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodHarborNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext GoldenrodHarborAlreadyBoughtText
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
	db "Magikarp    1400¥@"
	db "Marill      5600¥@"
	db "Octillery  11200¥@"
	db "Salir@"

GoldenrodHarborYoungsterScript:
	faceplayer
	opentext
	writetext GoldenrodHarborPlantVendorText
	special PlaceMoneyTopRight
.Start:
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .MagnaPlant
	ifequalfwd $2, .TropicPlant
	ifequalfwd $3, .JumboPlant
	endtext

.MagnaPlant:
	checkmoney YOUR_MONEY, 6400
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_1
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 6400
	setevent EVENT_DECO_PLANT_1
	writetext GoldenrodHarborMagnaPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborMagnaPlantSentText
	waitbutton
	sjump .Start

.TropicPlant:
	checkmoney YOUR_MONEY, 9600
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_2
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 9600
	setevent EVENT_DECO_PLANT_2
	writetext GoldenrodHarborTropicPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborTropicPlantSentText
	waitbutton
	sjump .Start

.JumboPlant:
	checkmoney YOUR_MONEY, 12800
	ifequalfwd HAVE_LESS, .NotEnoughMoney
	checkevent EVENT_DECO_PLANT_3
	iftruefwd .AlreadyBought
	takemoney YOUR_MONEY, 12800
	setevent EVENT_DECO_PLANT_3
	writetext GoldenrodHarborJumboPlantText
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	waitbutton
	writetext GoldenrodHarborJumboPlantSentText
	waitbutton
	sjump .Start

.NotEnoughMoney:
	writetext GoldenrodHarborNoMoneyText
	waitbutton
	sjump .Start

.AlreadyBought:
	writetext GoldenrodHarborAlreadyBoughtText
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
	db "P. Magna    6400¥@"
	db "P. Trópico  9600¥@"
	db "P. Gigante 12800¥@"
	db "Salir@"

GoldenrodHarborSailboatScript:
	readvar VAR_FACING
	ifnotequal DOWN, .show_text
	end
.show_text
	playsound SFX_READ_TEXT_2
	waitsfx
	jumpthistext

	text "Es un velero"
	line "llamado Seaking."
	done

GoldenrodHarborFisherText:
	text "Para pescar hay"
	line "que estar callado"
	cont "para no asustar a"
	cont "los #mon…"

	para "¡Pero con el mar"
	line "toca GRITAR!"
	done

Text_GoldenrodHarborTutorHyperVoice:
	text "Puedo enseñar a tu"
	line "#mon a usar"
	cont "Vozarrón por una"
	cont "Hoja Plata."
	done


Text_GoldenrodHarborTutorQuestion:
	text "¿Quieres que le"
	line "enseñe Vozarrón a"
	cont "tu #mon?"
	done



FisherPatonSeenText:
	text "¡El pez que pesqué"
	line "estaba pegado a"
	cont "otro #mon!"
	done

FisherPatonBeatenText:
	text "¿A que los #mon"
	line "son interesantes?"
	done

SwimmerfKatieSeenText:
	text "¡Nadar en el"
	line "profundo mar azul"
	cont "es maravilloso!"
	done

SwimmerfKatieBeatenText:
	text "Perdí…"
	line "Ahora me siento"
	cont "azul…"
	done

SwimmermJamesSeenText:
	text "¡Sé nadar, pero"
	line "también remar!"
	done

SwimmermJamesBeatenText:
	text "Quizás no sepa"
	line "luchar…"
	done

GoldenrodHarborDollVendorText:
	text "¡Hola! Vendo"
	line "adorables muñecos"
	cont "acuáticos."
	done

GoldenrodHarborMagikarpDollText:
	text "<PLAYER> compró"
	line "Muñeco Magikarp."
	done

GoldenrodHarborMagikarpDollSentText:
	text "Muñeco Magikarp"
	line "fue enviado a casa"
	done

GoldenrodHarborMarillDollText:
	text "<PLAYER> compró"
	line "el Muñeco Marill."
	done

GoldenrodHarborMarillDollSentText:
	text "Muñeco Marill"
	line "fue enviado a casa"
	done

GoldenrodHarborOctilleryDollText:
	text "<PLAYER> compró"
	line "Muñeco Octillery"
	done

GoldenrodHarborOctilleryDollSentText:
	text "Muñeco Octillery"
	line "fue enviado a casa"
	done

GoldenrodHarborNoMoneyText:
	text "¡No te lo puedes"
	line "permitir!"
	done

GoldenrodHarborAlreadyBoughtText:
	text "¡Ya tienes"
	line "eso!"
	done

GoldenrodHarborPlantVendorText:
	text "¡Hola! Tengo una"
	line "gran variedad de"
	cont "plantas exóticas"
	cont "para tu casa."
	done

GoldenrodHarborMagnaPlantText:
	text "<PLAYER> compró"
	line "la Planta Magna."
	done

GoldenrodHarborMagnaPlantSentText:
	text "La Planta Magna"
	line "fue enviada a casa"
	done

GoldenrodHarborTropicPlantText:
	text "<PLAYER> compró"
	line "la Planta Trópico."
	done

GoldenrodHarborTropicPlantSentText:
	text "La Planta Trópico"
	line "fue enviada a casa"
	done

GoldenrodHarborJumboPlantText:
	text "<PLAYER> compró"
	line "la Planta Gigante."
	done

GoldenrodHarborJumboPlantSentText:
	text "La Planta Gigante"
	line "fue enviada a casa"
	done

GoldenrodHarborLass2Text:
	text "Toda esta agua,"
	line "es totalmente…"

	para "glu-glu,"
	line "plis-plas."

	para "¿No crees?"
	done

GoldenrodHarborSignText:
	text "Puerto Trigal"
	done

GoldenrodHarborAdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "¡Las máquinas"
	line "expendedoras a"
	cont "veces dan dos"
	cont "bebidas por una!"
	done

GoldenrodHarborCrateSignText:
	text "¡Una caja llena"
	line "de objetos raros!"
	done
