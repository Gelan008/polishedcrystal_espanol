ShamoutiTunnel_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33,  9, SHAMOUTI_ISLAND, 3
	warp_event  5, 17, WARM_BEACH, 2

	def_coord_events

	def_bg_events
	bg_event 21,  5, BGEVENT_ITEM + NUGGET, EVENT_SHAMOUTI_TUNNEL_HIDDEN_NUGGET
	bg_event 32,  4, BGEVENT_ITEM + LEAF_STONE, EVENT_SHAMOUTI_TUNNEL_HIDDEN_LEAF_STONE

	def_object_events
	object_event 15, 17, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OreManiacScript, -1
	object_event 24, 14, SPRITE_TAMER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerOswald, -1
	object_event 24,  5, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerFirebreatherTala, -1
	object_event  6,  7, SPRITE_LADY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseerfNoelle, -1
	object_event  3, 16, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermChester, -1
	itemball_event  3,  4, X_SPEED, 1, EVENT_SHAMOUTI_TUNNEL_X_SPEED
	itemball_event 12, 17, SMOOTH_ROCK, 1, EVENT_SHAMOUTI_TUNNEL_SMOOTH_ROCK

OreManiacScript:
	faceplayer
	opentext
	writetext .GreetingText
	promptbutton
	special Special_ChooseItem
	iffalse_jumpopenedtext .NoItemText
	special GetOreManiacPrice
	iffalse_jumpopenedtext .WrongItemText
	special ItemManiac_SelectQuantity
	iffalse_jumpopenedtext .NoItemText
	special MultiplyMoneyByQuantity
	writetext .OfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse_jumpopenedtext .NoItemText
	special TakeItemFromMemWithQuantity
	waitsfx
	playsound SFX_TRANSACTION
	special Give_hMoneyTemp
	special PlaceMoneyTopRight
	jumpthisopenedtext

	text "¡Trato hecho!"
	line "¡He conseguido un"

	para "mineral que me"
	line "enamora de verdad!"
	done

.GreetingText:
	text "Minerales… ¡ay,"
	line "cuánto me fascinan"
	cont "los minerales!"

	para "Pagaré muy bien"
	line "por los minerales"
	cont "más raros."

	para "¿No tienes algún"
	line "mineral colosal"

	para "que me haga aluci-"
	line "nar de verdad?"
	done

.OfferText:
	text "¡Ese mineral me"
	line "hace alucinar!"

	para "¿Me lo venderías"
	line "por ¥"
	text_decimal hMoneyTemp, 3, 7
	text "?"
	done

.WrongItemText:
	text "¿Eh? ¿Pero qué"
	line "diablos es esto?"

	para "¡Un mineral tan ba-"
	line "rato no me va a"
	cont "fascinar!"
	done

.NoItemText:
	text "Mmm. Nada me saca"
	line "de mi asombro."

	para "Espero que algún"
	line "día me vendas uno."
	done

GenericTrainerTamerOswald:
	generictrainer TAMER, OSWALD, EVENT_BEAT_TAMER_OSWALD, .SeenText, .BeatenText

	text "Ahora soy Domador,"
	line "pero cuando empe-"

	para "cé en el circo"
	line "hacía el número"

	para "del trapecio con"
	line "#mon."
	done

.SeenText:
	text "Nací siendo un"
	line "hombre de circo."

	para "¡Y ahora también"
	line "soy un fiero lu-"
	cont "chador!"
	done

.BeatenText:
	text "No pude domar a"
	line "tus #mon…"
	done

GenericTrainerFirebreatherTala:
	generictrainer FIREBREATHER, TALA, EVENT_BEAT_FIREBREATHER_TALA, .SeenText, .BeatenText

	text "Mi número de tra-"
	line "gafuegos es muy"

	para "popular entre los"
	line "turistas."

	para "¡Algunos incluso"
	line "me dejan propina!"
	done

.SeenText:
	text "¡Pasen y vean, pa-"
	line "sen y vean mi gran"

	para "y espectacular ex-"
	line "travagancia de"
	cont "fuego!"
	done

.BeatenText:
	text "¡Me he apagado"
	line "tan pronto…!"
	done

GenericTrainerSightseerfNoelle:
	generictrainer SIGHTSEERF, NOELLE, EVENT_BEAT_SIGHTSEERF_NOELLE, .SeenText, .BeatenText

	text "Estoy haciendo un"
	line "álbum de fotos pa-"
	cont "ra mis padres."

	para "¡Eh, no mires!"
	line "¡Es privado!"
	done

.SeenText:
	text "¡Madre mía! ¡Tie-"
	line "nes #mon que no"
	cont "había visto nunca!"

	para "¿Puedo sacar una"
	line "foto?"
	done

.BeatenText:
	text "Oh… ¿He perdido?"
	line "¡No pasa nada!"

	para "¡Un selfi! ♥"
	line "¡Clic!"
	done

GenericTrainerSightseermChester:
	generictrainer SIGHTSEERM, CHESTER, EVENT_BEAT_SIGHTSEERM_CHESTER, .SeenText, .BeatenText

	text "¿Conque eres de"
	line "Johto? ¡Nunca he"
	cont "estado allí!"

	para "Quizá nos veamos"
	line "en la Torre"
	cont "Batalla."
	done

.SeenText:
	text "Estoy viajando por"
	line "todo el mundo."

	para "¿Qué región debe-"
	line "ría visitar ahora?"
	done

.BeatenText:
	text "¡Qué gran expe-"
	line "riencia!"
	done