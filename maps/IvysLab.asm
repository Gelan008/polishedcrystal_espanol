IvysLab_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4, 11, VALENCIA_ISLAND, 1
	warp_event  5, 11, VALENCIA_ISLAND, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_JUMPTEXT, IvysLabWindowText
	bg_event  2,  1, BGEVENT_READ, IvysLabHealingMachine
	bg_event  6,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  1, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  0,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  1,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  2,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  3,  7, BGEVENT_READ, PokemonJournalProfIvyScript
	bg_event  6,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  7,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  8,  7, BGEVENT_JUMPSTD, difficultbookshelf
	bg_event  9,  7, BGEVENT_JUMPSTD, difficultbookshelf

	def_object_events
	object_event  4,  3, SPRITE_IVY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfIvyScript, -1
	object_event  5,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, NIDORINO, -1, PAL_MON_PURPLE, OBJECTTYPE_SCRIPT, NO_FORM, IvysLabNidorinoScript, -1
	object_event  2,  9, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, IvysLabHopeScript, -1

	object_const_def
	const IVYSLAB_IVY
	const IVYSLAB_NIDORINO

ProfIvyScript:
	faceplayer
	opentext
	checkevent EVENT_HEALED_NIDORINO
	iftruefwd .GetItem
	writetext .RequestText
	yesorno
	iffalse_jumpopenedtext .NoBerryText
	checkitem LIECHI_BERRY
	iffalse_jumpopenedtext .NoBerryText
	takeitem LIECHI_BERRY
	checkitem LIECHI_BERRY
	iffalsefwd .Return1
	takeitem LIECHI_BERRY
	checkitem LIECHI_BERRY
	iffalsefwd .Return2
	takeitem LIECHI_BERRY
	writetext .OkayText
	waitbutton
	closetext
	turnobject IVYSLAB_IVY, RIGHT
	pause 15
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	pause 15
	showcrytext IvysLabNidorinoText, NIDORINO
	showemote EMOTE_HAPPY, IVYSLAB_NIDORINO, 15
	setevent EVENT_HEALED_NIDORINO
	setlasttalked IVYSLAB_IVY
	faceplayer
	opentext
.GetItem
	checkevent EVENT_GOT_MOON_STONE_FROM_IVY
	iftruefwd .GotItem
	writetext .ThanksText
	promptbutton
	verbosegiveitem MOON_STONE
	iffalse_endtext
	setevent EVENT_GOT_MOON_STONE_FROM_IVY
.GotItem:
	checkevent EVENT_BEAT_PROF_IVY
	iftrue_jumpopenedtext .AfterText
	writetext .ChallengeText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked IVYSLAB_IVY
	loadtrainer PROF_IVY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PROF_IVY
	jumptext .AfterText

.Return2:
	giveitem LIECHI_BERRY
.Return1:
	giveitem LIECHI_BERRY
	jumpthisopenedtext

	text "Ivy: Lo en-"
	line "tiendo..."

	para "No te sobran tres"
	line "Bayas Lichi."
	done

.RequestText:
	text "Ivy: ¡Hola de"
	line "nuevo, <PLAYER>!"

	para "¿Puedo pedirte un"
	line "favor?"

	para "Este Nidorino"
	line "está enfermo y"

	para "mis Bayas Ziuela"
	line "no le ayudan."

	para "¿Puedes encontrar"
	line "tres Bayas Lichi"
	cont "para él?"
	done

.OkayText:
	text "Ivy: ¡Perfecto!"
	line "¡Gracias,"
	cont "<PLAYER>!"

	para "A ver si esto"
	line "ayuda a Nidorino..."
	done

.ThanksText:
	text "Ivy: ¡Gracias,"
	line "<PLAYER>!"

	para "¡Nidorino se ve"
	line "mucho más sano!"

	para "Por favor, toma"
	line "esto por las mo-"
	cont "lestias."
	done

.ChallengeText:
	text "Ivy: Me vendría"
	line "bien un descanso"
	cont "del trabajo."

	para "¿Qué tal un com-"
	line "bate rápido?"
	done

.NoText:
	text "Vaya, seguiré"
	line "entonces con mi"
	cont "investigación."
	done

.SeenText:
	text "Profesora contra"
	line "Campeón... ¡Vamos!"
	done

.BeatenText:
	text "¡No me sorpren-"
	line "des!"
	done

.AfterText:
	text "Ivy: ¡Fue un"
	line "combate apasio-"
	cont "nante!"
	done

IvysLabHopeScript:
	checkevent EVENT_HEALED_NIDORINO
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Hope: La Prof. Ivy"
	line "cuida de los #-"
	cont "mon de esta isla."

	para "Ahora mismo está"
	line "atendiendo a un"
	cont "Nidorino enfermo."
	done

.Text2:
	text "Hope: ¡Gracias por"
	line "ayudar con ese"
	cont "Nidorino!"
	done

IvysLabNidorinoScript:
	checkevent EVENT_HEALED_NIDORINO
	iftruefwd .Healed
	opentext
	writetext .WeakCry
	setmonval NIDORINO
	special PlaySlowCry
	promptbutton
	jumpthisopenedtext

	text "Su llanto es"
	line "débil..."
	done

.WeakCry:
	text "Nidorino: Gyun…"
	done

.Healed:
	showcrytext IvysLabNidorinoText, NIDORINO
	end

IvysLabNidorinoText:
	text "Nidorino: Gyun!"
	done

IvysLabWindowText:
	text "La ventana está"
	line "abierta."

	para "Entra la brisa"
	line "del mar."
	done

IvysLabHealingMachine:
	opentext
	writetext .Text
	yesorno
	iftruefwd .HealParty
	endtext

.HealParty:
	special HealParty
	special SaveMusic
	playmusic MUSIC_NONE
	setval 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestoreMusic
	endtext

.Text:
	text "¿Quieres curar a"
	line "tus #mon?"
	done

PokemonJournalProfIvyScript:
	setflag ENGINE_READ_PROF_IVY_JOURNAL
	jumpthistext

	text "Diario #mon"

	para "Reportaje: ¡Profe-"
	line "sora #mon Ivy!"

	para "Philena Ivy"
	line "trabajó con Brock"
	cont "de Ciudad Plateada"

	para "para estudiar el"
	line "cuerpo cristalino"
	cont "de un Onix raro."
	done
