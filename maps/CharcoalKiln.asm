CharcoalKiln_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 2
	warp_event  4,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  9,  1, BGEVENT_JUMPTEXT, CharcoalKilnBucketText

	def_object_events
	object_event  1,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  4,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  8,  6, SPRITE_FARFETCH_D, SPRITEMOVEDATA_WANDER, 2, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchdScript, EVENT_CHARCOAL_KILN_FARFETCH_D

CharcoalKilnBoss:
	checkevent EVENT_GOT_HM01_CUT
	iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Los Slowpoke"
	line "han desaparecido"
	cont "del pueblo."

	para "El protector del"
	line "bosque puede es-"
	cont "tar enfadado…"

	para "Es un mal presa-"
	line "gio. Deberíamos"
	cont "quedarnos aquí."
	done

.Text2:
	text "Los Slowpoke han"
	line "vuelto…"

	para "Pero mi Aprendiz"
	line "no ha vuelto"
	cont "del Encinar."

	para "¿Dónde se habrá"
	line "metido ese hol-"
	cont "gazán?"
	done

.Text3:
	text "¿Ahuyentaste al"
	line "Team Rocket y"

	para "fuiste al Encinar"
	line "tú solo?"

	para "¡Tienes agallas!"
	line "Eso me gusta. Ven"
	cont "a entrenar con"
	cont "nosotros."
	done

CharcoalKilnApprentice:
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue_jumptextfaceplayer .Text3
	checkevent EVENT_GOT_HM01_CUT
	iffalse_jumptextfaceplayer .Text1
	faceplayer
	opentext
	writetext .Text2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse_endtext
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	endtext

.Text1:
	text "¿Adónde han ido"
	line "los Slowpoke?"

	para "¿Estarán jugando"
	line "por ahí?"
	done

.Text2:
	text "Lo siento, olvidé"
	line "darte las"
	cont "gracias."

	para "Este Carbón lo"
	line "hice yo."

	para "A los #mon de"
	line "fuego les gus-"
	cont "tará llevarlo."
	done

.Text3:
	text "Los Slowpoke"
	line "volvieron y tú"
	cont "encontraste a"
	cont "Farfetch'd."

	para "¡Molas mucho,"
	line "tío!"
	done

CharcoalKilnFarfetchdScript:
	faceplayer
	showcrytext .Text, FARFETCH_D
	end

.Text:
	text "Farfetch'd:"
	line "¡Kwaa!"
	done

CharcoalKilnBucketText:
	text "Es un cubo."
	done
