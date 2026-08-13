GoldenrodHappinessRater_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHappinessRaterPokefanMText, -1
	object_event  5,  6, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHappinessRaterTwinText, -1

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	writetext GoldenrodHappinessRaterAskCheckText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	special Special_MintTeaPickMon
	iffalse_jumpopenedtext .RefusedText
	ifequalfwd 1, .Egg
	special GetSelectedPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifequalfwd 255, .AdoresYou                            ; 255
	ifgreater AFFECTION_THRESHOLD_2 - 1, .LovesYouALot    ; 220-254
	ifgreater AFFECTION_THRESHOLD_1 - 1, .Affectionate    ; 180-219
	ifgreater HAPPINESS_THRESHOLD_2 - 1, .ReallyTrustsYou ; 160-179
		assert HAPPINESS_TO_EVOLVE == HAPPINESS_THRESHOLD_2
		assert MAX_RETURN_HAPPINESS == HAPPINESS_THRESHOLD_2
	ifgreater HAPPINESS_THRESHOLD_1 - 1, .SortOfHappy     ; 100-159
		assert FRIEND_BALL_HAPPINESS >= HAPPINESS_THRESHOLD_1 && FRIEND_BALL_HAPPINESS < HAPPINESS_THRESHOLD_2
		assert HATCHED_HAPPINESS >= HAPPINESS_THRESHOLD_1 && HATCHED_HAPPINESS < HAPPINESS_THRESHOLD_2
	ifgreater 50 - 1, .QuiteCute                          ; 50-99
		assert 50 < BASE_HAPPINESS
	ifgreater 0, .NotUsedToYou                            ; 1-49
	jumpthisopenedtext                                    ; 0

	text "No parece que le"
	line "caigas nada bien."
	cont "Parece enfadado."
	done

.Egg:
	jumpthisopenedtext

	text "Es un Huevo."
	line "Aún no ha desarro-"
	cont "llado sentimien-"
	cont "tos."
	done

.AdoresYou:
	jumpthisopenedtext

	text "¡Te adora!"
	line "No podría quererte"
	cont "más."

	para "¡Yo también me a-"
	line "legro al verlo! ♥"
	done

.LovesYouALot:
	jumpthisopenedtext

	text "¡Parece muy feliz!"
	line "Se nota que te"
	cont "quiere mucho."
	done

.Affectionate:
	jumpthisopenedtext

	text "¡Es bastante cari-"
	line "ñoso contigo!"

	para "Parece que quiere"
	line "que lo mimen un"
	cont "poco."
	done

.ReallyTrustsYou:
	jumpthisopenedtext

	text "Me da la sensación"
	line "de que de verdad"
	cont "confía en ti."
	done

.SortOfHappy:
	jumpthisopenedtext

	text "Es amigable"
	line "contigo. Parece"
	cont "algo feliz."
	done

.QuiteCute:
	jumpthisopenedtext

	text "Empieza a coger"
	line "confianza conti-"
	cont "go. Es muy mono."
	done

.NotUsedToYou:
	jumpthisopenedtext

	text "Deberías tratarlo"
	line "mejor. No está"
	cont "acostumbrado a ti."
	done

.RefusedText:
	text "Vuelve si cambias"
	line "de opinión."
	done

GoldenrodHappinessRaterAskCheckText:
	text "Si tratas a tus"
	line "#mon bien,"

	para "te querrán de"
	line "vuelta."

	para "¿Quieres que com-"
	line "pruebe la felici-"
	cont "dad de tus #-"
	cont "mon?"
	done

GoldenrodHappinessRaterTeacherText:
	text "¿Oh? A ver tu"
	line ""
	text_ram wStringBuffer3
	text "..."
	done

GoldenrodHappinessRaterPokefanMText:
	text "No paro de perder"
	line "combates, y mis"

	para "#mon acaban"
	line "debilitándose..."

	para "A lo mejor por"
	line "eso a mis #mon"
	cont "no les caigo muy"
	cont "bien..."
	done

GoldenrodHappinessRaterTwinText:
	text "¡Cuando uso un"
	line "objeto en mis"
	cont "#mon, se ponen"
	cont "muy contentos!"
	done
