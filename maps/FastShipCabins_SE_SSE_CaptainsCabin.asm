FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SSAquaGranddaughterHadFunText, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND

	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2

SSAquaCaptain:
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue_jumptextfaceplayer SSAquaCaptainHowDoYouLikeText
	jumpthistextfaceplayer

	text "¡Uf! Gracias por"
	line "venir a ayudar."

	para "Esa niña me ha"
	line "dejado agotado."
	done

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	showtext SSAquaGranddaughterCaptainPlayWithMeText
	showtextfaceplayer SSAquaGranddaughterHasToFindGrandpaText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	callasm DisableDynPalUpdates
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	loadmem wObject1Palette, 1
	callasm SetBlackObjectPals
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	callasm FadeInPalettes_EnableDynNoApply
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	showtext SSAquaGranddaughterWasPlayingText
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applyonemovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, step_down
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjumpfwd SSAquaMachoBraceAndDocking

SSAquaGrandpa:
	checkevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	iftrue_jumptextfaceplayer SSAquaGrandpaTravellingText
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftruefwd SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMachoBraceAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalsefwd .FailedMachoBrace
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	sjumpfwd .ContinueDocking
.FailedMachoBrace:
	writetext .NoRoomForMachoBrace
	waitbutton
.ContinueDocking:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	endtext

.NoRoomForMachoBrace:
	text "¡No te cabe más!"
	line "Te lo guardaré"
	cont "para otro viaje."
	done

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem MACHO_BRACE
	iffalse_endtext
	setevent EVENT_GOT_MACHO_BRACE_FROM_GRANDPA_ON_SS_AQUA
	endtext

GenericTrainerPokefanmColin:
	generictrainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText

	text "¿Viajas tú solo?"

	para "¿No se preocupa"
	line "tu madre?"
	done

GenericTrainerTwinsMegandpeg1:
	generictrainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText

	text "¡Llamarnos bebé es"
	line "muy grosero!"
	done

GenericTrainerTwinsMegandpeg2:
	generictrainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText

	text "A veces los niños"
	line "somos más listos"
	cont "que los adultos."
	done

GenericTrainerPsychicRodney:
	generictrainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText

	text "Ya veo. Puedes oír"
	line "la radio de Johto"
	cont "en el S.S. Aqua."
	done

GenericTrainerPokefanmJeremy:
	generictrainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText

	text "¡Debo ir a la"
	line "Peluquería #mon"
	cont "a arreglarlos un"
	cont "poco!"
	done

GenericTrainerPokefanfGeorgia:
	generictrainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText

	text "Iré de compras al"
	line "Centro Comercial"
	cont "y luego…"
	done

GenericTrainerSupernerdShawn:
	generictrainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText

	text "Deberías usar las"
	line "Balls adecuadas"
	cont "en cada ocasión."
	done

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	run_step_right
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step_up
	step_up
	turn_head_left
	step_end


SSAquaCaptainHowDoYouLikeText:
	text "¿Qué te parece el"
	line "viaje en el S.S."
	cont "Aqua?"

	para "Prácticamente"
	line "patina sobre las"
	cont "olas."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, hola… Aún no"
	line "hallo a mi nieta."

	para "Mientras esté a"
	line "bordo, todo bien,"
	cont "pero es inquieta."

	para "Es una niña muy"
	line "enérgica…"

	para "¡Temo que moleste"
	line "a los demás!"
	done

SSAquaEntertainedGranddaughterText:
	text "¿Eras <PLAYER>?"
	line "He oído que has"
	cont "entretenido a mi"
	cont "nieta."

	para "Quiero darte las"
	line "gracias por ello."
	done

SSAquaGrandpaHaveThisText:
	text "¡Ya sé! ¡Quiero"
	line "darte esto!"
	done

SSAquaGrandpaTravellingText:
	text "Estamos viajando"
	line "por todo el mundo."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "Capitán, juegue"
	line "conmigo, ¿por fa?"

	para "¡Me aburro mucho!"
	line "¡A jugar más!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "¡Hola! ¿Jugarás"
	line "conmigo?"

	para "…¡Ah! ¿Mi abuelo"
	line "está preocupado?"

	para "¡Tengo que irme!"
	line "¡Voy a buscarlo!"
	done

SSAquaGranddaughterWasPlayingText:
	text "¡Abuelo, ya volví!"
	line "¡Jugaba con el"
	cont "Capitán y este"
	cont "chico tan grande!"
	done

SSAquaGranddaughterHadFunText:
	text "¡Me he divertido"
	line "mucho jugando!"
	done

PokefanmColinSeenText:
	text "¡Eh, tú! ¿Quieres"
	line "un combate?"
	done

PokefanmColinBeatenText:
	text "¡Eres fuerte!"
	done

TwinsMegandpeg1SeenText:
	text "¿Te crees que soy"
	line "un bebé?"
	cont "¡No es justo!"
	done

TwinsMegandpeg1BeatenText:
	text "¡Oh! ¡Perdimos!"
	done

TwinsMegandpeg2SeenText:
	text "¡No soy un bebé!"

	para "¡Eso no se le dice"
	line "a una dama!"
	done

TwinsMegandpeg2BeatenText:
	text "¡Oh! ¡Perdimos!"
	done

PsychicRodneySeenText:
	text "¡Ssh! ¡Capto"
	line "ondas de radio en"
	cont "mi cerebro!"
	done

PsychicRodneyBeatenText:
	text "…¡Oigo algo!"
	done

PokefanmJeremySeenText:
	text "¿Qué te parecen?"
	line "Mis #mon son"
	cont "preciosos, ¿a que"
	cont "sí?"
	done

PokefanmJeremyBeatenText:
	text "¡Oh, no! ¡Mis"
	line "lindos #mon!"
	done

PokefanfGeorgiaSeenText:
	text "Iré de compras al"
	line "Centro Comercial"
	cont "y luego…"
	done

PokefanfGeorgiaBeatenText:
	text "¿Qué iba a hacer?"
	done

SupernerdShawnSeenText:
	text "¿Qué clase de"
	line "# Balls llevas"
	cont "contigo?"
	done

SupernerdShawnBeatenText:
	text "¡Espera! ¡Para!"
	line "¡No! ¡Por favor!"
	done

SSAquaHasArrivedVermilionText:
	text "El S.S. Aqua ha"
	line "llegado a Ciudad"
	cont "Carmín."
	done
