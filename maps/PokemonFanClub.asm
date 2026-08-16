PokemonFanClub_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, VERMILION_CITY, 3
	warp_event  5,  7, VERMILION_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_JUMPTEXT, PokemonFanClubListenSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, PokemonFanClubBraggingSignText
	bg_event  0,  1, BGEVENT_READ, PokemonJournalGreenScript

	def_object_events
	object_event  2,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STILL, 0, CLEFAIRY, -1, PAL_MON_PINK, OBJECTTYPE_SCRIPT, NO_FORM, ClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  4,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubReceptionistText, -1
	object_event  2,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PokemonFanClubTeacherText, -1
	pokemon_event  7,  3, ODDISH, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_GREEN, FanClubOddishText, -1

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
	jumpthisopenedtext

	text "Es un Caramelo"
	line "Raro que hace más"
	cont "fuerte al #mon."

	para "Prefiero fortale-"
	line "cer a mis #mon"

	para "combatiendo, así"
	line "que puedes quedár-"
	cont "telo."
	done

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

	text "Revista #mon"

	para "Edición especial:"
	line "¡Entrenadora Hoja!"

	para "Además de ser una"
	line "gran entrenadora,"

	para "dicen que a Hoja"
	line "le fascinan los"
	cont "#mon"
	cont "legendarios."
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
	text "Gracias por escu-"
	line "charme. ¡Quiero"
	cont "que tengas esto!"
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "¡Hola, <PLAYER>!"

	para "¿Has vuelto para"
	line "oír más sobre mis"
	cont "#mon?"

	para "¿No? Vaya… Aún te-"
	line "nía más historias…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Qué decepción…"

	para "Vuelve si quieres"
	line "escucharme."
	done
PokemonFanClubReceptionistText:
	text "Nuestro presidente"
	line "habla mucho cuan-"
	cont "do se trata de"
	cont "#mon…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "¡Me encanta cómo"
	line "mueve el dedo"

	para "Clefairy cuando"
	line "intenta usar"
	cont "Metrónomo!"

	para "¡Es una monada!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Adoro a Clefairy,"
	line "pero nunca pude"
	cont "atrapar uno."

	para "Así que me confor-"
	line "mo con este"

	para "# Muñeco que me"
	line "encontré."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ah, ya veo. La ni-"
	line "ña que perdió este"

	para "# Muñeco está"
	line "muy triste…"

	para "De acuerdo. ¿Po-"
	line "drías devolverle"

	para "este # Muñeco"
	line "a esa pobre niña?"

	para "Algún día me haré"
	line "amigo de un Cle-"
	cont "fairy de verdad."

	para "¡No te preocupes!"
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "¡Ya lo verás!"
	line "Me haré amigo de"

	para "un Clefairy de"
	line "verdad."
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
	text "Escuchemos todos"
	line "con educación a"
	cont "otros entrenado-"
	cont "res."
	done

PokemonFanClubBraggingSignText:
	text "¡Si alguien presu-"
	line "me, presume tú"
	cont "también!"
	done
