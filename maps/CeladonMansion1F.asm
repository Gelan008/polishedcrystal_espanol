CeladonMansion1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  9, CELADON_CITY, 2
	warp_event  7,  9, CELADON_CITY, 2
	warp_event  3,  0, CELADON_CITY, 3
	warp_event  0,  0, CELADON_MANSION_2F, 1
	warp_event  7,  0, CELADON_MANSION_2F, 4

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  0,  3, BGEVENT_JUMPSTD, picturebookshelf
	bg_event  2,  3, BGEVENT_JUMPSTD, picturebookshelf

	def_object_events
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManagerScript, -1
	pokemon_event  2,  6, MEOWTH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, CeladonMansion1FMeowthText, -1
	pokemon_event  3,  4, CLEFAIRY, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, CeladonMansion1FClefairyText, -1
	pokemon_event  4,  4, NIDORAN_F, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_TEAL, CeladonMansion1FNidoranFText, -1

CeladonMansionManagersSuiteSign:
	jumpthistext

	text "Mansión Azulona"
	line "Despacho Mánager"
	done

CeladonMansionManagerScript:
	checkitem MINT_LEAF
	iffalse_jumptextfaceplayer .NoMintLeafText
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .AcceptedText
	promptbutton
	special Special_MintTeaPickMon
	iffalse_jumpopenedtext .RefusedText
	ifequalfwd $1, .Egg
	writetext .LikedFlavorText
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	iffalse_jumpopenedtext .RefusedText
	writemem wMintTeaLikedFlavor
	writetext .DislikedFlavorText
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	iffalse_jumpopenedtext .RefusedText
	writemem wMintTeaDislikedFlavor
	special Special_MintTeaChangeNature
	iffalsefwd .Neutral
	writetext .TeaIsReadyText
	sjumpfwd .Done
.Neutral
	writetext .NeutralTeaText
.Done
	waitbutton
	closetext
	takeitem MINT_LEAF
	readmem wCurPartySpecies
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	opentext
	writetext .MonLooksDifferentText
	special PlayCurMonCry
	waitbutton
	jumpthisopenedtext

	text "No hay nada como"
	line "el té de menta"
	cont "bien caliente."

	para "¡Puede cambiar la"
	line "naturaleza de un"
	cont "#mon!"
	done

.Egg:
	jumpthisopenedtext

	text "¿Esperas que haga"
	line "un huevo de té"
	cont "con eso?"
	done

.NoMintLeafText:
	text "Oh, hola,"
	line "cariño."

	para "Estoy tomando el"
	line "té con mis"
	cont "queridos #mon."

	para "Si tuvieras una"
	line "Hoja Menta te"
	cont "invitaría."

	para "A los #mon les"
	line "encanta la menta"
	cont "en su té."

	para "¡Tiene un efecto"
	line "duradero en su"
	cont "naturaleza!"
	done

.QuestionText:
	text "Oh, hola,"
	line "cariño."

	para "Veo que tienes una"
	line "Hoja Menta."

	para "¿Quieres que haga"
	line "una infusión de té"
	cont "para tus #mon?"
	done

.RefusedText:
	text "¡No te vayas a"
	line "llenar con"
	cont "Limonada!"
	done

.AcceptedText:
	text "¿Cuál de tus"
	line "#mon quiere té?"
	done

.LikedFlavorText:
	text "Ahora, ¿qué sabor"
	line "le gusta a"
	cont ""
	text_ram wStringBuffer1
	text "?"
	done

.DislikedFlavorText:
	text "¿Y qué sabor le"
	line "disgusta?"
	done

.NeutralTeaText:
	text "¡Es una opción"
	line "inusual, pero"
	cont "puedo prepararla!"

	para "¡Una taza para ti"
	line "y una taza para"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.TeaIsReadyText:
	text "¡Aquí tienes tu"
	line "té recién hecho!"

	para "¡Una taza para ti"
	line "y una taza para"
	cont ""
	text_ram wStringBuffer1
	text "!"
	done

.MonLooksDifferentText:
	text "¡"
	text_ram wStringBuffer1
	text " se"
	line "ve un poco"
	cont "diferente!"
	done

.MenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 9, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 5 ; items
	; this order is meaningful to calculate the new nature
	db "Picante@" ; atk
	db "Acido@" ; def
	db "Dulce@" ; spe
	db "Seco@" ; sat
	db "Amargo@" ; sdf

CeladonMansion1FMeowthText:
	text "Meowth: ¡Miau!"
	done

CeladonMansion1FClefairyText:
	text "Clefairy: ¡Clef"
	line "clef!"
	done

CeladonMansion1FNidoranFText:
	text "Nidoran: ¡Kya"
	line "kyaoo!"
	done
