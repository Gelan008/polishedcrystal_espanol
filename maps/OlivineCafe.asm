OlivineCafe_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  7, OLIVINE_CITY, 6
	warp_event  5,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  4,  4, SPRITE_LYRA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeLyraScript, EVENT_GOT_AMULET_COIN_FROM_LYRA
	object_event  9,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeFishingGuruText, -1
	object_event  9,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeSailorText, -1
	object_event  7,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << MORN), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeOfficerText, -1
	object_event  7,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << DAY), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeYoungsterText, -1
	object_event  3,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCafeFisherText, -1

	object_const_def
	const OLIVINECAFE_BAKER
	const OLIVINECAFE_LYRA

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BAKER_CHELSIE
	iftrue_jumpopenedtext BakerChelsieAfterText
	writetext BakerChelsieGreetingText
	yesorno
	iffalse_jumpopenedtext BakerChelsieNoBattleText
	writetext BakerChelsieSeenText
	waitbutton
	closetext
	winlosstext BakerChelsieBeatenText, 0
	setlasttalked OLIVINECAFE_BAKER
	loadtrainer BAKER, CHELSIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BAKER_CHELSIE
	opentext
	jumpthisopenedtext

BakerChelsieAfterText:
	text "Siempre le añado"
	line "vitaminas al pan."

	para "¡Hacen que mis"
	line "#mon sean más"
	cont "fuertes!"
	done

OlivineCafeLyraScript:
	faceplayer
	opentext
	writetext OlivineCafeLyraText1
	promptbutton
	verbosegiveitem AMULET_COIN
	iffalse_endtext
	writetext OlivineCafeLyraText2
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .GoStraightDown
	applyonemovement OLIVINECAFE_LYRA, step_right
.GoStraightDown
	applymovement OLIVINECAFE_LYRA, OlivineCafeMovementData_LyraLeaves
	playsound SFX_EXIT_BUILDING
	disappear OLIVINECAFE_LYRA
	setevent EVENT_GOT_AMULET_COIN_FROM_LYRA
	waitsfx
	end

OlivineCafeMovementData_LyraLeaves:
	step_down
	step_down
	step_down
	step_end

OlivineCafeFishingGuruText:
	text "¡La carta del Café"
	line "Olivo rebosa de"
	cont "comida para los"
	cont "marineros fuertes!"
	done

OlivineCafeSailorText:
	text "Siempre que atraco"
	line "en la ciudad, me"
	cont "paso por el Café."

	para "¡Su comida me da"
	line "tanta fuerza que"
	cont "no puedo parar!"
	done

BakerChelsieGreetingText:
	text "¡Mis #mon están"
	line "en alza!"

	para "¡Los he criado con"
	line "mi pan especial de"
	cont "levadura!"

	para "¿Quieres luchar"
	line "contra ellos?"
	done

BakerChelsieSeenText:
	text "¡Verás de lo que"
	line "es capaz mi pan!"
	done

BakerChelsieBeatenText:
	text "Eres fuerte. ¿Tú"
	line "también comes de"
	cont "mi pan especial?"
	done

BakerChelsieNoBattleText:
	text "¡Criados con mi"
	line "pan, mis #mon"
	cont "no tienen rival!"
	done

OlivineCafeLyraText1:
	text "Lira: ¡Hola,"
	line "<PLAYER>!"

	para "Deberías probar la"
	line "comida de aquí."
	cont "¡Está riquísima!"

	para "Aunque no quiero"
	line "comer demasiado…"

	para "¡Ah, encontré un"
	line "objeto que podría"
	cont "gustarte! ¡Toma!"
	done

OlivineCafeLyraText2:
	text "¿A que es bonito?"
	line "Y además es útil."

	para "Bueno, debería ir"
	line "tirando."

	para "Quiero ver el"
	line "Bosque Amarillo en"
	cont "Orquídea antes de"
	cont "volver a casa."

	para "¡Nos vemos,"
	line "<PLAYER>!"
	done

OlivineCafeOfficerText:
	text "Será un tópico,"
	line "pero siempre vengo"
	cont "a por donuts."

	para "¡Nunca me canso"
	line "de ellos!"
	done

OlivineCafeYoungsterText:
	text "Estos donuts son"
	line "increíbles."

	para "¡Mis favoritos son"
	line "los de mermelada!"

	para "¡No hay nada como"
	line "un donut relleno"
	cont "de mermelada!"
	done

OlivineCafeFisherText:
	text "Saldría a correr,"
	line "pero no querría"
	cont "arruinar mi gran"
	cont "figura."
	done
