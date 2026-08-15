Route1_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10,  1, ROUTE_1_VIRIDIAN_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_JUMPTEXT, Route1SignText

	def_object_events
	object_event  6, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyDanny, -1
	object_event 17, 14, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboySherman, -1
	object_event 16, 21, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermFrench, -1
	object_event 11, 25, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainerfQuinn, -1
	fruittree_event  5,  7, FRUITTREE_ROUTE_1, FIGY_BERRY, PAL_NPC_BROWN

GenericTrainerSchoolboyDanny:
	generictrainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText

	text "Para los entrena-"
	line "dores, es normal"

	para "luchar cada vez"
	line "que nos vemos."
	done

GenericTrainerSchoolboySherman:
	generictrainer SCHOOLBOY, SHERMAN, EVENT_BEAT_SCHOOLBOY_SHERMAN, SchoolboyShermanSeenText, SchoolboyShermanBeatenText

	text "Debería anotar to-"
	line "dos los fallos"
	cont "de hoy."
	done

GenericTrainerCooltrainermFrench:
	generictrainer COOLTRAINERM, FRENCH, EVENT_BEAT_COOLTRAINERM_FRENCH, CooltrainermFrenchSeenText, CooltrainermFrenchBeatenText

	text "¡Ha sido un gran"
	line "combate!"
	cont "¿A que sí?"
	done

GenericTrainerCooltrainerfQuinn:
	generictrainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText

	text "Eres fuerte."

	para "Se nota que has"
	line "entrenado duro."
	done

SchoolboyDannySeenText:
	text "Si los entrenado-"
	line "res se cruzan, lo"

	para "primero que hacen"
	line "es combatir."
	done

SchoolboyDannyBeatenText:
	text "Vaya… Mi historial"
	line "de derrotas…"
	done

SchoolboyShermanSeenText:
	text "¡Al salir de cla-"
	line "se, voy directo"
	cont "a practicar!"
	done

SchoolboyShermanBeatenText:
	text "Tengo que seguir"
	line "el libro de texto."
	done

CooltrainermFrenchSeenText:
	text "¡Tú!"

	para "¡Estaba esperando"
	line "a alguien como tú!"
	done

CooltrainermFrenchBeatenText:
	text "¡Sí, tan fuerte"
	line "como esperaba!"
	done

CooltrainerfQuinnSeenText:
	text "¡Eh, tú!"
	line "¿Quieres luchar?"
	done

CooltrainerfQuinnBeatenText:
	text "K.O. total…"
	done

Route1SignText:
	text "Ruta 1"

	para "Pueblo Paleta -"
	line "Ciudad Verde"
	done
