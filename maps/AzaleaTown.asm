AzaleaTown_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_AZALEATOWN_NOOP
	scene_const SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_const SCENE_AZALEATOWN_CELEBI_EVENT

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback
	callback MAPCALLBACK_TILES, AzaleaTownRainScript

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_ENTRANCE, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleTrigger2
	coord_event  9,  6, SCENE_AZALEATOWN_CELEBI_EVENT, AzaleaTown_CelebiTrigger

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, AzaleaTownSignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, KurtsHouseSignText
	bg_event 11, 15, BGEVENT_JUMPTEXT, AzaleaGymSignText
	bg_event 29,  8, BGEVENT_JUMPTEXT, SlowpokeWellSignText
	bg_event 19, 13, BGEVENT_JUMPTEXT, CharcoalKilnSignText
	bg_event  3,  9, BGEVENT_JUMPTEXT, AzaleaTownIlexForestSignText
	bg_event 29, 14, BGEVENT_JUMPTEXT, AzaleaTownAdvancedTipsSignText
	bg_event 31,  6, BGEVENT_ITEM + FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

	def_object_events
	object_event 11, 10, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event  6,  5, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownYoungsterText, -1
	object_event 31,  9, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket1Text, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 10, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownRocket2Text, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  8, 17, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 30,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 14, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, PLAIN_FORM, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	pokemon_event 14, 12, WOOPER, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_SLOWPOKE_WELL_SLOWPOKES
	pokemon_event 14, 12, QUAGSIRE, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_BLUE, AzaleaTownWoosterText, EVENT_AZALEA_TOWN_SLOWPOKES
	fruittree_event  8,  2, FRUITTREE_AZALEA_TOWN, WHT_APRICORN, PAL_NPC_ENV_WHITE

	object_const_def
	const AZALEATOWN_RIVAL
	const AZALEATOWN_KURT

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRainScript:
	special Special_GetOvercastIndex
	ifequalfwd AZALEA_OVERCAST, .rain
	changemapblocks AzaleaTown_BlockData
	endcallback

.rain
	changemapblocks AzaleaTownRaining_BlockData
	endcallback

AzaleaTownRivalBattleTrigger1:
	moveobject AZALEATOWN_RIVAL, 11, 11
AzaleaTownRivalBattleTrigger2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, .ApproachMovement
	faceobject AZALEATOWN_RIVAL, PLAYER
	faceobject PLAYER, AZALEATOWN_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext .SeenText
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftruefwd .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftruefwd .Chikorita
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_6
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Totodile:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjumpfwd .AfterBattle

.Chikorita:
	winlosstext .WinText, .LossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	; fallthrough

.AfterBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext .AfterText
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_RIVAL, .ExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_RIVAL
	setmapscene ROUTE_34, SCENE_ROUTE34_LYRA_DAYCARE
	setscene SCENE_AZALEATOWN_NOOP
	waitsfx
	playmapmusic
	end

.SeenText:
	text "...Dime una cosa."

	para "¿Es verdad que el"
	line "Team Rocket ha"
	cont "vuelto?"

	para "¿Qué? ¿Los has"
	line "derrotado? ¡Ja!"
	cont "No me mientas."

	para "¿No bromeas?"
	line "Pues a ver lo"
	cont "bueno que eres."
	done

.WinText:
	text "¡Uf! ¡#mon"
	line "inútiles!"

	para "Oye, tú. Solo has"
	line "ganado porque"

	para "mis #mon eran"
	line "débiles."
	done

.LossText:
	text "¡Uf! Sabía que"
	line "estabas mintiendo."
	done

.AfterText:
	text "Odio a los débi-"
	line "les."

	para "#mon, entrena-"
	line "dores. Da igual"
	cont "quién o qué."

	para "Seré fuerte y aca-"
	line "baré con todos los"
	cont "débiles."

	para "Eso también va por"
	line "el Team Rocket."

	para "Van de duros"
	line "cuando van en"
	cont "grupo."

	para "Pero cuando están"
	line "solos, son débiles."

	para "Los odio a todos."

	para "Y tú, apártate de"
	line "mi camino. Un en-"

	para "clenque como tú"
	line "solo es una dis-"
	cont "tracción."
	done

.ApproachMovement:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.ExitMovement:
	step_left
	step_left
	step_left
	step_end

AzaleaTown_CelebiTrigger:
	applymovement PLAYER, .WalkOutOfKurtsHouseMovement
	opentext
	writethistext
		text "¡El Encinar está"
		line "muy agitado!"

		para "¿Qué está"
		line "pasando?"
		done
	promptbutton
	turnobject AZALEATOWN_KURT, RIGHT
	writethistext
		text "<PLAYER>, ¡te de-"
		line "vuelvo la GS Ball!"
		done
	promptbutton
	writetext AzaleaTownKurtText
	waitbutton
	verbosegivekeyitem GS_BALL
	turnobject AZALEATOWN_KURT, LEFT
	setflag ENGINE_HAVE_EXAMINED_GS_BALL
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOOP
	endtext

