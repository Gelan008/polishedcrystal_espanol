Route38_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 10, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35, 11, ROUTE_38_ECRUTEAK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 33,  8, BGEVENT_JUMPTEXT, Route38SignText
	bg_event  5, 13, BGEVENT_JUMPTEXT, Route38TrainerTipsText
	bg_event 17,  5, BGEVENT_JUMPTEXT, Route38AdvancedTipsText

	def_object_events
	object_event  4,  1, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 12, 15, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperToby, -1
	object_event 26,  9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyValencia, -1
	object_event 24,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, PAL_NPC_DARK_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	fruittree_event 12, 10, FRUITTREE_ROUTE_38, SITRUS_BERRY, PAL_NPC_BROWN
	object_event  5,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBeautyOlivia, -1

GenericTrainerBird_keeperToby:
	generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText

	text "Voy a entrenar en"
	line "el Bosq. Amarillo"
	cont "para enseñar Vuelo"
	cont "a mi #mon."
	done

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script, TRAINERPAL_DARK_SAILOR

.Script:
	endifjustbattled
	jumpthistextfaceplayer

	text "Gente de todo el"
	line "mundo vive feliz"
	cont "en armonía con los"
	cont "#mon."
	done

TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	opentext
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftruefwd .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftruefwd .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftruefwd .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext LassDanaMoomooMilkText
	promptbutton
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1f
	sjumpfwd .AskForPhoneNumber

.SecondTimeAsking:
	callstd asknumber2f
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .DeclinedPhoneNumber
	gettrainername LASS, DANA1, STRING_BUFFER_3
	callstd registerednumberf
	jumpstd numberacceptedf

.DanaRematch:
	callstd rematchf
	winlosstext LassDana1BeatenText, 0
	readmem wDanaFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 1
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 2
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 3
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 4
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA_READY_FOR_REMATCH
	end

.TryGiveThunderstone:
	callstd giftf
	verbosegiveitem THUNDERSTONE
	iffalsefwd .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jumpstd numberacceptedf

.NoRoomForThunderstone:
	jumpstd packfullf

.NumberAccepted:
	jumpstd numberacceptedf

.DeclinedPhoneNumber:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .script

.script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	opentext
	checkflag ENGINE_CHAD_READY_FOR_REMATCH
	iftruefwd .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftruefwd .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftruefwd .SecondTimeAsking
	writetext SchoolboyChadSoManyTestsText
	promptbutton
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .AskToRegisterNumber

.SecondTimeAsking:
	callstd asknumber2m
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .SaidNo
	gettrainername SCHOOLBOY, CHAD1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.ChadRematch:
	callstd rematchm
	winlosstext SchoolboyChad1BeatenText, 0
	readmem wChadFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 1
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 2
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 3
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 4
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD_READY_FOR_REMATCH
	end

.HaveChadsNumber:
	jumpstd numberacceptedm

.SaidNo:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

GenericTrainerBeautyValencia:
	generictrainer BEAUTY, VALENCIA, EVENT_BEAT_BEAUTY_VALENCIA, BeautyValenciaSeenText, BeautyValenciaBeatenText

	text "Ver a los #mon"
	line "me calma los"
	cont "nervios."
	done

GenericTrainerBeautyOlivia:
	generictrainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText

	text "La Leche Mu-mu es"
	line "sana y buena para"
	cont "la belleza."

	para "¡Compro una docena"
	line "de botellas de"
	cont "golpe!"
	done

Bird_keeperTobySeenText:
	text "¡Volad bien alto,"
	line "mis queridos"
	cont "#mon pájaro!"
	done

Bird_keeperTobyBeatenText:
	text "Ahora saldría"
	line "volando de aquí."
	done

SchoolboyChad1SeenText:
	text "¡Voy a probar lo"
	line "que he aprendido"
	cont "hoy!"
	done

SchoolboyChad1BeatenText:
	text "Supongo que no he"
	line "estudiado lo"
	cont "suficiente."
	done

SchoolboyChadSoManyTestsText:
	text "Tengo tantos tests"
	line "que apenas tengo"
	cont "tiempo para mis"
	cont "#mon."

	para "Por eso, cuando me"
	line "pongo a jugar, me"
	cont "concentro a tope."
	done

LassDana1SeenText:
	text "Parece que se te"
	line "dan bien los"
	cont "#mon."

	para "¿Por qué no me das"
	line "algún consejo?"
	done

LassDana1BeatenText:
	text "Ya veo. Así que se"
	line "puede luchar de"
	cont "esa forma."
	done

LassDanaMoomooMilkText:
	text "¡Sé de una cosa"
	line "buena!"

	para "La leche de Granja"
	line "Mu-mu es famosa"
	cont "por su sabor."
	done

BeautyValenciaSeenText:
	text "¡Hola! ¡Qué porte"
	line "tan elegante!"

	para "¿Puedo ver a tus"
	line "#mon?"
	done

BeautyValenciaBeatenText:
	text "¡Me encantó ver"
	line "a tus #mon!"
	done

SailorHarrySeenText:
	text "He navegado mucho"
	line "por el extranjero,"
	cont "¡y conozco muchos"
	cont "tipos de #mon!"
	done

SailorHarryBeatenText:
	text "¡Tu destreza es de"
	line "nivel mundial!"
	done

BeautyOliviaSeenText:
	text "¿No crees que mis"
	line "#mon y yo somos"
	cont "guapísimos?"
	done

BeautyOliviaBeatenText:
	text "Tomamos Leche"
	line "Mu-mu cada día."
	done

Route38SignText:
	text "Ruta 38"

	para "Ciudad Olivo -"
	line "Ciudad Iris"
	done

Route38TrainerTipsText:
	text "Pistas Entrenador"

	para "Si un #mon va a"
	line "evolucionar,"
	cont "puedes evitarlo."

	para "Pulsa el Botón B"
	line "al evolucionar."

	para "Eso asustará al"
	line "#mon y frenará"
	cont "su evolución."
	done

Route38AdvancedTipsText:
	text "¡Consejo Avanzado!"

	para "¡Pulsa Start en el"
	line "PC para ir rápido"
	cont "al nombre de Caja!"

	para "¡Puedes cambiar el"
	line "nombre y el tema"
	cont "de cada Caja!"

	para "¡Pulsa Select para"
	line "cambiar la función"
	cont "del Botón A!"
	done