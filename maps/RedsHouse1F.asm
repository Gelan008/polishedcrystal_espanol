RedsHouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  5,  1, BGEVENT_UP, RedsHouse1FTVScript

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1

RedsMom:
	checkevent EVENT_MET_REDS_MOM
	iftrue_jumptextfaceplayer .Text2
	setevent EVENT_MET_REDS_MOM
	jumpthistextfaceplayer

	text "¡Hola!"

	para "Rojo lleva fuera"
	line "mucho tiempo."

	para "Tampoco ha llamado"
	line "y no sé dónde está"
	cont "ni qué hace."

	para "Dicen que no saber"
	line "de alguien son"
	cont "buenas noticias,"

	para "¡pero me preocupo"
	line "mucho por él!"
	done

.Text2:
	text "Me preocupa que"
	line "Rojo se haga daño"
	cont "o enferme…"

	para "Pero es un chico"
	line "que hace lo que"
	cont "desea hacer y eso"
	cont "me enorgullece."
	done

RedsHouse1FTVScript:
	jumpthistext

	text "Echan programas"
	line "que no ponen en"
	cont "Johto…"
	done
