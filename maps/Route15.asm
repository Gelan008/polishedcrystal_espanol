Route15_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  4,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, Route15SignText

	def_object_events
	object_event 10, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyTommy, -1
	object_event 27, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyBilly, -1
	object_event 33, 10, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolgirlFaith, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 30,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanfBoone, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfEleanor, -1
	object_event 19,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsKayandtia1, -1
	object_event 20,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsKayandtia2, -1
	itemball_event 12,  5, PP_UP, 1, EVENT_ROUTE_15_PP_UP
	cuttree_event 43,  5, EVENT_ROUTE_14_CUT_TREE_3

GenericTrainerTeacherColette:
	generictrainer TEACHER_F, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText

	text "De joven solía"
	line "olvidar muchas"
	cont "cosas."
	done

TrainerTeacherHillary:
	trainer TEACHER_F, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script, TRAINERPAL_DARK_TEACHER_F

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Estudiar importa,"
	line "pero el deporte es"
	cont "igual de vital."
	done

GenericTrainerSchoolboyKipp:
	generictrainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText

	text "Mi madre sufre por"
	line "mí, debo llamarla"
	cont "a menudo."
	done

GenericTrainerSchoolboyTommy:
	generictrainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText

	text "¡Sayonara! Lo he"
	line "aprendido en clase"
	cont "de japonés."
	done

GenericTrainerSchoolboyBilly:
	generictrainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText

	text "¡Si #mon fuese"
	line "materia, sacaría"
	cont "sobresaliente!"
	done

GenericTrainerSchoolgirlFaith:
	generictrainer SCHOOLGIRL, FAITH, EVENT_BEAT_SCHOOLGIRL_FAITH, SchoolgirlFaithSeenText, SchoolgirlFaithBeatenText

	text "Me cansé de andar."
	line "Me hace falta un"
	cont "descanso."
	done

GenericTrainerPokefanfBoone:
	generictrainer POKEFANF, BOONE, EVENT_BEAT_POKEFANF_BOONE, PokefanfBooneSeenText, PokefanfBooneBeatenText

	text "Luchando ves"
	line "#mon nuevos."
	cont "¡Es genial!"
	done

GenericTrainerPokefanfEleanor:
	generictrainer POKEFANF, ELEANOR, EVENT_BEAT_POKEFANF_ELEANOR, PokefanfEleanorSeenText, PokefanfEleanorBeatenText

	text "¡Mis #mon no"
	line "son débiles, tú"
	cont "eres muy fuerte!"
	done

GenericTrainerTwinsKayandtia1:
	generictrainer TWINS, KAYANDTIA1, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia1SeenText, TwinsKayandtia1BeatenText

	text "Verdad absoluta:"
	line "¡Soy Kay! Quizá…"
	done

GenericTrainerTwinsKayandtia2:
	generictrainer TWINS, KAYANDTIA2, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia2SeenText, TwinsKayandtia2BeatenText

	text "Quizá sea verdad:"
	line "¡Soy Tia! ¡Fijo!"
	done

TeacherColetteSeenText:
	text "¿Te has olvidado"
	line "de algo?"
	done

TeacherColetteBeatenText:
	text "¡Kyaaaah!"
	done

TeacherHillarySeenText:
	text "Con sol, los niños"
	line "quieren jugar más"
	cont "que estudiar."
	done

TeacherHillaryBeatenText:
	text "No quería perder…"
	done

SchoolboyKippSeenText:
	text "Espera. Tengo que"
	line "llamar a mi madre."
	done

SchoolboyKippBeatenText:
	text "¡Perdón, mamá!"
	line "¡Me han ganado!"
	done

SchoolboyTommySeenText:
	text "¡Luchemos! ¡No voy"
	line "a perder!"
	done

SchoolboyTommyBeatenText:
	text "¡No me acordé de"
	line "hacer la tarea!"
	done

SchoolgirlFaithSeenText:
	text "Vamos de excursión"
	line "a la Torre Radio"
	cont "en sociales."
	done

SchoolgirlFaithBeatenText:
	text "¡Tienes mucha"
	line "fuerza!"
	done

SchoolboyBillySeenText:
	text "¡Mi clase favorita"
	line "es gimnasia!"
	done

SchoolboyBillyBeatenText:
	text "¡Oh, no! ¿Cómo he"
	line "podido perder?"
	done

PokefanfBooneSeenText:
	text "¡Enséñame a tus"
	line "#mon! ¡Porfa!"
	done

PokefanfBooneBeatenText:
	text "¡Fue fantástico!"
	done

PokefanfEleanorSeenText:
	text "¡Hora de luchar!"
	done

PokefanfEleanorBeatenText:
	text "En fin…"
	done

TwinsKayandtia1SeenText:
	text "¡Somos las gemelas"
	line "Kay y Tia!"
	cont "¿Quién soy yo?"
	done

TwinsKayandtia1BeatenText:
	text "Hemos perdido las"
	line "dos…"
	done

TwinsKayandtia2SeenText:
	text "¡Somos las gemelas"
	line "Kay y Tia!"
	cont "¿Quién soy yo?"
	done

TwinsKayandtia2BeatenText:
	text "Hemos perdido las"
	line "dos…"
	done

Route15SignText:
	text "Ruta 15"

	para "Ciudad Fucsia -"
	line "Pueblo Lavanda"
	done
