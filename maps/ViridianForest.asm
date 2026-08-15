ViridianForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  5, VIRIDIAN_FOREST_PEWTER_GATE, 1
	warp_event 18, 47, VIRIDIAN_FOREST_VIRIDIAN_GATE, 1
	warp_event 19, 47, VIRIDIAN_FOREST_VIRIDIAN_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  4,  7, BGEVENT_JUMPTEXT, ViridianForestSignText1
	bg_event  6, 26, BGEVENT_JUMPTEXT, ViridianForestSignText2
	bg_event 28, 19, BGEVENT_JUMPTEXT, ViridianForestSignText3
	bg_event 18, 34, BGEVENT_JUMPTEXT, ViridianForestSignText4
	bg_event 26, 42, BGEVENT_JUMPTEXT, ViridianForestSignText5
	bg_event 20, 44, BGEVENT_JUMPTEXT, ViridianForestSignText6
	bg_event 32, 44, BGEVENT_ITEM + MAX_ETHER, EVENT_VIRIDIAN_FOREST_HIDDEN_MAX_ETHER
	bg_event 18, 43, BGEVENT_ITEM + FULL_HEAL, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_HEAL
	bg_event  4, 43, BGEVENT_ITEM + MULCH, EVENT_VIRIDIAN_FOREST_HIDDEN_MULCH
	bg_event 30,  9, BGEVENT_ITEM + BIG_MUSHROOM, EVENT_VIRIDIAN_FOREST_HIDDEN_BIG_MUSHROOM
	bg_event  3, 14, BGEVENT_ITEM + LEAF_STONE, EVENT_VIRIDIAN_FOREST_HIDDEN_LEAF_STONE

	def_object_events
	object_event 29, 42, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBug_maniacDane, -1
	object_event 33, 35, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBug_maniacDion, -1
	object_event 32, 21, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBug_maniacStacey, -1
	object_event 31,  4, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_maniacEllis, -1
	object_event  5, 24, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBug_maniacAbner, -1
	itemball_event 14, 31, DIRE_HIT, 1, EVENT_ROUTE_2_DIRE_HIT
	itemball_event  3, 33, MAX_POTION, 1, EVENT_ROUTE_2_MAX_POTION

GenericTrainerBug_maniacDane:
	generictrainer BUG_MANIAC, DANE, EVENT_BEAT_BUG_MANIAC_DANE, BugManiacDaneSeenText, BugManiacDaneBeatenText

	text "¡Impresionante!"

	para "¡Seguro que puedes"
	line "ir a donde sea con"
	cont "esa habilidad!"
	done

GenericTrainerBug_maniacDion:
	generictrainer BUG_MANIAC, DION, EVENT_BEAT_BUG_MANIAC_DION, BugManiacDionSeenText, BugManiacDionBeatenText

	text "Los #mon de tipo"
	line "Bicho hacen todo"
	cont "tipo de sonidos."

	para "Para los fans de"
	line "los #mon bicho,"
	cont "¡saber distinguir-"
	cont "los es la clave!"
	done

GenericTrainerBug_maniacStacey:
	generictrainer BUG_MANIAC, STACEY, EVENT_BEAT_BUG_MANIAC_STACEY, BugManiacStaceySeenText, BugManiacStaceyBeatenText

	text "¿Te dijeron que"
	line "de espaldas te"
	cont "pareces a un"
	cont "Venonat?"
	done

GenericTrainerBug_maniacEllis:
	generictrainer BUG_MANIAC, ELLIS, EVENT_BEAT_BUG_MANIAC_ELLIS, BugManiacEllisSeenText, BugManiacEllisBeatenText

	text "Si es contra ti,"
	line "¡no me importa"
	cont "perder!"
	done

GenericTrainerBug_maniacAbner:
	generictrainer BUG_MANIAC, ABNER, EVENT_BEAT_BUG_MANIAC_ABNER, BugManiacAbnerSeenText, BugManiacAbnerBeatenText

	text "Da igual qué clase"
	line "de #mon sea…"

	para "Mientras te gus-"
	line "ten, todos te pa-"
	cont "recerán monos."
	done

BugManiacDaneSeenText:
	text "Te doy la bienve-"
	line "nida al Bosque"
	cont "Verde."

	para "¡Disfruta de mis"
	line "#mon tipo Bicho!"
	done

BugManiacDaneBeatenText:
	text "Es maravilloso…"
	done

BugManiacDionSeenText:
	text "¡Ssshh! ¡Silencio!"
	line "¡Los #mon bicho"
	cont "van a huir!"
	done

BugManiacDionBeatenText:
	text "Uf…"
	done

BugManiacStaceySeenText:
	text "¡Hala, menudo"
	line "#mon tan ENORME!"

	para "…"
	line "…¡¿Pero qué clase"
	cont "de entrenador?!"
	done

BugManiacStaceyBeatenText:
	text "¡No pude atrapar-"
	line "lo!"
	done

BugManiacEllisSeenText:
	text "No hay nada más"
	line "eficiente y bello"

	para "que un #mon de"
	line "tipo Bicho."
	done

BugManiacEllisBeatenText:
	text "¡He perdido con"
	line "gran elegancia!"
	done

BugManiacAbnerSeenText:
	text "Muchos prefieren"
	line "#mon bicho duros"

	para "antes que blandos"
	line "y viscosos."
	done

BugManiacAbnerBeatenText:
	text "Gracias por esfor-"
	line "zaros, mis que-"
	cont "ridos #mon…"
	done

ViridianForestSignText1:
	text "Salida del"
	line "Bosque Verde"

	para "Ciudad Plateada"
	line "más adelante"
	done

ViridianForestSignText2:
	text "Pistas Entrenador"

	para "¡Guarda bien esa"
	line "Seta Grande!"

	para "¡Hay coleccionis-"
	line "tas que pagan mu-"
	cont "cho por objetos"
	cont "aparentemente inú-"
	cont "tiles!"
	done

ViridianForestSignText3:
	text "Pistas Entrenador"

	para "¡Los #mon de"
	line "tipo Planta no se"

	para "ven afectados por"
	line "polvos ni esporas!"
	done

ViridianForestSignText4:
	text "¡Contra el veneno,"
	line "usa Antídoto!"

	para "¡De venta en las"
	line "Tiendas #mon!"
	done

ViridianForestSignText5:
	text "Pistas Entrenador"

	para "¡Los #mon de"
	line "tipo Veneno no"
	cont "pueden ser enve-"
	cont "nenados!"
	done

ViridianForestSignText6:
	text "Pistas Entrenador"

	para "¡Debilita a los"
	line "#mon antes de"
	cont "intentar atrapar-"
	cont "los!"

	para "¡Si están sanos,"
	line "podrían escapar!"
	done
