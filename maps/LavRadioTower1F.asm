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

	para "los programas de"
	line "radio de Kanto."

	para "¡Gahahahaha!"
	done

.OffTheAirText:
	text "¡Oh, no, no, no!"

	para "No hemos emitido"
	line "nada desde que la"

	para "Central Energía"
	line "cerró."

	para "Todos mis esfuer-"
	line "zos para abrir es-"

	para "ta emisora serán"
	line "en vano si no"
	cont "puedo emitir."

	para "¡Será mi ruina!"
	done

.ReturnedMachinePartText:
	text "¡Ah! ¿Tú eres"
	line "<PLAYER>, quien"

	para "resolvió el pro-"
	line "blema de la Cen-"
	cont "tral Energía?"

	para "Gracias a ti no"
	line "he perdido mi"
	cont "empleo."

	para "¡Me has salvado"
	line "la vida!"

	para "Por favor, acepta"
	line "esto en agrade-"
	cont "cimiento."
	done

LavRadioTower1FSuperNerd2Script:
	checkflag ENGINE_EXPN_CARD
	iftrue_jumptextfaceplayer LavRadioTower1FSuperNerd2Text_GotExpnCard
	jumpthistextfaceplayer

	text "¡Hola!"

	para "¡Soy el genial Di-"
	line "rector de Música!"

	para "¿Eh? Tu #gear"
	line "no puede sintoni-"

	para "zar mis programas"
	line "musicales."
	cont "¡Qué mala pata!"

	para "Si consigues una"
	line "Tarj. Expansión"

	para "podrás sintonizar"
	line "los programas."
	cont "¡A qué esperas!"
	done

LavRadioTower1FReceptionistText:
	text "¡Bienvenido!"
	line "Puedes echar un"

	para "vistazo a toda"
	line "esta planta."
	done

LavRadioTower1FOfficerText:
	text "Lo siento, pero"
	line "sólo puedes visi-"
	cont "tar la planta"
	cont "baja."

	para "Desde que la Torre"
	line "Radio de Johto"

	para "fue tomada por u-"
	line "na banda criminal,"

	para "hemos tenido que"
	line "aumentar la se-"
	cont "guridad."
	done

LavRadioTower1FSuperNerd1Text:
	text "Hay mucha gente"
	line "trabajando duro en"

	para "la Torre Radio."

	para "Deben de estar ha-"
	line "ciendo todo lo po-"
	cont "sible para ofrecer"
	cont "buenos programas."
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "¡Hola!"

	para "¡Soy el genial Di-"
	line "rector de Música!"

	para "Soy el responsa-"
	line "ble de las maravi-"

	para "llosas melodías"
	line "que se emiten."

	para "¡No seas soso!"
	line "¡Sintoniza tu"
	cont "música favorita!"
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
	text "Anima a tus #mon"
	line "con los suaves "

	para "sonidos de la #"
	line "Flauta, canal 20."
	done

; TODO: use this text
LavRadioTower1FReferenceLibraryText:
	text "¡Guau! Una estante"
	line "ría entera de CD y"
	cont "vídeos de #mon."

	para "Esta debe ser la"
	line "biblioteca de con-"
	cont "sulta."
	done
