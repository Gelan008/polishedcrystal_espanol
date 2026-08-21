PokemonFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, PokemonFanClubListenSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, PokemonFanClubBraggingSignText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalGreenScript

	def_object_events
	object_event  3,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, NO_FORM, ClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  5,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubReceptionistText, -1
	object_event  3,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubTeacherText, -1
	pokemon_event  7,  3, ODDISH, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_GREEN, FanClubOddishText, -1

	object_const_def
	const POKEMONFANCLUB_CLEFAIRY_DOLL

PokemonFanClubChairmanScript:
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue_jumptextfaceplayer PokemonFanClubChairmanMoreTalesToTellText
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftruefwd .HeardSpeech
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse_jumpopenedtext PokemonFanClubChairmanHowDisappointingText
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeech:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse_endtext
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	jumpopenedtext PokemonFanClubChairmanItsARareCandyText

PokemonFanClubClefairyGuyScript:
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue_jumptextfaceplayer PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumptextfaceplayer PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	faceplayer
	opentext
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftruefwd .FoundClefairyDoll
	waitendtext
.FoundClefairyDoll:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	disappear POKEMONFANCLUB_CLEFAIRY_DOLL
	verbosegivekeyitem LOST_ITEM
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	endtext

PokemonJournalGreenScript:
	setflag ENGINE_READ_GREEN_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "<PK><MN> Trainer Leaf!"

	para "In addition to"
	line "being a powerful"
	cont "trainer, Leaf is"

	para "said to be fascin-"
	line "ated by legendary"
	cont "#mon."
	done

ClefairyDollScript:
	jumpthistext

	text "¡Es un Clefairy!"
	line "¿Eh?"

	para "Ah, claro. Es un"
	line "# Muñeco"
	cont "Clefairy."
	done

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Soy el presidente"
	line "del Club de Fans"
	cont "de #mon."

	para "¡He criado a más"
	line "de 150 #mon!"

	para "Soy muy exigente"
	line "con todo lo que"
	cont "respecta a ellos."

	para "¿Has venido a oír"
	line "historias sobre"
	cont "mis #mon?"
	done

PokemonFanClubChairmanRapidashText:
	text "¡Bien!"
	line "¡Pues escucha!"

	para "Verás… mi querido"
	line "Rapidash…"

	para "Es… mono… dulce…"
	line "listo… increíble…"
	cont "además… genial…"
	cont "¿tú crees?… oh…"
	cont "Demasiado… fiero…"
	cont "bello… cariñoso…"
	cont "¡lo adoro!"

	para "Abrazarlo… al…"
	line "dormir… calentito…"
	cont "mimoso… ¡Ah, sí!…"
	cont "espectacular…"
	cont "fascinante… algo"
	cont "divino…"
	cont "¡Uy! ¡Mira qué"
	cont "hora es! ¡Te he"
	cont "entretenido mucho!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "¡Gracias por"
	line "escucharme! ¡Toma"
	cont "esto para ti!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "It's a Rare Candy"
	line "that makes #mon"
	cont "stronger."

	para "I prefer making my"
	line "#mon stronger"

	para "by battling, so"
	line "you can have it."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "¡Hola, <PLAYER>!"

	para "¿Has vuelto para"
	line "oír más sobre mis"
	cont "#mon?"

	para "¿No? Vaya… ¡Aún me"
	line "quedan historias!"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Qué decepción…"

	para "Vuelve si quieres"
	line "escucharme."
	done

PokemonFanClubReceptionistText:
	text "El presidente"
	line "habla muchísimo de"
	cont "sus #mon…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "¡Me encanta ver a"
	line "Clefairy mover el"
	cont "dedo con"
	cont "Metrónomo!"

	para "¡Es una monada!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Adoro a Clefairy,"
	line "pero nunca pude"
	cont "atrapar uno."

	para "Me conformo con"
	line "este # Muñeco"
	cont "que encontré."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ah, ya veo. La"
	line "niña que perdió el"
	cont "# Muñeco está"
	cont "muy triste…"

	para "¿Podrías llevarle"
	line "este # Muñeco?"

	para "Algún día me haré"
	line "amigo de uno de"
	cont "verdad. ¡Tranqui!"
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "¡Ya lo verás! Me"
	line "haré amigo de un"
	cont "Clefairy real."
	done

PokemonFanClubTeacherText:
	text "¡Mira a mi querido"
	line "Oddish!"

	para "¡Las hojas de su"
	line "cabeza son tan"
	cont "monas!"
	done

FanClubOddishText:
	text "Oddish: ¡Diiish!"
	done

PokemonFanClubListenSignText:
	text "Escuchemos a otros"
	line "entrenadores con"
	cont "mucha educación."
	done

PokemonFanClubBraggingSignText:
	text "¡Si alguien farda,"
	line "farda tú también!"
	done
