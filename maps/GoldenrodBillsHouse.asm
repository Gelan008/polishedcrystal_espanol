GoldenrodBillsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsMom, -1
	object_event  5,  4, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSister, -1

BillsGrandpa:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue_jumptextfaceplayer BillsGrandpaComeAgainText
	checkevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	iftrue_jumptextfaceplayer BillsGrandpaShownAllThePokemonText
	faceplayer
	opentext
	checkevent EVENT_MET_BILLS_GRANDPA
	iftruefwd .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_TOGEPI_TO_BILLS_GRANDPA
	iftrue .ShowedTogepi
	checkevent EVENT_SHOWED_MURKROW_TO_BILLS_GRANDPA
	iftrue .ShowedMurkrow
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_JIGGLYPUFF_TO_BILLS_GRANDPA
	iftrue .ShowedJigglypuff
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlithe
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_BELLSPROUT_TO_BILLS_GRANDPA
	iftrue .ShowedBellsprout
	checkevent EVENT_SHOWED_SNUBBULL_TO_BILLS_GRANDPA
	iftrue .ShowedSnubbull
	writetext BillsGrandpaSnubbullText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal SNUBBULL, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_SNUBBULL_TO_BILLS_GRANDPA
	sjumpfwd .ShowedSnubbull

.GotEverstone:
	writetext BillsGrandpaBellsproutText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal BELLSPROUT, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_BELLSPROUT_TO_BILLS_GRANDPA
	sjumpfwd .ShowedBellsprout

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedStaryu

.GotWaterStone:
	writetext BillsGrandpaGrowlitheText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_TO_BILLS_GRANDPA
	sjumpfwd .ShowedGrowlithe

.GotFireStone:
	writetext BillsGrandpaPichuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjumpfwd .ShowedPichu

.GotThunderstone:
	writetext BillsGrandpaJigglypuffText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal JIGGLYPUFF, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_JIGGLYPUFF_TO_BILLS_GRANDPA
	sjumpfwd .ShowedJigglypuff

.GotMoonStone:
	writetext BillsGrandpaOddishText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjumpfwd .ShowedOddish

.GotSunStone:
	writetext BillsGrandpaMurkrowText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal MURKROW, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_MURKROW_TO_BILLS_GRANDPA
	sjumpfwd .ShowedMurkrow

.GotDuskStone:
	writetext BillsGrandpaTogepiText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	scall .ExcitedToSee
	special Special_BillsGrandfather
	iffalse_jumpopenedtext BillsGrandpaYouDontHaveItTextText
	ifnotequal TOGEPI, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_TOGEPI_TO_BILLS_GRANDPA
	sjumpfwd .ShowedTogepi

.ShowedSnubbull:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse_endtext
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedBellsprout:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse_endtext
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse_endtext
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedGrowlithe:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse_endtext
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedPichu:
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse_endtext
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedJigglypuff:
	checkevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	iftrue .GotMoonStone
	scall .ReceiveItem
	verbosegiveitem MOON_STONE
	iffalse_endtext
	setevent EVENT_GOT_MOON_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedOddish:
	checkevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	iftrue .GotSunStone
	scall .ReceiveItem
	verbosegiveitem SUN_STONE
	iffalse_endtext
	setevent EVENT_GOT_SUN_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedMurkrow:
	checkevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	iftrue .GotDuskStone
	scall .ReceiveItem
	verbosegiveitem DUSK_STONE
	iffalse_endtext
	setevent EVENT_GOT_DUSK_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	endtext

.ShowedTogepi:
	scall .ReceiveItem
	verbosegiveitem SHINY_STONE
	iffalse_endtext
	setevent EVENT_GOT_SHINY_STONE_FROM_BILLS_GRANDPA
	endtext

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.WrongPokemon:
	jumpthisopenedtext

	text "¿Mmm?"

	para "Ese no es el #-"
	line "mon del que me"
	cont "hablaron."
	done

BillsMom:
	checkevent EVENT_NEVER_MET_BILL
	iffalse_jumptextfaceplayer BillsMomText_AfterEcruteak
	jumpthistextfaceplayer

	text "Oh, ¿coleccionas"
	line "#mon? Mi hijo"
	cont "Bill es un ex-"
	cont "perto."

	para "Lo acaban de lla-"
	line "mar del Centro"

	para "#mon de Ciudad"
	line "Iris."

	para "Mi marido se fue"
	line "al Casino sin"

	para "que lo llamaran…"
	done

