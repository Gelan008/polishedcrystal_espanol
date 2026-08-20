Route19FuchsiaGate_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY, 9
	warp_event  5,  0, FUCHSIA_CITY, 10
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1

Route19FuchsiaGateOfficerScript:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue_jumptextfaceplayer Route19FuchsiaGateOfficerText_RocksCleared
	jumpthistextfaceplayer

	text "El volcán de Isla"
	line "Canela ha entrado"
	cont "en erupción."

	para "Escupió rocas que"
	line "cortaron la Ruta"
	cont "19 por tiempo"
	cont "indefinido."

	para "Me pregunto si los"
	line "habitantes de Isla"
	cont "Canela estarán a"
	cont "salvo…"
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "Ningún habitante"
	line "de Isla Canela"
	cont "sufrió daños por"
	cont "la erupción."

	para "¡Menos mal!"
	done
