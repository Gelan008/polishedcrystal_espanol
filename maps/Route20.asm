Route20_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 70,  9, SEAFOAM_ISLANDS_1F, 1
	warp_event 62,  5, SEAFOAM_ISLANDS_1F, 4

	def_coord_events

	def_bg_events
	bg_event 69, 11, BGEVENT_JUMPTEXT, CinnabarGymSignText
	bg_event 65,  7, BGEVENT_JUMPTEXT, SeafoamIslandsSignText
	bg_event 23, 10, BGEVENT_ITEM + STARDUST, EVENT_ROUTE_20_HIDDEN_STARDUST

	def_object_events
	object_event 99, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfNicole, -1
	object_event 78, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfLori, -1
	object_event 32,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmerfMayu, -1
	object_event 62, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSwimmerfLeona, -1
	object_event  8,  6, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCameron, -1
	object_event 77,  3, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermLuis, -1
	object_event 88,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermElmo, -1
	object_event 18, 12, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPicnickerCheyenne, -1
	object_event 26, 14, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerPicnickerAdrian, -1
	object_event 14, 14, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCamperPedro, -1
	object_event 46,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperBert, -1
	object_event 69,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperErnie, -1
	itemball_event 72,  3, BIG_PEARL, 1, EVENT_ROUTE_20_BIG_PEARL

GenericTrainerSwimmerfNicole:
	generictrainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText

	text "Al nadar ejercitas"
	line "todo el cuerpo."

	para "Es genial para la"
	line "salud."
	done

SwimmerfNicoleSeenText:
	text "Me siento mucho"
	line "más ligera en el"
	cont "agua."
	done

SwimmerfNicoleBeatenText:
	text "¡Oh, no!"
	done

GenericTrainerSwimmerfLori:
	generictrainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText

	text "Surf ya no es el"
	line "único movimiento"
	cont "MO que se usa en"
	cont "el agua."
	done

SwimmerfLoriSeenText:
	text "¡Qué gran lista"
	line "de Medallas tienes"
	cont "de Gimnasio!"

	para "¡Echemos un buen"
	line "combate!"
	done

SwimmerfLoriBeatenText: ; text > text
	text "¡No!"
	done

GenericTrainerSwimmerfMayu:
	generictrainer SWIMMERF, MAYU, EVENT_BEAT_SWIMMERF_MAYU, .SeenText, .BeatenText

	text "¡Estaba intentando"
	line "ver cuánto tiempo"
	cont "aguantaba bajo el"
	cont "agua sin aire!"
	done

.SeenText:
	text "¿Mmph? ¿Mmmph"
	line "mmmmphh?"

	para "¡Mmmmph"
	line "mmmmmppphh!"
	done

.BeatenText:
	text "¡Puah!"
	done

GenericTrainerSwimmerfLeona:
	generictrainer SWIMMERF, LEONA, EVENT_BEAT_SWIMMERF_LEONA, .SeenText, .BeatenText

	text "Tus #mon…"

	para "¿sigues la moda"
	line "al formar tus"
	cont "equipos?"
	done

.SeenText:
	text "¡Mira! ¡Llevo mi"
	line "mejor bañador y a"
	cont "mis mejores"
	cont "#mon!"
	done

.BeatenText:
	text "¡Ohhh!"
	done

GenericTrainerSwimmermCameron:
	generictrainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText

	text "Aparte del mar,"
	line "también nado en"
	cont "lagos y ríos."
	done

SwimmermCameronSeenText:
	text "Supongo que no se"
	line "puede ir a nado"
	cont "hasta Johto."
	done

SwimmermCameronBeatenText:
	text "¡Aaaay!"
	done

GenericTrainerSwimmermLuis:
	generictrainer SWIMMERM, SWIMMERM_LUIS, EVENT_BEAT_SWIMMERM_LUIS, .SeenText, .BeatenText

	text "¡La próxima vez"
	line "me pondré mi"
	cont "bañador de gala!"
	done

.SeenText:
	text "¡Hoy me he puesto"
	line "mi mejor bañador!"
	done

.BeatenText:
	text "Ni con mi mejor"
	line "bañador he podido"
	cont "ganar."
	done

GenericTrainerSwimmermElmo:
	generictrainer SWIMMERM, ELMO, EVENT_BEAT_SWIMMERM_ELMO, .SeenText, .BeatenText

	text "Tal vez debería"
	line "volver a la pesca…"
	done

.SeenText:
	text "Antes me dedicaba"
	line "a la pesca."

	para "¡Pero me gusta"
	line "tanto nadar que"
	cont "siempre voy en"
	cont "bañador!"
	done

.BeatenText: ; text > text
	text "Glup…"
	done

GenericTrainerPicnickerCheyenne:
	generictrainer PICNICKER, CHEYENNE, EVENT_BEAT_PICNICKER_CHEYENNE, .SeenText, .BeatenText

	text "¡Junto a mis"
	line "#mon no me"
	cont "duele perder!"
	done

.SeenText:
	text "De pequeña solo"
	line "jugaba dentro de"
	cont "casa."

	para "¡Ahora me encanta"
	line "jugar fuera con"
	cont "los #mon!"
	done

.BeatenText:
	text "¡Argh!"
	done

GenericTrainerPicnickerAdrian:
	generictrainer PICNICKER, ADRIAN, EVENT_BEAT_PICNICKER_ADRIAN, .SeenText, .BeatenText

	text "¡Aunque perdí,"
	line "me lo pasé en"
	cont "grande!"
	done

.SeenText:
	text "¿Llevas prisa?"

	para "¿Qué tal una pausa"
	line "para un combate"
	cont "rápido?"
	done

.BeatenText:
	text "Aaaah… se acabó."
	done

GenericTrainerCamperPedro:
	generictrainer CAMPER, PEDRO, EVENT_BEAT_CAMPER_PEDRO, .SeenText, .BeatenText

	text "Si te falta manta,"
	line "¡acurrúcate con un"
	cont "#mon caliente!"
	done

.SeenText:
	text "¿Alguna vez has"
	line "ido de acampada"
	cont "con #mon?"
	done

.BeatenText:
	text "¡Qué fuerte eres!"
	done

GenericTrainerBird_keeperBert:
	generictrainer BIRD_KEEPER, BERT, EVENT_BEAT_BIRD_KEEPER_BERT, .SeenText, .BeatenText

	text "¡Ha sido un duelo"
	line "increíble!"

	para "¡Tengo la piel de"
	line "gallina!"
	done

.SeenText:
	text "¡Por fin! ¡Alguien"
	line "con quien da gusto"
	cont "luchar!"
	done

.BeatenText:
	text "¡Luché con todas"
	line "mis fuerzas!"
	done

GenericTrainerBird_keeperErnie:
	generictrainer BIRD_KEEPER, ERNIE, EVENT_BEAT_BIRD_KEEPER_ERNIE, .SeenText, .BeatenText

	text "¡Tienes un brillo"
	line "muy especial!"
	done

.SeenText:
	text "¡Oye! ¿Lucharías"
	line "contra mí?"
	done

.BeatenText:
	text "Ha sido bastante"
	line "impresionante."
	done

CinnabarGymSignText:
	text "Islas Espuma"

	para "¿Qué pone en este"
	line "aviso…?"

	para "Gimnasio de Isla"
	line "Canela"
	cont "Líder: Blaine"
	done

SeafoamIslandsSignText:
	text "Islas Espuma"
	done
