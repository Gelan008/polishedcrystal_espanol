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

	text "Espero grandes co-"
	line "sas de ti, si te"
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
	line "estás criando a"

	para "tus #mon con"
	line "mucho cariño y"
	cont "dedicación."

	para "Los amantes de los"
	line "#mon vienen"

	para "aquí a rendir"
	line "homenaje a los"
	cont "#mon difuntos."

	para "Por favor, reza"
	line "por las almas de"
	cont "los #mon que ya"
	cont "no están."

	para "Seguro que eso les"
	line "hará felices."
	done

MrFujiGiveSilphScopeText:
	text "Toma, tengo un re-"
	line "galo para ti."

	para "Por favor, acép-"
	line "talo."
	done

MrFujiUseThisText:
	text "Puedes usarlo para"
	line "ayudar a apaciguar"

	para "las almas de los"
	line "#mon que no"
	cont "descansan en paz."
	done

SoulHouseTeacherText:
	text "Creo que aquí hay"
	line "más tumbas de"
	cont "#mon."

	para "Hay muchas cáma-"
	line "ras a las que solo"
	cont "el Sr. Fuji puede"
	cont "entrar."
	done

SoulHouseLassText:
	text "He venido con mi"
	line "madre a visitar"

	para "las tumbas de los"
	line "#mon…"
	done

SoulHouseGrannyText:
	text "Los #mon que"
	line "vivían conmigo…"

	para "Los quería como a"
	line "mis propios nie-"
	cont "tos…"
	done

AgathaSeenText:
	text "Agatha: Hola,"
	line "criatura."

	para "Me llamo Agatha."

	para "Luché durante años"
	line "como miembro del"
	cont "Alto Mando."

	para "…………"

	para "¿Has venido a llo-"
	line "rar a un #mon?"

	para "Puede que ya no"
	line "esté aquí."

	para "El Sr. Fuji tras-"
	line "ladó muchas de las"

	para "tumbas a otra par-"
	line "te cuando la com-"

	para "pañía de radio to-"
	line "mó el control."

	para "…………"

	para "¡Podría haber lu-"
	line "chado por conser-"
	cont "var la torre!"

	para "Pero no quiso in-"
	line "miscuirse. Tenía"

	para "demasiado miedo de"
	line "abusar de su in-"
	cont "fluencia."

	para "Ese viejo necio…"

	para "¡El poder está pa-"
	line "ra usarse!"

	para "Está claro que tú"
	line "me comprendes."

	para "¡Te mostraré lo"
	line "que puede hacer un"

	para "Entrenador podero-"
	line "so de verdad!"
	done

AgathaBeatenText:
	text "¡Vaya, por Dios!"
	done

AgathaRewardText:
	text "Vales mucho, cria-"
	line "tura."

	para "Eres un Entrena-"
	line "dor fuerte con un"

	para "vínculo profundo"
	line "con tus #mon."

	para "¡Toma, quédate con"
	line "esta MT!"
	done