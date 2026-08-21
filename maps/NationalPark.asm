NationalPark_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 35, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 35, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 12, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 13, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 16, 44, BGEVENT_JUMPTEXT, NationalParkRelaxationSquareText
	bg_event 29, 31, BGEVENT_JUMPTEXT, NationalParkBattleNoticeText
	bg_event 14,  4, BGEVENT_JUMPTEXT, NationalParkTrainerTipsText
	bg_event  8, 47, BGEVENT_ITEM + FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

	def_object_events
	object_event 17, 24, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkLassText, -1
	object_event 16,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkPokefanFText, -1
	object_event 29, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 28,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event 13, 41, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSchoolgirlEliza, -1
	object_event 12, 41, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSchoolboyJohnny, -1
	object_event 19, 41, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, NationalParkTeacher2Text, -1
	pokemon_event 28, 40, PERSIAN, SPRITEMOVEDATA_POKEMON, -1, PAL_NPC_BROWN, NationalParkPersianText, -1
	object_event 29, 23, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event 20, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 18,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanmWilliam, -1
	object_event 10, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassKrise, -1
	object_event 28, 13, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBugManiacLou, -1
	object_event  4, 19, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, OfficermKeithScript, -1
	itemball_event 37, 12, SHINY_STONE, 1, EVENT_NATIONAL_PARK_SHINY_STONE
	tmhmball_event  3, 43, TM_DIG, EVENT_NATIONAL_PARK_TM_DIG

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftruefwd .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalsefwd .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	endtext

OfficermKeithScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficermKeithDaytimeText
	checkevent EVENT_BEAT_OFFICERM_KEITH
	iftrue_jumptextfaceplayer OfficermKeithAfterText
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficermKeithSeenText
	waitbutton
	closetext
	winlosstext OfficermKeithWinText, 0
	loadtrainer OFFICERM, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERM_KEITH
	endtext

GenericTrainerBugManiacLou:
	generictrainer BUG_MANIAC, LOU, EVENT_BEAT_BUG_MANIAC_LOU, BugManiacLouSeenText, BugManiacLouBeatenText

	text "I used to be just"
	line "a Bug Catcher,"

	para "but I evolved into"
	line "a Bug Maniac!"
	done

GenericTrainerSchoolgirlEliza:
	generictrainer SCHOOLGIRL, ELIZA, EVENT_BEAT_SCHOOLGIRL_ELIZA, SchoolgirlElizaSeenText, SchoolgirlElizaBeatenText

	text "I don't care!"
	line "I still love"
	cont "Oddish."
	done

GenericTrainerSchoolboyJohnny:
	generictrainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText

	text "Yeah, well, I"
	line "still prefer"
	cont "Bellsprout."
	done

NationalParkGameboyKidScript:
	showtextfaceplayer NationalParkGameboyKidText
	turnobject LAST_TALKED, DOWN
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, SchoolboyJack1Script

SchoolboyJack1Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	opentext
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftruefwd .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext SchoolboyJackTradeMonText
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername SCHOOLBOY, JACK1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	readmem wJackFightCount
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
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 1
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 2
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 3
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	loadmem wJackFightCount, 4
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

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

.RematchStd:
	jumpstd rematchm

GenericTrainerPokefanmWilliam:
	generictrainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText

	text "I lost the battle,"
	line "but my #mon win"

	para "the prize for"
	line "being most lovely."
	done

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, PokefanfBeverly1Script

PokefanfBeverly1Script:
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftruefwd .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftruefwd .NumberAccepted
	checkpoke MARILL
	iffalsefwd .NoMarill
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext PokefanBeverlyCuteMonText
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjumpfwd .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername POKEFANF, BEVERLY1, STRING_BUFFER_3
	scall .RegisteredNumber
	sjumpfwd .NumberAccepted

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalsefwd .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjumpfwd .NumberAccepted

.NoRoom:
	sjumpfwd .PackFull

.NoMarill:
	jumpopenedtext PokefanFBeverlyMarillFriendText

.AskNumber1:
	jumpstd asknumber1f

.AskNumber2:
	jumpstd asknumber2f

.RegisteredNumber:
	jumpstd registerednumberf

.NumberAccepted:
	jumpstd numberacceptedf

.NumberDeclined:
	jumpstd numberdeclinedf

.PhoneFull:
	jumpstd phonefullf

.Gift:
	jumpstd giftf

.PackFull:
	jumpstd packfullf

GenericTrainerLassKrise:
	generictrainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText

	text "I thought you were"
	line "staring at me"
	cont "because I'm cute!"
	done

NationalParkLassText:
	text "¡Mira! ¡Fíjate en"
	line "mi mochila!"

	para "Le he enganchado"
	line "mis Medallas."
	done