.WalkOutOfKurtsHouseMovement:
	step_left
	step_left
	step_up
	turn_head_left
	step_end

AzaleaTownSignText:
	text "Pueblo Azalea"
	line "Donde humanos y"

	para "#mon viven en"
	line "feliz armonía"
	done

KurtsHouseSignText:
	text "Casa de César"
	done

AzaleaGymSignText:
	text "Gimnasio #mon de"
	line "Pueblo Azalea"
	cont "Líder: Antón"

	para "La enciclopedia"
	line "viviente de los"
	cont "#mon bicho"
	done

SlowpokeWellSignText:
	text "Pozo Slowpoke"

	para "También conocido"
	line "como Pozo de la"
	cont "Lluvia."

	para "Dicen que el bos-"
	line "tezo de Slowpoke"
	cont "atrae la lluvia."

	para "Existen registros"
	line "que dicen que el"

	para "bostezo de un"
	line "Slowpoke acabó con"

	para "una sequía hace"
	line "400 años."
	done

CharcoalKilnSignText:
	text "Horno de Carbón"
	done

AzaleaTownIlexForestSignText:
	text "El Encinar"

	para "Entra por el"
	line "portal."
	done

AzaleaTownAdvancedTipsSignText:
	text "¡Pista Avanzada!"

	para "¡El estilo de com-"
	line "bate Cambio te"

	para "permite saber qué"
	line "#mon sacará el"
	cont "oponente,"

	para "pero el estilo"
	line "Fijo no!"
	done

AzaleaTownGrampsScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Los Slowpoke han"
	line "desaparecido del"
	cont "pueblo..."

	para "Dicen que venden"
	line "sus Colas en al-"
	cont "gún sitio."
	done

.Text2:
	text "Los Slowpoke han"
	line "vuelto."

	para "Conociéndolos,"
	line "seguro que se"

	para "fueron a holga-"
	line "zanear por ahí."
	done

AzaleaTownTeacherScript:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse_jumptextfaceplayer .Text1
	checkevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	iftrue_jumptextfaceplayer .Text2
	faceplayer
	opentext
	writetext .Text3
	promptbutton
	verbosegiveitem CLEAR_AMULET
	iffalse_endtext
	setevent EVENT_GOT_CLEAR_AMULET_IN_AZALEA
	jumpthisopenedtext

.Text2:
	text "Ha cambiado, pero"
	line "siempre será mi"

	para "pequeño Wooster"
	line "para mí."
	done

.Text1:
	text "No ha llovido des-"
	line "de que los Slow-"
	cont "poke se fueron."

	para "Mi pobre Wooster"
	line "no puede vivir en"
	cont "este clima..."
	done

.Text3:
	text "¡Con el chaparrón,"
	line "mi Wooster"
	cont "evolucionó!"

	para "¿Ah? ¿Tú trajiste"
	line "de vuelta a los"
	cont "Slowpoke?"

	para "¡Trajeron la"
	line "lluvia con ellos!"

	para "¡Muchas gracias!"

	para "¡Por favor, toma"
	line "esto, te lo has"
	cont "ganado!"
	done

AzaleaTownWoosterText:
	text "Wooster: Gugyoo…"
	done

AzaleaTownYoungsterText:
	text "Atraviesa Pueblo"
	line "Azalea y llegarás"
	cont "al Encinar."

	para "Pero esos arbu-"
	line "stos hacen impo-"

	para "sible pasar por"
	line "ahí."

	para "El #mon del"
	line "Carbonero puede"
	cont "usar Corte."
	done

AzaleaTownRocket1Text:
	text "Es peligroso en-"
	line "trar ahí, así que"
	cont "hago guardia."

	para "¿A que soy un"
	line "buen samaritano?"
	done

AzaleaTownRocket2Text:
	text "¿Conoces las Colas"
	line "Slowpoke? ¡Dicen"
	cont "que están ricas!"

	para "¿A que te alegras"
	line "de saberlo?"
	done

AzaleaTownSlowpokeScript:
	opentext
	writethistext
		text "Slowpoke: …"

		para "…… …… ……"
		done
	pause 60
	writethistext
		text "…… ……¿Bostezo?"
		done
	cry SLOWPOKE
	waitendtext

AzaleaTownKurtScript:
	showtextfaceplayer AzaleaTownKurtText
	turnobject LAST_TALKED, LEFT
	end

AzaleaTownKurtText:
	text "¿Podrías ir a ver"
	line "por qué el Encinar"
	cont "está tan agitado?"
	done
