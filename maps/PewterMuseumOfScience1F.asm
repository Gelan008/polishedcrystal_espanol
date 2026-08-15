PewterMuseumOfScience1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  7, PEWTER_CITY, 6
	warp_event 11,  7, PEWTER_CITY, 8
	warp_event 16,  7, PEWTER_CITY, 7
	warp_event 17,  7, PEWTER_CITY, 7
	warp_event  7,  7, PEWTER_MUSEUM_OF_SCIENCE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, KabutopsFossilSignpostScript
	bg_event  6,  3, BGEVENT_READ, OmastarFossilSignpostScript
	bg_event  3,  6, BGEVENT_READ, AerodactylFossilSignpostScript
	bg_event 12,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 13,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 14,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 15,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 17,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText
	bg_event 18,  1, BGEVENT_JUMPTEXT, Museum1FBookshelfSignpostText

	def_object_events
	object_event 18,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, Museum1FFossilScientistScript, -1
	object_event 12,  4, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Museum1FReceptionistScript, -1
	object_event 16,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GRAY, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FScientistText, -1
	object_event  1,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FGrampsText, -1
	object_event  4,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Museum1FYoungsterText, -1

	object_const_def
	const PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2

Museum1FFossilScientistScript:
	faceplayer
	opentext
	writetext Museum1FFossilScientistText
	waitbutton
	checkitem HELIX_FOSSIL
	iftruefwd .own_helix
	checkitem DOME_FOSSIL
	iftruefwd .own_dome
	checkitem OLD_AMBER
	iftruefwd .ask_old_amber
	jumpthisopenedtext

	text "¡Oye! No tienes"
	line "ningún fósil."
	done

.own_helix
	checkitem DOME_FOSSIL
	iftruefwd .own_helix_and_dome
	checkitem OLD_AMBER
	iftruefwd .ask_helix_amber
	writetext AskHelixFossilText
	yesorno
	iftrue ResurrectHelixFossil
	sjumpfwd .maybe_later

.own_dome
	checkitem OLD_AMBER
	iftruefwd .ask_dome_amber
	writetext AskDomeFossilText
	yesorno
	iftrue ResurrectDomeFossil
	sjumpfwd .maybe_later

.own_helix_and_dome
	checkitem OLD_AMBER
	iftruefwd .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectDomeFossil
	sjumpfwd .maybe_later

.ask_old_amber
	writetext AskOldAmberText
	yesorno
	iftrue ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_dome_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectDomeFossil
	ifequalfwd $2, ResurrectOldAmber
	sjumpfwd .maybe_later

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, ResurrectHelixFossil
	ifequalfwd $2, ResurrectDomeFossil
	ifequalfwd $3, ResurrectOldAmber
.maybe_later:
	jumpthisopenedtext

	text "Háblame si cam-"
	line "bias de opinión."
	done

HelixDomeMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Fósil Hélix@"
	db "Fósil Domo@"
	db "Cancelar@"

HelixAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Fósil Hélix@"
	db "Ambar Viejo@"
	db "Cancelar@"

DomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 14, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Fósil Domo@"
	db "Ambar Viejo@"
	db "Cancelar@"

HelixDomeAmberMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 15, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Fósil Hélix@"
	db "Fósil Domo@"
	db "Ambar Viejo@"
	db "Cancelar@"

ResurrectHelixFossil:
	takeitem HELIX_FOSSIL
	scall ResurrectAFossilScript
	givepoke OMANYTE, 20
	sjumpfwd FinishResurrect

ResurrectDomeFossil:
	takeitem DOME_FOSSIL
	scall ResurrectAFossilScript
	givepoke KABUTO, 20
	sjumpfwd FinishResurrect

ResurrectOldAmber:
	takeitem OLD_AMBER
	scall ResurrectAFossilScript
	givepoke AERODACTYL, 20
FinishResurrect:
	iffalse_jumpopenedtext NoRoomForFossilPokemonText
	jumpthisopenedtext

	text "¡Cuídalo muy"
	line "bien!"
	done

ResurrectAFossilScript:
	writetext ResurrectingPokemonText
	waitbutton
	closetext
	turnobject PEWTERMUSEUMOFSCIENCE1F_SCIENTIST2, RIGHT
	pause 15
	playsound SFX_BOOT_PC
	waitsfx
	pause 30
	playsound SFX_4_NOTE_DITTY
	waitsfx
	pause 5
	waitsfx
	pause 30
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	faceplayer
	opentext
	end

Museum1FReceptionistScript:
	readvar VAR_FACING
	ifequalfwd DOWN, .Sneak
	ifequalfwd LEFT, .Sneak
	jumpthistextfaceplayer

	text "¡Te damos la bien-"
	line "venida!"

	para "¡Gracias al apoyo"
	line "de Silph S.A.,"

	para "la entrada es to-"
	line "talmente gratis!"

	para "Pasa, por favor."
	done

.Sneak:
	jumpthistextfaceplayer

	text "¡No puedes colarte"
	line "por detrás!"
	done

KabutopsFossilSignpostScript:
	reanchormap
	trainerpic KABUTOPS_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Fósil Kabutops"
	line "(Domo)"

	para "Un #mon primi-"
	line "tivo y raro."
	done

OmastarFossilSignpostScript:
	reanchormap
	trainerpic OMASTAR_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Fósil Omastar"
	line "(Hélix)"

	para "Un #mon primi-"
	line "tivo y raro."
	done

AerodactylFossilSignpostScript:
	reanchormap
	trainerpic AERODACTYL_FOSSIL
	waitbutton
	closepokepic
	jumpthistext

	text "Fósil Aerodactyl"

	para "Un #mon primi-"
	line "tivo y raro."
	done

Museum1FScientistText:
	text "Estamos orgullosos"
	line "de estos 3 fósiles"

	para "de #mon prehis-"
	line "tóricos y raros."

	para "¡Yo ayudé a mon-"
	line "tarlos!"
	done

Museum1FFossilScientistText:
	text "¿Sabías que puedes"
	line "extraer #mon"
	cont "de los fósiles?"

	para "Si alguna vez lo"
	line "necesitas, ¡déja-"
	cont "melo a mí!"
	done

Museum1FGrampsText:
	text "¡Es un fósil"
	line "magnífico!"
	done

Museum1FYoungsterText:
	text "¡Hay dos lugares"
	line "que me encantan!"

	para "Uno son las Ruinas"
	line "Alfa de Johto."

	para "¡El otro es el Mu-"
	line "seo de Plateada!"

	para "En ambos se respi-"
	line "ra mucha historia."
	done

Museum1FBookshelfSignpostText:
	text "¡Libros gruesos y"
	line "muy leídos!"

	para "Manual arqueológi-"
	line "co, #mon perdi-"
	cont "dos, Ancestros…"

	para "Tratado sobre el"
	line "suelo de Kanto…"
	done

AskHelixFossilText:
	text "¿Quieres revivir"
	line "el Fósil Hélix?"
	done

AskDomeFossilText:
	text "¿Quieres revivir"
	line "el Fósil Domo?"
	done

AskOldAmberText:
	text "¿Quieres revivir"
	line "el Ambar Viejo?"
	done

ResurrectingPokemonText:
	text "¡Muy bien! ¡Revi-"
	line "viré a ese #mon!"
	done

NoRoomForFossilPokemonText:
	text "¡Oye! No puedes"
	line "llevar más #mon"

	para "¡y tu Caja también"
	line "está llena!"
	done
