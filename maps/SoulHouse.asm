SoulHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  9, LAVENDER_TOWN, 6
	warp_event  5,  9, LAVENDER_TOWN, 6
	warp_event  4,  2, SOUL_HOUSE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  7, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, AgathaScript, -1
	object_event  4,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujiScript, -1 ; TODO: EVENT_SOUL_HOUSE_MR_FUJI
	object_event  7,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseTeacherText, -1
	object_event  2,  7, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseLassText, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, SoulHouseGrannyText, -1

	object_const_def
	const SOULHOUSE_AGATHA

AgathaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_AGATHA
	iftruefwd AgathaAfterScript
	writetext AgathaSeenText
	waitbutton
	closetext
	winlosstext AgathaBeatenText, 0
	setlasttalked SOULHOUSE_AGATHA
	loadtrainer AGATHA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_AGATHA
	opentext
	writetext AgathaRewardText
	promptbutton
	verbosegivetmhm TM_SHADOW_CLAW
	setevent EVENT_GOT_TM65_SHADOW_CLAW_FROM_AGATHA
AgathaAfterScript:
	jumpthisopenedtext

	text "Espero grandes"
	line "cosas de ti si te"
	cont "lo propones."
	done

MrFujiScript:
	faceplayer
	opentext
	writetext MrFujiText
	waitbutton
	checkevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	iftrue_endtext
	writetext MrFujiGiveSilphScopeText
	waitbutton
	verbosegivekeyitem SILPHSCOPE2
	writetext MrFujiUseThisText
	waitbutton
	setevent EVENT_GOT_SILPHSCOPE2_FROM_MR_FUJI
	endtext

MrFujiText:
	text "Sr. Fuji: Te doy"
	line "la bienvenida."

	para "Mmm… Se nota que"
	line "crias a tus"
	cont "#mon con mucho"
	cont "amor y dedicación."

	para "Los amantes de los"
	line "#mon vienen a"
	cont "honrar la memoria"
	cont "de los difuntos."

	para "Por favor, reza"
	line "por las almas de"
	cont "los #mon que ya"
	cont "no están."

	para "Seguro que eso les"
	line "hará felices."
	done

MrFujiGiveSilphScopeText:
	text "Toma, tengo un"
	line "regalo para ti."

	para "Por favor,"
	line "acéptalo."
	done

MrFujiUseThisText:
	text "Puedes usarlo para"
	line "calmar las almas"
	cont "de los #mon que"
	cont "no descansan en"
	cont "paz."
	done

SoulHouseTeacherText:
	text "Creo que aquí hay"
	line "más tumbas de"
	cont "#mon."

	para "Hay muchas salas a"
	line "las que solo el"
	cont "Sr. Fuji puede"
	cont "entrar."
	done

SoulHouseLassText:
	text "He venido con mi"
	line "madre a visitar"
	cont "las tumbas de los"
	cont "#mon…"
	done

SoulHouseGrannyText:
	text "Los #mon que"
	line "vivían conmigo…"

	para "Los quería como a"
	line "mis propios"
	cont "nietos…"
	done

AgathaSeenText:
	text "Agatha: Hola,"
	line "criatura."

	para "Me llamo Agatha."

	para "Luché durante años"
	line "como miembro del"
	cont "Alto Mando."

	para "…………"

	para "¿Has venido a"
	line "llorar a un"
	cont "#mon?"

	para "Puede que ya no"
	line "esté aquí."

	para "El Sr. Fuji movió"
	line "muchas tumbas a"
	cont "otra parte cuando"
	cont "la radio tomó el"
	cont "control."

	para "…………"

	para "¡Podría haber"
	line "luchado por salvar"
	cont "la torre!"

	para "Pero no quiso"
	line "actuar por temor a"
	cont "abusar de su gran"
	cont "influencia."

	para "Ese viejo necio…"

	para "¡El poder está"
	line "para usarse!"

	para "Está claro que tú"
	line "me comprendes."

	para "¡Te mostraré lo"
	line "que puede hacer un"
	cont "entrenador fuerte"
	cont "de verdad!"
	done

AgathaBeatenText:
	text "¡Vaya, por Dios!"
	done

AgathaRewardText:
	text "Vales mucho, mi"
	line "buena criatura."

	para "Eres un entrenador"
	line "fuerte con un gran"
	cont "vínculo con tus"
	cont "#mon."

	para "¡Toma, quédate con"
	line "esta MT!"
	done