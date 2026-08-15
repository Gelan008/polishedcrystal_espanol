RuinsOfAlphResearchCenter_MapScriptHeader:
	def_scene_scripts
	scene_script DoNothingScript, SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 7

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterAcademicBooksText
	bg_event  3,  4, BGEVENT_READ, MapRuinsofAlphResearchCenterSignpost1Script
	bg_event  7,  1, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterPrinterText_DoesntWork
	bg_event  5,  0, BGEVENT_JUMPTEXT, RuinsOfAlphResearchCenterProfSilktreePhotoText

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST

	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequalfwd $1, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer .Script
	end

.Script:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	showtext RuinsOfAlphResearchCenterModifiedDexText
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_up
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	checkevent EVENT_RUINS_OF_ALPH_CLIMAX_DONE
	iftruefwd .Conclusion
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .PrinterAvailable
	jumpopenedtext RuinsOfAlphResearchCenterScientist3Text

.Conclusion:
	jumpthisopenedtext

	text "Iremos estudiando"
	line "poco a poco la"

	para "cámara que se ha"
	line "abierto."

	para "Hay que tener cui-"
	line "dado de no dañar"
	cont "el yacimiento."
	done

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	promptbutton
	setevent EVENT_DECO_UNOWN_DOLL
	writetext GotUnownDollText
	playsound SFX_ITEM
	pause 60
	waitbutton
	writetext UnownDollSentText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistRewardText
	promptbutton
	writetext RuinsofAlphResearchCenterScientistInterruptedText
	pause 30
	closetext
	pause 15
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	setevent EVENT_DOOR_OPENED_IN_RUINS_OF_ALPH
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST1, 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST2, 15
	showtext RuinsofAlphResearchCenterScientistShockedText
	readvar VAR_FACING
	ifequalfwd UP, .GoAround
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterLeave2MovementData
	stopfollow
	sjumpfwd .Continue
.GoAround:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsofAlphResearchCenterScientistStepAsideMovementData
	follow RUINSOFALPHRESEARCHCENTER_SCIENTIST3, PLAYER
	applyonemovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, step_down
	stopfollow
.Continue:
	playsound SFX_EXIT_BUILDING
	disappear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	applyonemovement PLAYER, step_down
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	clearevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST_CLIMAX
	setevent EVENT_DO_RUINS_OF_ALPH_CLIMAX
	pause 15
	warpfacing DOWN, RUINS_OF_ALPH_OUTSIDE, 19, 18
	end

RuinsofAlphResearchCenterScientistStepAsideMovementData:
	step_right
	step_down
	step_end

RuinsofAlphResearchCenterLeave2MovementData:
	step_down
	step_down
	step_end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftruefwd .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpthisopenedtext

	text "Las ruinas datan"
	line "de hace unos"
	cont "1500 años."

	para "Pero no se sabe"
	line "por qué se hicie-"
	cont "ron ni por quién."
	done

.UnownAppeared:
	jumpthisopenedtext

	text "¿Han aparecido"
	line "#mon en las"
	cont "ruinas?"

	para "¡Es una noticia"
	line "increíble!"

	para "Tendremos que in-"
	line "vestigarlo."
	done

.GotUnownDex:
	jumpthisopenedtext

	text "¿Cuántas clases"
	line "de #mon habrá"
	cont "en las ruinas?"
	done

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifgreater 3, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftruefwd .UnownAppeared
	jumpthisopenedtext

	text "Hay unos dibujos"
	line "muy raros en las"

	para "paredes de las"
	line "ruinas."

	para "Deben de ser la"
	line "clave para desve-"
	cont "lar el misterio"
	cont "de las ruinas."
	done

.UnownAppeared:
	jumpthisopenedtext

	text "¿Esos extraños"
	line "#mon que viste"
	cont "en las ruinas?"

	para "Parece que se pa-"
	line "recen mucho a los"

	para "dibujos que hay en"
	line "las paredes."

	para "Mmm…"

	para "Eso debe signifi-"
	line "car que hay muchas"
	cont "clases de ellos…"
	done

