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

	text "Siempre me in-"
	line "vigorizan los aro-"
	cont "mas de aquí."
	done

.SeenText:
	text "Flores tropica-"
	line "les, brisa ma-"
	cont "rina..."

	para "¡La Isla Shamouti"
	line "está llena de de-"
	cont "liciosos aromas!"
	done

.BeatenText:
	text "¿Acaso el aroma de"
	line "la isla te inspi-"
	cont "ró a ganar?"
	done

GenericTrainerSightseermJaska:
	generictrainer SIGHTSEERM, JASKA, EVENT_BEAT_SIGHTSEERM_JASKA, .SeenText, .BeatenText

	text "Sé que es una ton-"
	line "tería, pero me"
	cont "siento más seguro"

	para "viajando con un"
	line "amuleto de la"
	cont "suerte."
	done

.SeenText:
	text "Mis calcetines de"
	line "la suerte me"

	para "mantienen a salvo"
	line "en mis viajes."
	done

.BeatenText:
	text "Pero no me ayudan"
	line "a ganar combates..."
	done

GenericTrainerTamerVince:
	generictrainer TAMER, VINCE, EVENT_BEAT_TAMER_VINCE, .SeenText, .BeatenText

	text "Mis #mon están"
	line "domados experta-"
	cont "mente,"

	para "¡pero yo sigo sien-"
	line "do tan salvaje"
	cont "como siempre!"
	done

.SeenText:
	text "¡Mi espíritu rugi-"
	line "dor nunca será do-"
	cont "mado!"
	done

.BeatenText:
	text "¡¿Ñe?! ¡ROAR!"
	done

GenericTrainerSightseerfRosie:
	generictrainer SIGHTSEERF, ROSIE, EVENT_BEAT_SIGHTSEERF_ROSIE, .SeenText, .BeatenText

	text "¡La Isla Shamouti"
	line "tiene mucha his-"
	cont "toria!"

	para "No puedo esperar"
	line "a fotografiarla."
	done

.SeenText:
	text "El santuario, los"
	line "tres templos, las"
	cont "antiguas ruinas..."
	cont "¿Adónde ir pri-"
	cont "mero?"
	done

.BeatenText:
	text "Supongo que el Cen-"
	line "tro #mon es lo"
	cont "primero."
	done

TrainerSwimmerfRachel:
	trainer SWIMMERF, RACHEL, EVENT_BEAT_SWIMMERF_RACHEL, .SeenText, .BeatenText, 0, .Script, TRAINERPAL_DARK_SWIMMERF

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Podría pasarme to-"
	line "do el día en este"
	cont "agua."
	done

.SeenText:
	text "Arena blanca y"
	line "agua azul..."

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
	cont "pintura"

	para "son rojo, azul"
	line "y amarillo."

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
	text "Pero no pudieron"
	line "ganar un combate..."
	done
