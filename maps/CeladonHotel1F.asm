CeladonHotel1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 11
	warp_event  4,  7, CELADON_CITY, 11
	warp_event 16,  0, CELADON_HOTEL_2F, 1
	warp_event 12,  0, CELADON_HOTEL_POOL, 1

	def_coord_events

	def_bg_events
	bg_event  7,  2, BGEVENT_JUMPTEXT, CeladonHotel1FSignpost1Text
	bg_event 13,  0, BGEVENT_JUMPTEXT, CeladonHotel1FSignpost2Text
	bg_event 17,  0, BGEVENT_JUMPTEXT, CeladonHotel1FSignpost3Text

	def_object_events
	object_event 11,  6, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonHotel1FRichBoyGeraldScript, -1
	object_event  3,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotel1FGrampsText, -1
	object_event  7,  4, SPRITE_LADY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotel1FLadyText, -1
	object_event 14,  6, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonHotel1FCooltrainerFText, -1

	object_const_def
	const CELADONHOTEL1F_RICH_BOY

CeladonHotel1FRichBoyGeraldScript:
	checkevent EVENT_BEAT_RICH_BOY_GERALD
	iftrue_jumptextfaceplayer RichBoyGeraldAfterText
	faceplayer
	opentext
	writetext RichBoyGeraldGreetingText
	yesorno
	iffalse_jumpopenedtext RichBoyGeraldNoBattleText
	writetext RichBoyGeraldSeenText
	waitbutton
	closetext
	winlosstext RichBoyGeraldBeatenText, 0
	setlasttalked CELADONHOTEL1F_RICH_BOY
	loadtrainer RICH_BOY, GERALD
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RICH_BOY_GERALD
	end

CeladonHotel1FGrampsText:
	text "¿#mon? No, este"
	line "hotel es para"
	cont "personas."

	para "Estamos al"
	line "completo."
	done

CeladonHotel1FLadyText:
	text "Es mi primer viaje"
	line "a Kanto."

	para "¡Hay tanto que ver"
	line "en Azulona!"
	done

CeladonHotel1FCooltrainerFText:
	text "¡Cómo necesitaba"
	line "estas vacaciones!"
	done

RichBoyGeraldGreetingText:
	text "Mi hermana goza de"
	line "las vacaciones,"
	cont "pero me aburro."

	para "¿Echamos un"
	line "combate?"
	done

RichBoyGeraldSeenText:
	text "¡Pues prepárate"
	line "para perder!"
	done

RichBoyGeraldBeatenText:
	text "Al menos tú no"
	line "eres aburrido."
	done

RichBoyGeraldAfterText:
	text "La próxima vez"
	line "deberíamos ir de"
	cont "vacaciones a"
	cont "Ciudad Olivo."

	para "Me gustaría mucho"
	line "desafiar la"
	cont "Torre Batalla."
	done

RichBoyGeraldNoBattleText:
	text "¡Hmph! Vale."
	done

CeladonHotel1FSignpost1Text:
	text "Hotel Azulona"

	para "¡Disfrute su"
	line "estancia!"
	done

CeladonHotel1FSignpost2Text:
	text "Piscina del Hotel"

	para "Use gorro de baño"
	line "en el agua."
	done

CeladonHotel1FSignpost3Text:
	text "Suites"
	line "Piso de Arriba"
	done
