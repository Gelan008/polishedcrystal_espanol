Route27RestHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ROUTE_27, 1
	warp_event  3,  7, ROUTE_27, 1

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route27RestHouseGranny, -1

Route27RestHouseGranny:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	iftruefwd .HeardIntro
	writetext .IntroText
	setevent EVENT_LISTENED_TO_SKILL_SWAP_INTRO
	sjumpfwd .Continue
.HeardIntro
	writetext .HeardIntroText
.Continue
	promptbutton
	special GetFirstPokemonHappiness
	ifgreater FRIEND_BALL_HAPPINESS - 1, .Loyal
	jumpthisopenedtext

	text "Si no confía un"
	line "poco más en ti,"

	para "el viaje podría"
	line "hacerse cuesta"
	cont "arriba."

	para "La confianza es el"
	line "lazo que une a los"
	cont "#mon y a los"
	cont "entrenadores."
	done

.Loyal:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalsefwd .NoSilverLeaf
	yesorno
	iffalsefwd .TutorRefused
	setval SKILL_SWAP
	writetext ClearText
	special Special_MoveTutor
	ifequalfwd $0, .TeachMove
.TutorRefused
	jumpopenedtext .RefusedText

.NoSilverLeaf
	waitbutton
	jumpthisopenedtext

	text "No has encontrado"
	line "ninguna Hoja"
	cont "Plata…"
	done

.TeachMove
	takeitem SILVER_LEAF
	jumpthisopenedtext

	text "Intercambio es un"
	line "ataque que cam-"
	cont "bia tu habilidad"

	para "por la de tu"
	line "rival."

	para "Es solo para en-"
	line "trenadores avan-"
	cont "zados."

	para "¡Úsalo si te atre-"
	line "ves! ¡Suerte!"
	done

.IntroText:
	text "¿Adónde vas con"
	line "tus #mon?"

	para "¿A la Liga"
	line "#mon?"

	para "¿Son tus #mon"
	line "lo bastante leales"
	cont "para ganar?"

	para "Déjame ver…"
	done

.HeardIntroText:
	text "Déjame ver a tus"
	line "#mon…"
	done

.QuestionText:
	text "¡Ah! Tu #mon"
	line "confía muchísimo"
	cont "en ti."

	para "Da gusto ver a un"
	line "buen entrenador."

	para "Puedo enseñarle mi"
	line "técnica secreta,"

	para "Intercambio, si"
	line "quieres."
	done

.RefusedText:
	text "¡Buena suerte en"
	line "tu viaje!"
	done