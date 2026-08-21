ShamoutiPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, SHAMOUTI_ISLAND, 1
	warp_event  6,  7, SHAMOUTI_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalLoreleiScript

	def_object_events
	object_event  6,  3, SPRITE_IVY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ShamoutiPokeCenter1FIvyScript, EVENT_SHAMOUTI_POKE_CENTER_IVY
	pc_nurse_event  5, 1

	object_const_def
	const SHAMOUTIPOKECENTER1F_IVY

PokemonJournalLoreleiScript:
	setflag ENGINE_READ_LORELEI_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Ex-Elite Lorelei!"

	para "Lorelei is said to"
	line "have a complete"

	para "collection of"
	line "#mon dolls."
	done

ShamoutiPokeCenter1FIvyScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_IVY_INTRO
	iftruefwd .HeardIntro
	writetext .GreetingText
	waitbutton
	setevent EVENT_LISTENED_TO_IVY_INTRO
.HeardIntro
	writetext .OfferText
	loadmenu .KantoStarterMenuData
	verticalmenu
	closewindow
	ifequalfwd $1, .Bulbasaur
	ifequalfwd $2, .Charmander
	ifequalfwd $3, .Squirtle
	jumpthisopenedtext

	text "Ivy: Hm, I thought"
	line "you'd be happy to"

	para "raise a rare"
	line "#mon…"
	done

.Bulbasaur:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke BULBASAUR, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname BULBASAUR, STRING_BUFFER_3
	setevent EVENT_GOT_BULBASAUR_FROM_IVY
	sjumpfwd .Finish

.Charmander:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke CHARMANDER, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname CHARMANDER, STRING_BUFFER_3
	setevent EVENT_GOT_CHARMANDER_FROM_IVY
	sjumpfwd .Finish

.Squirtle:
	writetext .ChoseKantoStarterText
	promptbutton
	waitsfx
	givepoke SQUIRTLE, PLAIN_FORM, 10, SITRUS_BERRY
	iffalse_jumpopenedtext .NoRoomText
	getmonname SQUIRTLE, STRING_BUFFER_3
	setevent EVENT_GOT_SQUIRTLE_FROM_IVY
.Finish:
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement SHAMOUTIPOKECENTER1F_IVY, step_left
.noleftstep
	applymovement SHAMOUTIPOKECENTER1F_IVY, .DownMovement
	playsound SFX_EXIT_BUILDING
	disappear SHAMOUTIPOKECENTER1F_IVY
	setevent EVENT_GOT_A_POKEMON_FROM_IVY
	checkevent EVENT_BEAT_YELLOW
	iffalsefwd .skip
	clearevent EVENT_INDIGO_PLATEAU_POKECENTER_YELLOW
.skip
	waitsfx
	end

.NoRoomText:
	text "Vaya, parece que"
	line "no tienes sitio ni"
	cont "en tu equipo ni en"
	cont "tu Caja…"
	done

.GreetingText:
	text "Ivy: ¡<PLAYER>!"
	line "¡El flamante"
	cont "nuevo Campeón!"

	para "¡Encantada de"
	line "conocerte!"

	para "Soy Ivy, una"
	line "profesora #mon."

	para "Estudio la"
	line "variación local de"
	cont "fenotipos #mon."

	para "¿Sabías que hay"
	line "#mon salvajes"
	cont "con ataques únicos"
	cont "de su hábitat?"

	para "¡E incluso dos"
	line "#mon de la"
	cont "misma especie"
	cont "pueden tener otro"
	cont "color…!"

	para "¡Perdón! A veces"
	line "me dejo llevar por"
	cont "la emoción."
	done

.OfferText:
	text "Ivy: ¿Conque vas a"
	line "afrontar un nuevo"
	cont "reto de Gimnasios"
	cont "en otra región…?"

	para "¡Ajá! ¿No querrías"
	line "tener un nuevo"
	cont "#mon?"

	para "¿Cuál de ellos te"
	line "gustaría tener?"
	done

.ChoseKantoStarterText:
	text "Ivy: ¡A mí también"
	line "me parece un gran"
	cont "#mon!"
	done

.GoodbyeText:
	text "Ivy: El Prof. Elm"
	line "confió en ti"
	cont "dándote un #mon"

	para "y el Prof. Oak te"
	line "dio una #dex,"

	para "así que sé que"
	line "cuidarás muy bien"
	cont "de este "
	text_ram wStringBuffer3
	text "."

	para "En fin, tomaré el"
	line "ferry de vuelta a"
	cont "mi laboratorio en"
	cont "Isla Valencia."

	para "¡Saluda al Prof."
	line "Oak de mi parte!"
	done

.DownMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

.KantoStarterMenuData:
	db MENU_BACKUP_TILES
	menu_coords 0, 2, 13, 11
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "Bulbasaur@"
	db "Charmander@"
	db "Squirtle@"
	db "Cancelar@"
