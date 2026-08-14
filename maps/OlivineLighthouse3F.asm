OlivineLighthouse3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 14, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse3FBattleGirlEmy, -1
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanPreston, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
	object_event  3,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperTheo, -1
	itemball_event  8,  2, ETHER, 1, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER

	object_const_def
	const OLIVINELIGHTHOUSE3F_COOLTRAINER_F

OlivineLighthouse3FBattleGirlEmy:
	checkevent EVENT_GOT_PROTECT_PADS_FROM_LIGHTHOUSE_LEADER
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	checkevent EVENT_BEAT_BATTLE_GIRL_EMY
	iftruefwd .Beaten
	opentext
	checkevent EVENT_BEAT_GENTLEMAN_ALFRED
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_HUEY
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_THEO
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_GENTLEMAN_PRESTON
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_TERRELL
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_LASS_CONNIE
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_KENT
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_BIRD_KEEPER_DENIS
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SAILOR_ERNEST
	iffalse_jumpopenedtext .IntroText
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked OLIVINELIGHTHOUSE3F_COOLTRAINER_F
	loadtrainer BATTLE_GIRL, EMY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BATTLE_GIRL_EMY
.Beaten:
	opentext
	writetext .AfterText1
	promptbutton
	verbosegiveitem PROTECT_PADS
	iffalse_endtext
	setevent EVENT_GOT_PROTECT_PADS_FROM_LIGHTHOUSE_LEADER
	jumpthisopenedtext

.AfterText2:
	text "Bruno, del Alto"
	line "Mando, lucha como"
	cont "yo."

	para "Ser tan fuerte"
	line "como él… ¡esa es"
	cont "mi meta!"
	done

.IntroText:
	text "Como Luchadora,"
	line "entreno a tope"
	cont "cada día."

	para "Desprendes una"
	line "gran intensidad."

	para "¿Podrás vencer a"
	line "todos los entrena-"
	cont "dores del Faro?"

	para "Si lo logras, com-"
	line "batiré contigo."
	done

.QuestionText:
	text "¿Así que has ven-"
	line "cido en toda la"
	cont "torre?"

	para "¡Pues te queda una"
	line "rival: la alumna"
	cont "de Aníbal… ¡yo!"

	para "¿A punto para un"
	line "asalto?"
	done

.RefusedText:
	text "Mejor sigo entre-"
	line "nando sola…"
	done

.SeenText:
	text "¡A través de mis"
	line "Paracontacto,"
	cont "ataco! ¡Kii-yaah!"
	done

.BeatenText:
	text "¡Has atravesado mi"
	line "defensa!"
	done

.AfterText1:
	text "¡Tu equipo es for-"
	line "midable!"

	para "Pero aún puedes"
	line "ser más fuerte."

	para "Esta Paracontacto"
	line "te deja entrar en"

	para "contacto con el"
	line "rival sin sufrir"
	cont "daño."
	done

TrainerBird_keeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, Bird_keeperTheoSeenText, Bird_keeperTheoBeatenText, 0, Bird_keeperTheoScript

Bird_keeperTheoScript:
	endifjustbattled
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer Bird_keeperTheoFinalText
	jumpthistextfaceplayer

	text "¿Cómo demonios se"
	line "sube?"

	para "Quiero visitar al"
	line "#mon enfermo,"

	para "pero no puedo lle-"
	line "gar ahí arriba…"
	done

GenericTrainerGentlemanPreston:
	generictrainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText

	text "Yasmina solía usar"
	line "#mon Roca"
	cont "como Onix."
	done

GenericTrainerSailorTerrell:
	generictrainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText

	text "Cada vez que vuel-"
	line "vo a Olivo, visito"
	cont "el Gimnasio."

	para "El tipo de los"
	line "#mon de la"

	para "Líder ha cambiado"
	line "sin que me diese"
	cont "cuenta."
	done

Bird_keeperTheoSeenText:
	text "¿Qué haces aquí?"
	line "¿Solo vienes a mi-"

	para "rar? ¡Te sugiero"
	line "que te marches!"
	done

Bird_keeperTheoBeatenText:
	text "De verdad estás"
	line "preocupado…"
	done

Bird_keeperTheoFinalText:
	text "¿Cómo demonios se"
	line "sube?"

	para "He oído que el"
	line "#mon enfermo ya"

	para "está mejor, pero"
	line "no consigo llegar"
	cont "ahí arriba…"
	done

SailorTerrellSeenText:
	text "Los marineros son"
	line "amables y fuertes."
	cont "¿Y tú qué tal?"
	done

SailorTerrellBeatenText:
	text "Eres a la vez"
	line "amable y fuerte…"
	done

GentlemanPrestonSeenText:
	text "Viajo por el mundo"
	line "para entrenar a"

	para "mis #mon."
	line "Deseo luchar"
	cont "contra ti."
	done

GentlemanPrestonBeatenText:
	text "… Ay… Debo entre-"
	line "nar un poco más…"
	done
