NationalParkBugContest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 35, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 12, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 13, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 16, 44, BGEVENT_JUMPTEXT, NationalParkRelaxationSquareText
	bg_event 29, 31, BGEVENT_JUMPTEXT, NationalParkBattleNoticeText
	bg_event 14,  4, BGEVENT_JUMPTEXT, NationalParkTrainerTipsText
	bg_event  8, 47, BGEVENT_ITEM + FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

	def_object_events
	object_event 21, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 30, 22, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event 11, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  9, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 25,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 29, 13, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event  9, 23, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event 13, 27, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 18,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 19, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	itemball_event 37, 12, SHINY_STONE, 1, EVENT_NATIONAL_PARK_SHINY_STONE
	tmhmball_event  3, 43, TM_DIG, EVENT_NATIONAL_PARK_TM_DIG

BugCatchingContestant1AScript:
	jumpthistextfaceplayer

	text "Don: ¡Voy a ganar!"
	line "No me molestes."
	done

BugCatchingContestant2AScript:
	jumpthistextfaceplayer

	text "Lou: Mi Parasect"
	line "duerme a los"
	cont "#mon con"
	cont "Espora."
	done

BugCatchingContestant3AScript:
	jumpthistextfaceplayer

	text "Nick: Entreno a"
	line "#mon rápidos"
	cont "para combatir."
	done

BugCatchingContestant4AScript:
	jumpthistextfaceplayer

	text "William: No me"
	line "preocupa ganar."

	para "Solo busco #mon"
	line "raros."
	done

BugCatchingContestant5AScript:
	jumpthistextfaceplayer

	text "Benny: ¡Ssh! Vas a"
	line "asustar a Scyther."

	para "Hablamos luego."
	done

BugCatchingContestant6AScript:
	jumpthistextfaceplayer

	text "Barry: Debilita a"
	line "los #mon bicho"
	cont "antes de lanzar"
	cont "la # Ball."
	done

BugCatchingContestant7AScript:
	jumpthistextfaceplayer

	text "Cindy: Me encantan"
	line "los #mon Bicho."

	para "Imagino que a ti"
	line "también te gustan."
	done

BugCatchingContestant8AScript:
	jumpthistextfaceplayer

	text "Josh: Colecciono"
	line "#mon bicho"
	cont "desde bebé."

	para "¡Es imposible que"
	line "vaya a perder!"
	done

BugCatchingContestant9AScript:
	jumpthistextfaceplayer

	text "Johnny: Si te da"
	line "tiempo a charlar,"
	cont "¡busca bichos!"
	done

BugCatchingContestant10AScript:
	jumpthistextfaceplayer

	text "Kipp: He estudiado"
	line "mucho sobre los"
	cont "#mon Bicho."

	para "¡Ganaré seguro!"
	done