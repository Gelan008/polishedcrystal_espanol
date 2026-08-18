LavRadioTower1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, LavRadioTower1FUpstairsScript

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7
	warp_event 15,  0, LAV_RADIO_TOWER_2F, 255

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_JUMPTEXT, LavRadioTower1FDirectoryText
	bg_event  5,  0, BGEVENT_JUMPTEXT, LavRadioTower1FPokeFluteSignText

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FReceptionistText, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FOfficerText, -1
	object_event  1,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, LavRadioTower1FSuperNerd1Text, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1

LavRadioTower1FUpstairsScript:
	checkevent EVENT_EXORCISED_LAV_RADIO_TOWER
	iftruefwd .Exorcised
	warpmod 1, HAUNTED_RADIO_TOWER_2F
	endcallback

.Exorcised:
	warpmod 1, LAV_RADIO_TOWER_2F
	endcallback

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue_jumpopenedtext .GotExpnCardText
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iffalse_jumpopenedtext .OffTheAirText
	writetext .ReturnedMachinePartText
	promptbutton
	givespecialitem EXPN_CARD
	setflag ENGINE_EXPN_CARD
	jumpthisopenedtext

.GotExpnCardText:
	text "Con ese trasto"
	line "podrás sintonizar"
	cont "la radio de Kanto."

	para "¡Gahahahaha!"
	done

.OffTheAirText:
	text "¡Oh, no, no, no!"

	para "No emitimos nada"
	line "desde que cerró la"
	cont "Central Energía."

	para "¡Todo mi trabajo"
	line "no valdrá nada si"
	cont "no puedo emitir!"

	para "¡Será mi ruina!"
	done

.ReturnedMachinePartText:
	text "¡Ah! ¿Tú eres"
	line "<PLAYER>?"

	para "¡Salvaste la"
	line "Central Energía!"

	para "Gracias a ti no he"
	line "perdido mi empleo."
	cont "¡Me has salvado!"

	para "Acepta esto como"
	line "agradecimiento."
	done

LavRadioTower1FSuperNerd2Script:
	checkflag ENGINE_EXPN_CARD
	iftrue_jumptextfaceplayer LavRadioTower1FSuperNerd2Text_GotExpnCard
	jumpthistextfaceplayer

	text "¡Hola! ¡Soy el"
	line "Director Musical!"

	para "¿? Tu #gear no"
	line "puede sintonizar"
	cont "mi música. ¡Vaya!"

	para "Si consigues una"
	line "Tarj. Expansión,"
	cont "podrás oírla."
	cont "¡A qué esperas!"
	done

LavRadioTower1FReceptionistText:
	text "¡Bienvenido!"
	line "Puedes mirar por"
	cont "toda esta planta."
	done

LavRadioTower1FOfficerText:
	text "Lo siento, solo"
	line "puedes visitar la"
	cont "planta baja."

	para "Desde que tomaron"
	line "la Torre Radio en"
	cont "Johto, aumentamos"
	cont "la seguridad."
	done

LavRadioTower1FSuperNerd1Text:
	text "Hay mucha gente"
	line "trabajando duro en"
	cont "la Torre Radio."

	para "Lo dan todo para"
	line "emitir muy buenos"
	cont "programas."
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "¡Hola! ¡Soy el"
	line "Director Musical!"

	para "¡Creo todas las"
	line "bellas melodías"
	cont "que emitimos!"

	para "¡No seas soso y"
	line "escucha la radio!"
	done

LavRadioTower1FDirectoryText:
	text "PB Recepción"
	line "P1 Ventas"

	para "P2 Personal"
	line "P3 Producción"

	para "P4 Oficina"
	line "   del Director"
	done

LavRadioTower1FPokeFluteSignText:
	text "Anima a tus"
	line "#mon con los "
	cont "suaves sonidos de"
	cont "la # Flauta,"
	cont "canal 20."
	done

; TODO: use this text
LavRadioTower1FReferenceLibraryText:
	text "¡Guau! ¡Toda una"
	line "estantería de CD y"
	cont "vídeos #mon!"

	para "¡Debe de ser la"
	line "fonoteca!"
	done
