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
	text "MT03 es Maldición."

	para "Es un ataque"
	line "terrorífico que"

	para "reduce poco a po-"
	line "co los PS de su"
	cont "víctima."
	done

.IntroText:
	text "Déjame contarte"
	line "una historia"
	cont "terrorífica…"
	done

.NotNiteText:
	text "Aunque no da"
	line "tanto miedo mien-"

	para "tras siga habiendo"
	line "luz afuera."

	para "Vuelve cuando se"
	line "ponga el sol, ¿ok?"
	done

.StoryText:
	text "Érase una vez,"
	line "un niño pequeño"

	para "al que le regala-"
	line "ron una nueva"
	cont "Bici…"

	para "Él quería probarla"
	line "inmediatamente…"

	para "Se estaba divir-"
	line "tiendo tanto que"

	para "no se dio cuenta"
	line "de que anochecía…"

	para "De vuelta a casa"
	line "en la oscura no-"
	cont "che,"

	para "¡la bici empezó a"
	line "ir más lento!"

	para "¡Los pedales se"
	line "volvieron pesa-"
	cont "dos!"

	para "¡Y cuando dejó de"
	line "pedalear, la bici"

	para "empezó a ir ha-"
	line "cia atrás!"

	para "¡Era como si es-"
	line "tuviera maldita y"

	para "tratara de arras-"
	line "trarle al olvido!"

	para "…"

	para "…"

	para "¡AAAAAAAAAAAAAAAA!"

	para "¡Resulta que el ni"
	line "ño iba cuesta ar-"
	cont "riba por el Cami-"
	cont "no de Bicis!"

	para "…"
	line "¡Ba-dum ba-dum!"

	para "Por escuchar tan"
	line "pacientemente, ¡te"
	cont "daré esto--MT03!"
	done
