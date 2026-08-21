SinjohRuinsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, SINJOH_RUINS, 2
	warp_event  3,  7, SINJOH_RUINS, 2

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  2,  1, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  5,  4, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, SinjohRuinsHouseCynthiaScript, EVENT_SINJOH_RUINS_HOUSE_CYNTHIA
	object_event  5,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, SinjohRuinsHousePokefanmText, -1
	object_event  2,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SinjohRuinsHouseGrampsScript, -1
	pokemon_event  2,  3, ABRA, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_BROWN, SinjohRuinsHouseAbraText, -1

	object_const_def
	const SINJOHRUINSHOUSE_CYNTHIA

SinjohRuinsHouseGrampsScript:
	faceplayer
	opentext
	writetext SinjohRuinsHouseGrampsText
	yesorno
	iffalse_jumpopenedtext SinjohRuinsHouseGrampsNoText
	writetext SinjohRuinsHouseGrampsYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 15, 6
	end

SinjohRuinsHouseCynthiaScript:
	checkevent EVENT_BEAT_CYNTHIA
	iftrue_jumptextfaceplayer SinjohRuinsHouseCynthiaAfterText
	faceplayer
	opentext
	writetext SinjohRuinsHouseCynthiaChallengeText
	yesorno
	iffalse_jumpopenedtext SinjohRuinsHouseCynthiaNoText
	writetext SinjohRuinsHouseCynthiaYesText
	waitbutton
	closetext
	winlosstext SinjohRuinsHouseCynthiaWinText, 0
	setlasttalked SINJOHRUINSHOUSE_CYNTHIA
	loadtrainer CYNTHIA, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	jumpthistext

SinjohRuinsHouseCynthiaAfterText:
	text "Cintia: ¡Qué gran"
	line "combate!"

	para "Eres un entrenador"
	line "magnífico, y me"
	cont "encantaría volver"
	cont "a verte algún día."
	done

SinjohRuinsHousePokefanmText:
	text "Hace mucho tiempo,"
	line "la gente tenía"
	cont "lazos más fuertes"
	cont "con los #mon."

	para "Surgieron mitos y"
	line "leyendas sobre"
	cont "#mon poderosos,"
	cont "por todos lados."

	para "Estas ruinas unen"
	line "las culturas del"
	cont "pueblo de Alfa, en"
	cont "Johto, y de la"
	cont "Columna Lanza, en"
	cont "Sinnoh."
	done

SinjohRuinsHouseGrampsText:
	text "Pareces fuera de"
	line "lugar, sin saber"
	cont "siquiera por qué"
	cont "has venido aquí."

	para "¿Quieres que mi"
	line "Abra te lleve de"
	cont "vuelta a casa?"
	done

SinjohRuinsHouseGrampsYesText:
	text "Vale, de acuerdo."
	line "Imagina tu casa en"
	cont "tu mente…"
	done

SinjohRuinsHouseGrampsNoText:
	text "Vale, de acuerdo."
	line "¡Mucha suerte en"
	cont "todo!"
	done

SinjohRuinsHouseAbraText:
	text "Abra: Aabra…"
	done

SinjohRuinsHouseCynthiaChallengeText:
	text "Cintia: Hola,"
	line "<PLAYER>."

	para "¿Te ha ido todo"
	line "bien?"

	para "¡Venciste de nuevo"
	line "al Alto Mando!"
	cont "¡Enhorabuena!"

	para "Tengo curiosidad"
	line "por ver lo que has"
	cont "aprendido desde"
	cont "nuestro combate."

	para "¿Luchamos de"
	line "nuevo, <PLAYER>?"
	done

SinjohRuinsHouseCynthiaNoText:
	text "Cintia: Vuelve"
	line "cuando quieras si"
	cont "cambias de idea."
	done

SinjohRuinsHouseCynthiaYesText:
	text "Cintia: Antes de"
	line "sacar mis #mon"
	cont "al combate,"

	para "mi corazón siempre"
	line "late con fuerza…"
	done

SinjohRuinsHouseCynthiaWinText:
	text "¡Ni me acuerdo de"
	line "la última vez que"
	cont "me superaron de"
	cont "esta manera!"
	done
