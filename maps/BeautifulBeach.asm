BeautifulBeach_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 23, SEAGALLOP_FERRY_SHAMOUTI_GATE, 1
	warp_event 12, 23, SEAGALLOP_FERRY_SHAMOUTI_GATE, 1
	warp_event 27, 18, BEAUTIFUL_BEACH_VILLA, 1

	def_coord_events

	def_bg_events
	bg_event 14, 21, BGEVENT_JUMPTEXT, BeautifulBeachWelcomeSignText
	bg_event 29, 19, BGEVENT_JUMPTEXT, BeautifulBeachVillaSignText

	def_object_events
	object_event 11, 18, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyBryony, -1
	object_event 26, 26, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSightseermJaska, -1
	object_event 33, 23, SPRITE_TAMER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerTamerVince, -1
	object_event  5, 22, SPRITE_LADY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerfRosie, -1
	object_event 12, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfRachel, -1
	object_event 27, 13, SPRITE_ARTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerArtistMarlene, -1
	itemball_event  6, 19, LUXURY_BALL, 1, EVENT_BEAUTIFUL_BEACH_LUXURY_BALL
	itemball_event 36, 20, FULL_RESTORE, 1, EVENT_BEAUTIFUL_BEACH_FULL_RESTORE
	fruittree_event -2, 13, FRUITTREE_SHAMOUTI_ISLAND, FIGY_BERRY, PAL_NPC_BROWN

BeautifulBeachWelcomeSignText:
	text "¡Bienvenido a la"
	line "Isla Shamouti!"

	para "La isla principal"
	line "está justo al"
	cont "oeste."
	done

BeautifulBeachVillaSignText:
	text "Villa Isleña"
	done

GenericTrainerAromaLadyBryony:
	generictrainer AROMA_LADY, BRYONY, EVENT_BEAT_AROMA_LADY_BRYONY, .SeenText, .BeatenText

	text "Siempre me"
	line "invigorizan los"
	cont "aromas de aquí."
	done

.SeenText:
	text "Flores"
	line "tropicales,"
	cont "brisa marina…"

	para "¡La Isla Shamouti"
	line "está llena de"
	cont "deliciosos aromas!"
	done

.BeatenText:
	text "¿Acaso el aroma de"
	line "la isla te inspiró"
	cont "a ganar?"
	done

GenericTrainerSightseermJaska:
	generictrainer SIGHTSEERM, JASKA, EVENT_BEAT_SIGHTSEERM_JASKA, .SeenText, .BeatenText

	text "Sé que es una"
	line "tontería, pero me"
	cont "siento más seguro"
	cont "viajando con un"
	cont "amuleto de la"
	cont "suerte."
	done

.SeenText:
	text "Mis calcetines de"
	line "la suerte me"
	cont "mantienen a salvo"
	cont "en mis viajes."
	done

.BeatenText:
	text "No me ayudan a"
	line "ganar combates…"
	done

GenericTrainerTamerVince:
	generictrainer TAMER, VINCE, EVENT_BEAT_TAMER_VINCE, .SeenText, .BeatenText

	text "Mis #mon están"
	line "domados"
	cont "por un experto,"

	para "¡pero yo sigo"
	line "siendo tan salvaje"
	cont "como siempre!"
	done

.SeenText:
	text "¡Mi espíritu"
	line "rugidor nunca"
	cont "será domado!"
	done

.BeatenText:
	text "¡¿Ñe?! ¡ROAR!"
	done

GenericTrainerSightseerfRosie:
	generictrainer SIGHTSEERF, ROSIE, EVENT_BEAT_SIGHTSEERF_ROSIE, .SeenText, .BeatenText

	text "¡La Isla Shamouti"
	line "tiene mucha"
	cont "historia!"

	para "No puedo esperar"
	line "a fotografiarla."
	done

.SeenText:
	text "El santuario, los"
	line "tres templos, las"
	cont "antiguas ruinas…"
	cont "¿Adónde ir"
	cont "primero?"
	done

.BeatenText:
	text "Supongo que el"
	line "Centro #mon"
	cont "es lo primero."
	done

TrainerSwimmerfRachel:
	trainer SWIMMERF, RACHEL, EVENT_BEAT_SWIMMERF_RACHEL, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Podría pasarme"
	line "todo el día en"
	cont "este agua."
	done

.SeenText:
	text "Arena blanca y"
	line "agua azul…"

	para "¡La Costa Bella"
	line "hace honor a su"
	cont "nombre!"
	done

.BeatenText:
	text "¡Peleas de forma"
	line "preciosa!"
	done

GenericTrainerArtistMarlene:
	generictrainer ARTIST, MARLENE, EVENT_BEAT_ARTIST_MARLENE, .SeenText, .BeatenText

	text "Los tres colores"
	line "primarios de la"
	cont "pintura son rojo,"
	cont "azul y amarillo."

	para "Pero para la luz"
	line "son rojo, azul y"
	cont "verde."
	done

.SeenText:
	text "¡Mi trío de"
	line "Smeargle puede"
	cont "pintar cualquier"
	cont "escena!"
	done

.BeatenText:
	text "No han podido"
	line "ganar ni un"
	cont "combate…"
	done
