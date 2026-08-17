BluesHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2
	warp_event  7,  0, BLUES_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_UP, RedsHouse1FTVScript

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1

DaisyScript:
	readvar VAR_HOUR
	ifequalfwd 15, .Massage
	checkflag ENGINE_TEA_IN_BLUES_HOUSE
	iftrue .After
	jumpthistextfaceplayer

	text "Dalia: ¡Hola! Mi"
	line "hermano es el"
	cont "Líder de Gimnasio"
	cont "de Ciudad Verde."

	para "Pero sale tanto de"
	line "la ciudad que les"
	cont "causa problemas a"
	cont "los entrenadores."
	done

.Massage:
	faceplayer
	opentext
	writetext .IntroText
	yesorno
	iffalsefwd .NoMassage
	writetext .QuestionText
	waitbutton
	special Special_DaisyMassage
	ifequalfwd 0, .NoMassage
	ifequal 1, .EggMassage
	setflag ENGINE_TEA_IN_BLUES_HOUSE
	writetext .OkayText
	waitbutton
	closetext
	special FadeOutPalettes
	special LoadMapPalettes
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes_EnableDynNoApply
	special RestoreMusic
	opentext
	writetext .LooksContentText
	special PlayCurMonCry
	promptbutton
	jumpthisopenedtext

	text "Dalia: ¡Aquí"
	line "tienes! Ya está."

	para "¿Ves? ¿A que está"
	line "muy guapo?"

	para "Es un #mon tan"
	line "lindo."
	done

.IntroText:
	text "Dalia: ¡Hola!"
	line "Llegas justo a"
	cont "tiempo. Iba a"
	cont "tomar un té."

	para "¿Te gustaría"
	line "acompañarme?"

	para "Oh, tus #mon"
	line "están algo sucios."

	para "¿Te gustaría que"
	line "acicalara a uno?"
	done

.After:
	jumpthistextfaceplayer

	text "Dalia: Siempre"
	line "tomo té a esta"
	cont "hora."

	para "Ven a tomar algo"
	line "conmigo."
	done

.NoMassage:
	jumpthistext

	text "Dalia: ¿No quieres"
	line "que acicale a"
	cont "ninguno?"

	para "Vale, solo"
	line "tomaremos el té."
	done

.QuestionText:
	text "Dalia: ¿A cuál"
	line "debería acicalar?"
	done

.OkayText:
	text "Dalia: Vale, lo"
	line "dejaré muy guapo"
	cont "en un santiamén."
	done

.LooksContentText:
	text_ram wStringBuffer3
	text " parece"
	line "contento."
	done

.EggMassage:
	jumpthistext

	text "Dalia: Oh, lo"
	line "siento. La verdad"
	cont "es que no puedo"
	cont "acicalar un Huevo."
	done