NationalParkPokefanFText:
	text "Es una Carta de mi"
	line "hija. Me alegra el"
	cont "día."
	done

NationalParkTeacher1Text:
	text "¡Prestad atención,"
	line "por favor!"

	para "…Uy, debo dejar"
	line "de pensar como una"
	cont "maestra siempre."

	para "Debes de ser un"
	line "entrenador #mon"

	para "¡Por esforzarte"
	line "tanto, quiero que"
	cont "te quedes esto!"
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Equípale esa Garra"
	line "Rápida a un"
	cont "#mon."

	para "A veces le dejará"
	line "atacar primero en"
	cont "el combate."
	done

SchoolgirlElizaSeenText:
	text "¡Oddish es lo más"
	line "mono que hay!"

	para "¿A que sí?"
	done

SchoolgirlElizaBeatenText:
	text "Mi pobre Oddish…"
	done

SchoolboyJohnnySeenText:
	text "¡Bellsprout es el"
	line "más guay de todos!"

	para "¿A que sí?"
	done

SchoolboyJohnnyBeatenText:
	text "Bellsprout, no…"
	done

NationalParkTeacher2Text:
	text "Los críos deberían"
	line "luchar en la"
	cont "hierba."

	para "Están molestando"
	line "mi tranquilo"
	cont "paseo…"
	done

NationalParkPersianText:
	text "Persian: ¡Fufusha!"
	done

NationalParkGameboyKidText:
	text "Estoy estudiando"
	line "mi #dex."

	para "Quiero completar"
	line "una #dex viva"
	cont "con cada #mon."
	done

SchoolboyJack1SeenText:
	text "El mundo #mon"
	line "es muy profundo."

	para "Aún hay muchas"
	line "cosas que no"
	cont "conocemos."

	para "¡Pero yo sé más"
	line "que tú!"
	done

SchoolboyJack1BeatenText:
	text "¿Q-q-quéee?"
	done

SchoolboyJackTradeMonText:
	text "Hay mucho que"
	line "aprender."

	para "Por ejemplo…"
	line "Hay {d:NUM_TMS} tipos"
	cont "de MT."

	para "Los #mon que"
	line "son intercambiados"
	cont "suben más rápido"
	cont "de nivel."
	done

PokefanfBeverly1SeenText:
	text "Mis #mon son"
	line "sencillamente"
	cont "encantadores."

	para "Déjame contarte"
	line "lo orgullosa que"
	cont "me hacen sentir."
	done

PokefanfBeverly1BeatenText:
	text "Puedo ganarte en"
	line "orgullo, pero…"
	done

PokefanBeverlyCuteMonText:
	text "Debo decir que tus"
	line "#mon también"
	cont "son muy monos."
	done

PokefanmWilliamSeenText:
	text "Queremos a los"
	line "#mon, aunque"
	cont "no nos quieran."

	para "Eso es lo que"
	line "significa ser un"
	cont "fan."
	done

PokefanmWilliamBeatenText:
	text "¡M-mis #mon!"
	done

PokefanFBeverlyMarillFriendText:
	text "My friend keeps a"
	line "Marill!"

	para "I find them very"
	line "endearing."

	para "Oh, I wish for a"
	line "Marill of my own…"
	done

LassKriseSeenText:
	text "¿Hola? ¿Por qué te"
	line "me quedas mirando?"

	para "¿Ah, un combate?"
	done

LassKriseBeatenText: ; text > text
	text "…Hmmm…"
	done

BugManiacLouSeenText:
	text "¡Nadie supera mi"
	line "pasión por los"
	cont "#mon bicho!"
	done

BugManiacLouBeatenText:
	text "¡¿Cómo ha sido?!"
	done

OfficermKeithSeenText:
	text "¡Alto! ¿Qué haces"
	line "fuera tan tarde?"
	done

OfficermKeithWinText:
	text "¡Sabes cómo"
	line "defenderte!"
	done

OfficermKeithAfterText:
	text "¡El parque sigue"
	line "abierto de noche"
	cont "porque los agentes"
	cont "lo protegemos!"
	done

OfficermKeithDaytimeText:
	text "¿Disfrutando del"
	line "parque, eh?"

	para "¡Lleva siempre un"
	line "#mon contigo si"
	cont "entras en la"
	cont "hierba alta!"
	done

NationalParkRelaxationSquareText:
	text "Plaza del Sosiego"
	line "Parque Nacional"
	done

NationalParkBattleNoticeText:
	text "¿Qué es este"
	line "aviso?"

	para "Por favor, luche"
	line "solo en la hierba."

	para "Parque Nacional"
	line "Oficina del Guarda"
	done

NationalParkTrainerTipsText:
	text "Pistas Entrenador"

	para "Los #mon son"
	line "más felices con"
	cont "cortes de pelo,"
	cont "fotos, etc…"
	done
