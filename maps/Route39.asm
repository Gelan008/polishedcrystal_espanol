Route39_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 19, ROUTE_39_BARN, 1
	warp_event  7, 19, ROUTE_39_FARMHOUSE, 1
	warp_event  9,  5, ROUTE_39_RUGGED_ROAD_GATE, 3
	warp_event  3, 19, ROUTE_39_BARN, 2

	def_coord_events

	def_bg_events
	bg_event  5, 47, BGEVENT_JUMPTEXT, Route39TrainerTipsText
	bg_event  8, 21, BGEVENT_JUMPTEXT, MoomooFarmSignText
	bg_event 11,  7, BGEVENT_JUMPTEXT, RuggedRoadAheadSignText
	bg_event 15, 23, BGEVENT_JUMPTEXT, Route39SignText
	bg_event  8,  9, BGEVENT_JUMPTEXT, Route39AdvancedTips1Text
	bg_event 14, 31, BGEVENT_JUMPTEXT, Route39AdvancedTips2Text
	bg_event  5, 29, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

	def_object_events
	object_event  7, 30, SPRITE_COWGIRL, SPRITEMOVEDATA_WANDER, 1, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39CowgirlAnnieScript, -1
	object_event 13, 45, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSailorEugene, -1
	object_event 10, 38, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek1, -1
	object_event 11, 35, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfRuth, -1
	pokemon_event  3, 28, MILTANK, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, Route39MiltankText, -1
	pokemon_event  6, 27, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_PINK, Route39MiltankText, -1
	pokemon_event  4, 31, MILTANK, SPRITEMOVEDATA_POKEMON, (1 << MORN) | (1 << DAY), PAL_MON_AZURE, Route39MiltankText, -1
	pokemon_event  8, 29, MILTANK, SPRITEMOVEDATA_POKEMON, -1, PAL_MON_PINK, Route39MiltankText, -1
	object_event 13, 23, SPRITE_PSYCHIC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPsychicNorman, -1
	fruittree_event  9, 26, FRUITTREE_ROUTE_39, CHESTO_BERRY, PAL_NPC_PURPLE
	object_event  4, 38, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_DARK_PURPLE, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  4, 46, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39BeautyText, -1
	object_event 15, 12, SPRITE_HIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route39HikerText, -1
	object_event 25, 24, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1
	tmhmball_event  1, 23, TM_BULLDOZE, EVENT_ROUTE_39_TM_BULLDOZE
	smashrock_event 12, 10
	smashrock_event 15,  8

	object_const_def
	const ROUTE39_COWGIRL

TrainerPokefanmDerek1:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerek1SeenText, PokefanmDerek1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftruefwd .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftruefwd .NumberAccepted
	checkpoke PIKACHU
	iffalsefwd .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEFANM, DEREK1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalsefwd .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.WantsPikachu:
	jumpthisopenedtext

	text "¡Pikachu es el"
	line "mejor! ¿A que sí?"
	done

.AskNumber1:
	jumpstd asknumber1m

.AskNumber2:
	jumpstd asknumber2m

.RegisteredNumber:
	jumpstd registerednumberm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.Gift:
	jumpstd giftm

.PackFull:
	jumpstd packfullm

GenericTrainerPokefanfRuth:
	generictrainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText

	text "¿Sabes de los"
	line "#mon bebé?"

	para "¡Apuesto a que son"
	line "adorables!"
	done

Route39CowgirlAnnieScript:
	checkevent EVENT_GOT_PP_MAX_FROM_ROUTE_39_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_COWGIRL_ANNIE
	iftruefwd .Beaten
	checkevent EVENT_BEAT_BIRD_KEEPER_TOBY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SAILOR_HARRY
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_LASS_DANA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SCHOOLBOY_CHAD
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_VALENCIA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_BEAUTY_OLIVIA
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANM_DEREK
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANF_RUTH
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_SAILOR_EUGENE
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_PSYCHIC_NORMAN
	iffalse_jumptext .IntroText
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iffalse_jumptext .IntroText
	opentext
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE39_COWGIRL
	loadtrainer COWGIRL, ANNIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COWGIRL_ANNIE
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem PP_MAX
	iffalse_endtext
	setevent EVENT_GOT_PP_MAX_FROM_ROUTE_39_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Hacemos queso y"
	line "yogur con la leche"
	cont "de Miltank."
	done

.IntroText:
	text "¡Eh! ¡No asustes a"
	line "las Miltank!"

	para "… ¿Ah, que quieres"
	line "un combate?"

	para "Ahora estoy con la"
	line "faena del campo…"

	para "Hagamos un trato:"
	line "vence a los demás"

	para "entre Ciudad Iris"
	line "y Ciudad Olivo y"
	cont "lucharé contigo."

	para "Puede que algunos"
	line "solo quieran lu-"

	para "char cuando sea de"
	line "noche."
	done

.QuestionText:
	text "Terminé mis"
	line "tareas, y tú has"

	para "despejado todas"
	line "estas rutas."

	para "Bien, mi equipo"
	line "venció a Morti, ¡y"

	para "creo que también"
	line "podemos contigo!"

	para "¿Qué me dices?"
	done

.RefusedText:
	text "Vaya. Pues vuelvo"
	line "a cuidar de las"
	cont "Miltank."
	done

.SeenText:
	text "¡Te enseñaré de lo"
	line "que es capaz una"
	cont "vaquera!"
	done

