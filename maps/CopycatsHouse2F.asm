CopycatsHouse2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CopycatsHouse2FCallback

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Copycat1Script, EVENT_COPYCAT_1
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Copycat2Script, EVENT_COPYCAT_2
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Copycat3Script, EVENT_COPYCAT_3
	object_event  6,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsDodrioScript, -1
	object_event  6,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, GENGAR, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	object_event  7,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, MURKROW, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, NO_FORM, CopycatsHouse2FDollScript, -1
	pokemon_event  0,  4, DITTO, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_PURPLE, CopycatsHouse2FDittoText, -1

	object_const_def
	const COPYCATSHOUSE2F_COPYCAT1
	const COPYCATSHOUSE2F_COPYCAT2
	const COPYCATSHOUSE2F_COPYCAT3

CopycatsHouse2FCallback:
	disappear COPYCATSHOUSE2F_COPYCAT1
	disappear COPYCATSHOUSE2F_COPYCAT2
	disappear COPYCATSHOUSE2F_COPYCAT3
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	readvar VAR_PLAYERGENDER
	ifequalfwd $1, .Female
	ifequalfwd $2, .Enby
; Male
	appear COPYCATSHOUSE2F_COPYCAT1
	endcallback
.Female:
	appear COPYCATSHOUSE2F_COPYCAT2
	endcallback
.Enby:
	appear COPYCATSHOUSE2F_COPYCAT3
	endcallback

Copycat1Script:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting1Text
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinMovement
	sjump CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll1Text
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinMovement
	sjump CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special RefreshSprites
	showtext CopycatThanks1Text
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatGreeting1Text:
	text "<PLAYER>: ¡Hola!"
	line "¿Te gustan los"
	cont "#mon?"

	para "<PLAYER>: No, solo"
	line "te preguntaba"
	cont "a ti."

	para "<PLAYER>: ¿Eh?"
	line "¡Qué rara eres!"
	done

CopycatLostDoll1Text:
	text "<PLAYER>: ¡Hola!"
	line "Oí que perdiste"
	cont "tu Muñeco #mon"
	cont "favorito."

	para "<PLAYER>: Si lo en"
	line "cuentro, ¿me darás"
	cont "un pase de tren?"

	para "<PLAYER>: Iré a"
	line "buscarlo por ti."

	para "¿Crees que lo"
	line "perdiste al ir a"
	cont "Ciudad Carmín?"
	done

CopycatThanks1Text:
	text "<PLAYER>: ¡Hola!"
	line "¡Muchas gracias"
	cont "por el pase!"

	para "<PLAYER>: ¿Perdón?"

	para "<PLAYER>: ¿Es tan"
	line "divertido imitar"
	cont "cada cosa que"
	cont "hago?"
	done

Copycat2Script:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftrue CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinMovement
	sjump CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinMovement
	sjump CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatGreeting2Text:
	text "<PLAYER>: Hola."
	line "Te deben gustar"
	cont "los #mon."

	para "<PLAYER>: A mí no."
	line "Te he preguntado"
	cont "a ti."

	para "<PLAYER>: ¿Perdón?"
	line "¡Eres rarísima!"
	done

CopycatLostDoll2Text:
	text "<PLAYER>: Hola."
	line "¿De verdad que has"
	cont "perdido tu Muñeco"
	cont "#mon?"

	para "<PLAYER>: ¿Seguro"
	line "que me darás el"
	cont "pase si lo"
	cont "encuentro?"

	para "<PLAYER>: ¡Iré a"
	line "buscarlo!"

	para "¿Crees que lo per-"
	line "diste estando en"
	cont "Carmín?"
	done

CopycatThanks2Text:
	text "<PLAYER>: ¡Gracias"
	line "por el pase de"
	cont "tren!"

	para "<PLAYER>: …"
	line "¿Perdón?"

	para "<PLAYER>: ¿Tanto te"
	line "divierte copiar lo"
	cont "que digo y hago?"
	done

Copycat3Script:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftruefwd .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue CopycatReturnedLostItemScript
	checkkeyitem LOST_ITEM
	iftruefwd CopycatFoundLostItemScript
	applymovement COPYCATSHOUSE2F_COPYCAT3, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .ReturnedMachinePart
	showtext CopycatGreeting2Text
	applymovement COPYCATSHOUSE2F_COPYCAT3, CopycatSpinMovement
	sjumpfwd CopycatRetortScript

.ReturnedMachinePart:
	showtext CopycatLostDoll2Text
	applymovement COPYCATSHOUSE2F_COPYCAT3, CopycatSpinMovement
	sjumpfwd CopycatWorriedScript

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT3, CopycatSpinMovement
	faceplayer
	loadmem wObject1Palette, 0
	variablesprite SPRITE_COPYCAT, SPRITE_CRYS
	special RefreshSprites
	showtext CopycatThanks2Text
	applymovement COPYCATSHOUSE2F_COPYCAT3, CopycatSpinMovement
	sjump CopycatFinalScript

CopycatRetortScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "Copycat: Hmm?"
	line "Quit mimicking?"

	para "But that's my"
	line "favorite hobby!"
	done

CopycatWorriedScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	jumpthistext

	text "Copycat: Pardon?"

	para "I shouldn't decide"
	line "what you should"
	cont "do?"

	para "But I'm really"
	line "worried… What if"
	cont "someone finds it?"
	done

CopycatFoundLostItemScript:
	opentext
	writetext .FoundDollText
	promptbutton
	takekeyitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjumpfwd CopycatGivePassScript

.FoundDollText:
	text "Copiona: ¡Yupi!"
	line "¡Es mi Muñeco"
	cont "Clefairy!"

	para "¿Ves el remiendo"
	line "en la pierna"
	cont "derecha? ¡Esa es"
	cont "la prueba!"
	done

CopycatReturnedLostItemScript:
	opentext
CopycatGivePassScript:
	writetext .GivePassText
	promptbutton
	verbosegivekeyitem PASS
	iffalse_endtext
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	jumpthisopenedtext

	text "Copycat: That's"
	line "the pass for the"
	cont "Magnet Train."

	para "The rail company"
	line "man gave me that"

	para "when they tore"
	line "down our old house"
	cont "for the station."
	done

.GivePassText:
	text "¡Aquí tienes el"
	line "Pase del"
	cont "Magnetotrén, tal"
	cont "como prometí!"
	done

CopycatFinalScript:
	faceplayer
	loadmem wObject1Palette, 1
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special RefreshSprites
	jumpthistext

	text "Copycat: You bet!"
	line "It's a scream!"
	done

CopycatSpinMovement:
rept 2
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
endr
	turn_head_down
	step_end

CopycatsDodrioScript:
	opentext
	writetext .Text1
	cry DODRIO
	promptbutton
	jumpthisopenedtext

	text "Mirror, mirror on"
	line "the wall, who's"

	para "the fairest one of"
	line "all?"
	done

.Text1:
	text "Dodrio: ¡Gii giii!"
	done

CopycatsHouse2FDollScript:
	jumpthistext

	text "¡Es un #mon"
	line "muy raro! ¿Eh?"

	para "Es solo un"
	line "muñeco…"
	done

CopycatsHouse2FDittoText:
	text "Ditto: Dii…"
	done
