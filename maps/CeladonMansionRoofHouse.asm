CeladonMansionRoofHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1

CeladonMansionRoofHousePharmacistScript:
	checkevent EVENT_GOT_TM03_CURSE
	iftrue_jumptextfaceplayer .CurseText
	faceplayer
	opentext
	writetext .IntroText
	promptbutton
	checktime 1 << NITE
	iffalse_jumpopenedtext .NotNiteText
	writetext .StoryText
	promptbutton
	verbosegivetmhm TM_CURSE
	setevent EVENT_GOT_TM03_CURSE
	jumpthisopenedtext

.CurseText:
	text "La MT03 contiene"
	line "Maldición."

	para "Es un movimiento"
	line "terrorífico que"
	cont "drena poco a poco"
	cont "los PS del rival."
	done

.IntroText:
	text "Déjame contarte"
	line "una historia"
	cont "terrorífica…"
	done

.NotNiteText:
	text "Aunque no asusta"
	line "tanto de día."

	para "Vuelve cuando se"
	line "ponga el sol, ¿ok?"
	done

.StoryText:
	text "Érase una vez un"
	line "niño al que le"
	cont "regalaron una Bici"
	cont "nueva…"

	para "Quiso probarla al"
	line "instante…"

	para "Se divertía tanto"
	line "que no vio cómo se"
	cont "hacía de noche…"

	para "De vuelta a casa"
	line "en la oscuridad,"

	para "¡la bici empezó a"
	line "ir más despacio!"

	para "¡Los pedales eran"
	line "muy pesados!"

	para "¡Y cuando dejó de"
	line "pedalear, ¡la bici"
	cont "iba hacia atrás!"

	para "¡Era como si"
	line "estuviese maldita"
	cont "y quisiera tirarlo"
	cont "al abismo!"

	para "…"

	para "…"

	para "¡AAAAAAAAAH!"

	para "¡Resulta que el"
	line "niño iba cuesta"
	cont "arriba por el"
	cont "Camino de Bicis!"

	para "…"
	line "¡Ba-dum tsss!"

	para "Por escuchar tan"
	line "atento, ¡te daré"
	cont "esto: la MT03!"
	done
