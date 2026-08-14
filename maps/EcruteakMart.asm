EcruteakMart_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, ECRUTEAK_CITY, 9
	warp_event  3,  7, ECRUTEAK_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_ECRUTEAK
	object_event  5,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakMartSuperNerdText, -1
	object_event  6,  6, SPRITE_RICH_BOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakMartGrannyText, -1

EcruteakMartSuperNerdText:
	text "Mi Eevee evolucio-"
	line "nó a un Espeon."

	para "Pero el Eevee de"
	line "mi amigo se con-"
	cont "virtió en Umbreon."

	para "¿Por qué será?"
	line "Ambos estábamos"

	para "criando a nuestro"
	line "Eevee de la misma"
	cont "manera…"
	done

EcruteakMartGrannyText:
	text "El Magnetotrén de"
	line "Trigal es genial,"
	cont "pero al principio"

	para "también había pla-"
	line "nes para poner una"
	cont "estación en Iris."
	done
