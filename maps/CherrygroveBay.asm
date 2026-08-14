CherrygroveBay_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 21, 22, HIDDEN_TREE_GROTTO, 1

	def_coord_events

	def_bg_events
	bg_event 21, 21, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_CHERRYGROVE_BAY
	bg_event 22, 21, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_CHERRYGROVE_BAY
	bg_event 11, 12, BGEVENT_READ, CherrygroveBayGalarianBirdsScript

	def_object_events
	object_event  9, 32, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveBayHikerScript, -1
	object_event 23, 25, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerTony, -1
	object_event 15, 43, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CherrygroveBayFisherText, -1
	object_event  7, 39, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmermThomas, -1
	object_event  7, 22, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmerfSally, -1
	object_event 22, 39, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfTara, -1
	itemball_event 22, 23, SHINY_STONE, 1, EVENT_CHERRYGROVE_BAY_SHINY_STONE
	cuttree_event -1,  8, EVENT_CHERRYGROVE_BAY_CUT_TREE
	fruittree_event  8,  9, FRUITTREE_CHERRYGROVE_BAY_1, POMEG_BERRY, PAL_NPC_RED
	fruittree_event  7, 11, FRUITTREE_CHERRYGROVE_BAY_2, KELPSY_BERRY, PAL_NPC_BLUE
	fruittree_event  8, 13, FRUITTREE_CHERRYGROVE_BAY_3, QUALOT_BERRY, PAL_NPC_PINK
	fruittree_event 14,  9, FRUITTREE_CHERRYGROVE_BAY_4, HONDEW_BERRY, PAL_NPC_GREEN
	fruittree_event 15, 11, FRUITTREE_CHERRYGROVE_BAY_5, GREPA_BERRY, PAL_NPC_ENV_YELLOW
	fruittree_event 14, 13, FRUITTREE_CHERRYGROVE_BAY_6, TAMATO_BERRY, PAL_NPC_RED

CherrygroveBayGalarianBirdsScript:
	opentext
	writetext .GreatTreeText
	waitbutton
	callasm CheckForLures
	iffalse_endtext ; User has no lures, do nothing
	writetext .LikeToUseItemText
	yesorno
	iffalse_endtext
	writetext .WhichLureText
	callasm CheckForLures
	callasm SetUpLureMenu
	iffalse_endtext ; User canceled the menu
	writetext .YouSprayedTheLureText
	waitbutton
	ifequalfwd POTENT_LURE_MENU_OPT, .Galarian_Articuno
	ifequalfwd MALIGN_LURE_MENU_OPT, .Galarian_Zapdos
; HARSH_LURE_MENU_OPT, .Galarian_Moltres
	checkevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_MOLTRES
	iftruefwd .NothingHappens
	closetext
	callasm GalarianMoltresEvent
	opentext
	farwritetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	loadwildmon MOLTRES, GALARIAN_FORM, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	setevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_MOLTRES
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatchGalarianMoltres
	setflag ENGINE_PLAYER_CAUGHT_GALARIAN_MOLTRES
.NoCatchGalarianMoltres
	end

.Galarian_Articuno
	checkevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ARTICUNO
	iftruefwd .NothingHappens
	closetext
	callasm GalarianArticunoEvent
	opentext
	farwritetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	loadwildmon ARTICUNO, GALARIAN_FORM, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	setevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ARTICUNO
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatchGalarianArticuno
	setflag ENGINE_PLAYER_CAUGHT_GALARIAN_ARTICUNO
.NoCatchGalarianArticuno
	end

.Galarian_Zapdos
	checkevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ZAPDOS
	iftruefwd .NothingHappens
	closetext
	callasm GalarianZapdosEvent
	opentext
	farwritetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	loadwildmon ZAPDOS, GALARIAN_FORM, 65
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	setevent EVENT_CHERRYGROVE_BAY_FOUGHT_GALARIAN_ZAPDOS
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalsefwd .NoCatchGalarianZapdos
	setflag ENGINE_PLAYER_CAUGHT_GALARIAN_ZAPDOS
.NoCatchGalarianZapdos
	end

.NothingHappens
	writetext .NothingHappensText
	waitbutton
	endtext
.GreatTreeText
	text "¡Es el Gran Arbol"
	line "de Ciudad Cerezo!"
	done

