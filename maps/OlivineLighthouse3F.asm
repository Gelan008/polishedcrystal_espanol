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
	line "todos aquí?"

	para "Si lo logras,"
	line "¡lucharé contigo!"
	done

.QuestionText:
	text "¿Así que venciste"
	line "a todos los de"
	cont "la torre?"

	para "¡Pues te queda una"
	line "rival: la alumna"
	cont "de Aníbal… ¡yo!"

	para "¿A punto para un"
	line "asalto?"
	done

.RefusedText:
	text "Mejor seguiré"
	line "entrenando sola…"
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
	text "¡Tienes un equipo"
	line "formidable!"

	para "Pero aún puedes"
	line "ser más fuerte."

	para "El Paracontacto te"
	line "permite tocar al"
	cont "rival sin dañarte."
	done

TrainerBird_keeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, Bird_keeperTheoSeenText, Bird_keeperTheoBeatenText, 0, Bird_keeperTheoScript

Bird_keeperTheoScript:
	endifjustbattled
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue_jumptextfaceplayer Bird_keeperTheoFinalText
	jumptextfaceplayer BirdKeeperTheoAfterBattleText

GenericTrainerGentlemanPreston:
	generictrainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText

	text "Jasmine used to"
	line "use Rock #mon"
	cont "like Onix."
	done

GenericTrainerSailorTerrell:
	generictrainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText

	text "Every time I come"
	line "back to Olivine, I"
	cont "visit the Gym."

	para "The Gym Leader's"
	line "#mon type has"

	para "changed without me"
	line "noticing."
	done

Bird_keeperTheoSeenText:
	text "¿Qué haces aquí?"
	line "¿Vienes a mirar?"

	para "¡Pues te sugiero"
	line "que te marches!"
	done

Bird_keeperTheoBeatenText:
	text "De verdad estás"
	line "preocupado…"
	done

BirdKeeperTheoAfterBattleText:
	text "How the heck do"
	line "you go up?"

	para "I want to visit"
	line "the sick #mon,"

	para "but I can't get up"
	line "there…"
	done

Bird_keeperTheoFinalText:
	text "¿Cómo demonios se"
	line "sube?"

	para "Oí que el #mon"
	line "enfermo ya mejoró,"
	cont "¡pero no logro"
	cont "llegar arriba!"
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
	cont "mis #mon."

	para "¡Deseo luchar"
	line "contra ti!"
	done

GentlemanPrestonBeatenText:
	text "…Ay… Necesito más"
	line "entrenamiento…"
	done