BillsSister:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftruefwd .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequalfwd $1, .NoRoom
	ifequalfwd $2, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	jumpthisopenedtext

	text "Mi hermano mayor,"
	line "Bill, creó el sis-"

	para "tema de almacena-"
	line "miento #mon"
	cont "del PC."
	done

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
.Refused:
	jumpthisopenedtext

	text "Mi hermano creó"
	line "el sistema de al-"
	cont "macenamiento"
	cont "#mon del PC."

	para "Iba a darte el"
	line "número de Bill…"
	done

BillsGrandpaIntroText:
	text "¿Eh? ¿Conoces a"
	line "Bill? Es mi nieto."

	para "Está en Kanto."
	line "Hace algo con PCs,"

	para "así que yo cuido"
	line "la casa."
	done

BillsGrandpaAskToSeeMonText:
	text "Si tienes a ese"
	line "#mon, ¿podría"
	cont "verlo, por favor?"
	done

BillsGrandpaExcitedToSeeText:
	text "¿Me lo enseñarás?"
	line "¡Qué amable eres!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "¿No lo tienes?"
	line "Qué pena…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, ¿así que ese"
	line "es "
	text_ram wStringBuffer3
	text "?"

	para "¡Es muy mono!"
	line "Eres muy amable."
	done

BillsGrandpaTokenOfAppreciationText:
	text "¡Gracias!"

	para "Esto es una mues-"
	line "tra de mi"
	cont "agradecimiento."
	done

BillsGrandpaComeAgainText:
	text "Vuelve a visitar-"
	line "me algún día."
	done

BillsGrandpaShownAllThePokemonText:
	text "Gracias por mos-"
	line "trarme tantos #-"
	cont "mon tan monos."

	para "Me he divertido"
	line "mucho. Me alegro"

	para "de haber vivido"
	line "una vida tan"
	cont "larga."
	done

BillsGrandpaSnubbullText:
	text "Mi nieto Bill me"
	line "habló de un #mon"

	para "canino rosa, bajo,"
	line "y con lunares"
	cont "azules."
	done

BillsGrandpaTogepiText:
	text "¿Conoces a un"
	line "#mon que tiene"

	para "un caparazón cu-"
	line "bierto de triángu-"
	cont "los rojos y"
	cont "azules?"

	para "Se supone que es"
	line "un símbolo de"
	cont "buena suerte."
	done

BillsGrandpaMurkrowText:
	text "¿Conoces a un pá-"
	line "jaro #mon que"

	para "tiene un pico"
	line "amarillo curvo y"
	cont "plumas negras?"

	para "Escuché que apa-"
	line "rece de noche."

	para "Me gustaría"
	line "mucho verlo."
	done

BillsGrandpaOddishText:
	text "Ah, mi nieto men-"
	line "cionó un #mon"

	para "redondo y azul al"
	line "que le crecen ho-"
	cont "jas en la cabeza."
	done

BillsGrandpaJigglypuffText:
	text "Bill me habló de"
	line "un #mon rosa"

	para "con una voz canta-"
	line "rina hipnótica."
	done

BillsGrandpaBellsproutText:
	text "Mi nieto Bill men-"
	line "cionó un #mon"

	para "verde que camina"
	line "sobre sus raíces."
	done

BillsGrandpaStaryuText:
	text "¿Conoces a un"
	line "#mon marino que"

	para "tiene una esfera"
	line "roja en su cuerpo?"

	para "Ya sabes, ¿el que"
	line "tiene forma de"
	cont "estrella?"

	para "Oí que aparece de"
	line "noche."

	para "Seguro que me gus-"
	line "taría verlo."
	done

BillsGrandpaGrowlitheText:
	text "Bill me habló de"
	line "un #mon que es"

	para "muy leal a su"
	line "entrenador."

	para "Se supone que sabe"
	line "Rugir muy bien."
	done

BillsGrandpaPichuText:
	text "¿Conoces a ese"
	line "#mon tan popu-"
	cont "lar?"

	para "El #mon que"
	line "tiene cuerpo ama-"
	cont "rillo y mejillas"
	cont "rojas."

	para "Me encantaría ver"
	line "qué aspecto tiene"

	para "antes de que"
	line "evolucione."
	done


BillsMomText_AfterEcruteak:
	text "Mi marido solía"
	line "ser conocido como"

	para "un #maníaco."
	line "Bill debe de haber"

	para "salido a su padre."

	para "Pero ahora mi ma-"
	line "rido no trabaja."

	para "Solo holgazanea"
	line "todo el día."
	done

BillsSisterUsefulNumberText:
	text "¿Eres entrenador?"

	para "Tengo un número de"
	line "teléfono útil para"
	cont "ti."
	done

RecordedBillsNumberText:
	text "<PLAYER> guardó el"
	line "número de Bill."
	done

BillsSisterPhoneFullText:
	text "No puedes guardar"
	line "más números."
	done
