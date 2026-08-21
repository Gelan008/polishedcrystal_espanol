CeruleanBikeShop_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 8
	warp_event  3,  7, CERULEAN_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopClerkScript, -1

CeruleanBikeShopClerkScript:
	showtextfaceplayer CeruleanBikeShopClerkText
	turnobject LAST_TALKED, UP
	end

CeruleanBikeShopClerkText:
	text "Hace mucho, un"
	line "chico guay usaba"
	cont "mi Bici,"

	para "y eso provocó el"
	line "boom de las Bicis."

	para "Entonces decidí"
	line "abrir una sucursal"
	cont "en Trigal."

	para "¡Y se vendieron"
	line "como la espuma!"

	para "Pero ya nadie"
	line "viene a esta"
	cont "tienda."

	para "Solo me queda un"
	line "inflador de bicis…"

	para "¿Debería vender"
	line "cámaras inflables?"
	done
