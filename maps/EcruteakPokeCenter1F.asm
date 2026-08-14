EcruteakPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ECRUTEAK_CITY, 6
	warp_event  6,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMortyScript

	def_object_events
	object_event  6,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FBillScript, EVENT_ECRUTEAK_POKE_CENTER_BILL
	pc_nurse_event  5, 1
	object_event 11,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FPokefanMScript, -1
	object_event 11,  5, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FLassScript, -1
	object_event  1,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FCooltrainerFText, -1
	object_event  8,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FGymGuyText, -1

	object_const_def
	const ECRUTEAKPOKECENTER1F_BILL

PokemonJournalMortyScript:
	setflag ENGINE_READ_MORTY_JOURNAL
	jumpthistext

	text "Revista #mon"

	para "Reportaje Especial"
	line "¡Líder Morti!"

	para "Morti asegura ha-"
	line "ber visto una vez"
	cont "a Entei. Él dice:"

	para "“Fue asombroso."
	line "Entei me miró a"
	cont "los ojos."

	para "Nunca olvidaré"
	line "sus ojos. Fue"

	para "como si pudiera"
	line "ver a través de mí"

	para "hasta lo más pro-"
	line "fundo de mi cora-"
	cont "zón...”"
	done

EcruteakPokeCenter1FBillScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_BILL_INTRO
	iftruefwd .heardintro
	writetext .IntroText
	waitbutton
	setevent EVENT_LISTENED_TO_BILL_INTRO
.heardintro
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .NoText
	writetext .YesText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequalfwd PARTY_LENGTH, .NoRoom
	givepoke EEVEE, PLAIN_FORM, 5, NO_ITEM, GREAT_BALL
	givepokemail .GiftEeveeMail
	callasm .SetEeveeMailOT
	setevent EVENT_GOT_EEVEE
	writetext .GoodbyeText
	waitbutton
	closetext
	readvar VAR_FACING
	turnobject PLAYER, DOWN
	ifnotequal UP, .noleftstep
	applyonemovement ECRUTEAKPOKECENTER1F_BILL, step_left
.noleftstep
	applymovement ECRUTEAKPOKECENTER1F_BILL, .LeaveMovement
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_NEVER_MET_BILL
	waitsfx
	end

.NoRoom:
	jumpthisopenedtext

	text "Vaya, espera."
	line "No puedes llevar"
	cont "más #mon."
	done

.IntroText:
	text "Hola, soy Bill. ¿Y"
	line "quién eres tú?"

	para "Hmm, ¿<PLAYER>?"
	line "Llegas en buen"
	cont "momento."

	para "Las Cápsulas del"
	line "Tiempo están"
	cont "totalmente fritas,"

	para "y me vendría bien"
	line "tu ayuda."
	done

.QuestionText:
	text "Bill: Este Eevee"
	line "llegó justo"

	para "antes de que la"
	line "Cápsula del Tiempo"
	cont "se apagara."

	para "Alguien tiene que"
	line "cuidar de él,"

	para "pero no me gusta"
	line "estar fuera."

	para "¿Puedo contar con-"
	line "tigo para que jue-"
	cont "gues con él,"
	cont "<PLAYER>?"
	done

.YesText:
	text "Bill: ¡Sabía que"
	line "aceptarías!"

	para "¡Genial! ¡Eres un"
	line "crack!"

	para "Vale, cuento con-"
	line "tigo."

	para "¡Cuídalo mucho!"
	done

.GoodbyeText:
	text "Bill: El Prof. Elm"
	line "afirma que Eevee"

	para "puede evolucionar"
	line "de formas nuevas"
	cont "y desconocidas."

	para "Tengo que darme"
	line "prisa en volver a"
	cont "Trigal a ver a mi"
	cont "familia,"

	para "y luego volver a"
	line "Kanto."

	para "¡Adiós!"
	done

.NoText:
	text "Oh... ¿Y ahora"
	line "qué hago?"
	done

.LeaveMovement:
	step_down
	step_down
	step_down
	step_down
	step_end

.GiftEeveeMail:
	db   EON_MAIL
	setcharmap no_ngrams
	db   "¡Cuida bien de"
	next "este Pokémon!@@"
	setcharmap default

.SetEeveeMailOT:
	ld hl, sPartyMon1MailAuthor
	ld a, [wPartyCount]
	dec a
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	push hl
	pop de
	ld hl, .EeveeMailOTID
	ld bc, .EeveeMailOTIDEnd - .EeveeMailOTID
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	rst CopyBytes
	jmp CloseSRAM

.EeveeMailOTID:
	rawchar "Prof.Oak@@"
	bigdw 00001
.EeveeMailOTIDEnd

EcruteakPokeCenter1FPokefanMScript:
	checkevent EVENT_GOT_HM03_SURF
	iftrue_jumptextfaceplayer .SurfText
	jumpthistextfaceplayer

	text "El modo de bailar"
	line "de las Chicas"

	para "Kimono es maravi-"
	line "lloso. Igual que"
	cont "su forma de usar a"
	cont "sus #mon."
	done

.SurfText:
	text "Seguro que esperas"
	line "combatir contra"
	cont "más gente, ¿no?"

	para "Al parecer hay"
	line "un lugar donde se"
	cont "reúnen entrenado-"
	cont "res."

	para "¿Que dónde está?"

	para "Un poco más allá"
	line "de Ciudad Olivo."
	done

EcruteakPokeCenter1FLassScript:
	faceplayer
	opentext
	writetext .QuestionText
	yesorno
	iffalsefwd .No
	checkevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	iffalse_jumpopenedtext .HereText
	jumpthisopenedtext

	text "Una vez oí que"
	line "la madre de Bill"

	para "fue una Chica"
	line "Kimono. Quizá por"

	para "eso visita este"
	line "lugar tan a me-"
	cont "nudo."
	done

.No:
	checkevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	iffalse_jumpopenedtext .HereText
	jumpthisopenedtext

	text "Oh... No impor-"
	line "ta entonces."
	done

.QuestionText:
	text "¿Sabes quién es"
	line "Bill?"
	done

.HereText:
	text "¡Entonces ve a ha-"
	line "blar con él! ¡Está"
	cont "junto al mostra-"
	cont "dor!"
	done

EcruteakPokeCenter1FCooltrainerFText:
	text "Morti, el Líder"
	line "del Gimnasio, mo-"
	cont "la muuuuucho."

	para "Sus #mon tam-"
	line "bién son muy"
	cont "duros."
	done

EcruteakPokeCenter1FGymGuyText:
	text "El Lago de la Fu-"
	line "ria..."

	para "La aparición de un"
	line "enjambre de"
	cont "Gyarados..."

	para "Huelo a conspira-"
	line "ción. ¡Lo sé!"
	done
