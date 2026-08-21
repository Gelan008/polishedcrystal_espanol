PlayersNeighborsHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_READ, PlayersNeighborsHouseRadio

	def_object_events
	object_event  5,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborText, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	object_event  2,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsDaughterText, -1
	object_event  5,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, (1 << EVE) | (1 << NITE), 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, PlayersNeighborsHusbandText, -1

PlayersNeighborsHouseRadio:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftruefwd .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftruefwd .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, $10
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd radio1
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	endtext

PlayersNeighborsDaughterText:
	text "Pikachu es un"
	line "#mon ya"
	cont "evolucionado."

	para "Me asombraron los"
	line "hallazgos del"
	cont "Prof. Elm."

	para "Es famoso por sus"
	line "estudios sobre la"
	cont "evolución #mon."

	para "…Uf… Ojalá pudiera"
	line "ser investigadora"
	cont "como él…"
	done

PlayersNeighborsHusbandText:
	text "Este pueblo es el"
	line "más al sureste de"
	cont "todo Johto."
	done

PlayersNeighborText:
	text "Mi hija está"
	line "empeñada en ser"
	cont "la ayudante del"
	cont "Profesor Elm."

	para "¡Le encantan los"
	line "#mon!"

	para "¡Aunque a mí"
	line "también me gustan!"
	done

PlayerNeighborRadioText1:
	text "¡La Hora Oak!"
	line "¡Sintonízanos la"
	cont "próxima vez!"
	done

PlayerNeighborRadioText2:
	text "¡Canal #mon!"
	done

PlayerNeighborRadioText3:
	text "¡Aquí DJ Rosa,"
	line "tu copresentadora!"
	done

PlayerNeighborRadioText4:
	text "¡#mon!"
	line "Canal #mon…"
	done

PlayerNeighborRadioText2:
	text "#mon Channel!"
	done

PlayerNeighborRadioText3:
	text "This is DJ Mary,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#mon!"
	line "#mon Channel…"
	done
