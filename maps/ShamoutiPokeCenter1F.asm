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

	text "Revista #mon"

	para "Edición especial:"
	line "¡Lorelei, excuarto"
	cont "miembro del Alto"
	cont "Mando!"

	para "Se dice que Lore-"
	line "lei tiene una co-"

	para "lección completa"
	line "de muñecos #mon"
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

	text "Ivy: Mmm, pensaba"
	line "que te alegraría"

	para "criar a un #mon"
	line "tan poco común…"
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
	text "Ivy: ¡Oh! ¡Eres"
	line "<PLAYER>, ¡el nuevo"
	cont "Campeón!"

	para "¡Encantada de"
	line "conocerte!"

	para "Soy Ivy, una pro-"
	line "fesora #mon."

	para "Estudio la varia-"
	line "ción local en los"
	cont "fenotipos #mon."

	para "¿Sabías que algu-"
	line "nos #mon salvajes"

	para "conocen ataques"
	line "únicos de su hábi-"
	cont "tat?"

	para "¡E incluso dos"
	line "#mon de la misma"

	para "especie en una zo-"
	line "na pueden tener"
	cont "distinto color…!"

	para "¡Ah, perdón! A ve-"
	line "ces me dejo llevar"
	cont "por la emoción."
	done

.OfferText:
	text "Ivy: ¿Conque vas a"
	line "afrontar un nuevo"

	para "desafío de Gimna-"
	line "sios en otra re-"
	cont "gión…?"

	para "¡Ajá! ¿Por qué no"
	line "te doy a ti tam-"
	cont "bién un nuevo"
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
	line "confió en ti dán-"
	cont "dote un #mon, y"

	para "el Prof. Oak te"
	line "dio una #dex, así"

	para "que sé que cuida-"
	line "rás muy bien de"
	cont "este "
	text_ram wStringBuffer3
	text "."

	para "En fin, tengo que"
	line "coger un ferry de"

	para "vuelta a mi labo-"
	line "ratorio en Isla"
	cont "Valencia."

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
	db "Cancel@"
