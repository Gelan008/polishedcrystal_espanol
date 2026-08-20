PokemonMansionB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 25, 24, POKEMON_MANSION_1F, 3

	def_coord_events

	def_bg_events
	bg_event 26,  4, BGEVENT_ITEM + MAX_ELIXIR, EVENT_POKEMON_MANSION_B1F_HIDDEN_MAX_ELIXIR
	bg_event  8, 13, BGEVENT_ITEM + RARE_CANDY, EVENT_POKEMON_MANSION_B1F_HIDDEN_RARE_CANDY
	bg_event 20, 27, BGEVENT_ITEM + BERSERK_GENE, EVENT_POKEMON_MANSION_B1F_HIDDEN_BERSERK_GENE
	bg_event 20, 27, BGEVENT_JUMPTEXT, PokemonMansion1FMewtwoStatueText
	bg_event 22,  5, BGEVENT_JUMPTEXT, PokemonMansion1FMewtwoStatueText
	bg_event  8, 13, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event  9, 13, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event  4, 17, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event  5, 17, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event  8, 17, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText
	bg_event  9, 17, BGEVENT_JUMPTEXT, PokemonMansion1FFlowerPotText

	def_object_events
	object_event 18,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerScientistBraydon, -1
	object_event 18, 22, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptext, PokemonMansionDiaryText, -1
	itemball_event 13,  5, CARBOS, 1, EVENT_POKEMON_MANSION_B1F_CARBOS
	itemball_event  7,  6, CALCIUM, 1, EVENT_POKEMON_MANSION_B1F_CALCIUM
	itemball_event 16, 27, HP_UP, 1, EVENT_POKEMON_MANSION_B1F_HP_UP
	keyitemball_event  4, 23, OLD_SEA_MAP, EVENT_POKEMON_MANSION_B1F_OLD_SEA_MAP

GenericTrainerScientistBraydon:
	generictrainer SCIENTIST, BRAYDON, EVENT_BEAT_SCIENTIST_BRAYDON, ScientistBraydonSeenText, ScientistBraydonBeatenText

	text "Este lugar fue la"
	line "sede de serios"
	cont "estudios #mon."
	done

ScientistBraydonSeenText:
	text "Echo de menos el"
	line "antiguo Lab de"
	cont "Isla Canela…"
	done

ScientistBraydonBeatenText:
	text "¡Uf!"
	line "¡Abrumador!"
	done

PokemonMansionDiaryText:
	text "Diario: 5 de julio"

	para "Descubrimos un"
	line "nuevo #mon en"
	cont "la selva virgen."

	para "Diario: 10 julio"

	para "Bautizamos al"
	line "#mon recién"
	cont "descubierto: Mew."

	para "Diario: 6 febrero"

	para "Mew dio a luz."
	line "Llamamos al recién"
	cont "nacido Mewtwo."

	para "Diario: 1 sept."

	para "Mewtwo es muy"
	line "poderoso."

	para "No pudimos calmar"
	line "su agresividad…"
	done
