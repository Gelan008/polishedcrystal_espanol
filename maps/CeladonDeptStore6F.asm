CeladonDeptStore6F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 15,  0, CELADON_DEPT_STORE_5F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_JUMPTEXT, CeladonDeptStore6FDirectoryText

	def_object_events
	object_event  9,  2, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore6FSuperNerdText, -1
	object_event 12,  5, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 2, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, CeladonDeptStore6FYoungsterText, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event  6,  1, SPRITE_GAMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1

CeladonDeptStore3FGameboyKid1Script:
	showtextfaceplayer CeladonDeptStore3FGameboyKid1Text
	turnobject LAST_TALKED, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	showtextfaceplayer CeladonDeptStore3FGameboyKid2Text
	turnobject LAST_TALKED, DOWN
	end

CeladonDeptStore6FSuperNerdText:
	text "Una expendedora"
	line "con ruleta de"
	cont "premios…"

	para "Ya no se ven"
	line "de esas."
	done

CeladonDeptStore6FYoungsterText:
	text "¡Puedo jugar a"
	line "videojuegos en la"
	cont "segunda planta y"
	cont "luego venir aquí"
	cont "si tengo sed!"

	para "¡Esta tienda es"
	line "genial!"
	done

CeladonDeptStore3FGameboyKid1Text:
	text "Intercambié a mi"
	line "#mon mientras"
	cont "llevaba una"
	cont "Mejora."
	done

CeladonDeptStore3FGameboyKid2Text:
	text "¡Bieeen! ¡Por fin"
	line "tengo a Porygon!"

	para "Soy malísima en"
	line "las tragaperras y"
	cont "no podía reunir"
	cont "tantas monedas…"

	para "¡Lo intercambiaré"
	line "con Mejora para"
	cont "hacerlo"
	cont "evolucionar!"
	done

CeladonDeptStore6FDirectoryText:
	text "P5: Atrio de la"
	line "Azotea"
	cont "Máq. Expendedoras"
	done