.LikeToUseItemText
	text "¿Quieres usar un"
	line "Cebo en el Gran"
	cont "Arbol?"
	done

.WhichLureText
	text "¿Qué Cebo quieres"
	line "usar?"
	done

.YouSprayedTheLureText
	text "Rociaste el Cebo"
	line "en el árbol."
	done

.NothingHappensText
	text "No ocurrió nada…"
	done

CherrygroveBayHikerScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_EARTH_POWER_INTRO
	iftruefwd CherrygroveBayTutorEarthPowerScript
	writetext CherrygroveBayHikerText
	waitbutton
	setevent EVENT_LISTENED_TO_EARTH_POWER_INTRO
CherrygroveBayTutorEarthPowerScript:
	writetext Text_CherrygroveBayTutorEarthPower
	waitbutton
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	writetext Text_CherrygroveBayTutorQuestion
	yesorno
	iffalsefwd .TutorRefused
	setval EARTH_POWER
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpthisopenedtext

	text "En fin."
	done

.NoSilverLeaf
	jumpthisopenedtext

	text "No tienes ninguna"
	line "Hoja Plata..."
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Ahora tu #mon"
	line "sabe usar"
	cont "Tierra Viva."
	done

GenericTrainerSwimmermThomas:
	generictrainer SWIMMERM, THOMAS, EVENT_BEAT_SWIMMERM_THOMAS, .SeenText, .BeatenText

	text "Mi #mon sabe"
	line "usar Surf, pero"

	para "prefiero nadar."
	done

.SeenText:
	text "¿Sabes nadar?"
	line "Puedo enseñarte,"
	cont "si quieres."
	done

.BeatenText:
	text "Gub, gub, gub…"
	done

GenericTrainerSwimmerfSally:
	generictrainer SWIMMERF, SALLY, EVENT_BEAT_SWIMMERF_SALLY, .SeenText, .BeatenText

	text "¡Me gusta flotar"
	line "en las olas junto"
	cont "a mi #mon!"
	done

.SeenText:
	text "Me gusta esta bahía."
	line "Sus aguas son muy"

	para "más tranquilas que"
	line "en mar abierto."
	done

.BeatenText:
	text "Aunque no me"
	line "gusta perder…"
	done

TrainerSwimmerfTara:
	trainer SWIMMERF, TARA, EVENT_BEAT_SWIMMERF_TARA, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Al norte de aquí"
	line "está el Gran Arbol"
	cont "de Ciudad Cerezo."

	para "Dicen que aves"
	line "#mon raras"

	para "vienen de lejos a"
	line "anidar allí."
	done

.SeenText:
	text "¡Ah, nadar entre"
	line "flores de cerezo es"
	cont "tan relajante!"
	done

.BeatenText:
	text "Ni me importa"
	line "perder…"
	done

GenericTrainerHikerTony:
	generictrainer HIKER, TONY, EVENT_BEAT_HIKER_TONY, .SeenText, .BeatenText

	text "Tras una larga"
	line "caminata, ¡vi lo"

	para "que parecía un ave"
	line "grande volando por"
	cont "aquí!"

	para "¿A dónde iba y"
	line "por qué?"
	done

.SeenText:
	text "¡Caminé millas por"
	line "el bosque solo para"

	para "ver al ave #mon"
	line "legendaria!"
	done

.BeatenText:
	text "Estoy agotado…"
	done

CherrygroveBayFisherText:
	text "Puedo ver Ciudad"
	line "Cerezo desde lejos"
	cont "mientras pesco."

	para "¡Ah! Y el otro día"
	line "también vi unas"

	para "aves realmente"
	line "grandes."

	para "¿Creo que iban a"
	line "ese viejo árbol"
	cont "gigante de cerca?"
	done

CherrygroveBayHikerText:
	text "No creo en mitos"
	line "de creación de"

	para "#mon legendarios."

	para "¡Johto se formó"
	line "durante millones"

	para "de años por el po-"
	line "-der de la tierra!"
	done

Text_CherrygroveBayTutorEarthPower:
	text "Puedo enseñar a tu"
	line "#mon a usar"

	para "Tierra Viva por"
	line "una Hoja Plata."
	done

Text_CherrygroveBayTutorQuestion:
	text "¿Debería enseñar"
	line "a tu #mon"
	cont "Tierra Viva?"
	done