.GotAllUnown:
	readvar VAR_UNOWNCOUNT
	ifequalfwd NUM_UNOWN, .ResearchComplete
	readvar VAR_UNOWNCOUNT
	ifgreater 10, .ResearchOngoing
	jumpthisopenedtext

	text "¿Por qué habrán"
	line "aparecido ahora"

	para "esos dibujos anti-"
	line "guos en la pared?"

	para "El misterio se"
	line "vuelve más oscuro…"
	done

.ResearchComplete:
	writetext RuinsOfAlphResearchCenterScientist2Text_RadioWaves
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

.ResearchOngoing:
	jumpthisopenedtext

	text "Creemos que algo"
	line "hizo aparecer los"

	para "dibujos crípticos"
	line "en las ruinas."

	para "Hemos centrado"
	line "nuestros estudios"
	cont "en ello."
	done

MapRuinsofAlphResearchCenterSignpost1Script:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iffalsefwd .SkipChecking
	checkevent EVENT_DECO_UNOWN_DOLL
	iftruefwd .SkipChecking
	jumpthisopenedtext

	text "Ruinas Alfa"

	para "Exploración"
	line "Año 10"
	done

.SkipChecking:
	readvar VAR_UNOWNCOUNT
	jumpopenedtext RuinsOfAlphResearchCenterComputerText_GotAllUnown

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step_up
	step_up
	step_left
	turn_head_up
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "¡Listo!"

	para "He modificado tu"
	line "#dex."

	para "He añadido un"
	line "modo opcional a la"

	para "#dex para guar-"
	line "dar datos de Unown."

	para "Los registrará en"
	line "orden alfabético."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "¡La #dex de"
	line "<PLAYER> se ha"
	cont "actualizado!"
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Todos los Unown"
	line "que captures que-"
	cont "darán registrados."

	para "Comprueba cuántas"
	line "formas existen."

	para "Nos estás haciendo"
	line "un gran favor, así"

	para "que te daré algo"
	line "bueno si logras"
	cont "encontrarlos todos."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "¿Has atrapado to-"
	line "das las formas de"
	cont "los Unown?"

	para "¡Es un logro fan-"
	line "tástico!"

	para "Nos has ayudado"
	line "muchísimo en nues-"
	cont "tra investigación."

	para "Déjame darte esto."
	done

GotUnownDollText:
	text "¡<PLAYER> recibió"
	line "el Muñeco Unown!"
	done

UnownDollSentText:
	text "¡El Muñeco Unown"
	line "se envió a casa!"
	done

RuinsofAlphResearchCenterScientistRewardText:
	text "¡Ese muñeco lo he"
	line "diseñado yo mismo!"
	done

RuinsofAlphResearchCenterScientistInterruptedText:
	text "Puedes…"
	done

RuinsofAlphResearchCenterScientistShockedText:
	text "¡¿Qué ha sido ESO?!"
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Gracias a tu gran"
	line "ayuda, avanzamos"

	para "en el estudio de"
	line "las ruinas."

	para "Parece ser que las"
	line "ruinas se cons-"

	para "truyeron como un"
	line "hábitat para los"
	cont "#mon."
	done

RuinsOfAlphResearchCenterScientist2Text_RadioWaves:
	text "Según mis investi-"
	line "gaciones…"

	para "Esos extraños di-"
	line "bujos aparecieron"

	para "cuando se constru-"
	line "yó el Centro #-"
	cont "Com."

	para "Esto debe signifi-"
	line "car que las ondas"

	para "de radio guardan"
	line "alguna relación…"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "#mon misterioso"
	line "Nombre: Unown"

	para "Un total de "
	text_decimal hScriptVar, 1, 2
	line "formas halladas."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Es una impresora."
	line "En pantalla pone:"
	cont "“PC LOAD LETTER”."

	para "… ¿Qué querrá"
	line "decir eso?"
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "Es una foto del"
	line "fundador de este"

	para "Centro de Investi-"
	line "gación: el Prof."
	cont "Silktree."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Hay muchos libros"
	line "académicos."

	para "Ruinas Antiguas…"
	line "Misterios de los"
	cont "Antiguos…"
	done
