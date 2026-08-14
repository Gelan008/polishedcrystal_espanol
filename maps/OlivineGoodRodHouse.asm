OlivineGoodRodHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 5
	warp_event  3,  7, OLIVINE_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue_jumpopenedtext HaveGoodRodText
	writetext OfferGoodRodText
	yesorno
	iffalse_jumpopenedtext DontWantGoodRodText
	writetext GiveGoodRodText
	promptbutton
	verbosegivekeyitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end
OfferGoodRodText:
	text "¡Olivo da al"
	line "mar!"

	para "Y si da al mar,"
	line "¡seguro que hay"
	cont "peces!"

	para "He pescado aquí"
	line "durante 30 años."

	para "¿Te gustaría mirar"
	line "al mar y pescar?"
	done

GiveGoodRodText:
	text "¡Ja, ja, ja!"
	line "¡Tenemos a un"
	cont "nuevo pescador!"
	done

GaveGoodRodText:
	text "No solo hay peces"
	line "en el mar."

	para "Están dondequiera"
	line "que haya agua."
	done

DontWantGoodRodText:
	text "¿Cóoomo? ¡¿No te"
	line "gusta pescar?!"
	cont "¡Incomprensible!"
	done

HaveGoodRodText:
	text "¿Cómo va eso?"
	line "¿Pescaste alguno"
	cont "grande?"
	done
