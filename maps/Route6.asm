Route6_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 21,  9, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 10,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 23, 11, BGEVENT_JUMPTEXT, Route6UndergroundPathSignText
	bg_event  7,  9, BGEVENT_JUMPTEXT, Route6AdvancedTipsSignText

	def_object_events
	object_event 21, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route6PokefanMText, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 13, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokefanmRex, -1
	object_event 14, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerPokefanmAllan, -1
	object_event 16, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsDayanddani1, -1
	object_event 17, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerTwinsDayanddani2, -1
	object_event 20, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterChaz, -1
	object_event 12, 13, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGuitaristfWanda, -1
	object_event 21, 19, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 1, OfficerfJennyScript, -1
	fruittree_event 17,  5, FRUITTREE_ROUTE_6, STARF_BERRY, PAL_NPC_GREEN

GenericTrainerPokefanmRex:
	generictrainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText

	text "¡Mira lo adorable"
	line "que es mi Phanpy!"

	para "¿No es tan mono"
	line "que te derrite el"
	cont "corazón?"
	done

PokefanmRexSeenText:
	text "Mi Phanpy es el"
	line "más mono de todo"
	cont "el mundo."
	done

PokefanmRexBeatenText:
	text "¡Mi Phanpy!"
	done

GenericTrainerPokefanmAllan:
	generictrainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText

	text "¡Mira qué adorable"
	line "es mi Teddiursa!"

	para "¿No es tan mono"
	line "que te derrite el"
	cont "corazón?"
	done

PokefanmAllanSeenText:
	text "Mi Teddiursa es el"
	line "más mono de todo"
	cont "el mundo."
	done

PokefanmAllanBeatenText:
	text "¡Mi Teddiursa!"
	done

GenericTrainerTwinsDayanddani1:
	generictrainer TWINS, DAYANDDANI1, EVENT_BEAT_TWINS_DAY_AND_DANI, TwinsDayanddani1SeenText, TwinsDayanddani1BeatenText

	text "Day: Nos has"
	line "ganado…"
	done

TwinsDayanddani1SeenText:
	text "Day: ¿Podrás"
	line "vencernos?"
	done

TwinsDayanddani1BeatenText:
	text "Day: ¡Buaaa!"
	done

GenericTrainerTwinsDayanddani2:
	generictrainer TWINS, DAYANDDANI2, EVENT_BEAT_TWINS_DAY_AND_DANI, TwinsDayanddani2SeenText, TwinsDayanddani2BeatenText

	text "Dani: Parece que"
	line "nos han echado."
	done

TwinsDayanddani2SeenText:
	text "Dani: ¡Te vamos a"
	line "dejar K.O.!"
	done

TwinsDayanddani2BeatenText:
	text "Dani: ¡Eeeeh!"
	done

GenericTrainerYoungsterChaz:
	generictrainer YOUNGSTER, CHAZ, EVENT_BEAT_YOUNGSTER_CHAZ, .SeenText, .BeatenText

	text "Por hablar de más…"
	done

.SeenText:
	text "¿Acaso veo a un"
	line "entrenador fuerte?"

	para "¡Qué va, por aquí"
	line "solo hay basura!"
	done

.BeatenText:
	text "La basura era yo…"
	done

GenericTrainerGuitaristfWanda:
	generictrainer GUITARISTF, WANDA, EVENT_BEAT_GUITARISTF_WANDA, .SeenText, .BeatenText

	text "Sigue tu camino…"
	done

.SeenText:
	text "¡Será mejor que"
	line "eches a correr!"
	done

.BeatenText:
	text "Perdí el combate"
	line "sin ton ni son…"
	done

OfficerfJennyScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer .DaytimeText
	checkevent EVENT_BEAT_OFFICERF_JENNY
	iftrue_jumptextfaceplayer .AfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	loadtrainer OFFICERF, JENNY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_JENNY
	endtext

.DaytimeText:
	text "La policía está"
	line "aquí para mantener"
	cont "la paz."
	done

.SeenText:
	text "No me suena tu"
	line "cara."

	para "¡Escuadrón"
	line "Squirtle, ataque!"
	done

.BeatenText:
	text "¡Escuadrón"
	line "Squirtle, toca"
	cont "retirarse…!"
	done

.AfterText:
	text "Siento molestarte,"
	line "chaval."

	para "De noche me pongo"
	line "en alerta."
	done

Route6PokefanMText:
	text "El paso se cerró"
	line "por el problema"
	cont "en la Central"
	cont "Energía."
	done

Route6UndergroundPathSignText:
	text "Vía Subterránea"

	para "Ciudad Celeste -"
	line "Ciudad Carmín"
	done

Route6AdvancedTipsSignText:
	text "¡Consejo Avanzado!"

	para "Hay objetos con"
	line "efectos molestos"
	cont "para su portador,"

	para "como la Bola"
	line "Férrea o el"
	cont "Pañuelo Elegido."

	para "¡Pero con Truco,"
	line "el usuario puede"
	cont "dárselos al rival!"
	done