.BeatenText:
	text "He derramado algo"
	line "de leche…"
	done

.AfterText1:
	text "¡Vaya descanso"
	line "tan intenso!"

	para "Gracias por este"
	line "rato, camarada."

	para "¡Llévate esto con-"
	line "tigo!"
	done

GenericTrainerSailorEugene:
	generictrainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText

	text "Mis #mon fueron"
	line "atrapados y cria-"
	cont "dos en ultramar."

	para "Son mis compañeros"
	line "en esos viajes tan"
	cont "largos."
	done

GenericTrainerPsychicNorman:
	generictrainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText

	text "¿Sabías que los"
	line "#mon tienen"
	cont "más habilidades?"

	para "A la gente le pasa"
	line "igual. Cada uno"

	para "tiene un potencial"
	line "diferente."
	done

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime 1 << NITE
	iffalsefwd .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftruefwd .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainerwithpal POKEFANF, JAIME, TRAINERPAL_DARK_POKEFANF
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	endtext

.Beaten:
	jumpthisopenedtext

	text "Conocí a mi Meowth"
	line "de noche, aquí"
	cont "mismo, en Ruta 39."

	para "No sé por qué, pe-"
	line "ro parece que le"

	para "gusta que entrene-"
	line "mos por aquí."

	para "Se vuelve más ca-"
	line "riñoso entrenando"

	para "aquí que en cual-"
	line "quier otra parte."
	done

.NotNight:
	jumpthisopenedtext

	text "Je, je, je… Espero"
	line "que anochezca"
	cont "pronto."
	done

Route39MiltankText:
	text "Miltank: ¡Muuu!"
	done

SailorEugeneSeenText:
	text "Acabo de volver a"
	line "Ciudad Olivo."

	para "¿Qué tal un com-"
	line "bate #mon?"
	done

SailorEugeneBeatenText:
	text "¡Aaaargh!"
	done

PokefanmDerek1SeenText:
	text "¡Es el momento de"
	line "presumir de mi"
	cont "Pikachu!"
	done

PokefanmDerek1BeatenText:
	text "No me dio tiempo"
	line "a fardar de Pika-"
	cont "chu…"
	done

PokefanMDerekText_NotBragging:
	text "¡No voy a escuchar"
	line "tus fanfarronadas!"

	para "¡Los Pokéfan tene-"
	line "mos la norma de no"

	para "escuchar a otros"
	line "presumir!"
	done

PokefanfRuthSeenText:
	text "¡Qué #mon tan"
	line "encantadores!"

	para "¡Enseñemos a nues-"
	line "tros #mon a la"
	cont "vez!"
	done

PokefanfRuthBeatenText:
	text "No me importa"
	line "perder."
	done


PsychicNormanSeenText:
	text "Veamos de qué son"
	line "capaces tus"
	cont "#mon."
	done

PsychicNormanBeatenText:
	text "¡Oh! Tus #mon"
	line "tienen potencial."
	done


PokefanfJaimeSeenText:
	text "Llegas en el mo-"
	line "mento justo."

	para "¡Combatamos!"
	done

PokefanfJaimeBeatenText:
	text "Vaya, qué decep-"
	line "ción…"
	done


Route39BeautyText:
	text "¿Cuál es más alta:"
	line "la Torre Hojalata"
	cont "de Ciudad Iris,"

	para "¿o el Faro de Ciu-"
	line "dad Olivo?"

	para "¡La Torre,"
	line "Hojalata sin duda!"
	done

Route39HikerText:
	text "¡Al norte de Olivo"
	line "está la frontera"
	cont "de Johto!"

	para "Una ruta dura por"
	line "terreno escarpado,"

	para "y luego escalar un"
	line "pico helado…"

	para "He oído que algu-"
	line "nos #mon se han"

	para "adaptado para so-"
	line "brevivir al clima."

	para "… Pero sin unas"
	line "Gafas Aislantes"
	cont "por seguridad,"

	para "no puedo ni empe-"
	line "zar la marcha…"
	done

Route39SignText:
	text "Ruta 39"

	para "Ciudad Olivo -"
	line "Ciudad Iris"
	done

Route39AdvancedTips1Text:
	text "¡Consejo Avanzado!"

	para "¡La Tormenta Arena"
	line "sube la Def. Esp."
	cont "al tipo Roca!"

	para "¡Y el Granizo sube"
	line "la Defensa al tipo"
	cont "Hielo!"
	done

Route39AdvancedTips2Text:
	text "¡Consejo Avanzado!"

	para "¡Un #mon con"
	line "Ojo Compuesto o"

	para "con una Moneda"
	line "Amuleto equipada"

	para "facilitará encon-"
	line "trar salvajes con"
	cont "un objeto!"
	done

RuggedRoadAheadSignText:
	text "Camino Pedregoso"
	line "más adelante"

	para "Al norte hacia"
	line "Cumbre Nevada"
	done

MoomooFarmSignText:
	text "Granja Mu-mu"

	para "Disfruta de nues-"
	line "tra leche fresca y"
	cont "deliciosa"
	done

Route39TrainerTipsText:
	text "Pistas Entrenador"

	para "Usa Golpe Cabeza"
	line "en los árboles"
	cont "para hacer caer"
	cont "#mon."

	para "¡Caerán clases de"
	line "#mon distintas!"

	para "¡Usa Golpe Cabeza"
	line "en cada árbol que"
	cont "veas!"
	done
