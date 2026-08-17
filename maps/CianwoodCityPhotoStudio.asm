CianwoodCityPhotoStudio_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_PHOTOGRAPH
	iftrue_jumpopenedtext PhotoStudioAlreadyDoneText
	writetext PhotoStudioGreetingText
	yesorno
	iffalse_jumpopenedtext PhotoStudioRefusedText
	writetext PhotoStudioWhichMonText
	promptbutton
	special Special_CianwoodPhotograph
	ifequalfwd $0, .NoPicture
	ifequalfwd $1, .EggPicture
	setflag ENGINE_DAILY_PHOTOGRAPH
	writetext PhotoStudioHoldStillText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	callasm LoadBlindingFlashPalette
	pause 10
	playsound SFX_DOUBLE_SLAP
	waitsfx
	pause 10
	special FadeInPalettes_EnableDynNoApply
	readmem wCurPartySpecies
	pokepic 0
	cry 0
	waitsfx
	closepokepic
	opentext
	writetext PhotoStudioPrestoText
	special PlayCurMonCry
	waitbutton
	jumpthisopenedtext

	text "Vuelve otro día,"
	line "¿vale?"
	done

.NoPicture:
	jumpthisopenedtext

	text "¿Oh, no hay foto?"
	line "Vuelve otro día,"
	cont "¿vale?"
	done

.EggPicture:
	jumpthisopenedtext

	text "¿Un Huevo? Mi gran"
	line "talento vale más…"
	done

PhotoStudioGreetingText:
	text "Soy Cameron, el"
	line "Fotógrafo."

	para "Llevas #mon"
	line "magníficos."

	para "¿Qué tal una foto"
	line "de recuerdo?"
	done

PhotoStudioWhichMonText:
	text "¡Vale! ¡Sonreíd!"

	para "¿A qué #mon le"
	line "hago una foto?"
	done

PhotoStudioHoldStillText:
	text "Muy bien. No os"
	line "mováis un segundo."
	done

PhotoStudioPrestoText:
	text "¡Listo! Ya está."

	para "¡Tu "
	text_ram wStringBuffer3
	line "se ve más feliz!"
	done

PhotoStudioAlreadyDoneText:
	text "Ya te he sacado"
	line "una foto hoy."

	para "Vuelve de nuevo"
	line "mañana."
	done

PhotoStudioRefusedText:
	text "Qué pena. Pensaba"
	line "que sería un buen"
	cont "recuerdo…"
	done
