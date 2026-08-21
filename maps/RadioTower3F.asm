RadioTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CardKeyShutterCallback

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower3FPersonnelSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, RadioTower3FPokemonMusicSignText
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, RadioTower3FSuperNerdText, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WANDER, 1, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerRocketScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftruefwd .Change
	endcallback

.Change:
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	endcallback

RadioTower3FGymGuideScript:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FGymGuideText
	jumptextfaceplayer RadioTower3FGymGuideText_Rockets

RadioTower3FCooltrainerFScript:
	checkevent EVENT_GOT_GBC_SOUNDS_FROM_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FCooltrainerFYouWereMarvelousText
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue_jumptextfaceplayer RadioTower3FCooltrainerFIsDirectorSafeText
	jumpthistextfaceplayer

	text "The Team Rocket"
	line "boss has locked"
	cont "himself in."

	para "But the Director"
	line "can open it."

	para "He's up on the"
	line "fifth floor."

	para "Please save him!"
	done

.NoRockets:
	faceplayer
	opentext
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegivekeyitem GBC_SOUNDS
	iffalse_endtext
	writetext RadioTower3FCooltrainerFItsAGBCSoundsText
	waitbutton
	closetext
	setevent EVENT_GOT_GBC_SOUNDS_FROM_RADIO_TOWER
	end

GenericTrainerGruntM7:
	generictrainer GRUNTM, 7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText

	text "I failed in my"
	line "duties…"

	para "I'll be docked pay"
	line "for this…"
	done

GenericTrainerGruntM8:
	generictrainer GRUNTM, 8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText

	text "I feel lousy over"
	line "losing!"

	para "Darn it! I hate"
	line "useless #mon!"
	done

GenericTrainerGruntM9:
	generictrainer GRUNTM, 9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText

	text "What?! You made it"
	line "past our men in"
	cont "the Underground?"

	para "How could you?"
	done

GenericTrainerRocketScientistMarc:
	generictrainer ROCKET_SCIENTIST, MARC, EVENT_BEAT_ROCKET_SCIENTIST_MARC, RocketScientistMarcSeenText, RocketScientistMarcBeatenText

	text "Bwahahaha…"

	para "I can transmit as"
	line "strong a signal as"
	cont "I need from here."
	done

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftruefwd .UsedCardKey
	checkkeyitem CARD_KEY
	iftruefwd .HaveCardKey
.UsedCardKey:
	endtext

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a
	changeblock 14, 4, $1
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FSuperNerdText:
	text "Tenemos grabados"
	line "los sonidos de"
	cont "los #mon."

	para "¡Habrá cerca de"
	line "200 clases!"
	done

RadioTower3FGymGuideText_Rockets:
	text "To trainers, #-"
	line "mon are their"
	cont "beloved partners."

	para "It's terrible how"
	line "Team Rocket is"

	para "trying to control"
	line "#mon."
	done

RadioTower3FGymGuideText:
	text "Emitimos las"
	line "24 horas del día"
	cont "programas muy"
	cont "divertidos."

	para "¡Yo también daré"
	line "el máximo sin"
	cont "descanso!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "¿Estará a salvo"
	line "el Director?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "¡Muchas gracias!"
	line "¡Eres mi héroe!"

	para "Acepta esto como"
	line "muestra de mi"
	cont "agradecimiento."
	done

RadioTower3FCooltrainerFItsAGBCSoundsText:
	text "Es el Reprod. GBC"

	para "¡Tiene montones de"
	line "canciones para oír"
	cont "donde quieras!"

	para "Incluso puedes"
	line "cambiar el tono y"
	cont "la velocidad."

	para "¡Pruébalo!"
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "¡Estuviste genial!"
	done

GruntM7SeenText:
	text "Tengo órdenes"
	line "estrictas:"

	para "¡Aplastaré a quien"
	line "desafíe al"
	cont "Team Rocket!"
	done

GruntM7BeatenText:
	text "¡¿Qué?!"
	done

GruntM8SeenText:
	text "¡Es genial mandar"
	line "a los #mon a"
	cont "cometer crímenes!"
	done

GruntM8BeatenText:
	text "¡No me lo creo!"
	done

GruntM9SeenText:
	text "¿Por qué se abrió"
	line "la persiana?"

	para "¿Tienes tú algo"
	line "que ver con esto?"
	done

GruntM9BeatenText:
	text "¡Estoy acabado!"
	done

RocketScientistMarcSeenText:
	text "¿Un chiquillo por"
	line "aquí perdido?"

	para "¿Quién eres?"
	done

RocketScientistMarcBeatenText:
	text "¡Tch! ¡Te he"
	line "subestimado!"
	done

RadioTower3FCardKeySlotText:
	text "Es la ranura para"
	line "la Llave Magnét."
	done

InsertedTheCardKeyText:
	text "<PLAYER> insertó"
	line "la Llave Magnét."
	done

RadioTower3FPersonnelSignText:
	text "2P Personal"
	done

RadioTower3FPokemonMusicSignText:
	text "Música #mon"
	line "con el DJ Ben"
	done
