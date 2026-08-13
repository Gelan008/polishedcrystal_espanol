SlowpokeWellB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	itemball_event 15,  5, DAMP_ROCK, 1, EVENT_SLOWPOKE_WELL_B2F_DAMP_ROCK

SlowpokeWellB2FGymGuideScript:
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue_jumptextfaceplayer SlowpokeWellB2FGymGuideText_GotKingsRock
	faceplayer
	opentext
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem KINGS_ROCK
	iffalse_endtext
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	endtext

SlowpokeWellB2FGymGuideText:
	text "Espero a ver el"
	line "momento de la evo-"
	cont "lución de Slowpo-"
	cont "ke."

	para "De tanto observar,"
	line "hice un nuevo des-"
	cont "cubrimiento."

	para "A un Slowpoke con"
	line "Roca del Rey"

	para "a menudo le muerde"
	line "un Shellder."

	para "Toma, compartiré"
	line "una Roca del Rey"
	cont "contigo."
	done

SlowpokeWellB2FGymGuideText_GotKingsRock:
	text "Voy a ser como un"
	line "Slowpoke."

	para "Esperaré paciente-"
	line "mente hasta que"
	cont "vea uno evolucio-"
	cont "nar."
	done
