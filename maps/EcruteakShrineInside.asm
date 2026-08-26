EcruteakShrineInside_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  9, ECRUTEAK_SHRINE_OUTSIDE, 1
	warp_event  6,  9, ECRUTEAK_SHRINE_OUTSIDE, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_JUMPTEXT, EcruteakShrineInsideAltarText
	bg_event  6,  1, BGEVENT_JUMPTEXT, EcruteakShrineInsideAltarText
	bg_event  4,  0, BGEVENT_JUMPTEXT, EcruteakShrineInsideSignText
	bg_event  7,  0, BGEVENT_JUMPTEXT, EcruteakShrineInsideSignText

	def_object_events
	object_event  4,  2, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakShrineInsideReiScript, -1
	object_event  3,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideGrampsText, -1
	object_event 10,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideSageText, -1
	object_event  1,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakShrineInsideGrannyText, -1
	pokemon_event  9,  6, FURRET, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BROWN, EcruteakShrineInsideFurretText, -1

	object_const_def
	const ECRUTEAKSHRINEINSIDE_REI

EcruteakShrineInsideReiScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_SHRINE_VISIT
	iftruefwd .ReiDone
	writetext EcruteakShrineInsideReiGreetingText
	loadmenu .ReiMenuDataHeader
	verticalmenu
	closewindow
	ifequalfwd $1, .ReiBless
	ifequalfwd $2, .ReiBattle
	sjumpfwd .ReiCancel

.ReiBless
	writetext EcruteakShrineInsideReiBlessText
	promptbutton
	special Special_ReiBlessing
	ifequalfwd $0, .ReiCancel
	ifequalfwd $1, .EggBlessing
	setflag ENGINE_DAILY_SHRINE_VISIT
	writetext EcruteakShrineInsideReiBlessingText
	special PlayCurMonCry
	waitbutton
	writetext EcruteakShrineInsideHappinessText
	waitbutton
	sjumpfwd .ReiDone

.ReiBattle
	writetext EcruteakShrineInsideReiBattleText
	waitbutton
	closetext
	setflag ENGINE_DAILY_SHRINE_VISIT
	winlosstext EcruteakShrineInsideReiBeatenText, 0
	setlasttalked ECRUTEAKSHRINEINSIDE_REI
	readvar VAR_BADGES
	ifequalfwd 16, .Battle3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .Battle2
	loadtrainer REI, 1
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle2:
	loadtrainer REI, 2
	startbattle
	reloadmapafterbattle
	sjumpfwd .AfterRematch

.Battle3:
	loadtrainer REI, 3
	startbattle
	reloadmapafterbattle
	; fallthrough

.AfterRematch:
	opentext
	; fallthrough

.ReiDone
	jumpthisopenedtext

	text "Rei: Por favor,"
	line "vuelve mañana."
	done

.ReiCancel
	jumpthisopenedtext

	text "Rei: Vuelve si"
	line "cambias de idea."
	done

.EggBlessing
	jumpthisopenedtext

	text "Rei: No puedo"
	line "bendecir un Huevo."
	done

.ReiMenuDataHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 11, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "Bendecir@"
	db "Luchar@"
	db "Salir@"

EcruteakShrineInsideReiGreetingText:
	text "Rei: ¡Hola! Te doy"
	line "la bienvenida a"
	cont "este santuario."

	para "¿Vienes a que le"
	line "dé una bendición"
	cont "a tus #mon?"

	para "¿O prefieres un"
	line "combate?"
	done

EcruteakShrineInsideReiBlessText:
	text "Rei: Vale, ¿qué"
	line "#mon debería"
	cont "bendecir?"
	done

EcruteakShrineInsideReiBlessingText:
	text "Rei: Que estés"
	line "tranquilo y"
	cont "encuentres la paz."
	done

EcruteakShrineInsideHappinessText:
	text_ram wStringBuffer3
	text " parece"
	line "contento."
	done

EcruteakShrineInsideReiBattleText:
	text "Rei: Muy bien."
	line "¡Malos espíritus,"
	cont "desapareced!"
	done

EcruteakShrineInsideReiBeatenText:
	text "¡Admito mi"
	line "derrota!"
	done

EcruteakShrineInsideGrampsText:
	text "La sacerdotisa"
	line "del santuario es"
	cont "mi nieta."
	done

EcruteakShrineInsideGrannyText:
	text "Menos mal que no"
	line "pusieron parada"
	cont "del Magnetotrén."

	para "Arruinaría nuestro"
	line "paisaje clásico."
	done

EcruteakShrineInsideSageText:
	text "Casi todos aquí"
	line "entrenamos a"
	cont "Hoothoot y Sentret"
	cont "contra fantasmas."

	para "Rei es única,"
	line "usa tipo Fuego y"
	cont "tipo Psíquico."
	done

EcruteakShrineInsideFurretText:
	text "Furret: ¡Dook-dook!"
	done

EcruteakShrineInsideAltarText:
	text "Es un altar con"
	line "un espejo sagrado"
	cont "y flores."
	done

EcruteakShrineInsideSignText:
	text "Muestra honor y"
	line "respeto durante"
	cont "tu visita."
	done
