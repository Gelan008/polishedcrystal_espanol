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

	text "Antes de hacerme"
	line "profesora, solía"

	para "olvidarme de mu-"
	line "chas cosas."
	done

TrainerTeacherHillary:
	trainer TEACHER_F, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script, TRAINERPAL_DARK_TEACHER_F

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Estudiar es impor-"
	line "tante, pero hacer"

	para "ejercicio es igual"
	line "de vital."
	done

GenericTrainerSchoolboyKipp:
	generictrainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText

	text "Mi madre se preo-"
	line "cupa tanto por mí"

	para "que tengo que lla-"
	line "marla a cada rato."
	done

GenericTrainerSchoolboyTommy:
	generictrainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText

	text "¡Sayonara! Lo aca-"
	line "bo de aprender en"
	cont "clase de japonés."
	done

GenericTrainerSchoolboyBilly:
	generictrainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText

	text "¡Si los #mon"
	line "fueran una asigna-"
	cont "tura, sacaría un"
	cont "sobresaliente!"
	done

GenericTrainerSchoolgirlFaith:
	generictrainer SCHOOLGIRL, FAITH, EVENT_BEAT_SCHOOLGIRL_FAITH, SchoolgirlFaithSeenText, SchoolgirlFaithBeatenText

	text "Me he cansado de"
	line "caminar. Me hace"
	cont "falta un descanso."
	done

GenericTrainerPokefanfBoone:
	generictrainer POKEFANF, BOONE, EVENT_BEAT_POKEFANF_BOONE, PokefanfBooneSeenText, PokefanfBooneBeatenText

	text "Luchando puedes"
	line "ver #mon que"
	cont "no habías visto"
	cont "antes."

	para "¡Es genial!"
	done

GenericTrainerPokefanfEleanor:
	generictrainer POKEFANF, ELEANOR, EVENT_BEAT_POKEFANF_ELEANOR, PokefanfEleanorSeenText, PokefanfEleanorBeatenText

	text "¡Mis #mon no"
	line "son débiles! ¡Es"
	cont "que los tuyos son"
	cont "muy fuertes!"
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
	text "En días soleados,"
	line "creo que los niños"

	para "preferirían jugar"
	line "en el patio a es-"
	cont "tudiar en clase."
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
	text "¡Me olvidé de ha-"
	line "cer los deberes!"
	done

SchoolgirlFaithSeenText:
	text "Vamos de excursión"
	line "a la Torre Radio"

	para "de Lavanda para la"
	line "clase de sociales."
	done

SchoolgirlFaithBeatenText:
	text "¡Tienes una fuerza"
	line "increíble!"
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
	text "Oye, tus"
	line "#mon…"

	para "Enséñamelos."
	line "¡Enséñamelos!"
	done

PokefanfBooneBeatenText:
	text "¡Bien! ¡Ha sido"
	line "fantástico!"
	done

PokefanfEleanorSeenText:
	text "¡Muy bien, #mon,"
	line "hora de luchar!"
	done

PokefanfEleanorBeatenText:
	text "En fin…"
	done

TwinsKayandtia1SeenText:
	text "¡Somos las gemelas"
	line "Kay y Tia!"

	para "¿A que no sabes"
	line "quién soy yo?"
	done

TwinsKayandtia1BeatenText:
	text "Tia y Kay hemos"
	line "perdido las dos…"
	done

TwinsKayandtia2SeenText:
	text "¡Somos las gemelas"
	line "Kay y Tia!"

	para "¿A que no sabes"
	line "quién soy yo?"
	done

TwinsKayandtia2BeatenText:
	text "Tia y Kay hemos"
	line "perdido las dos…"
	done

Route15SignText:
	text "Ruta 15"

	para "Ciudad Fucsia -"
	line "Pueblo Lavanda"
	done
