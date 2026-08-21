BlackthornGym1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBoulderCallback

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
	object_event  1, 14, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerDragonTamerPaul, -1
	object_event  6,  6, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCooltrainermMike, -1
	object_event  9,  2, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainerfLola, -1

BlackthornGym1FBoulderCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalsefwd .skip1
	changeblock 8, 2, $3b
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalsefwd .skip2
	changeblock 2, 4, $3a
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalsefwd .skip3
	changeblock 8, 6, $3b
.skip3
	endcallback

BlackthornGymStatue:
	gettrainername CLAIR, 1, STRING_BUFFER_4
	checkflag ENGINE_RISINGBADGE
	iftruefwd .Beaten
	jumpstd gymstatue1
.Beaten:
	readvar VAR_BADGES
	ifgreater 15, .LyraToo
	jumpstd gymstatue2
.LyraToo
	jumpstd gymstatue3

BlackthornGymClairScript:
	checkflag ENGINE_RISINGBADGE
	iftrue_jumptextfaceplayer ClairPokemonLeagueDirectionsText
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .TooMuchToExpectText
	showtextfaceplayer .IntroText
	winlosstext .WinText, 0
	loadtrainer CLAIR, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	showtext .GoToDragonsDenText
	setevent EVENT_BEAT_DRAGON_TAMER_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.IntroText:
	text "Soy Débora."

	para "La mejor maestra"
	line "dragón del mundo."

	para "Puedo defenderme"
	line "incluso contra el"
	cont "Alto Mando de la"
	cont "Liga #mon."

	para "¿Aún quieres"
	line "enfrentarte a mí?"

	para "…Bien."
	line "¡Hagámoslo!"

	para "¡Como Líder de"
	line "Gimnasio, usaré"
	cont "todo mi poder"
	cont "contra cualquier"
	cont "oponente!"
	done

.WinText:
	text "I lost?"

	para "I don't believe"
	line "it. There must be"
	cont "some mistake…"
	done

.GoToDragonsDenText:
	text "No lo admitiré."

	para "Puede que haya"
	line "perdido, pero no"
	cont "estás listo para"
	cont "la Liga #mon."

	para "Ya sé. Deberías"
	line "hacer el desafío"
	cont "del maestro"
	cont "Dragón."

	para "Detrás de este"
	line "Gimnasio hay un"
	cont "sitio llamado"
	cont "Guarida Dragón."

	para "Hay un pequeño"
	line "santuario en el"
	cont "centro. Ve allí."

	para "Si puedes probar"
	line "que has superado"
	cont "tus ideales"
	cont "perezosos, te"
	cont "reconoceré como un"
	cont "entrenador digno"
	cont "de una Medalla."
	done

.TooMuchToExpectText:
	text "¿Qué pasa?"

	para "¿Es mucho"
	line "esperar esto de"
	cont "ti?"
	done

ClairPokemonLeagueDirectionsText:
	text "¿Qué pasa?"

	para "¿No te diriges a"
	line "la Liga #mon?"

	para "¿Sabes cómo llegar"
	line "allí?"

	para "Desde aquí, ve a"
	line "Pueblo Primavera."
	cont "Luego haz Surf"
	cont "hacia el este."

	para "La ruta hasta allí"
	line "es muy dura."

	para "¡Ni se te ocurra"
	line "perder en la Liga"
	cont "#mon!"

	para "¡Si lo haces, me"
	line "sentiré aún peor"
	cont "por haber perdido"
	cont "contra ti!"

	para "Da todo lo que"
	line "tienes."
	done

BlackthornGymGuyScript:
	checkevent EVENT_BEAT_CLAIR
	iftrue_jumptextfaceplayer .WinText
	jumpthistextfaceplayer

	text "Yo! Champ in"
	line "making!"

	para "It's been a long"
	line "journey, but we"

	para "are almost done!"
	line "Count on me!"

	para "Clair uses the"
	line "mythical and sac-"
	cont "red Dragon-type"
	cont "#mon."

	para "You can't damage"
	line "them very easily."

	para "But you know,"
	line "they're supposed"

	para "to be weak against"
	line "Ice-type moves."
	done

.WinText:
	text "¡Has estado genial"
	line "venciendo a"
	cont "Débora!"

	para "Solo queda el"
	line "desafío de la"
	cont "Liga #mon."

	para "¡Estás en camino a"
	line "ser el Campeón"
	cont "#mon!"
	done

GenericTrainerDragonTamerPaul:
	generictrainer DRAGON_TAMER, PAUL, EVENT_BEAT_DRAGON_TAMER_PAUL, .SeenText, .BeatenText

	text "Lance told you"
	line "that he'd like to"

	para "see you again?"
	line "Not a chance!"
	done

.SeenText:
	text "Your first battle"
	line "against dragons?"

	para "I'll show you how"
	line "tough they are!"
	done

.BeatenText:
	text "My dragon #mon"
	line "lost?"
	done

GenericTrainerCooltrainermMike:
	generictrainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, .SeenText, .BeatenText

	text "I know my short-"
	line "comings now."

	para "Thanks for showing"
	line "me!"
	done

.SeenText:
	text "My chance of"
	line "losing? Not even"
	cont "one percent!"
	done

.BeatenText:
	text "That's odd."
	done

GenericTrainerCooltrainerfLola:
	generictrainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, .SeenText, .BeatenText

	text "Dragons are weak"
	line "against Dragon-"
	cont "type moves."
	done

.SeenText:
	text "Los dragones son"
	line "#mon sagrados."

	para "Están llenos de"
	line "energía vital."

	para "Si no vas en"
	line "serio, no podrás"
	cont "vencerlos."
	done

.BeatenText:
	text "¡Bien hecho!"
	done
